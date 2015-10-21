From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v4 1/6] remoteproc: dt: Provide bindings for ST's Remote
 Processor Controller driver
Date: Wed, 21 Oct 2015 12:47:02 +0100
Message-ID: <1445428027-26174-2-git-send-email-lee.jones@linaro.org>
References: <1445428027-26174-1-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1445428027-26174-1-git-send-email-lee.jones@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: ohad@wizery.com, devicetree@vger.kernel.org, f.fainelli@gmail.com, kernel@stlinux.com, Nathan_Lynch@mentor.com, Lee Jones <lee.jones@linaro.org>, ludovic.barre@st.com, maxime.coquelin@st.com
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
