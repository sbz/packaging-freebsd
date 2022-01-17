--- pf.go.orig	2022-01-18 11:38:14 UTC
+++ pf.go
@@ -66,7 +66,7 @@ func newPF(config *bouncerConfig) (interface{}, error)
 func (ctx *pfContext) checkTable() error {
 	log.Infof("Checking pf table: %s", ctx.table)
 
-	cmd := exec.Command(pfctlCmd, "-s", "Tables")
+	cmd := exec.Command(pfctlCmd, "-a", "crowdsec", "-s", "Tables")
 	out, err := cmd.CombinedOutput()
 
 	if err != nil {
@@ -79,7 +79,7 @@ func (ctx *pfContext) checkTable() error {
 }
 
 func (ctx *pfContext) shutDown() error {
-	cmd := exec.Command(pfctlCmd, "-t", ctx.table, "-T", "flush")
+	cmd := exec.Command(pfctlCmd, "-a", "crowdsec", "-t", ctx.table, "-T", "flush")
 	log.Infof("pf table clean-up : %s", cmd.String())
 	if out, err := cmd.CombinedOutput(); err != nil {
 		log.Errorf("Error while flushing table (%s): %v --> %s", cmd.String(), err, string(out))
@@ -94,7 +94,7 @@ func (ctx *pfContext) Add(decision *models.Decision) e
 		return err
 	}
 	log.Debugf(addBanFormat, backendName, *decision.Value, strconv.Itoa(int(banDuration.Seconds())), *decision.Scenario)
-	cmd := exec.Command(pfctlCmd, "-t", ctx.table, "-T", "add", *decision.Value)
+	cmd := exec.Command(pfctlCmd, "-a", "crowdsec", "-t", ctx.table, "-T", "add", *decision.Value)
 	log.Debugf("pfctl add : %s", cmd.String())
 	if out, err := cmd.CombinedOutput(); err != nil {
 		log.Infof("Error while adding to table (%s): %v --> %s", cmd.String(), err, string(out))
@@ -109,7 +109,7 @@ func (ctx *pfContext) Delete(decision *models.Decision
 		return err
 	}
 	log.Debugf(delBanFormat, backendName, *decision.Value, strconv.Itoa(int(banDuration.Seconds())), *decision.Scenario)
-	cmd := exec.Command(pfctlCmd, "-t", ctx.table, "-T", "delete", *decision.Value)
+	cmd := exec.Command(pfctlCmd, "-a", "crowdsec", "-t", ctx.table, "-T", "delete", *decision.Value)
 	log.Debugf("pfctl del : %s", cmd.String())
 	if out, err := cmd.CombinedOutput(); err != nil {
 		log.Infof("Error while deleting from table (%s): %v --> %s", cmd.String(), err, string(out))
