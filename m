From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [dtc] Remove another bashism from run_tests.sh
Date: Mon, 30 Aug 2010 12:53:03 +1000
Message-ID: <20100830025303.GA5210@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Current we check for various error codes with [ $x == "NN" ].  However
'==' is not actually a correct operator for the [ (test) command.  It
should be either '=' for string comparison or '-eq' for integer
comparison.  It appears that the bash builtin version of test
implements '==' though, so we were getting away with it, as long as
/bin/sh was bash - or the testsuite generated no errors.

This patch fixes the usage of test so that it should work on non-bash
shells.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Index: dtc/tests/run_tests.sh
===================================================================
--- dtc.orig/tests/run_tests.sh	2010-08-30 12:43:03.133784380 +1000
+++ dtc/tests/run_tests.sh	2010-08-30 12:43:34.741770203 +1000
@@ -24,11 +24,11 @@ base_run_test() {
 	tot_pass=$((tot_pass + 1))
     else
 	ret="$?"
-	if [ "$ret" == "1" ]; then
+	if [ "$ret" -eq 1 ]; then
 	    tot_config=$((tot_config + 1))
-	elif [ "$ret" == "2" ]; then
+	elif [ "$ret" -eq 2 ]; then
 	    tot_fail=$((tot_fail + 1))
-	elif [ "$ret" == "$VGCODE" ]; then
+	elif [ "$ret" -eq $VGCODE ]; then
 	    tot_vg=$((tot_vg + 1))
 	else
 	    tot_strange=$((tot_strange + 1))

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
