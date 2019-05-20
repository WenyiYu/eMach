classdef TokenMake
    % TOKENMAKE Data generated upon making a component
    
    properties(GetAccess = 'public', SetAccess = 'protected')
        csToken = [];
        prepSectToken = [];
        makeSolidToken = [];
    end
    
    methods        
        function obj = TokenMake(csToken, prepSectToken, makeSolidToken)
            % TOKENMAKE Constructor of a TokenMake
            
            % TODO: validate `csToken` is an ARRAY of CrossSectToken objects:
            % validateattributes(csToken, {});
            
            % TODO: consider validating the other tokens...
            
            obj.csToken = csToken;
            obj.prepSectToken = prepSectToken;
            obj.makeSolidToken = makeSolidToken;
        end        
    end
end

