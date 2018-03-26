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
       // console.log(playerName);
        this.channel = props.channel;
        console.log("calling join");
        console.log("player name is "+ playerName);
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
            cturn: null
        };
        this.channel.on("reload:view", game => {
          this.setState(game);
      
        });
        // this.channel.on("player:entered",game =>{

        //   console.log("player:entered mein aaya ");
        //   console.log("player name is "+ playerName);
          
        //     // if(game.playerBlack == null){
        //     //   this.setState({
        //     //     squares: game.squares,
        //     //     scoreBlack: game.scoreBlack,
        //     //     scoreWhite: game.scoreWhite,
        //     //     turn: game.turn,
        //     //     playerWhite: game.playerWhite,
        //     //     playerBlack: playerName,
        //     //     observors: game.observors
        //     //   })
        //     // }
        //     // else if(game.playerWhite == null){
        //     //   this.setState({
        //     //     squares: game.squares,
        //     //     scoreBlack: game.scoreBlack,
        //     //     scoreWhite: game.scoreWhite,
        //     //     turn: game.turn,
        //     //     playerWhite: playerName,
        //     //     playerBlack: game.playerBlack,
        //     //     observors: game.observors
        //     //   })
        //     // }
        //     // else{
        //     //   this.setState({
        //     //     squares: game.squares,
        //     //     scoreBlack: game.scoreBlack,
        //     //     scoreWhite: game.scoreWhite,
        //     //     turn: game.turn,
        //     //     playerWhite: game.playerWhite,
        //     //     playerBlack: game.playerBlack,
        //     //     observors: game.observors + [playerName]
        //     //   })
        //     // }
        //     this.channel.push("player:joined", {player_name: playerName})
        //     .receive("ok", this.gotView.bind(this))

        // })
    }
   

    gotView(view){
      console.log(view.game);
    //  const scoreWB = this.state.scoreWhite;
     // const scoreBB = this.state.scoreBlack;
      this.setState(view.game);
      const score1 = view.game.scoreWhite;
      const score2 = view.game.scoreBlack;
     // if(scoreWB == score1 && scoreBB == score2){
      //  alert("Invalid Move! You lost your turn")
     // }
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
    }
    handleClickByServer(i){
      //console.log("yaha aaay");
      this.channel.push("handleClickByServer",{num:i })
          .receive("ok", this.gotView.bind(this))

    }
    handleClick(i){
      //console.log("clicked")
       this.handleClickByServer(i); 
    }
    restartFn(){
      this.channel.push("restartFn",{})
      .receive("ok",this.gotView.bind(this))
    }
    render() {
        const current = this.state.squares;
        console.log(this.cTurn);
        return (
        <div>
          <div className="game">
            <div className="game-board">
                <Board 
                    squares= {current}
                    onClick = {(i) => this.handleClick(i)}
                />
            </div>
          </div>
          <div >
            <div className="score"><p>scoreBlack :: {this.state.scoreBlack} </p></div>
            <div className="score"><p>scoreWhite :: {this.state.scoreWhite} </p></div>
            <div className="score"><p>Player Black :: {this.state.playerBlack} </p></div>
            <div className="score"><p>player White :: {this.state.playerWhite} </p></div>
            <div className="score"><p>curren Turn  :: {this.state.cTurn} </p></div>

          </div>
          <div>
            <RestartFunc onClick = {() => this.restartFn()} />
            <a className="btn btn-primary btn-lg github" href="https://github.com/rishab121/othello" target="_blank">
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
    <button className="btn btn-danger btn-lg" onClick={props.onClick} >
    Restart
     </button>
  );
}