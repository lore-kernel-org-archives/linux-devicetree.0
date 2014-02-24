From: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Subject: [PATCH] ARM: dts: keystone: add AEMIF/NAND device entry
Date: Mon, 24 Feb 2014 20:52:56 +0200
Message-ID: <1393267976-15709-1-git-send-email-ivan.khoronzhuk@ti.com>
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
To: santosh.shilimkar@ti.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, grygorii.strashko@ti.com, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, robh+dt@kernel.org, galak@codeaurora.org, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add AEMIF/NAND device entry.

Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
---

Based on
git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone.git
keystone/master

 arch/arm/boot/dts/k2hk-evm.dts  | 52 +++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/keystone.dtsi | 13 +++++++++++
 2 files changed, 65 insertions(+)

diff --git a/arch/arm/boot/dts/k2hk-evm.dts b/arch/arm/boot/dts/k2hk-evm.dts
index 1d8ea6e..a08581b 100644
--- a/arch/arm/boot/dts/k2hk-evm.dts
+++ b/arch/arm/boot/dts/k2hk-evm.dts
@@ -84,3 +84,55 @@
 &usb {
 	status = "okay";
 };
+
+&aemif {
+	cs0 {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		clock-ranges;
+		ranges;
+
+		ti,cs-chipselect = <0>;
+		/* all timings in nanoseconds */
+		ti,cs-min-turnaround-ns = <12>;
+		ti,cs-read-hold-ns = <6>;
+		ti,cs-read-strobe-ns = <23>;
+		ti,cs-read-setup-ns = <9>;
+		ti,cs-write-hold-ns = <8>;
+		ti,cs-write-strobe-ns = <23>;
+		ti,cs-write-setup-ns = <8>;
+
+		nand@0,0 {
+			compatible = "ti,keystone-nand","ti,davinci-nand";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0 0 0x4000000
+			       1 0 0x0000100>;
+
+			ti,davinci-chipselect = <0>;
+			ti,davinci-mask-ale = <0x2000>;
+			ti,davinci-mask-cle = <0x4000>;
+			ti,davinci-mask-chipsel = <0>;
+			nand-ecc-mode = "hw";
+			ti,davinci-ecc-bits = <4>;
+			nand-on-flash-bbt;
+
+			partition@0 {
+				label = "u-boot";
+				reg = <0x0 0x100000>;
+				read-only;
+			};
+
+			partition@100000 {
+				label = "params";
+				reg = <0x100000 0x80000>;
+				read-only;
+			};
+
+			partition@180000 {
+				label = "ubifs";
+				reg = <0x180000 0x7E80000>;
+			};
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/keystone.dtsi b/arch/arm/boot/dts/keystone.dtsi
index 4eceb46..af80cb2 100644
--- a/arch/arm/boot/dts/keystone.dtsi
+++ b/arch/arm/boot/dts/keystone.dtsi
@@ -266,5 +266,18 @@
 			ti,ngpio = <32>;
 			ti,davinci-gpio-unbanked = <32>;
 		};
+
+		aemif: aemif@21000A00 {
+			compatible = "ti,keystone-aemif", "ti,davinci-aemif";
+			#address-cells = <2>;
+			#size-cells = <1>;
+			clocks = <&clkaemif>;
+			clock-names = "aemif";
+			clock-ranges;
+
+			reg = <0x21000A00 0x00000100>;
+			ranges = <0 0 0x30000000 0x10000000
+				  1 0 0x21000A00 0x00000100>;
+		};
 	};
 };
-- 
1.8.3.2
