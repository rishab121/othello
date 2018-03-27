import React from 'react';
import ReactDOM from 'react-dom';
import { Button } from 'reactstrap';

//Attribution : https://reactjs.org/tutorial/tutorial.html

export default function run_othello(root, channel) {
    ReactDOM.render(<Othello channel={channel}/>, root);
}

class Othello extends React.Component{
    constructor(props){
        super(props);
        this.channel = props.channel;
        this.channel.join()
        .receive("ok", this.gotView.bind(this))
        .receive("error", resp => { console.log("Unable to join", resp); });
        this.channel.push("player:joined", {player_name: playerName})
        .receive("ok", this.gotView.bind(this))
        this.state = {
            squares: Array(64).fill(null),
            scoreBlack: 2,
            scoreWhite: 2,
            turn: 0,
            playerWhite: null,
            playerBlack: null,
            observers: [],
            cturn: ""
        };
        this.channel.on("reload:view", game => {
          this.setState(game);
      
        });
        this.channel.on("reload:view:restart", view => {
          if(view.game.playerWhite == view.player_name){
            alert("Game restarted!!" + " " + view.game.playerBlack + " wins!!");
          }
          if(view.game.playerBlack == view.player_name){
            alert("Game restarted!!" + " " + view.game.playerWhite + " " + "Wins!!");
          }
    
          this.setState(view.game);
      
        });
    }
   

    gotView(view){
      this.setState(view.game);
      const score1 = view.game.scoreWhite;
      const score2 = view.game.scoreBlack;
      if(score1+score2 == 64){
        if(score1 > score2){
          alert("White Wins");
        }
        else if(score2 > score1){
          alert("Black Wins");
        }
        else{
          alert("match ties click restart to play again");
        }
      }
      if(this.state.scoreWhite==0){
        alert(view.game.playerBlack + "wins");
        alert("Restarting Game");
        this.restartFn();
      }
      if(this.state.scoreBlack==0){
        alert(view.game.playerWhite + "wins");
        alert("Restarting Game");
        this.restartFn();
      }
    }
    handleClickByServer(i){
     
      this.channel.push("handleClickByServer",{num:i, player_name: playerName })
          .receive("ok", this.gotView.bind(this))

    }
    handleClick(i){
     
       this.handleClickByServer(i); 
    }
    restartFn(){
      var x  = confirm("are you sure?");
      if(x){
        this.channel.push("restartFn",{player_name: playerName})
        .receive("ok",this.gotView.bind(this))
      }
     
      
  
    }
    quitFn(){
      var x  = confirm("are you sure?");
      if(x){
        this.channel.push("quitFn",{player_name: playerName})
        .receive("ok",this.gotView.bind(this))
  
        window.setTimeout(function(){ window.location = "http://localhost:4000/table/" + playerName; },500);
      }
      
    }
    render() {
        const current = this.state.squares;
        return (
        <div>
          <div className="game">
            <div className="game-board">
                <Board 
                    squares= {current}
                    onClick = {(i) => this.handleClick(i)}
                />
            </div>
          
          <div className="scorecard">
            <h3 id="scoreTitle">Score Card</h3>
            <span className="black-large"><p>{this.state.scoreBlack}</p></span>
            <div className="score"><p>{this.state.playerBlack} </p></div>
            <span className="white-large"><p> {this.state.scoreWhite}</p></span>
            <div className="score"><p>{this.state.playerWhite} </p></div>
            <div className="score"><p>Current Turn  :: {this.state.cturn} </p></div>
            <div> <RestartFunc onClick = {() => this.restartFn()} /> </div><br /> 
            <div> <QuitFunc onClick = {() => this.quitFn()} /> </div>
          </div>
          </div>
          <div>
            <a className="btn btn-primary btn-lg" href="https://github.com/rishab121/othello" target="_blank">
              Github Link
            </a>
          </div>
        </div>
        );
      }

}

class Board extends React.Component{

    renderSquare(i) {
        const value = this.props.squares[i];
        if (value == null){
          return ( 
            <Square 
            onClick= {() => this.props.onClick(i)}
          />);
        }
        else if(value == 1){ //render white circle 
          return ( 
            <Squarevalues 
            onClick= {() => this.props.onClick(i)}
          />);
        }
        else{ // render black circles
          return ( 
            <Squarescored 
            onClick= {() => this.props.onClick(i)}
          />);
        }
          
      }

    render(){
        return (
          <div>
            <div className="board-row">
              {this.renderSquare(0)}
              {this.renderSquare(1)}
              {this.renderSquare(2)}
              {this.renderSquare(3)}
              {this.renderSquare(4)}
              {this.renderSquare(5)}
              {this.renderSquare(6)}
              {this.renderSquare(7)}
            </div>
            <div className="board-row">
              {this.renderSquare(8)}
              {this.renderSquare(9)}
              {this.renderSquare(10)}
              {this.renderSquare(11)}
              {this.renderSquare(12)}
              {this.renderSquare(13)}
              {this.renderSquare(14)}
              {this.renderSquare(15)}
            </div>
            <div className="board-row">
              {this.renderSquare(16)}
              {this.renderSquare(17)}
              {this.renderSquare(18)}
              {this.renderSquare(19)}
              {this.renderSquare(20)}
              {this.renderSquare(21)}
              {this.renderSquare(22)}
              {this.renderSquare(23)}
            </div>
            <div className="board-row">
              {this.renderSquare(24)}
              {this.renderSquare(25)}
              {this.renderSquare(26)}
              {this.renderSquare(27)}
              {this.renderSquare(28)}
              {this.renderSquare(29)}
              {this.renderSquare(30)}
              {this.renderSquare(31)}
            </div>
            <div className="board-row">
              {this.renderSquare(32)}
              {this.renderSquare(33)}
              {this.renderSquare(34)}
              {this.renderSquare(35)}
              {this.renderSquare(36)}
              {this.renderSquare(37)}
              {this.renderSquare(38)}
              {this.renderSquare(39)}
            </div>
            <div className="board-row">
              {this.renderSquare(40)}
              {this.renderSquare(41)}
              {this.renderSquare(42)}
              {this.renderSquare(43)}
              {this.renderSquare(44)}
              {this.renderSquare(45)}
              {this.renderSquare(46)}
              {this.renderSquare(47)}
            </div>
            <div className="board-row">
              {this.renderSquare(48)}
              {this.renderSquare(49)}
              {this.renderSquare(50)}
              {this.renderSquare(51)}
              {this.renderSquare(52)}
              {this.renderSquare(53)}
              {this.renderSquare(54)}
              {this.renderSquare(55)}
            </div>
            <div className="board-row">
              {this.renderSquare(56)}
              {this.renderSquare(57)}
              {this.renderSquare(58)}
              {this.renderSquare(59)}
              {this.renderSquare(60)}
              {this.renderSquare(61)}
              {this.renderSquare(62)}
              {this.renderSquare(63)}
            </div>
          </div>
        );
      }
}

function Square(props){
  return (
      <button className="square btn" onClick={props.onClick} >
       </button>
  );
}
function Squarevalues(props){
  return(
    <button className="square-without-hover btn">
    <span className="white"></span>
     </button>
  );
}

function Squarescored(props){
  return(
    <button className="square-without-hover btn">
    <span className="black"></span>
    </button>
  );
}

function RestartFunc(props){
  return(
    <button className="btn btn-lg btn-dark btn" onClick={props.onClick} >
    Restart Game!
     </button>
  );
}

function QuitFunc(props){
  return(
    <button className="btn btn-lg btn-danger " onClick={props.onClick} >
    Quit Game!
     </button>
  );
}