From: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 3/3] MIPS: OCTEON: fix PCI interrupt routing on D-Link DSR-500N
Date: Sat,  3 Sep 2016 00:11:36 +0300
Message-ID: <20160902211136.8610-4-aaro.koskinen@iki.fi>
References: <20160902211136.8610-1-aaro.koskinen@iki.fi>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160902211136.8610-1-aaro.koskinen-X3B1VOXEql0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Fix PCI interrupt routing on D-Link DSR-500N.

Signed-off-by: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
---
 arch/mips/pci/pci-octeon.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/pci/pci-octeon.c b/arch/mips/pci/pci-octeon.c
index c258cd4..308d051 100644
--- a/arch/mips/pci/pci-octeon.c
+++ b/arch/mips/pci/pci-octeon.c
@@ -204,6 +204,8 @@ const char *octeon_get_pci_interrupts(void)
 	 * Interrupt Number (INTA# = 0, INTB# = 1, INTC# = 2, and
 	 * INTD# = 3)
 	 */
+	if (of_machine_is_compatible("dlink,dsr-500n"))
+		return "CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC";
 	switch (octeon_bootinfo->board_type) {
 	case CVMX_BOARD_TYPE_NAO38:
 		/* This is really the NAC38 */
-- 
2.9.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
