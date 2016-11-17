From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH] ARM: dts: lpc435x: remove address and size cells from
 gpio-keys-polled nodes
Date: Thu, 17 Nov 2016 04:06:15 +0200
Message-ID: <20161117020615.30383-1-vz@mleia.com>
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
To: Joachim Eastwood <manabian@gmail.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The change removes redundant #address-cells and #size-cells properties from
gpio-keys-polled compatible device nodes found in lpc4357-ea4357-devkit and
lpc4350-hitex-eval board DTS files.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 arch/arm/boot/dts/lpc4350-hitex-eval.dts    | 2 --
 arch/arm/boot/dts/lpc4357-ea4357-devkit.dts | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/lpc4350-hitex-eval.dts b/arch/arm/boot/dts/lpc4350-hitex-eval.dts
index 874c75d..7649285 100644
--- a/arch/arm/boot/dts/lpc4350-hitex-eval.dts
+++ b/arch/arm/boot/dts/lpc4350-hitex-eval.dts
@@ -40,8 +40,6 @@
 
 	pca_buttons {
 		compatible = "gpio-keys-polled";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		poll-interval = <100>;
 		autorepeat;
 
diff --git a/arch/arm/boot/dts/lpc4357-ea4357-devkit.dts b/arch/arm/boot/dts/lpc4357-ea4357-devkit.dts
index 9b5fad6..50ee2d5 100644
--- a/arch/arm/boot/dts/lpc4357-ea4357-devkit.dts
+++ b/arch/arm/boot/dts/lpc4357-ea4357-devkit.dts
@@ -57,8 +57,6 @@
 		compatible = "gpio-keys-polled";
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_joystick_pins>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 		poll-interval = <100>;
 		autorepeat;
 
-- 
2.10.2
