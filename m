From: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 4/6] ARM: DTS: da850-evm: Enable McASP via DT boot
Date: Thu, 31 Jul 2014 13:18:52 +0300
Message-ID: <1406801934-23334-5-git-send-email-peter.ujfalusi@ti.com>
References: <1406801934-23334-1-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406801934-23334-1-git-send-email-peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nsekhar-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: khilman-1D3HCaltpLuhEniVeURVKkEOCMrvLtNR@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add pinctrl nodes for the McASP0 pins and configure McASP to the desired
mode for the board.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
---
 arch/arm/boot/dts/da850-evm.dts | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/da850-evm.dts b/arch/arm/boot/dts/da850-evm.dts
index 1e11e5a5f723..09118c72e83f 100644
--- a/arch/arm/boot/dts/da850-evm.dts
+++ b/arch/arm/boot/dts/da850-evm.dts
@@ -17,6 +17,18 @@
 	soc {
 		pmx_core: pinmux@1c14120 {
 			status = "okay";
+
+			mcasp0_pins: pinmux_mcasp0_pins {
+				pinctrl-single,bits = <
+					/*
+					 * AHCLKX, ACLKX, AFSX, AHCLKR, ACLKR,
+					 * AFSR, AMUTE
+					 */
+					0x00 0x11111111 0xffffffff
+					/* AXR11, AXR12 */
+					0x04 0x00011000 0x000ff000
+				>;
+			};
 		};
 		serial0: serial@1c42000 {
 			status = "okay";
@@ -170,3 +182,22 @@
 		};
 	};
 };
+
+&mcasp0 {
+	#sound-dai-cells = <0>;
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&mcasp0_pins>;
+
+	op-mode = <0>;          /* MCASP_IIS_MODE */
+	tdm-slots = <2>;
+	/* 4 serializer */
+	serial-dir = <  /* 0: INACTIVE, 1: TX, 2: RX */
+		0 0 0 0
+		0 0 0 0
+		0 0 0 1
+		2 0 0 0
+	>;
+	tx-num-evt = <32>;
+	rx-num-evt = <32>;
+};
-- 
2.0.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
