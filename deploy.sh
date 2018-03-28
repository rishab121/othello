export PORT=5111
export MIX_ENV=prod
export GIT_PATH=/home/othello/src/othello
PWD = `pwd`
mix deps.get
(cd assets && npm install --unsafe-perm)
(cd assets && ./node_modules/brunch/bin/brunch b -p)
mix phx.digest
MIX_ENV=prod mix ecto.create
MIX_ENV=prod mix ecto.migrate
mix release.init
MIX_ENV=prod mix release 
mkdir -p ~/wwww
mkdir -p ~/oldd

NOW=`date +%s`
if [ -d ~/www/othello ]; then
	echo mv ~/wwww/othello ~/oldd/$NOW
	mv ~/wwww/othello ~/oldd/$NOW
fi

mkdir -p ~/wwww/othello
REL_TAR=~/src/othello/_build/prod/rel/othello/releases/0.0.1/othello.tar.gz
(cd ~/wwww/othello && tar xzvf $REL_TAR)

crontab - <<CRONTAB
@reboot bash /home/othello/src/othello/start.sh
CRONTAB
