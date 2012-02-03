From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH 06/10] Remove bashism from run_tests.sh
Date: Fri,  3 Feb 2012 16:12:05 +1100
Message-ID: <1328245929-15443-7-git-send-email-david@gibson.dropbear.id.au>
References: <1328245929-15443-1-git-send-email-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1328245929-15443-1-git-send-email-david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: jdl-CYoMK+44s/E@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

The patches introducing fdtget and fdtput inserted a peculiar bashism to
run_tests.sh using non-portable assignment within an (( )) expression.
This patch fixes it.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 tests/run_tests.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 2650559..37c173c 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -478,7 +478,7 @@ fdtput_tests () {
     tac $base | tr a-z A-Z | sort -r >$bigfile2
 
     # Allow just enough space for both file1 and file2
-    (( space = $(stat -c %s $file1) + $(stat -c %s $file2) ))
+    space=$(( $(stat -c %s $file1) + $(stat -c %s $file2) ))
     $DTC -O dtb -p $space -o $file ${file%.dtb}.dts 2>/dev/null
 
     # run_fdtput_test <test-name> <expected-result> <file> <key> <flags>
-- 
1.7.8.3
