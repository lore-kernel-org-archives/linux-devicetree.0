From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH 04/11] ARM: dts: imx6qdl: add capture-subsystem device
Date: Mon, 12 Jun 2017 11:23:57 -0700
Message-ID: <1497291844-14632-5-git-send-email-steve_longerbeam@mentor.com>
References: <1497291844-14632-1-git-send-email-steve_longerbeam@mentor.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1497291844-14632-1-git-send-email-steve_longerbeam@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Steve Longerbeam <steve_longerbeam@mentor.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
---
 arch/arm/boot/dts/imx6dl.dtsi | 5 +++++
 arch/arm/boot/dts/imx6q.dtsi  | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/imx6dl.dtsi b/arch/arm/boot/dts/imx6dl.dtsi
index 4049af7..8475e6c 100644
--- a/arch/arm/boot/dts/imx6dl.dtsi
+++ b/arch/arm/boot/dts/imx6dl.dtsi
@@ -100,6 +100,11 @@
 		};
 	};
 
+	capture-subsystem {
+		compatible = "fsl,imx-capture-subsystem";
+		ports = <&ipu1_csi0>, <&ipu1_csi1>;
+	};
+
 	display-subsystem {
 		compatible = "fsl,imx-display-subsystem";
 		ports = <&ipu1_di0>, <&ipu1_di1>;
diff --git a/arch/arm/boot/dts/imx6q.dtsi b/arch/arm/boot/dts/imx6q.dtsi
index 214bbb3..89dab0f 100644
--- a/arch/arm/boot/dts/imx6q.dtsi
+++ b/arch/arm/boot/dts/imx6q.dtsi
@@ -206,6 +206,11 @@
 		};
 	};
 
+	capture-subsystem {
+		compatible = "fsl,imx-capture-subsystem";
+		ports = <&ipu1_csi0>, <&ipu1_csi1>, <&ipu2_csi0>, <&ipu2_csi1>;
+	};
+
 	display-subsystem {
 		compatible = "fsl,imx-display-subsystem";
 		ports = <&ipu1_di0>, <&ipu1_di1>, <&ipu2_di0>, <&ipu2_di1>;
-- 
2.7.4
