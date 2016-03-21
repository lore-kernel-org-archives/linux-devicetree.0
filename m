From: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH v2 5/5] ARM: dts: sun7i: Add SPDIF to Itead Ibox
Date: Mon, 21 Mar 2016 17:10:42 +0100
Message-ID: <1458576642-4078-6-git-send-email-codekipper@gmail.com>
References: <1458576642-4078-1-git-send-email-codekipper@gmail.com>
Reply-To: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCHNXO4F7MHBBC52YC3QKGQE4XTR5VQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1458576642-4078-1-git-send-email-codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Enable the S/PDIF transmitter that is present on the Itead Ibox.

Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/sun7i-a20-itead-ibox.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20-itead-ibox.dts b/arch/arm/boot/dts/sun7i-a20-itead-ibox.dts
index a512581..df76b74 100644
--- a/arch/arm/boot/dts/sun7i-a20-itead-ibox.dts
+++ b/arch/arm/boot/dts/sun7i-a20-itead-ibox.dts
@@ -65,6 +65,23 @@
 			default-state = "on";
 		};
 	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "On-board SPDIF";
+		simple-audio-card,cpu {
+			sound-dai = <&spdif>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&spdif_out>;
+		};
+	};
+
+	spdif_out: spdif-out {
+		#sound-dai-cells = <0>;
+		compatible = "linux,spdif-dit";
+	};
 };
 
 &ahci {
@@ -131,6 +148,13 @@
 	status = "okay";
 };
 
+
+&spdif {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spdif_tx_pins_a>;
+	status = "okay";
+};
+
 &usbphy {
 	pinctrl-names = "default";
 	pinctrl-0 = <&usb0_id_detect_pin>;
-- 
2.7.4
