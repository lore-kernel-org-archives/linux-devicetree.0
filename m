From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH 10/10] Generate test data for fdtput more sensibly
Date: Fri,  3 Feb 2012 16:12:09 +1100
Message-ID: <1328245929-15443-11-git-send-email-david@gibson.dropbear.id.au>
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

Currently run_tests.sh generates several files of text test data.  The
procedure it uses for this is somewhat torturous and has several problems:
 * Since the test data is derived from a dts file, a cursory glance at the
test output suggests something is wrong with the processing of that dts.
This is misleading since in fact it's just being used as an arbirary
string.
 * Since the base input has linefeeds removed, the head and sort commands
used later have no effect.
 * Although an attempt is made to get rid of characters which the shell
will mangle, it's not thorough enough.  Specifically it leaves in \ which
means that some string escapes found in the input data can get expanded
somewhere along the line in some shells.

This patch, therefore, replaces this generation of test data with a
pre-canned "Lorem ipsum" of approximately 2k.  On my system, where /bin/sh
is dash, this fixes a test failure due to the aforementioned string
escapes being evaluated on one but not the other of the two comparison
paths (I haven't tracked down exactly where the expansion is happening).

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 tests/lorem.txt    |   35 +++++++++++++++++++++++++++++++++++
 tests/run_tests.sh |   32 ++++++--------------------------
 2 files changed, 41 insertions(+), 26 deletions(-)
 create mode 100644 tests/lorem.txt

diff --git a/tests/lorem.txt b/tests/lorem.txt
new file mode 100644
index 0000000..acff698
--- /dev/null
+++ b/tests/lorem.txt
@@ -0,0 +1,35 @@
+Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris eros
+arcu, egestas non pellentesque non, euismod eu nibh. Proin arcu metus,
+dapibus vitae sodales rhoncus, suscipit vel nulla. Etiam lorem est,
+aliquam ut fringilla sit amet, condimentum et quam. Duis eu arcu odio,
+at pulvinar nisi. Morbi condimentum eros ut turpis rhoncus
+pharetra. Pellentesque habitant morbi tristique senectus et netus et
+malesuada fames ac turpis egestas. Nam et nulla enim. Etiam fringilla
+eleifend neque, at posuere ante lacinia a. Duis orci tortor, dictum ac
+gravida ac, euismod eu leo. Sed eget dolor tortor. Pellentesque
+venenatis, lectus eu vulputate porta, libero ipsum convallis mi, sit
+amet vehicula arcu elit sit amet odio.
+
+Fusce iaculis massa metus, id sagittis diam. Praesent molestie ante
+vel odio tincidunt auctor. Cum sociis natoque penatibus et magnis dis
+parturient montes, nascetur ridiculus mus. Duis rutrum vehicula nisl
+eget condimentum. In in justo nisl. Nullam id arcu at nisl eleifend
+pretium. Nulla interdum ligula id elit mollis dictum a sit amet
+quam. Nullam iaculis laoreet ipsum at tempus. Vestibulum in cursus
+dui. Curabitur porta lectus eget urna bibendum congue eget elementum
+nisi. Proin sit amet lectus ut neque iaculis consectetur eu sit amet
+nibh. Maecenas rhoncus dolor ac nunc gravida blandit. Fusce sem felis,
+aliquam a porttitor a, porta quis odio.
+
+Nunc purus lorem, sollicitudin non ultricies id, porta vitae
+enim. Nulla tristique gravida leo ut suscipit. Phasellus vitae turpis
+libero. Proin ac purus dolor, in suscipit magna. Sed et enim
+arcu. Morbi semper aliquet suscipit. Aenean laoreet condimentum massa,
+eu pharetra magna fermentum ut. Morbi euismod convallis tortor, eget
+fringilla lacus sagittis non. Nullam bibendum posuere feugiat.
+
+In at pulvinar massa. Mauris nunc lectus, mollis et malesuada
+pharetra, cursus sed lacus. Integer dolor urna, interdum a mollis at,
+vestibulum non nisl. Sed in urna tortor. Mauris arcu felis, volutpat
+quis euismod vel, congue sit amet ipsum. Morbi in aliquet purus. Duis
+cras amet.
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 999c882..a561433 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -480,28 +480,10 @@ fdtget_tests () {
 fdtput_tests () {
     dts=label01.dts
     dtb=$dts.fdtput.test.dtb
+    text=lorem.txt
 
-    # Create some test files containing useful strings
-    base=tmp.test0
-    file1=tmp.test1
-    file2=tmp.test2
-    bigfile1=tmp.test3
-    bigfile2=tmp.test4
-
-    # Filter out anything the shell might not like
-    cat $dts | tr -d "'\"\n\;/\.\*{}\-" | tr -s "[:blank:]" " " >$base
-
-    # Make two small files
-    head -5 $base >$file1
-    cat $file1 | tr a-z A-Z | cut -c10-30 | sort -r >$file2
-
-    # and two larger ones
-    cat $base > $bigfile1
-    tac $base | tr a-z A-Z | sort -r >$bigfile2
-
-    # Allow just enough space for both file1 and file2
-    space=$(( $(stat -c %s $file1) + $(stat -c %s $file2) ))
-    run_dtc_test -O dtb -p $space -o $dtb $dts
+    # Allow just enough space for $text
+    run_dtc_test -O dtb -p $(stat -c %s $text) -o $dtb $dts
 
     # run_fdtput_test <expected-result> <file> <node> <property> <flags> <value>
     run_fdtput_test "a_model" $dtb / model -ts "a_model"
@@ -514,12 +496,10 @@ fdtput_tests () {
 	-tbx "a b c ea ad be ef"
     run_fdtput_test "a0b0c0d deeaae ef000000" $dtb /randomnode blob \
 	-tx "a0b0c0d deeaae ef000000"
-    run_fdtput_test "`cat $file1 $file2`" $dtb /randomnode blob \
-	-ts "`cat $file1`" "`cat $file2`"
+    run_fdtput_test "$(cat $text)" $dtb /randomnode blob -ts "$(cat $text)"
 
-    # This should be larger than available space in the fdt ($space)
-    run_wrap_error_test $DTPUT $dtb /randomnode blob \
-	-ts "`cat $bigfile1`" "`cat $bigfile2`"
+    # This should be larger than available space in the fdt
+    run_wrap_error_test $DTPUT $dtb /randomnode blob -ts "$(cat $text $text)"
 
     # TODO: Add tests for verbose mode?
 }
-- 
1.7.8.3
