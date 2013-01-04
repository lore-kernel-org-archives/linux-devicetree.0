From: Pantelis Antoniou <panto@antoniou-consulting.com>
Subject: Fix test relying in wrong behavior of is_printable
Date: Fri,  4 Jan 2013 21:16:08 +0200
Message-ID: <1357326968-13124-1-git-send-email-panto@antoniou-consulting.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Loeliger <jdl@jdl.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Matt Porter <mporter@ti.com>, Russ Dill <Russ.Dill@ti.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-Id: devicetree@vger.kernel.org

After fixing the is_printable bug the test suite fails.
Fix it with this patch

Signed-off-by: Pantelis Antoniou <panto@antoniou-consulting.com>
---
 tests/run_tests.sh | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index dd7f217..43279c9 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -498,9 +498,8 @@ fdtget_tests () {
 
     # run_fdtget_test <expected-result> [<flags>] <file> <node> <property>
     run_fdtget_test "MyBoardName" $dtb / model
-    run_fdtget_test "77 121 66 111 \
-97 114 100 78 97 109 101 0 77 121 66 111 97 114 100 70 97 109 105 \
-108 121 78 97 109 101 0" $dtb / compatible
+    # run_fdtget_test "77 121 66 111 97 114 100 78 97 109 101 0 77 121 66 111 97 114 100 70 97 109 105 108 121 78 97 109 101 0" $dtb / compatible
+    run_fdtget_test "MyBoardName MyBoardFamilyName" $dtb / compatible
     run_fdtget_test "MyBoardName MyBoardFamilyName" -t s $dtb / compatible
     run_fdtget_test 32768 $dtb /cpus/PowerPC,970@1 d-cache-size
     run_fdtget_test 8000 -tx $dtb /cpus/PowerPC,970@1 d-cache-size
-- 
1.7.12
