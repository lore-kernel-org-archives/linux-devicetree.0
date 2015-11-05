From: Kapil Hali <kapilh@broadcom.com>
Subject: [PATCH RESEND 2/4] ARM: dts: add SMP support for Broadcom NSP
Date: Thu, 5 Nov 2015 00:51:19 -0500
Message-ID: <1446702681-45339-3-git-send-email-kapilh@broadcom.com>
References: <1446702681-45339-1-git-send-email-kapilh@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1446702681-45339-1-git-send-email-kapilh@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell
 King <linux@arm.linux.org.uk>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: devicetree@vger.kernel.org, Paul Walmsley <paul@pwsan.com>, Heiko Stuebner <heiko@sntech.de>, Hauke Mehrtens <hauke@hauke-m.de>, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, Kever Yang <kever.yang@rock-chips.com>, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, bcm-kernel-feedback-list@broadcom.com, Gregory Fong <gregory.0xf0@gmail.com>, Olof Johansson <olof@lixom.net>, Maxime Ripard <maxime.ripard@free-electrons.com>, Kapil Hali <kapilh@broadcom.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add device tree changes required for providing SMP support
for Broadcom Northstar Plus SoC.

Signed-off-by: Kapil Hali <kapilh@broadcom.com>
---
 arch/arm/boot/dts/bcm-nsp.dtsi | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/bcm-nsp.dtsi b/arch/arm/boot/dts/bcm-nsp.dtsi
index 58aca27..d1875d9 100644
--- a/arch/arm/boot/dts/bcm-nsp.dtsi
+++ b/arch/arm/boot/dts/bcm-nsp.dtsi
@@ -40,24 +40,33 @@
 	model = "Broadcom Northstar Plus SoC";
 	interrupt-parent = <&gic>;
 
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		enable-method = "brcm,bcm-nsp-smp";
+		secondary-boot-reg = <0xffff042c>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a9";
+			next-level-cache = <&L2>;
+			reg = <0x0>;
+		};
+
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a9";
+			next-level-cache = <&L2>;
+			reg = <0x1>;
+		};
+	};
+
 	mpcore {
 		compatible = "simple-bus";
 		ranges = <0x00000000 0x19020000 0x00003000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 
-		cpus {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			cpu@0 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a9";
-				next-level-cache = <&L2>;
-				reg = <0x0>;
-			};
-		};
-
 		L2: l2-cache {
 			compatible = "arm,pl310-cache";
 			reg = <0x2000 0x1000>;
-- 
2.1.0
