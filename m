From: Rob Clark <robdclark@gmail.com>
Subject: [RFC 2/3] arm64: dts: qcom: sdm845-cheza: Re-add reserved memory
Date: Thu,  9 May 2019 11:44:12 -0700
Message-ID: <20190509184415.11592-3-robdclark@gmail.com>
References: <20190509184415.11592-1-robdclark@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190509184415.11592-1-robdclark@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org
Cc: Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@chromium.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Douglas Anderson <dianders@chromium.org>

Let's fixup the reserved memory to re-add the things we deleted in
("CHROMIUM: arm64: dts: qcom: sdm845-cheza: Temporarily delete
reserved-mem changes") in a way that plays nicely with the new
upstream definitions.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
index 338c92ddd1c3..8ccbe246dff4 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -156,10 +156,44 @@
 	};
 };
 
+/*
+ * Reserved memory changes
+ *
+ * Putting this all together (out of order with the rest of the file) to keep
+ * all modifications to the memory map (from sdm845.dtsi) in one place.
+ */
+
+/*
+ * Our mpss_region is 8MB bigger than the default one and that conflicts
+ * with venus_mem and cdsp_mem.
+ *
+ * For venus_mem we'll delete and re-create at a different address.
+ *
+ * cdsp_mem isn't used on cheza right now so we won't bother re-creating it; but
+ * that also means we need to delete cdsp_pas.
+ */
+/delete-node/ &venus_mem;
+/delete-node/ &cdsp_mem;
+/delete-node/ &cdsp_pas;
+
+/* Increase the size from 120 MB to 128 MB */
 &mpss_region {
 	reg = <0 0x8e000000 0 0x8000000>;
 };
 
+/* Increase the size from 2MB to 8MB */
+&rmtfs_mem {
+	reg = <0 0x88f00000 0 0x800000>;
+};
+
+/ {
+	reserved-memory {
+		venus_mem: memory@96000000 {
+			reg = <0 0x96000000 0 0x500000>;
+			no-map;
+		};
+	};
+};
 &qspi {
 	status = "okay";
 	pinctrl-names = "default";
-- 
2.20.1
