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
        this.state = {
            squares: Array(64).fill(null),
            score1: 0,
            score2: 0,
            turn: 0,
        };
    }

    gotView(view){
      console.log(view.game);
      this.setState(view.game);
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
            <div className="score"><p>Score1 :: {this.state.score1} </p></div>
            <div className="score"><p>Score2 :: {this.state.score2} </p></div>
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
        else if(value == 1){
          return ( 
            <Squarevalues 
            onClick= {() => this.props.onClick(i)}
          />);
        }
        else{
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
    <button className="square-filled btn" onClick={props.onClick} >
    <span className="white"></span>
     </button>
  );
}

function Squarescored(props){
  return(
    <button className="square-scored btn"  onClick={props.onClick} >
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