From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH 07/10] Use shorten_echo for wrap_tests
Date: Wed, 29 May 2013 12:51:35 +1000
Message-ID: <1369795898-7631-8-git-send-email-david@gibson.dropbear.id.au>
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

We have certain tests which generate extremely long command lines, which
are shortened in the testsuite output with the 'shorten_echo' function.
Currently that is used in run_fdtput_test and run_wrap_test, this patch
uses it for run_wrap_test as well, allowing more general tests with long
command lines.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 tests/run_tests.sh |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index b013761..9c87369 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -80,7 +80,7 @@ wrap_test () {
 }
 
 run_wrap_test () {
-    echo -n "$@:	"
+    shorten_echo "$@:	"
     base_run_test wrap_test "$@"
 }
 
-- 
1.7.10.4
