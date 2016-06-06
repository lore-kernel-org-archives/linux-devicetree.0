From: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 7/7] ARM: dts: sun7i: Enable NAND on Wexler TAB7200
Date: Mon,  6 Jun 2016 13:24:24 +0300
Message-ID: <1465208664-9366-8-git-send-email-mamlinav@gmail.com>
References: <1465208664-9366-1-git-send-email-mamlinav@gmail.com>
Reply-To: mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCENVD7YAEIIDH6VXICRUBEC5ZRLY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1465208664-9366-1-git-send-email-mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Enable the NFC and describe the NAND flash connected to this controller.

Signed-off-by: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts | 41 ++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts b/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
index 2f6b21a..42aff91 100644
--- a/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
+++ b/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
@@ -159,6 +159,47 @@
 	status = "okay";
 };
 
+&nfc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&nand_pins_a>, <&nand_cs0_pins_a>, <&nand_rb0_pins_a>;
+	status = "okay";
+
+	nand@0 {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		reg = <0>;
+		allwinner,rb = <0>;
+
+		nand-ecc-mode = "hw";
+		nand-on-flash-bbt;
+
+		boot0@0 {
+			label = "boot0";
+			reg = /bits/ 64 <0x0 0x200000>;
+		};
+
+		boot0-rescue@200000 {
+			label = "boot0-rescue";
+			reg = /bits/ 64 <0x200000 0x200000>;
+		};
+
+		uboot@400000 {
+			label = "uboot";
+			reg = /bits/ 64 <0x400000 0x200000>;
+		};
+
+		uboot-rescue@600000 {
+			label = "uboot-rescue";
+			reg = /bits/ 64 <0x600000 0x200000>;
+		};
+
+		main@800000 {
+			label = "main";
+			reg = /bits/ 64 <0x800000 0xff800000>;
+		};
+	};
+};
+
 &ohci0 {
 	status = "okay";
 };
-- 
2.7.3
