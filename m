From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg-NmTC/0ZBporQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] of/irq: Fix device_node refcount in of_irq_parse_raw()
Date: Tue, 17 Dec 2013 18:32:53 +0100
Message-ID: <1387301573-30502-1-git-send-email-clg@fr.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg-NmTC/0ZBporQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Commit 2361613206e6, "of/irq: Refactor interrupt-map parsing" changed
the refcount on the device_node causing an error in of_node_put():

ERROR: Bad of_node_put() on /pci@800000020000000
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 3.13.0-rc3-dirty #2
Call Trace:
[c00000003e403500] [c0000000000144fc] .show_stack+0x7c/0x1f0 (unreliabl=
e)
[c00000003e4035d0] [c00000000070f250] .dump_stack+0x88/0xb4
[c00000003e403650] [c0000000005e8768] .of_node_release+0xd8/0xf0
[c00000003e4036e0] [c0000000005eeafc] .of_irq_parse_one+0x10c/0x280
[c00000003e4037a0] [c0000000005efd4c] .of_irq_parse_pci+0x3c/0x1d0
[c00000003e403840] [c000000000038240] .pcibios_setup_device+0xa0/0x2e0
[c00000003e403910] [c0000000000398f0] .pcibios_setup_bus_devices+0x60/0=
xd0
[c00000003e403990] [c00000000003b3a4] .__of_scan_bus+0x1a4/0x2b0
[c00000003e403a80] [c00000000003a62c] .pcibios_scan_phb+0x30c/0x410
[c00000003e403b60] [c0000000009fe430] .pcibios_init+0x7c/0xd4

This patch adjusts the refcount in the walk of the interrupt tree.
When a match is found, there is no need to increase the refcount=20
on 'out_irq->np' as 'newpar' is already holding a ref. The refcount
balance between 'ipar' and 'newpar' is maintained in the skiplevel:
goto label.

This patch also removes the usage of the device_node variable 'old'=20
which seems useless after the latest changes.

Signed-off-by: C=C3=A9dric Le Goater <clg-NmTC/0ZBporQT0dZR+AlfA@public.gmane.org>
---

This patch was tested on powerpc, pseries and powernv. This is a=20
new area for me so I might have missed a path. Please take a look.

We could now introduce an helper routine to look for #address-cells in
of_irq_parse_raw(). This can be the subject of another patch.

Thanks,

C.

 drivers/of/irq.c |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 786b0b47fae4..27212402c532 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -165,7 +165,6 @@ int of_irq_parse_raw(const __be32 *addr, struct of_=
phandle_args *out_irq)
 		if (of_get_property(ipar, "interrupt-controller", NULL) !=3D
 				NULL) {
 			pr_debug(" -> got it !\n");
-			of_node_put(old);
 			return 0;
 		}
=20
@@ -250,8 +249,7 @@ int of_irq_parse_raw(const __be32 *addr, struct of_=
phandle_args *out_irq)
 		 * Successfully parsed an interrrupt-map translation; copy new
 		 * interrupt specifier into the out_irq structure
 		 */
-		of_node_put(out_irq->np);
-		out_irq->np =3D of_node_get(newpar);
+		out_irq->np =3D newpar;
=20
 		match_array =3D imap - newaddrsize - newintsize;
 		for (i =3D 0; i < newintsize; i++)
@@ -268,7 +266,6 @@ int of_irq_parse_raw(const __be32 *addr, struct of_=
phandle_args *out_irq)
 	}
  fail:
 	of_node_put(ipar);
-	of_node_put(out_irq->np);
 	of_node_put(newpar);
=20
 	return -EINVAL;
--=20
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
