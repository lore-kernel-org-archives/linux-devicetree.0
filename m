From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH 08/10] Remove some tests for misfeatures
Date: Wed, 29 May 2013 12:51:36 +1000
Message-ID: <1369795898-7631-9-git-send-email-david@gibson.dropbear.id.au>
References: <1369795898-7631-1-git-send-email-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1369795898-7631-1-git-send-email-david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: jdl-CYoMK+44s/E@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

There are a couple of fdtput related tests which are rather pointless -
they explicitly test for the presence of an undesirable limitation in
fdtput, which will cause test failures when we fix it.  This patch removes
the tests.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 tests/run_tests.sh |    4 ----
 1 file changed, 4 deletions(-)

diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 9c87369..d0a7f02 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -549,9 +549,6 @@ fdtput_tests () {
 	-tx "a0b0c0d deeaae ef000000"
     run_fdtput_test "$(cat $text)" $dtb /randomnode blob -ts "$(cat $text)"
 
-    # This should be larger than available space in the fdt
-    run_wrap_error_test $DTPUT $dtb /randomnode blob -ts "$(cat $text $text)"
-
     # Start again with a fresh dtb
     run_dtc_test -O dtb -p $(stat -c %s $text) -o $dtb $dts
 
@@ -572,7 +569,6 @@ fdtput_tests () {
     run_fdtput_test "fine wine" $dtb /blackadder/the-second/potato drink \
 	"-ts" "fine wine"
     run_wrap_test $DTPUT $dtb -p /you/are/drunk/sir/winston slurp -ts twice
-    run_wrap_error_test $DTPUT $dtb -cp "$(cat $text $text)/longish"
 
     # Allowed to create an existing node with -p
     run_wrap_test $DTPUT $dtb -cp /chosen
-- 
1.7.10.4
