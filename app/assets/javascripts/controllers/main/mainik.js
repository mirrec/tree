  $(function () {
    $('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', 'Collapse this branch');
    $('.tree li.parent_li > span').on('click', function (e) {
        var children = $(this).parent('li.parent_li').find(' > ul > li');
        if (children.is(":visible")) {
            children.hide('fast');
            $(this).attr('title', 'Expand this branch').find(' > i').addClass('icon-plus-sign').removeClass('icon-minus-sign');
        } else {
            children.show('fast');
            $(this).attr('title', 'Collapse this branch').find(' > i').addClass('icon-minus-sign').removeClass('icon-plus-sign');
        }
        e.stopPropagation();
    });
});



angular.module('plunker', ['ui.bootstrap']);


function DialogDemoCtrl($scope, $dialog, $http){


  
  //  buildEmptyTree();
    buildTreeFromRailsData ("");

    $scope.selectedNode = "";
    
 $scope.najdi = function (){
    buildTreeFromRailsData($scope.frmFindInTree);
 }  


 $scope.showNode = function(data) {
   
   console.log(data);

      
        
         return data.name;

    };

 $scope.isClient = function(selectedNode) {

        if (selectedNode == undefined) {
            return false;
        }

        if (selectedNode.device_name != undefined) {
            return true;
        }

        return false;
    };

 function buildTreeFromRailsData (param){
 $http.get('http://0.0.0.0:3000/items.json?q='+param).
    success(function(data, status, headers, config) {
      $scope.displayTree = data;
    }).
    error(function(data, status, headers, config) {
      // log error
    });

 }

 function buildEmptyTree() {

        $scope.displayTree =
            [{
            "name": "Root",
            "type_name": "Node",
            "show": true,
            "nodes": [{
                "name": "Loose",
                "group_name": "Node-1",
                "show": true,
                "nodes": [{
                    "name": "Node-1-1",
                    "device_name": "Node-1-1",
                    "show": true,
                    "nodes": []
                }, {
                    "name": "Node-1-2",
                    "device_name": "Node-1-2",
                    "show": true,
                    "nodes": []
                }, {
                    "name": "Node-1-3",
                    "device_name": "Node-1-3",
                    "show": true,
                    "nodes": []
                }]
            }, {
                "name": "God",
                "group_name": "Node-2",
                "show": true,
                "nodes": [{
                    "name": "Vadar",
                    "device_name": "Node-2-1",
                    "show": true,
                    "nodes": []
                }]
            }, {
                "name": "Borg",
                "group_name": "Node-3",
                "show": true,
                "nodes": []
            }, {
                "name": "Fess",
                "group_name": "Node-4",
                "show": true,
                "nodes": []
            }]
        }];
        [{
            "name": "Android",
            "type_name": "Android",
            "icon": "icon-android icon-3",
            "show": true,
            "nodes": []
        }];
    }

}