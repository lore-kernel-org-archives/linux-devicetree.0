From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
Subject: [PATCH v3 1/4] powerpc: wii: Explicitly configure GPIO owner for poweroff pin
Date: Fri,  9 Feb 2018 13:07:28 +0100
Message-ID: <20180209120732.17863-2-j.neuschaefer@gmx.net>
References: <20180209120732.17863-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180209120732.17863-1-j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Hollywood chipset's GPIO controller has two sets of registers: One
for access by the PowerPC CPU, and one for access by the ARM coprocessor
(but both are accessible from the PPC because the memory firewall
(AHBPROT) is usually disabled when booting Linux, today).

The wii_power_off function currently assumes that the poweroff GPIO pin
is configured for use via the ARM side, but the upcoming GPIO driver
configures all pins for use via the PPC side, breaking poweroff.

Configure the owner register explicitly in wii_power_off to make
wii_power_off work with and without the new GPIO driver.

I think the Wii can be switched to the generic gpio-poweroff driver,
after the GPIO driver is merged.

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
---

v2, v3:
- no change
---
 arch/powerpc/platforms/embedded6xx/wii.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/powerpc/platforms/embedded6xx/wii.c b/arch/powerpc/platforms/embedded6xx/wii.c
index 160fa09533ba..4682327f76a9 100644
--- a/arch/powerpc/platforms/embedded6xx/wii.c
+++ b/arch/powerpc/platforms/embedded6xx/wii.c
@@ -45,6 +45,7 @@
 #define HW_GPIO_BASE(idx)	(idx * 0x20)
 #define HW_GPIO_OUT(idx)	(HW_GPIO_BASE(idx) + 0)
 #define HW_GPIO_DIR(idx)	(HW_GPIO_BASE(idx) + 4)
+#define HW_GPIO_OWNER		(HW_GPIO_BASE(1) + 0x1c)
 
 #define HW_GPIO_SHUTDOWN	(1<<1)
 #define HW_GPIO_SLOT_LED	(1<<5)
@@ -177,6 +178,12 @@ static void wii_power_off(void)
 	local_irq_disable();
 
 	if (hw_gpio) {
+		/*
+		 * set the owner of the shutdown pin to ARM, because it is
+		 * accessed through the registers for the ARM, below
+		 */
+		clrbits32(hw_gpio + HW_GPIO_OWNER, HW_GPIO_SHUTDOWN);
+
 		/* make sure that the poweroff GPIO is configured as output */
 		setbits32(hw_gpio + HW_GPIO_DIR(1), HW_GPIO_SHUTDOWN);
 
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
