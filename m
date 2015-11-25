From: Curt Brune <curt-qUQiAmfTcIp+XZJcv9eMoEEOCMrvLtNR@public.gmane.org>
Subject: [RFC 1/1] powerpc: legacy serial port use device tree cell-index property
Date: Wed, 25 Nov 2015 10:46:49 -0800
Message-ID: <1448477209-22340-2-git-send-email-curt@cumulusnetworks.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org, mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Currently for PowerPC systems using device tree, the legacy serial
ports are allocated in the order by which they are found in the device
tree structure.

This can cause problems in cases where the device tree nodes are
sysnthesized by an external program (kexec for example), which may not
preserve the original order of the device tree nodes.  This in turn
can result in the serial console changing from ttyS0 to ttyS1
unexpectedly.

This patch uses the 'cell-index' property (if present) to map UART
device tree nodes to legacy serial port number.  The cell-index
property is widely used in all the Freescale .dts files for PowerPC.

Signed-off-by: Curt Brune <curt-qUQiAmfTcIp+XZJcv9eMoEEOCMrvLtNR@public.gmane.org>
---
 arch/powerpc/kernel/legacy_serial.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/legacy_serial.c b/arch/powerpc/kernel/legacy_serial.c
index 7b750c4..b717133 100644
--- a/arch/powerpc/kernel/legacy_serial.c
+++ b/arch/powerpc/kernel/legacy_serial.c
@@ -164,6 +164,8 @@ static int __init add_legacy_soc_port(struct device_node *np,
 	u64 addr;
 	const __be32 *addrp;
 	struct device_node *tsi = of_get_parent(np);
+	int index = -1, len;
+	u32 *indexp;
 
 	/* We only support ports that have a clock frequency properly
 	 * encoded in the device-tree.
@@ -188,14 +190,19 @@ static int __init add_legacy_soc_port(struct device_node *np,
 	if (addr == OF_BAD_ADDR)
 		return -1;
 
+	/* Check if the ports have an ordering, defined by 'cell-index' */
+	if (((indexp = (u32*)of_get_property(np, "cell-index", &len)) != NULL) &&
+	    (len == sizeof(u32)))
+		index = *indexp;
+
 	/* Add port, irq will be dealt with later. We passed a translated
 	 * IO port value. It will be fixed up later along with the irq
 	 */
 	if (tsi && !strcmp(tsi->type, "tsi-bridge"))
-		return add_legacy_port(np, -1, UPIO_TSI, addr, addr,
+		return add_legacy_port(np, index, UPIO_TSI, addr, addr,
 				       NO_IRQ, legacy_port_flags, 0);
 	else
-		return add_legacy_port(np, -1, UPIO_MEM, addr, addr,
+		return add_legacy_port(np, index, UPIO_MEM, addr, addr,
 				       NO_IRQ, legacy_port_flags, 0);
 }
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
