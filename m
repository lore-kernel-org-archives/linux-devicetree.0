From: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Subject: [PATCH 3/4] Fix test relying in wrong behavior of is_printable
Date: Fri,  4 Jan 2013 21:15:21 +0200
Message-ID: <1357326921-13085-1-git-send-email-panto@antoniou-consulting.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
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
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: Matt Porter <mporter-l0cyMroinI0@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Russ Dill <Russ.Dill-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

After fixing the is_printable bug the test suite fails.
Fix it with this patch

Signed-off-by: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
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
