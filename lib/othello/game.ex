defmodule Othello.Game do
    def new do
        %{
            squares: [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil,0,1,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],
            scoreBlack: 2,
            scoreWhite: 2,
            turn: 0,
            playerBlack: nil,
            playerWhite: nil,
            observers: []
        }

    end

    def client_view(game) do
        %{
            squares: game.squares,
            scoreBlack: game.scoreBlack,
            scoreWhite: game.scoreWhite,
            turn: game.turn,
            playerBlack: game.playerBlack,
            playerWhite: game.playerWhite,
            observers: game.observers
        }
    end

    #RETURNS : limit - the index at which the first square from left has a circle
    #          turnCount - number of squares which have circle of turn's color
    #          lastTurn - the last square (going right to left) which has turn's color
    def getFirstHorizontal(squares,i,lower,limit,turn,turnCount,lastTurn) do
        if(limit>=lower) do
            if(Enum.at(squares,limit)!=nil) do
                if(Enum.at(squares,limit)==turn) do
                    turnCount = turnCount+1
                    lastTurn = limit
                end
                obj=getFirstHorizontal(squares,i,lower,limit-1,turn,turnCount,lastTurn)
                limit = obj.limit
                turnCount = obj.turnCount
                lastTurn = obj.lastTurn
            end
        end
        %{
            limit: limit,
            turnCount: turnCount,
            lastTurn: lastTurn
        }
    end

    #Identifies which row the click has occured.
    #RETURNS : limit - the index at which the first square from left has a circle
    #          turnCount - number of squares which have circle of turn's color
    #          lastTurn - the last square (going right to left) which has turn's color
    def getFirstSquareHorizontal(squares,i,turn) do
        row1 = [0,7]
        row2 = [8,15]
        row3 = [16,23]
        row4 = [24,31]
        row5 = [32, 39]
        row6 = [40, 47]
        row7 = [48, 55]
        row8 = [56,63]
        index = -1
        limit = i-1
        if(i>=Enum.at(row1,0) and i<=Enum.at(row1,1)) do
            lower = Enum.at(row1,0)
            indexObj = getFirstHorizontal(squares, i,lower,limit,turn,0,i)
        end
        if(i>=Enum.at(row2,0) and i<=Enum.at(row2,1)) do
            lower = Enum.at(row2,0)
            indexObj = getFirstHorizontal(squares, i,lower,limit,turn,0,i)
        end 
        if(i>=Enum.at(row3,0) and i<=Enum.at(row3,1)) do
            lower = Enum.at(row3,0)
            indexObj = getFirstHorizontal(squares, i,lower,limit,turn,0,i)
        end       
        if(i>=Enum.at(row4,0) and i<=Enum.at(row4,1)) do
            lower = Enum.at(row4,0)
            indexObj = getFirstHorizontal(squares, i,lower,limit,turn,0,i)
        end
        if(i>=Enum.at(row5,0) and i<=Enum.at(row5,1)) do
            lower = Enum.at(row5,0)
            indexObj = getFirstHorizontal(squares, i,lower,limit,turn,0,i)
        end
        if(i>=Enum.at(row6,0) and i<=Enum.at(row6,1)) do
            lower = Enum.at(row6,0)
            indexObj = getFirstHorizontal(squares, i,lower,limit,turn,0,i)
        end
        if(i>=Enum.at(row7,0) and i<=Enum.at(row7,1)) do
            lower = Enum.at(row7,0)
            indexObj = getFirstHorizontal(squares, i,lower,limit,turn,0,i)
        end
        if(i>=Enum.at(row8,0) and i<=Enum.at(row8,1)) do
            lower = Enum.at(row8,0)
            indexObj = getFirstHorizontal(squares, i,lower,limit,turn,0,i)
        end
        IO.puts(index)
        indexObj
    end

    #RETURNS : squares with i value changed to color
    def changeSquareColor(squares,i,color) do
        squares = List.replace_at(squares,i,color)
        squares
    end

    #RETURNS : squares value from right (i) to left (index) to color
    def changeLeftHorizontal(squares,i,index,color) do
        if(i>=index) do
            squares = changeSquareColor(squares,i,color)
            squares = changeLeftHorizontal(squares,i-1,index,color)
        end
        squares
    end

    #RETURNS : limit - the index at which the last square from right has a circle
    #          turnCount - number of squares which have circle of turn's color
    #          lastTurn - the last square (going left to right) which has turn's color
    def getLastHorizontal(squares,i,higher,limit,turn,turnCount,lastTurn) do
        if(limit<=higher) do
            if(Enum.at(squares,limit)!=nil) do
                if(Enum.at(squares,limit)==turn) do
                    turnCount = turnCount+1
                    lastTurn = limit
                end
                obj = getLastHorizontal(squares,i,higher,limit+1,turn,turnCount,lastTurn)
                limit = obj.limit
                turnCount = obj.turnCount
                lastTurn = obj.lastTurn
            end
        end
        %{
            limit: limit,
            turnCount: turnCount,
            lastTurn: lastTurn
        }
    end

    #Identifies which row the click occurred.
    #RETURNS : limit - the index at which the last square from right has a circle
    #          turnCount - number of squares which have circle of turn's color
    #          lastTurn - the last square (going left to right) which has turn's color
    def getLastSquareHorizontal(squares,i,turn) do
        row1 = [0,7]
        row2 = [8,15]
        row3 = [16,23]
        row4 = [24,31]
        row5 = [32, 39]
        row6 = [40, 47]
        row7 = [48, 55]
        row8 = [56,63]
        index = -1
        limit = i+1
        if(i>=Enum.at(row1,0) and i<=Enum.at(row1,1)) do
            higher = Enum.at(row1,1)
            indexObj = getLastHorizontal(squares, i,higher,limit,turn,0,i)
        end
        if(i>=Enum.at(row2,0) and i<=Enum.at(row2,1)) do
            higher = Enum.at(row2,1)
            indexObj = getLastHorizontal(squares, i,higher,limit,turn,0,i)
        end 
        if(i>=Enum.at(row3,0) and i<=Enum.at(row3,1)) do
            higher = Enum.at(row3,1)
            indexObj = getLastHorizontal(squares, i,higher,limit,turn,0,i)
        end       
        if(i>=Enum.at(row4,0) and i<=Enum.at(row4,1)) do
            
            higher = Enum.at(row4,1)
            indexObj = getLastHorizontal(squares, i,higher,limit,turn,0,i)
        end
        if(i>=Enum.at(row5,0) and i<=Enum.at(row5,1)) do
            higher = Enum.at(row5,1)
            indexObj = getLastHorizontal(squares, i,higher,limit,turn,0,i)
        end
        if(i>=Enum.at(row6,0) and i<=Enum.at(row6,1)) do
            higher = Enum.at(row6,1)
            indexObj = getLastHorizontal(squares, i,higher,limit,turn,0,i)
        end
        if(i>=Enum.at(row7,0) and i<=Enum.at(row7,1)) do
            higher = Enum.at(row7,1)
            indexObj = getLastHorizontal(squares, i,higher,limit,turn,0,i)
        end
        if(i>=Enum.at(row8,0) and i<=Enum.at(row8,1)) do
            higher = Enum.at(row8,1)
            indexObj = getLastHorizontal(squares, i,higher,limit,turn,0,i)
        end
        indexObj
    end

    #RETURNS : squares value from left (index) to right (i) to color
    def changeRightHorizontal(squares,i,index,color) do
        if(i<=index) do
            squares = changeSquareColor(squares,i,color)
            squares = changeRightHorizontal(squares,i+1,index,color)
        end
        squares
    end

    #Avoids array indexing error
    def handleEnds(squares,i,turn) do
        if(i==0) do
            if(Enum.at(squares,i+1)!=nil) do
                obj = handleOnlyRight(squares,i,turn)
                squares = obj.squares
                valid = obj.valid
            end
        else
            if(Enum.at(squares,i-1)!=nil) do
                obj = handleOnlyLeft(squares,i,turn)
                squares = obj.squares
                valid = obj.valid    
            end
        end
        %{
            squares: squares,
            valid: valid
        }
    end

    #RETURNS : squares with values changed to color from the i in left 
    #          direction horizontally if the move is valid
    def handleOnlyLeft(squares,i,turn) do
        indexObj = getFirstSquareHorizontal(squares,i,turn) #first filled square of that row
        index = indexObj.limit
        turnCount = indexObj.turnCount
        lastTurn = indexObj.lastTurn
        notAllSame = i - lastTurn
        if(index==lastTurn and notAllSame != turnCount) do
            squares = changeLeftHorizontal(squares,i,index,turn)
            valid = true
        else
            if(lastTurn != i and notAllSame != turnCount) do
                squares = changeLeftHorizontal(squares,i,lastTurn,turn)
                valid = true
            end
        end
        %{
            squares: squares,
            valid: valid
        }
    end

    #RETURNS : squares with values changed to color from the i in right 
    #          direction horizontally if the move is valid
    def handleOnlyRight(squares,i,turn) do
        indexObj = getLastSquareHorizontal(squares,i,turn)
        index = indexObj.limit
        turnCount = indexObj.turnCount
        lastTurn = indexObj.lastTurn
        notAllSame = lastTurn - i
        if(index==lastTurn and notAllSame != turnCount) do
            squares = changeRightHorizontal(squares,i,index,turn)
            valid = true
        else
            if(lastTurn != i and notAllSame != turnCount) do
                squares = changeRightHorizontal(squares,i,lastTurn,turn)
                valid = true
            end
        end
        %{
            squares: squares,
            valid: valid
        }
    end

    #RETURNS : squares with values changed to color from the i in left 
    #          and right direction horizontally if the move is valid
    def handleBothSides(squares,i,turn) do
        obj = handleOnlyLeft(squares,i,turn)
        obj = handleOnlyRight(obj.squares,i,turn)
        valid = obj.valid
        squares = obj.squares
        %{
            squares: squares,
            valid: valid
        }
    end

    #RETURNS : squares with values changed to color from the i in left 
    #          direction or right direction or both left and right direction
    #          horizontally if the move is valid
    def checkHorizontal(squares,i,valid,turn) do
        #AVOIDS ENCOUNTERING -1 AND 64 ARRAY INDEXING
        if(i==0 or i==63) do
            obj = handleEnds(squares,i,turn)
            squares = obj.squares
            valid = obj.valid
        else
            #CHECKS IF NOTHING ON RIGHT OF IT BUT SOMETHING TO ITS LEFT
            if(Enum.at(squares,i-1) != nil and Enum.at(squares,i+1) == nil) do
                obj = handleOnlyLeft(squares,i,turn)
                squares = obj.squares
                valid = obj.valid
            else
                #CHECKS ONLY IF NOTHING ON LEFT BUT SOMETHING ON RIGHT
                if (Enum.at(squares,i-1) == nil and Enum.at(squares,i+1) != nil) do
                    obj = handleOnlyRight(squares,i,turn)
                    squares = obj.squares
                    valid = obj.valid
                else
                    #HERE GOES CODE WHEN THE BALL FALLS IN BETWEEN TWO BALLS
                    if(Enum.at(squares,i-1) != nil and Enum.at(squares,i+1) != nil) do
                        obj = handleBothSides(squares,i,turn)
                        squares = obj.squares
                        valid = obj.valid
                    end
                end
            end
        end
       
        %{
            squares: squares,
            valid: valid
        }
    end

    #RETURNS : limit - the index at which the last square from top has a circle
    #          turnCount - number of squares which have circle of turn's color
    #          lastTurn - the last square (going bottom to top) which has turn's color
    def getFirstSquareVertical(squares,i,limit,upLimit,turn,turnCount,lastTurn) do
        if(limit>=upLimit) do
            if(Enum.at(squares,limit)!=nil) do
                if(Enum.at(squares,limit)==turn) do
                    turnCount = turnCount + 1
                    lastTurn = limit
                end
                obj = getFirstSquareVertical(squares,i,limit-8,upLimit,turn,turnCount,lastTurn)
                limit = obj.limit
                turnCount = obj.turnCount
                lastTurn = obj.lastTurn
            end
        end
        %{
            limit: limit,
            turnCount: turnCount,
            lastTurn: lastTurn
        }
    end

    #RETURNS : limit - the index at which the last square from bottom has a circle
    #          turnCount - number of squares which have circle of turn's color
    #          lastTurn - the last square (going top to bottom) which has turn's color
    def getLastSquareVertical(squares,i,limit,downLimit,turn,turnCount,lastTurn) do
        if(limit<=downLimit) do
            if(Enum.at(squares,limit)!=nil) do
                if(Enum.at(squares,limit)==turn)do
                    turnCount = turnCount+1
                    lastTurn = limit
                end
                obj = getLastSquareVertical(squares,i,limit+8,downLimit,turn,turnCount,lastTurn)
                limit = obj.limit
                turnCount = obj.turnCount
                lastTurn = obj.lastTurn
            end
        end
        %{
            limit: limit,
            turnCount: turnCount,
            lastTurn: lastTurn
        }
    end

    #RETURNS : the index of the top-most square in limit's column
    def getUpLimit(limit) do
        if(limit-8>7) do
            limit = getUpLimit(limit-8)
        end
        limit
    end

    #RETURNS : the index of the bottom-most square in limit's column
    def getDownLimit(limit) do
        if(limit+8<64) do
            limit = getDownLimit(limit+8)
        end
        limit
    end

    #RETURNS : squares value from bottom (i) to top (upLimit) to color
    def changeUpVertical(squares,i,upLimit,turn) do
        if(upLimit <= i) do
            squares = changeSquareColor(squares,i,turn)
            squares = changeUpVertical(squares,i-8,upLimit,turn)
        end
        squares
    end

    #RETURNS : squares value from top (i) to bottom (downLimit) to color
    def changeDownVertical(squares,i,downLimit,turn) do
        if(downLimit >= i) do
            squares = changeSquareColor(squares,i,turn)
            squares = changeDownVertical(squares,i+8,downLimit,turn)
        end
        squares
    end

    #Avoids array indexing error
    def handleFirstLastRow(squares,i,turn) do
        if(i<8) do
            if(Enum.at(squares,i+8)!=nil) do
                obj = handleOnlyDown(squares,i,turn)
                squares = obj.squares
                valid = obj.valid
            end
        else
            if(Enum.at(squares,i-8)!=nil) do
                obj = handleOnlyUp(squares,i,turn)
                squares = obj.squares
                valid = obj.valid
            end
        end

        %{
            squares: squares,
            valid: valid
        }
    end

    #RETURNS : squares with values changed to color from i in up 
    #          direction vertically if the move is valid
    def handleOnlyUp(squares,i,turn) do
        limit = i-8
        upLimit = getUpLimit(i) - 8
        indexObj = getFirstSquareVertical(squares,i,limit,upLimit,turn,0,i) 
        index = indexObj.limit + 8
        turnCount = indexObj.turnCount
        lastTurn = indexObj.lastTurn
        notAllSame = i - lastTurn
        turnC = turnCount*8
        if(index==lastTurn and notAllSame != turnC and notAllSame > 8) do
            squares = changeUpVertical(squares,i,index,turn)
            valid = true
        else
            if(lastTurn != i and notAllSame != turnC and notAllSame > 8) do
                squares = changeUpVertical(squares,i,lastTurn,turn)
                valid = true
            end
        end
        %{
            squares: squares,
            valid: valid
        }
    end

    #RETURNS : squares with values changed to color from i in down 
    #          direction vertically if the move is valid
    def handleOnlyDown(squares,i,turn) do
        limit = i+8
        downLimit = getDownLimit(i) 
        indexObj = getLastSquareVertical(squares,i,limit,downLimit,turn,0,i)
        index = indexObj.limit - 8
        turnCount = indexObj.turnCount
        lastTurn = indexObj.lastTurn
        notAllSame = lastTurn - i
        turnC = turnCount*8
        if(index==lastTurn and notAllSame != turnC and notAllSame > 8) do
            squares = changeDownVertical(squares,i,index,turn)
            valid = true
        else
            if(lastTurn != i and notAllSame != turnC and notAllSame > 8) do
                squares = changeDownVertical(squares,i,lastTurn,turn)
                valid = true
            end
        end
        %{
            squares: squares,
            valid: valid
        }
    end

    #RETURNS : squares with values changed to color from i in both up and 
    #          down direction vertically if the move is valid
    def handleUpDown(squares,i,turn) do
        obj = handleOnlyUp(squares,i,turn)
        obj = handleOnlyDown(obj.squares,i,turn)
        valid = obj.valid
        squares = obj.squares
        %{
            squares: squares,
            valid: valid
        }
    end

    #RETURNS : squares with values changed to color from i in up direction or
    #          down direction or both up and down direction vertically if 
    #          the move is valid
    def checkVertical(squares,i,valid,turn) do
        #AVOIDS ARRAY INDEXING ERROR
        if(i<8 or i>63) do
            obj = handleFirstLastRow(squares,i,turn)
            squares = obj.squares
            valid = obj.valid
        else
            #CHECKS WHEN NOTHING DOWN BUT SOMETHING UP
            if(Enum.at(squares,i-8) !=nil and Enum.at(squares,i+8) == nil) do
                obj = handleOnlyUp(squares,i,turn)
                squares = obj.squares
                valid = obj.valid
            else
                #WHEN NOTHING UP BUT SOMETHING DOWN
                if(Enum.at(squares,i-8) ==nil and Enum.at(squares,i+8) != nil) do
                    obj = handleOnlyDown(squares,i,turn)
                    squares = obj.squares
                    valid = obj.valid
                else
                    #WHEN SOMETHING UP AND DOWN
                    if(Enum.at(squares,i-8) !=nil and Enum.at(squares,i+8) != nil) do
                        obj = handleUpDown(squares,i,turn)
                        squares = obj.squares
                        valid = obj.valid
                    end
                end
            end
        end
        %{
            squares: squares,
            valid: valid
        }
    end

    #Avoids array indexing error
    def handleLeftRightEdges(squares,i,valid,turn) do
        if(i+9>63) do
            if(Enum.at(squares,i-9)!=nil) do
                obj = handleLeftRightUp(squares,i,turn)
                squares = obj.squares
                valid = obj.valid
            end
        else
            if(Enum.at(squares,i+9)!=nil) do
                obj = handleLeftRightDown(squares,i,turn)
                squares = obj.squares
                valid = obj.valid
            end
        end
        %{
            squares: squares,
            valid: valid
        }
    end

    #RETURNS : index of the top-most square of the LEFT-RIGHT diagonal
    def getLeftRightUp(limit) do
        if(limit>=9) do
            limit = getLeftRightUp(limit-9)
        end
        limit
    end

    def getLeftRightUpFirst(squares,i,limit,upLimit,turn,turnCount,lastTurn) do
        if(limit>=upLimit) do
            if(Enum.at(squares,limit)!=nil) do
                if(Enum.at(squares,limit)==turn) do
                    turnCount = turnCount + 1
                    lastTurn = limit
                end
                obj = getLeftRightUpFirst(squares,i,limit-9,upLimit,turn,turnCount,lastTurn)
                limit = obj.limit
                turnCount = obj.turnCount
                lastTurn = obj.lastTurn
            end
        end
        %{
            limit: limit,
            turnCount: turnCount,
            lastTurn: lastTurn
        }
    end

    #RETURNS : squares with value changed to turn's color
    def changeLeftRightUp(squares,i,upLimit,turn) do
        if(upLimit<=i) do
            squares = changeSquareColor(squares,i,turn)
            squares = changeLeftRightUp(squares,i-9,upLimit,turn)
        end
        squares
    end

    def handleLeftRightUp(squares,i,valid,turn) do
        upLimit = getLeftRightUp(i)
        limit = i - 9
        indexObj = getLeftRightUpFirst(squares,i,limit,upLimit,turn,0,i)
        index = indexObj.limit
        turnCount = indexObj.turnCount
        lastTurn = indexObj.lastTurn
        notAllSame = i - lastTurn
        turnC = turnCount*9
        if(index==lastTurn and notAllSame != turnC and notAllSame > 9) do
            squares = changeLeftRightUp(squares,i,index,turn)
            valid = true
        else
            if(lastTurn != i and notAllSame != turnC and notAllSame > 9) do
                squares = changeLeftRightUp(squares,i,lastTurn,turn)
                valid = true
            end
        end
        %{
            squares: squares,
            valid: valid
        }
    end

    #RETURNS : index of the bottom-most square of the LEFT-RIGHT diagonal
    def getLeftRightDown(limit) do
        if(limit<=54) do
            limit = getLeftRightDown(limit+9)
        end
        limit
    end

    def getLeftRightDownLast(squares,i,limit,downLimit,turn,turnCount,lastTurn) do
        if(limit<=downLimit) do
            if(Enum.at(squares,limit)!=nil) do
                if(Enum.at(squares,limit)==turn) do
                    turnCount = turnCount + 1
                    lastTurn = limit
                end
                obj = getLeftRightDownLast(squares,i,limit+9,downLimit,turn,turnCount,lastTurn)
                limit = obj.limit
                turnCount = obj.turnCount
                lastTurn = obj.lastTurn
            end
        end
        %{
            limit: limit,
            turnCount: turnCount,
            lastTurn: lastTurn
        }
    end

     #RETURNS : squares with value changed to turn's color
    def changeLeftRightDown(squares,i,downLimit,turn) do
        if(downLimit>=i) do
            squares = changeSquareColor(squares,i,turn)
            squares = changeLeftRightDown(squares,i+9,downLimit,turn)
        end
        squares
    end

    def handleLeftRightDown(squares,i,valid,turn) do
        downLimit = getLeftRightDown(i)
        limit = i + 9
        indexObj = getLeftRightDownLast(squares,i,limit,downLimit,turn,0,i)
        index = indexObj.limit
        turnCount = indexObj.turnCount
        lastTurn = indexObj.lastTurn
        notAllSame = lastTurn - i
        turnC = turnCount*9
        if(index==lastTurn and notAllSame != turnC and notAllSame > 9) do
            squares = changeLeftRightDown(squares,i,index,turn)
            valid = true
        else
            if(lastTurn != i and notAllSame != turnC and notAllSame > 9) do
                squares = changeLeftRightDown(squares,i,lastTurn,turn)
                valid = true
            end
        end
        %{
            squares: squares,
            valid: valid
        }
    end

    #RETURNS : squares with values changed to color from i in both up and 
    #          down direction of diagonal LEFT-RIGHT if the move is valid
    def handleLeftRightUpDown(squares,i,valid,turn) do
        obj = handleLeftRightUp(squares,i,valid,turn)
        obj = handleLeftRightDown(obj.squares,i,obj.valid,turn)
        squares = obj.squares
        valid = obj.valid
        %{
            squares: squares,
            valid: valid
        }
    end

    #RETURNS : squares with values changed to color from i in up direction or
    #          down direction or up and down direction of diagonal LEFT-RIGHT 
    #          if the move is valid    
    def leftRightDiagonal(squares,i,valid,turn) do
        #AVOIDS ARRAY INDEXING ERROR
        if(i-9<9 or i+9>63) do
            obj = handleLeftRightEdges(squares,i,valid,turn)
            squares = obj.squares
            valid = obj.valid
        else
            #CHECKS IF SOMETHING IN LEFT-RIGHT UP SQUARE AND NOTHING IN LEFT-RIGHT DOWN
            if(Enum.at(squares,i-9)!=nil and Enum.at(squares,i+9)==nil) do
                obj = handleLeftRightUp(squares,i,valid,turn)
                squares = obj.squares
                valid = obj.valid
            else
                #CHECKS IF SOMETHING IN LEFT-RIGHT DOWN SQUARE AND NOTHING IN LEFT-RIGHT UP
                if(Enum.at(squares,i-9)==nil and Enum.at(squares,i+9)!=nil) do
                    obj = handleLeftRightDown(squares,i,valid,turn)
                    squares = obj.squares
                    valid = obj.valid
                else
                    #CHECKS IF SOMETHING IN LEFT-RIGHT UP AND DOWN DIRECTION
                    if(Enum.at(squares,i-9)!=nil and Enum.at(squares,i+9)!=nil) do
                        obj = handleLeftRightUpDown(squares,i,valid,turn)
                        squares = obj.squares
                        valid = obj.valid
                    end
                end
            end
        end
        %{
            squares: squares,
            valid: valid
        }
    end

    def handleRightLeftEdges(squares,i,valid,turn) do
        if(i-7<7) do
            if(Enum.at(squares,i+1)!=nil) do
                downLimit = getRightLeftDown(i)
                limit = i + 7
                indexObj = getRightLeftDownLast(squares,i,limit,downLimit,turn,0,i)
                index = indexObj.limit
                turnCount = indexObj.turnCount
                lastTurn = indexObj.lastTurn
                notAllSame = lastTurn - i
                turnC = turnCount*7
                if(index==lastTurn and notAllSame != turnC and notAllSame > 7) do
                    squares = changeRightLeftDown(squares,i,index,turn)
                    valid = true
                else
                    if(lastTurn != i and notAllSame != turnC and notAllSame > 7) do
                        squares = changeRightLeftDown(squares,i,lastTurn,turn)
                        valid = true
                    end
                end
            end
        else
            if(Enum.at(squares,i-1)!=nil) do
                upLimit = getRightLeftUp(i)
                limit = i - 7
                indexObj = getRightLeftUpFirst(squares,i,limit,upLimit,turn,0,i)
                index = indexObj.limit
                turnCount = indexObj.turnCount
                lastTurn = indexObj.lastTurn
                notAllSame = i - lastTurn
                turnC = turnCount*7
                if(index==lastTurn and notAllSame != turnC and notAllSame > 7) do
                    squares = changeRightLeftUp(squares,i,index,turn)
                    valid = true
                else
                    if(lastTurn != i and notAllSame != turnC and notAllSame > 7) do
                        squares = changeRightLeftUp(squares,i,lastTurn,turn)
                        valid = true
                    end
                end
            end
        end
        %{
            squares: squares,
            valid: valid
        }
    end

    #RETURNS : index of the top-most square of the RIGHT-LEFT diagonal
    def getRightLeftUp(limit) do
        if(limit>=7) do
            limit = getLeftRightUp(limit-7)
        end
        limit
    end

    def getRightLeftUpFirst(squares,i,limit,upLimit,turn,turnCount,lastTurn) do
        if(limit>=upLimit) do
            if(Enum.at(squares,limit)!=nil) do
                if(Enum.at(squares,limit)==turn) do
                    turnCount = turnCount + 1
                    lastTurn = limit
                end
                obj = getLeftRightUpFirst(squares,i,limit-7,upLimit,turn,turnCount,lastTurn)
                limit = obj.limit
                turnCount = obj.turnCount
                lastTurn = obj.lastTurn
            end
        end
        %{
            limit: limit,
            turnCount: turnCount,
            lastTurn: lastTurn
        }
    end

     #RETURNS : squares with value changed to turn's color
    def changeRightLeftUp(squares,i,upLimit,turn) do
        if(upLimit<=i) do
            squares = changeSquareColor(squares,i,turn)
            squares = changeRightLeftUp(squares,i-7,upLimit,turn)
        end
        squares
    end

    def handleRightLeftUp(squares,i,valid,turn) do
        upLimit = getRightLeftUp(i)
        limit = i - 7
        indexObj = getRightLeftUpFirst(squares,i,limit,upLimit,turn,0,i)
        index = indexObj.limit
        turnCount = indexObj.turnCount
        lastTurn = indexObj.lastTurn
        notAllSame = i - lastTurn
        turnC = turnCount*7
        if(index==lastTurn and notAllSame != turnC and notAllSame > 7) do
            squares = changeRightLeftUp(squares,i,index,turn)
            valid = true
        else
            if(lastTurn != i and notAllSame != turnC and notAllSame > 7) do
                squares = changeRightLeftUp(squares,i,lastTurn,turn)
                valid = true
            end
        end
        %{
            squares: squares,
            valid: valid
        }
    end

    #RETURNS : index of the bottom-most square of the RIGHT-LEFT diagonal
    def getRightLeftDown(limit) do
        if(limit<=56) do
            limit = getRightLeftDown(limit+7)
        end
        limit
    end

    def getRightLeftDownLast(squares,i,limit,downLimit,turn,turnCount,lastTurn) do
        if(limit<=downLimit) do
            if(Enum.at(squares,limit)!=nil) do
                if(Enum.at(squares,limit)==turn) do
                    turnCount = turnCount + 1
                    lastTurn = limit
                end
                obj = getRightLeftDownLast(squares,i,limit+7,downLimit,turn,turnCount,lastTurn)
                limit = obj.limit
                turnCount = obj.turnCount
                lastTurn = obj.lastTurn
            end
        end
        %{
            limit: limit,
            turnCount: turnCount,
            lastTurn: lastTurn
        }
    end

    #RETURNS : squares with value changed to turn's color
    def changeRightLeftDown(squares,i,downLimit,turn) do
        if(downLimit>=i) do
            squares = changeSquareColor(squares,i,turn)
            squares = changeRightLeftDown(squares,i+7,downLimit,turn)
        end
        squares
    end

    #RETURNS : squares with values changed to color from i in down 
    #          direction of diagonal RIGHT-LEFT if the move is valid
    def handleRightLeftDown(squares,i,valid,turn) do
        downLimit = getRightLeftDown(i)
        limit = i + 7
        indexObj = getRightLeftDownLast(squares,i,limit,downLimit,turn,0,i)
        index = indexObj.limit
        turnCount = indexObj.turnCount
        lastTurn = indexObj.lastTurn
        notAllSame = lastTurn - i
        turnC = turnCount*7
        if(index==lastTurn and notAllSame != turnC and notAllSame > 7) do
            squares = changeRightLeftDown(squares,i,index,turn)
            valid = true
        else
            if(lastTurn != i and notAllSame != turnC and notAllSame > 7) do
                squares = changeRightLeftDown(squares,i,lastTurn,turn)
                valid = true
            end
        end
        %{
            squares: squares,
            valid: valid
        }
    end

    #RETURNS : squares with values changed to color from i in both up and 
    #          down direction of diagonal RIGHT-LEFT if the move is valid
    def handleRightLeftUpDown(squares,i,valid,turn) do
        obj = handleRightLeftUp(squares,i,valid,turn)
        obj = handleRightLeftDown(obj.squares,i,obj.valid,turn)
        squares = obj.squares
        valid = obj.valid
        %{
            squares: squares,
            valid: valid
        }
    end

    #RETURNS : squares with values changed to turn's color from i in up direction or
    #          down direction or up and down direction of diagonal RIGHT-LEFT 
    #          if the move is valid  
    def rightLeftDiagonal(squares,i,valid,turn) do
        #AVOIDS ARRAY INDEXING ERROR
        if(i-7<8 or i+7>63) do
            obj = handleRightLeftEdges(squares,i,valid,turn)
            squares = obj.squares
            valid = obj.valid
        else
            #CHECKS IF SOMETHING IN RIGHT-LEFT UP SQUARE AND NOTHING IN RIGHT-LEFT DOWN
            if(Enum.at(squares,i-7)!=nil and Enum.at(squares,i+7)==nil) do
                obj = handleRightLeftUp(squares,i,valid,turn)
                squares = obj.squares
                valid = obj.valid
            else
                #CHECKS IF SOMETHING IN RIGHT-LEFT DOWN SQUARE AND NOTHING IN RIGHT-LEFT UP
                if(Enum.at(squares,i-7)==nil and Enum.at(squares,i+7)!=nil) do
                    obj = handleRightLeftDown(squares,i,valid,turn)
                    squares = obj.squares
                    valid = obj.valid
                else
                    #CHECKS IF SOMETHING IN RIGHT-LEFT UP AND DOWN DIRECTION
                    if(Enum.at(squares,i-7)!=nil and Enum.at(squares,i+7)!=nil) do
                        obj = handleRightLeftUpDown(squares,i,valid,turn)
                        squares = obj.squares
                        valid = obj.valid
                    end
                end
            end
        end
        %{
            squares: squares,
            valid: valid
        }
    end

    #RETURNS : squares with values changed to turn's color from i in up direction or
    #          down direction or up and down direction of diagonal RIGHT-LEFT 
    #          and LEFT-RIGHT if the move is valid 
    def checkDiagonal(squares,i,valid,turn) do
        obj = leftRightDiagonal(squares,i,valid,turn)
        obj = rightLeftDiagonal(obj.squares,i,obj.valid,turn)
        squares = obj.squares
        valid = obj.valid
        %{
            squares: squares,
            valid: valid
        }
    end

    #RETURNS : squares with values changed to turn's color, if the move is valid 
    def checkValidMove(squares,i,valid,turn) do
        check = checkHorizontal(squares,i,valid,turn)
        check = checkVertical(check.squares,i,check.valid,turn)
        check = checkDiagonal(check.squares,i,check.valid,turn)
    end

    def handleClickByServer(game,i) do
        squares = game.squares
        scoreBlack = game.scoreBlack
        scoreWhite = game.scoreWhite
        turn = game.turn
        if(Enum.at(squares,i) == nil) do
            valid = false
            obj = checkValidMove(squares,i,valid,turn)
            squares = obj.squares
            
        end
        if(turn == 0) do
            turn = 1
        else
            turn = 0
        end
        scoreBlack = updateBlack(squares)
        scoreWhite = updateWhite(squares)
        %{
            squares: squares,
            scoreBlack: scoreBlack,
            scoreWhite: scoreWhite,
            turn: turn,
            playerBlack: game.playerBlack,
            playerWhite: game.playerWhite,
            observers: game.observers
        }   
    end

    #RETURNS : game with all values set same as new game
    def handlerestart(game) do
        %{
            squares: [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil,0,1,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],
            scoreBlack: 0,
            scoreWhite: 0,
            turn: 0,
            playerBlack: nil,
            playerWhite: nil,
            observers: []
        }

    end

    def updateBlack(squares) do
        updateBlackRecur(squares,0,0)
    end

    def updateBlackRecur(squares, i,count) do
        if(i < 64) do
            if(Enum.at(squares,i) == 0) do
                updateBlackRecur(squares,i+1,count+1)
            else
                updateBlackRecur(squares,i+1,count)
            end
        else
            count
        end
    end

    def updateWhite(squares) do
        updateWhiteRecur(squares,0,0)
    end

    def updateWhiteRecur(squares, i,count) do
        if(i < 64) do
            if(Enum.at(squares,i) == 1) do
                updateWhiteRecur(squares,i+1,count+1)
            else
                updateWhiteRecur(squares,i+1,count)
            end
        else
            count
        end
    end

    #RETURNS : a game with playerName updated. If playerBlack is nil,
    #          it is updated with playerName. If playerWhite is nil,
    #          it is updated with playerName. Else playerName is added 
    #          ro observers list.    
    def addNewPlayer(game, playerName) do
        playerBlack = game.playerBlack
        playerWhite = game.playerWhite
        observers = game.observers
        if(playerBlack==nil) do
            playerBlack = playerName
        else
            if(playerWhite == nil) do
                playerWhite = playerName
            else
                observer = [playerName]
                observers = observers++observer
            end
        end
        %{
            squares: game.squares,
            scoreBlack: game.scoreBlack,
            scoreWhite: game.scoreWhite,
            turn: game.turn,
            playerBlack: playerBlack,
            playerWhite: playerWhite,
            observers: observers
        } 
    end

end