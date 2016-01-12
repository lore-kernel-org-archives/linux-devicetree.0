From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v5 2/7] remoteproc: dt: Provide bindings for ST's Remote Processor Controller driver
Date: Tue, 12 Jan 2016 12:46:16 +0000
Message-ID: <1452602781-22424-3-git-send-email-lee.jones@linaro.org>
References: <1452602781-22424-1-git-send-email-lee.jones@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452602781-22424-1-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel@stlinux.com, maxime.coquelin@st.com, ohad@wizery.com, devicetree@vger.kernel.org, Nathan_Lynch@mentor.com, f.fainelli@gmail.com, ludovic.barre@st.com, s-anna@ti.com, Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 .../devicetree/bindings/remoteproc/st-rproc.txt    | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/st-rproc.txt

diff --git a/Documentation/devicetree/bindings/remoteproc/st-rproc.txt b/Documentation/devicetree/bindings/remoteproc/st-rproc.txt
new file mode 100644
index 0000000..1031bcd
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/st-rproc.txt
@@ -0,0 +1,41 @@
+STMicroelectronics Co-Processor Bindings
+----------------------------------------
+
+This binding provides support for adjunct processors found on ST SoCs.
+
+Co-processors can be controlled from the bootloader or the primary OS. If
+the bootloader starts a co-processor, the primary OS must detect its state
+and act accordingly.
+
+Required properties:
+- compatible		Should be one of:
+				"st,st231-rproc"
+				"st,st40-rproc"
+- memory-region		Reserved memory (See: ../reserved-memory/reserved-memory.txt)
+- resets		Reset lines (See: ../reset/reset.txt)
+- reset-names		Must be "sw_reset" and "pwr_reset"
+- clocks		Clock for co-processor (See: ../clock/clock-bindings.txt)
+- clock-frequency	Clock frequency to set co-processor at if the bootloader
+			hasn't already done so
+- st,syscfg		System configuration register which holds the boot vector
+			for the co-processor
+				1st cell: Phandle to syscon block
+				2nd cell: Boot vector register offset
+
+Example:
+
+	audio_reserved: rproc@42000000 {
+		compatible = "shared-dma-pool";
+		reg = <0x42000000 0x01000000>;
+		no-map;
+	};
+
+	st231-audio {
+		compatible	= "st,st231-rproc";
+		memory-region	= <&audio_reserved>;
+		resets		= <&softreset STIH407_ST231_AUD_SOFTRESET>;
+		reset-names	= "sw_reset";
+		clocks		= <&clk_s_c0_flexgen CLK_ST231_AUD_0>;
+		clock-frequency	= <600000000>;
+		st,syscfg	= <&syscfg_core 0x228>;
+	};
-- 
1.9.1
