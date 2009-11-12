From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Don't use echo -e in run_tests.sh
Date: Thu, 12 Nov 2009 11:56:34 +1100
Message-ID: <20091112005634.GJ3235@yookeroo.seuss>
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
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

In one section, the run_tests script attempts to use the -e (interpret
escapes) option to echo.  This option is not portable - for example
the echo built into dash, now the default /bin/sh on several
distributions does not support it and will just echo "-e" literally.

Since we don't actually use any of the escapes that -e enables, this
patch simply removes it.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Index: dtc/tests/run_tests.sh
===================================================================
--- dtc.orig/tests/run_tests.sh	2009-11-12 11:52:41.000000000 +1100
+++ dtc/tests/run_tests.sh	2009-11-12 11:52:50.000000000 +1100
@@ -339,14 +339,14 @@ for set in $TESTSETS; do
     esac
 done
 
-echo -e "********** TEST SUMMARY"
-echo -e "*     Total testcases:	$tot_tests"
-echo -e "*                PASS:	$tot_pass"
-echo -e "*                FAIL:	$tot_fail"
-echo -e "*   Bad configuration:	$tot_config"
+echo "********** TEST SUMMARY"
+echo "*     Total testcases:	$tot_tests"
+echo "*                PASS:	$tot_pass"
+echo "*                FAIL:	$tot_fail"
+echo "*   Bad configuration:	$tot_config"
 if [ -n "$VALGRIND" ]; then
-    echo -e "*    valgrind errors:	$tot_vg"
+    echo "*    valgrind errors:	$tot_vg"
 fi
-echo -e "* Strange test result:	$tot_strange"
-echo -e "**********"
+echo "* Strange test result:	$tot_strange"
+echo "**********"
 


-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
