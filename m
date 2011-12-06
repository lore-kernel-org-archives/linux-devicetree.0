From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: libfdt: Add support for appending the values to a existing
 property
Date: Tue, 6 Dec 2011 11:22:40 +1100
Message-ID: <20111206002240.GB6753@truffala.fritz.box>
References: <20111205012207.GA3734@truffala.fritz.box>
 <E1RXbId-0003zK-SS@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E1RXbId-0003zK-SS-CYoMK+44s/E@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 05, 2011 at 10:21:50AM -0600, Jon Loeliger wrote:
> > From: Minghuan Lian <Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > 
> > Some properties may contain multiple values, these values may need
> > to be added to the property respectively. this patch provides this
> > functionality. The main purpose of fdt_append_prop() is to append
> > the values to a existing property, or create a new property if it
> > dose not exist.
> > 
> > Signed-off-by: Minghuan Lian <Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> > --- 
> > 
> > Jon,
> > 
> > Minghuan Lian sent this to the list ages ago, but it got stuck for
> > months in a mailing list mishap.  It more recently resurfaced, I made
> > some small cleanups and added testcases.  Please apply.
> 
> Ooo, sorry. So, yeah...
> 
> Applied.

Thanks.

But, apparently I've been using git so much lately, I've forgotten how
to use quilt :(.  Seems I left out the updates to the tests makefile
and script:

diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index 215a8c5..3f92074 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -12,6 +12,7 @@ LIB_TESTS_L = get_mem_rsv \
 	sw_tree1 \
 	move_and_save mangle-layout nopulate \
 	open_pack rw_tree1 set_name setprop del_property del_node \
+	appendprop1 appendprop2 \
 	string_escapes references path-references phandle_format \
 	boot-cpuid incbin \
 	extra-terminating-null \
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index da6f970..c72b9d2 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -178,6 +178,10 @@ libfdt_tests () {
     run_test rw_tree1
     tree1_tests rw_tree1.test.dtb
     tree1_tests_rw rw_tree1.test.dtb
+    run_test appendprop1
+    run_test appendprop2 appendprop1.test.dtb
+    run_dtc_test -I dts -O dtb -o appendprop.test.dtb appendprop.dts
+    run_test dtbs_equal_ordered appendprop2.test.dtb appendprop.test.dtb
 
     for basetree in test_tree1.dtb sw_tree1.test.dtb rw_tree1.test.dtb; do
 	run_test nopulate $basetree


-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
