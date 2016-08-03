From: Jon Mason <jon.mason@broadcom.com>
Subject: [PATCH 02/11] ARM: dts: NSP: Enable SATA and add i2c devices on XMC
Date: Wed,  3 Aug 2016 14:38:57 -0400
Message-ID: <1470249546-12440-3-git-send-email-jon.mason@broadcom.com>
References: <1470249546-12440-1-git-send-email-jon.mason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1470249546-12440-1-git-send-email-jon.mason@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: f.fainelli@gmail.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Scott Branden <sbranden@broadcom.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Ray Jui <rjui@broadcom.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Enable SATA on bcm958625xmc and add the i2c devices present.

Signed-off-by: Jon Mason <jon.mason@broadcom.com>
---
 arch/arm/boot/dts/bcm958525xmc.dts | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/bcm958525xmc.dts b/arch/arm/boot/dts/bcm958525xmc.dts
index d257e83..a337f2d 100644
--- a/arch/arm/boot/dts/bcm958525xmc.dts
+++ b/arch/arm/boot/dts/bcm958525xmc.dts
@@ -47,6 +47,24 @@
 	};
 };
 
+&i2c0 {
+	temperature-sensor@4c {
+		compatible = "adi,adt7461a";
+		reg = <0x4c>;
+	};
+
+	eeprom@52 {
+		compatible = "atmel,24c02";
+		reg = <0x52>;
+		pagesize = <16>;
+	};
+
+	rtc@68 {
+		compatible = "st,m41t81";
+		reg = <0x68>;
+	};
+};
+
 &nand {
 	nandcs@0 {
 		compatible = "brcm,nandcs";
@@ -85,7 +103,7 @@
 	};
 };
 
-/* XHCI, SATA, MMC, and Ethernet support needed to be complete */
+/* XHCI, MMC, and Ethernet support needed to be complete */
 
 &uart0 {
 	status = "okay";
@@ -99,6 +117,18 @@
 	status = "okay";
 };
 
+&sata_phy0 {
+	status = "okay";
+};
+
+&sata_phy1 {
+	status = "okay";
+};
+
+&sata {
+	status = "okay";
+};
+
 &pinctrl {
 	pinctrl-names = "default";
 	pinctrl-0 = <&nand_sel>;
-- 
2.7.4
