From: Walter Goossens <waltergoossens-CmkmPbn3yAE@public.gmane.org>
Subject: microblaze console init
Date: Sat, 11 Dec 2010 22:50:33 +0100
Message-ID: <4D03F229.9070403@home.nl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------070908040400010701010609"
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a multi-part message in MIME format.
--------------070908040400010701010609
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi list,

while working on fdt support for the nios2 I was reading some code for 
other archs I also looked at the microblaze code and I believe I found 
some leftovers from a copy/paste action, attached is a small patch 
(untested) to fix a debug print and (more important) remove a useless 
call to early_init_dt_check_for_initrd.

I do still have one concern, do I understand correctly that there is no 
way to do address-translation (the "ranges" stuff) on a flattenend tree, 
using the of_get_flat_dt_* functions? This would mean that this code 
would fail to get the correct address for a uartlite connected to a bus 
that has address-translation.

Greetingz
Walter

--------------070908040400010701010609
Content-Type: text/plain; x-mac-type="0"; x-mac-creator="0";
 name="microblaze_prom_copy_paste_fix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="microblaze_prom_copy_paste_fix.patch"

diff --git a/arch/microblaze/kernel/prom.c b/arch/microblaze/kernel/prom.c
index a105301..c881393 100644
--- a/arch/microblaze/kernel/prom.c
+++ b/arch/microblaze/kernel/prom.c
@@ -61,14 +61,12 @@ static int __init early_init_dt_scan_serial(unsigned long node,
 	char *p;
 	int *addr;
 
-	pr_debug("search \"chosen\", depth: %d, uname: %s\n", depth, uname);
+	pr_debug("search \"serial\", depth: %d, uname: %s\n", depth, uname);
 
 /* find all serial nodes */
 	if (strncmp(uname, "serial", 6) != 0)
 		return 0;
 
-	early_init_dt_check_for_initrd(node);
-
 /* find compatible node with uartlite */
 	p = of_get_flat_dt_prop(node, "compatible", &l);
 	if ((strncmp(p, "xlnx,xps-uartlite", 17) != 0) &&

--------------070908040400010701010609
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--------------070908040400010701010609--
