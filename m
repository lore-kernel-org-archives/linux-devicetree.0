From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v7 3/5] dt-bindings: timer: add i.MX EPIT timer binding
Date: Mon, 11 Jun 2018 17:49:59 +0200
Message-ID: <20180611155001.3506-4-peron.clem@gmail.com>
References: <20180611155001.3506-1-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180611155001.3506-1-peron.clem@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Colin Didier <colin.didier@devialet.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Stefan Agner <stefan@agner.ch>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, =?UTF-8?q?Cl=C3=A9ment=20Peron?= <clement.peron@devialet.com>
List-Id: devicetree@vger.kernel.org

From: Clément Peron <clement.peron@devialet.com>

Add devicetree binding document for NXP's i.MX SoC specific
EPIT timer driver.

Signed-off-by: Clément Peron <clement.peron@devialet.com>
Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
---
 .../devicetree/bindings/timer/fsl,imxepit.txt | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/fsl,imxepit.txt

diff --git a/Documentation/devicetree/bindings/timer/fsl,imxepit.txt b/Documentation/devicetree/bindings/timer/fsl,imxepit.txt
new file mode 100644
index 000000000000..819d6458a860
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/fsl,imxepit.txt
@@ -0,0 +1,21 @@
+Binding for the i.MX Enhanced Periodic Interrupt Timer (EPIT)
+
+The Enhanced Periodic Interrupt Timer (EPIT) is a 32-bit set-and-forget timer
+that is capable of providing precise interrupts at regular intervals with
+minimal processor intervention.
+
+Required properties:
+- compatible: should be "fsl,<chip>-epit", "fsl,imx31-epit" where <chip> is
+  imx25, imx6qdl, imx6sl, imx6sul or imx6sx.
+- reg: physical base address of the controller and length of memory mapped
+  region.
+- interrupts: Should contain EPIT controller interrupt
+- clocks : The clock provided by the SoC to drive the timer.
+
+Example for i.MX6QDL:
+	epit1: timer@20d0000 {
+		compatible = "fsl,imx6qdl-epit", "fsl,imx31-epit";
+		reg = <0x020d0000 0x4000>;
+		interrupts = <0 56 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&clks IMX6QDL_CLK_EPIT1>;
+	};
-- 
2.17.1
