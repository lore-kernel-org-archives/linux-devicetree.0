From: Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v3 1/8] dt-bindings: Document STM32 DCMI bindings
Date: Tue, 4 Apr 2017 17:44:31 +0200
Message-ID: <1491320678-17246-2-git-send-email-hugues.fruchet@st.com>
References: <1491320678-17246-1-git-send-email-hugues.fruchet@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1491320678-17246-1-git-send-email-hugues.fruchet-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds documentation of device tree bindings for the STM32 DCMI
(Digital Camera Memory Interface).

Signed-off-by: Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>
---
 .../devicetree/bindings/media/st,stm32-dcmi.txt    | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/st,stm32-dcmi.txt

diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.txt b/Documentation/devicetree/bindings/media/st,stm32-dcmi.txt
new file mode 100644
index 0000000..c0f6f4b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.txt
@@ -0,0 +1,46 @@
+STMicroelectronics STM32 Digital Camera Memory Interface (DCMI)
+
+Required properties:
+- compatible: "st,stm32-dcmi"
+- reg: physical base address and length of the registers set for the device
+- interrupts: should contain IRQ line for the DCMI
+- resets: reference to a reset controller,
+          see Documentation/devicetree/bindings/reset/st,stm32-rcc.txt
+- clocks: list of clock specifiers, corresponding to entries in
+          the clock-names property
+- clock-names: must contain "mclk", which is the DCMI peripherial clock
+- pinctrl: the pincontrol settings to configure muxing properly
+           for pins that connect to DCMI device.
+           See Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt.
+- dmas: phandle to DMA controller node,
+        see Documentation/devicetree/bindings/dma/stm32-dma.txt
+- dma-names: must contain "tx", which is the transmit channel from DCMI to DMA
+
+DCMI supports a single port node with parallel bus. It should contain one
+'port' child node with child 'endpoint' node. Please refer to the bindings
+defined in Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+Example:
+
+	dcmi: dcmi@50050000 {
+		compatible = "st,stm32-dcmi";
+		reg = <0x50050000 0x400>;
+		interrupts = <78>;
+		resets = <&rcc STM32F4_AHB2_RESET(DCMI)>;
+		clocks = <&rcc 0 STM32F4_AHB2_CLOCK(DCMI)>;
+		clock-names = "mclk";
+		pinctrl-names = "default";
+		pinctrl-0 = <&dcmi_pins>;
+		dmas = <&dma2 1 1 0x414 0x3>;
+		dma-names = "tx";
+		port {
+			dcmi_0: endpoint@0 {
+				remote-endpoint = <...>;
+				bus-width = <8>;
+				hsync-active = <0>;
+				vsync-active = <0>;
+				pclk-sample = <1>;
+			};
+		};
+	};
+
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
