From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH v2 2/6] powerpc: wii: Explicitly configure GPIO owner for poweroff pin
Date: Mon, 22 Jan 2018 06:04:07 +0100
Message-ID: <20180122050411.32460-3-j.neuschaefer@gmx.net>
References: <20180122050411.32460-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180122050411.32460-1-j.neuschaefer@gmx.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
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

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
---

v2:
- no change
---
 arch/powerpc/platforms/embedded6xx/wii.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/powerpc/platforms/embedded6xx/wii.c b/arch/powerpc/platforms/embedded6xx/wii.c
index 79a1fe54ebc9..6e6db1e16d71 100644
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
