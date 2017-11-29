node default {
        include apt
        include java
        include jenkins
        include stdlib
#       include zypprepo
}

jenkins::plugin { 'credentials'  : version => "2.1.12",}
jenkins::plugin { 'workflow-cps' : version => "2.28",}
jenkins::plugin { 'log-parser' : version => "2.0",}
jenkins::plugin { 'pipeline-stage-view' : version => "2.5",}
jenkins::plugin { 'ant' : version => "1.4",}
jenkins::plugin { 'postbuildscript' : version => "0.17",}
jenkins::plugin { 'matrix-auth' : version => "1.4",}
jenkins::plugin { 'workflow-step-api' : version => "2.9",}
jenkins::plugin { 'workflow-support' : version => "2.13",}
jenkins::plugin { 'structs' : version => "1.7",}
jenkins::plugin { 'git-client' : version => "2.3.0",}
jenkins::plugin { 'pipeline-model-api' : version => "1.0.2",}
jenkins::plugin { 'job-dsl' : version => "1.58",}
jenkins::plugin { 'run-condition' : version => "1.0",}
jenkins::plugin { 'repo' : version => "1.10.6",}
jenkins::plugin { 'ssh-slaves' : version => "1.13",}
jenkins::plugin { 'workflow-aggregator' : version => "2.5",}
jenkins::plugin { 'javadoc' : version => "1.4",}
jenkins::plugin { 'ssh-credentials' : version => "1.13",}
jenkins::plugin { 'naginator' : version => "1.17.2",}
jenkins::plugin { 'workflow-scm-step' : version => "2.4",}
jenkins::plugin { 'pipeline-milestone-step' : version => "1.3",}
jenkins::plugin { 'bouncycastle-api' : version => "2.16.0",}
jenkins::plugin { 'copyartifact' : version => "1.38.1",}
jenkins::plugin { 'windows-slaves' : version => "1.2",}
jenkins::plugin { 'build-failure-analyzer' : version => "1.18.0",}
jenkins::plugin { 'multiple-scms' : version => "0.6",}
jenkins::plugin { 'rebuild' : version => "1.25",}
jenkins::plugin { 'teamconcert-git' : version => "1.0.10",}
jenkins::plugin { 'external-monitor-job' : version => "1.7",}
jenkins::plugin { 'scm-api' : version => "2.0.8",}
jenkins::plugin { 'token-macro' : version => "2.0",}
jenkins::plugin { 'flexible-publish' : version => "0.15.2",}
jenkins::plugin { 'scriptler' : version => "2.9",}
jenkins::plugin { 'analysis-core' : version => "1.82",}
jenkins::plugin { 'promoted-builds' : version => "2.28.1",}
jenkins::plugin { 'ivy' : version => "1.27.1",}
jenkins::plugin { 'matrix-project' : version => "1.8",}
jenkins::plugin { 'momentjs' : version => "1.1.1",}
jenkins::plugin { 'jobConfigHistory' : version => "2.15",}
jenkins::plugin { 'workflow-durable-task-step' : version => "2.9",}
jenkins::plugin { 'ace-editor' : version => "1.1",}
jenkins::plugin { 'email-ext' : version => "2.57",}
jenkins::plugin { 'antisamy-markup-formatter' : version => "1.5",}
jenkins::plugin { 'build-pipeline-plugin' : version => "1.5.6",}
jenkins::plugin { 'display-url-api' : version => "1.1.1",}
jenkins::plugin { 'workflow-job' : version => "2.10",}
jenkins::plugin { 'extended-choice-parameter' : version => "0.75",}
jenkins::plugin { 'pipeline-model-definition' : version => "1.0.2",}
jenkins::plugin { 'durable-task' : version => "1.13",}
jenkins::plugin { 'dashboard-view' : version => "2.9.10",}
jenkins::plugin { 'pipeline-model-declarative-agent' : version => "1.0.2",}
jenkins::plugin { 'git-server' : version => "1.7",}
jenkins::plugin { 'workflow-cps-global-lib' : version => "2.6",}
jenkins::plugin { 'plain-credentials' : version => "1.4",}
jenkins::plugin { 'delivery-pipeline-plugin' : version => "0.10.2",}
jenkins::plugin { 'dynamicparameter' : version => "0.2.0",}
jenkins::plugin { 'build-monitor-plugin' : version => "1.11+build.201701152243",}
jenkins::plugin { 'handlebars' : version => "1.1.1",}
jenkins::plugin { 'workflow-basic-steps' : version => "2.4",}
jenkins::plugin { 'pipeline-graph-analysis' : version => "1.3",}
jenkins::plugin { 'pipeline-build-step' : version => "2.4",}
jenkins::plugin { 'pipeline-stage-tags-metadata' : version => "1.0.2",}
jenkins::plugin { 'locale' : version => "1.2",}
jenkins::plugin { 'build-blocker-plugin' : version => "1.7.3",}
jenkins::plugin { 'teamconcert' : version => "1.2.0.2",}
jenkins::plugin { 'workflow-multibranch' : version => "2.12",}
jenkins::plugin { 'script-security' : version => "1.27",}
jenkins::plugin { 'jquery' : version => "1.11.2-0",}
jenkins::plugin { 'dynamic-axis' : version => "1.0.3",}
jenkins::plugin { 'config-file-provider' : version => "2.15.6",}
jenkins::plugin { 'junit' : version => "1.20",}
jenkins::plugin { 'test-stability' : version => "2.2",}
jenkins::plugin { 'timestamper' : version => "1.8.8",}
jenkins::plugin { 'cobertura' : version => "1.9.8",}
jenkins::plugin { 'maven-plugin' : version => "2.15.1",}
jenkins::plugin { 'authentication-tokens' : version => "1.3",}
jenkins::plugin { 'gradle' : version => "1.26",}
jenkins::plugin { 'pipeline-rest-api' : version => "2.5",}
jenkins::plugin { 'plot' : version => "1.9",}
jenkins::plugin { 'git' : version => "3.1.0",}
jenkins::plugin { 'mailer' : version => "1.19",}
jenkins::plugin { 'credentials-binding' : version => "1.10",}
jenkins::plugin { 'coverity' : version => "1.8.1",}
jenkins::plugin { 'pam-auth' : version => "1.3",}
jenkins::plugin { 'jquery-detached' : version => "1.2.1",}
jenkins::plugin { 'scp' : version => "1.8",}
jenkins::plugin { 'versionnumber' : version => "1.8.1",}
jenkins::plugin { 'conditional-buildstep' : version => "1.3.5",}
jenkins::plugin { 'workflow-api' : version => "2.11",}
jenkins::plugin { 'ws-cleanup' : version => "0.32",}
jenkins::plugin { 'parameterized-trigger' : version => "2.33",}
jenkins::plugin { 'docker-commons' : version => "1.6",}
jenkins::plugin { 'cloudbees-folder' : version => "5.18",}
jenkins::plugin { 'warnings' : version => "4.60",}
jenkins::plugin { 'docker-workflow' : version => "1.10",}
jenkins::plugin { 'icon-shim' : version => "2.0.3",}
jenkins::plugin { 'pipeline-input-step' : version => "2.5",}
jenkins::plugin { 'envinject' : version => "1.93.1",}
jenkins::plugin { 'build-name-setter' : version => "1.6.5",}
jenkins::plugin { 'branch-api' : version => "2.0.7",}
jenkins::plugin { 'role-strategy' : version => "2.3.2",}
jenkins::plugin { 'ldap' : version => "1.14",}
jenkins::plugin { 'pipeline-stage-step' : version => "2.2",}
jenkins::plugin { 'build-timeout' : version => "1.18",}
jenkins::plugin { 'resource-disposer' : version => "0.6",}