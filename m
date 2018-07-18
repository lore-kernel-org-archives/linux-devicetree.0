From: Douglas Anderson <dianders@chromium.org>
Subject: [RFC PATCH 1/2] clk: qcom: Add qspi (Quad SPI) clock defines for sdm845 to header
Date: Wed, 18 Jul 2018 11:04:29 -0700
Message-ID: <20180718180431.48580-2-dianders@chromium.org>
References: <20180718180431.48580-1-dianders@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180718180431.48580-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sboyd@kernel.org, andy.gross@linaro.org
Cc: tdas@codeaurora.org, girishm@codeaurora.org, anischal@codeaurora.org, bjorn.andersson@linaro.org, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

These clocks will need to be defined in the clock driver and
referenced in device tree files.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 include/dt-bindings/clock/qcom,gcc-sdm845.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-sdm845.h b/include/dt-bindings/clock/qcom,gcc-sdm845.h
index f96fc2dbf60e..b8eae5a76503 100644
--- a/include/dt-bindings/clock/qcom,gcc-sdm845.h
+++ b/include/dt-bindings/clock/qcom,gcc-sdm845.h
@@ -194,6 +194,9 @@
 #define GPLL4							184
 #define GCC_CPUSS_DVM_BUS_CLK					185
 #define GCC_CPUSS_GNOC_CLK					186
+#define GCC_QSPI_CORE_CLK_SRC					187
+#define GCC_QSPI_CORE_CLK					188
+#define GCC_QSPI_CNOC_PERIPH_AHB_CLK				189
 
 /* GCC Resets */
 #define GCC_MMSS_BCR						0
-- 
2.18.0.233.g985f88cf7e-goog
