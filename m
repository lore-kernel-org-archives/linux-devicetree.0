From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v4 3/5] Documentation: DT: add i.MX EPIT timer binding
Date: Wed, 30 May 2018 14:03:25 +0200
Message-ID: <20180530120327.27681-4-peron.clem@gmail.com>
References: <20180530120327.27681-1-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180530120327.27681-1-peron.clem@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Colin Didier <colin.didier@devialet.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, =?UTF-8?q?Cl=C3=A9ment=20Peron?= <clement.peron@devialet.com>
List-Id: devicetree@vger.kernel.org

From: Clément Peron <clement.peron@devialet.com>

Add devicetree binding document for NXP's i.MX SoC specific
EPIT timer driver.

Signed-off-by: Clément Peron <clement.peron@devialet.com>
---
 .../devicetree/bindings/timer/fsl,imxepit.txt | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/fsl,imxepit.txt

diff --git a/Documentation/devicetree/bindings/timer/fsl,imxepit.txt b/Documentation/devicetree/bindings/timer/fsl,imxepit.txt
new file mode 100644
index 000000000000..90112d58af10
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/fsl,imxepit.txt
@@ -0,0 +1,24 @@
+Binding for the i.MX EPIT timer
+
+This binding uses the common clock binding[1].
+
+[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
+
+Required properties:
+- compatible: should be "fsl,imx31-epit"
+- reg: physical base address of the controller and length of memory mapped
+  region.
+- interrupts: Should contain EPIT controller interrupt
+- clocks: list of clock specifiers, must contain an entry for each required
+  entry in clock-names
+- clock-names : should include entries "ipg", "per"
+
+Example for i.MX6QDL:
+	epit1: epit@20d0000 {
+		compatible = "fsl,imx6q-epit", "fsl,imx31-epit";
+		reg = <0x020d0000 0x4000>;
+		interrupts = <0 56 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&clks IMX6QDL_CLK_IPG_PER>,
+			<&clks IMX6QDL_CLK_EPIT1>;
+		clock-names = "ipg", "per";
+	};
-- 
2.17.0
