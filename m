From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] ARM: dts: sun7i: Disable OOB IRQ for brcm wifi on Cubietruck
 and Banana Pro
Date: Sun, 30 Sep 2018 17:09:27 +0200
Message-ID: <20180930150927.12076-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-arm-kernel@lists.infradead.org, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

While doing some brcmfmac driver work I needed to test this also on some
devicetree based boards. So I fired up the good old Cubietruck and when
that would not work a Banana Pro.

With an unmodified 4.17 kernel both boards intermittently would come up
with non working wifi with the following errors:

 brcmfmac: brcmf_sdio_bus_rxctl: resumed on timeout
 brcmfmac: brcmf_bus_started: failed: -110
 brcmfmac: brcmf_attach: dongle is not responding: err=-110
 brcmfmac: brcmf_sdio_firmware_callback: brcmf_attach failed

They would come up this way more often then with actual working wifi,
once this problem happens it seems to require a power-cycle to fix.
Once things work one can safely reboot without hitting the issue.

I've found that disabling OOB interrupts fixes this. This really is more
of a workaround then a proper fix, but it makes the wifi reliable again
and it does not have much of a downside.

Using an OOB IRQ instead of the sdio-IRQ mechanism is mostly important to
allow the MMC controller to go into runtime-suspend which is not really an
issue on these boards since they are (usually) not battery powered.

I've looked at recent brcmfmac and mmc-core changes which may explain this
and I've not found anything. So the most likely culprit is the A20 external
interrupt handling e.g. perhaps it is set to edge instead of level? Either
way I do not have time to further investigate this.

BugLink: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=908438
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 arch/arm/boot/dts/sun7i-a20-bananapro.dts  | 16 +++++++++++++---
 arch/arm/boot/dts/sun7i-a20-cubietruck.dts | 16 +++++++++++++---
 2 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/sun7i-a20-bananapro.dts b/arch/arm/boot/dts/sun7i-a20-bananapro.dts
index 0898eb6162f5..0e1ddd998b20 100644
--- a/arch/arm/boot/dts/sun7i-a20-bananapro.dts
+++ b/arch/arm/boot/dts/sun7i-a20-bananapro.dts
@@ -174,9 +174,19 @@
 	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
-		interrupt-parent = <&pio>;
-		interrupts = <7 15 IRQ_TYPE_LEVEL_LOW>;
-		interrupt-names = "host-wake";
+		/*
+		 * OOB interrupt support is broken ATM, often the first irq
+		 * does not get seen resulting in the drv probe failing with:
+		 *
+		 * brcmfmac: brcmf_sdio_bus_rxctl: resumed on timeout
+		 * brcmfmac: brcmf_bus_started: failed: -110
+		 * brcmfmac: brcmf_attach: dongle is not responding: err=-110
+		 * brcmfmac: brcmf_sdio_firmware_callback: brcmf_attach failed
+		 *
+		 * interrupt-parent = <&pio>;
+		 * interrupts = <7 15 IRQ_TYPE_LEVEL_LOW>;
+		 * interrupt-names = "host-wake";
+		 */
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun7i-a20-cubietruck.dts b/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
index 5649161de1d7..a837516db6f9 100644
--- a/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
+++ b/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
@@ -222,9 +222,19 @@
 	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
-		interrupt-parent = <&pio>;
-		interrupts = <7 10 IRQ_TYPE_LEVEL_LOW>; /* PH10 / EINT10 */
-		interrupt-names = "host-wake";
+		/*
+		 * OOB interrupt support is broken ATM, often the first irq
+		 * does not get seen resulting in the drv probe failing with:
+		 *
+		 * brcmfmac: brcmf_sdio_bus_rxctl: resumed on timeout
+		 * brcmfmac: brcmf_bus_started: failed: -110
+		 * brcmfmac: brcmf_attach: dongle is not responding: err=-110
+		 * brcmfmac: brcmf_sdio_firmware_callback: brcmf_attach failed
+		 *
+		 * interrupt-parent = <&pio>;
+		 * interrupts = <7 10 IRQ_TYPE_LEVEL_LOW>; /* PH10 / EINT10 */
+		 * interrupt-names = "host-wake";
+		 */
 	};
 };
 
-- 
2.19.0
