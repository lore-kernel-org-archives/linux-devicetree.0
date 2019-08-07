From: Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v1 1/2] clk: qcom: Add DT bindings for SC7180 gcc clock controller
Date: Wed,  7 Aug 2019 23:43:00 +0530
Message-ID: <20190807181301.15326-2-tdas@codeaurora.org>
References: <20190807181301.15326-1-tdas@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190807181301.15326-1-tdas@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc: David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add compatible string and the include file for gcc clock
controller for SC7180.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 .../devicetree/bindings/clock/qcom,gcc.txt    |   1 +
 include/dt-bindings/clock/qcom,gcc-sc7180.h   | 155 ++++++++++++++++++
 2 files changed, 156 insertions(+)
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sc7180.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.txt b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
index 8661c3cd3ccf..18d95467cb36 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
@@ -23,6 +23,7 @@ Required properties :
 			"qcom,gcc-sdm630"
 			"qcom,gcc-sdm660"
 			"qcom,gcc-sdm845"
+			"qcom,gcc-sc7180"

 - reg : shall contain base register location and length
 - #clock-cells : shall contain 1
diff --git a/include/dt-bindings/clock/qcom,gcc-sc7180.h b/include/dt-bindings/clock/qcom,gcc-sc7180.h
new file mode 100644
index 000000000000..d76b061f6a4e
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,gcc-sc7180.h
@@ -0,0 +1,155 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_SC7180_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_SC7180_H
+
+/* GCC clocks */
+#define GCC_GPLL0_MAIN_DIV_CDIV					0
+#define GPLL0							1
+#define GPLL0_OUT_EVEN						2
+#define GPLL1							3
+#define GPLL4							4
+#define GPLL6							5
+#define GPLL7							6
+#define GCC_AGGRE_UFS_PHY_AXI_CLK				7
+#define GCC_AGGRE_USB3_PRIM_AXI_CLK				8
+#define GCC_BOOT_ROM_AHB_CLK					9
+#define GCC_CAMERA_AHB_CLK					10
+#define GCC_CAMERA_HF_AXI_CLK					11
+#define GCC_CAMERA_THROTTLE_HF_AXI_CLK				12
+#define GCC_CAMERA_XO_CLK					13
+#define GCC_CE1_AHB_CLK						14
+#define GCC_CE1_AXI_CLK						15
+#define GCC_CE1_CLK						16
+#define GCC_CFG_NOC_USB3_PRIM_AXI_CLK				17
+#define GCC_CPUSS_AHB_CLK					18
+#define GCC_CPUSS_AHB_CLK_SRC					19
+#define GCC_CPUSS_GNOC_CLK					20
+#define GCC_CPUSS_RBCPR_CLK					21
+#define GCC_DDRSS_GPU_AXI_CLK					22
+#define GCC_DISP_AHB_CLK					23
+#define GCC_DISP_GPLL0_CLK_SRC					24
+#define GCC_DISP_GPLL0_DIV_CLK_SRC				25
+#define GCC_DISP_HF_AXI_CLK					26
+#define GCC_DISP_THROTTLE_HF_AXI_CLK				27
+#define GCC_DISP_XO_CLK						28
+#define GCC_GP1_CLK						29
+#define GCC_GP1_CLK_SRC						30
+#define GCC_GP2_CLK						31
+#define GCC_GP2_CLK_SRC						32
+#define GCC_GP3_CLK						33
+#define GCC_GP3_CLK_SRC						34
+#define GCC_GPU_CFG_AHB_CLK					35
+#define GCC_GPU_GPLL0_CLK_SRC					36
+#define GCC_GPU_GPLL0_DIV_CLK_SRC				37
+#define GCC_GPU_MEMNOC_GFX_CLK					38
+#define GCC_GPU_SNOC_DVM_GFX_CLK				39
+#define GCC_NPU_AXI_CLK						40
+#define GCC_NPU_BWMON_AXI_CLK					41
+#define GCC_NPU_BWMON_DMA_CFG_AHB_CLK				42
+#define GCC_NPU_BWMON_DSP_CFG_AHB_CLK				43
+#define GCC_NPU_CFG_AHB_CLK					44
+#define GCC_NPU_DMA_CLK						45
+#define GCC_NPU_GPLL0_CLK_SRC					46
+#define GCC_NPU_GPLL0_DIV_CLK_SRC				47
+#define GCC_PDM2_CLK						48
+#define GCC_PDM2_CLK_SRC					49
+#define GCC_PDM_AHB_CLK						50
+#define GCC_PDM_XO4_CLK						51
+#define GCC_PRNG_AHB_CLK					52
+#define GCC_QSPI_CNOC_PERIPH_AHB_CLK				53
+#define GCC_QSPI_CORE_CLK					54
+#define GCC_QSPI_CORE_CLK_SRC					55
+#define GCC_QUPV3_WRAP0_CORE_2X_CLK				56
+#define GCC_QUPV3_WRAP0_CORE_CLK				57
+#define GCC_QUPV3_WRAP0_S0_CLK					58
+#define GCC_QUPV3_WRAP0_S0_CLK_SRC				59
+#define GCC_QUPV3_WRAP0_S1_CLK					60
+#define GCC_QUPV3_WRAP0_S1_CLK_SRC				61
+#define GCC_QUPV3_WRAP0_S2_CLK					62
+#define GCC_QUPV3_WRAP0_S2_CLK_SRC				63
+#define GCC_QUPV3_WRAP0_S3_CLK					64
+#define GCC_QUPV3_WRAP0_S3_CLK_SRC				65
+#define GCC_QUPV3_WRAP0_S4_CLK					66
+#define GCC_QUPV3_WRAP0_S4_CLK_SRC				67
+#define GCC_QUPV3_WRAP0_S5_CLK					68
+#define GCC_QUPV3_WRAP0_S5_CLK_SRC				69
+#define GCC_QUPV3_WRAP1_CORE_2X_CLK				70
+#define GCC_QUPV3_WRAP1_CORE_CLK				71
+#define GCC_QUPV3_WRAP1_S0_CLK					72
+#define GCC_QUPV3_WRAP1_S0_CLK_SRC				73
+#define GCC_QUPV3_WRAP1_S1_CLK					74
+#define GCC_QUPV3_WRAP1_S1_CLK_SRC				75
+#define GCC_QUPV3_WRAP1_S2_CLK					76
+#define GCC_QUPV3_WRAP1_S2_CLK_SRC				77
+#define GCC_QUPV3_WRAP1_S3_CLK					78
+#define GCC_QUPV3_WRAP1_S3_CLK_SRC				79
+#define GCC_QUPV3_WRAP1_S4_CLK					80
+#define GCC_QUPV3_WRAP1_S4_CLK_SRC				81
+#define GCC_QUPV3_WRAP1_S5_CLK					82
+#define GCC_QUPV3_WRAP1_S5_CLK_SRC				83
+#define GCC_QUPV3_WRAP_0_M_AHB_CLK				84
+#define GCC_QUPV3_WRAP_0_S_AHB_CLK				85
+#define GCC_QUPV3_WRAP_1_M_AHB_CLK				86
+#define GCC_QUPV3_WRAP_1_S_AHB_CLK				87
+#define GCC_SDCC1_AHB_CLK					88
+#define GCC_SDCC1_APPS_CLK					89
+#define GCC_SDCC1_APPS_CLK_SRC					90
+#define GCC_SDCC1_ICE_CORE_CLK					91
+#define GCC_SDCC1_ICE_CORE_CLK_SRC				92
+#define GCC_SDCC2_AHB_CLK					93
+#define GCC_SDCC2_APPS_CLK					94
+#define GCC_SDCC2_APPS_CLK_SRC					95
+#define GCC_SYS_NOC_CPUSS_AHB_CLK				96
+#define GCC_UFS_MEM_CLKREF_CLK					97
+#define GCC_UFS_PHY_AHB_CLK					98
+#define GCC_UFS_PHY_AXI_CLK					99
+#define GCC_UFS_PHY_AXI_CLK_SRC					100
+#define GCC_UFS_PHY_ICE_CORE_CLK				101
+#define GCC_UFS_PHY_ICE_CORE_CLK_SRC				102
+#define GCC_UFS_PHY_PHY_AUX_CLK					103
+#define GCC_UFS_PHY_PHY_AUX_CLK_SRC				104
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK				105
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK				106
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK				107
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK_SRC				108
+#define GCC_USB30_PRIM_MASTER_CLK				109
+#define GCC_USB30_PRIM_MASTER_CLK_SRC				110
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK				111
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC			112
+#define GCC_USB30_PRIM_SLEEP_CLK				113
+#define GCC_USB3_PRIM_CLKREF_CLK				114
+#define GCC_USB3_PRIM_PHY_AUX_CLK				115
+#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC				116
+#define GCC_USB3_PRIM_PHY_COM_AUX_CLK				117
+#define GCC_USB3_PRIM_PHY_PIPE_CLK				118
+#define GCC_USB_PHY_CFG_AHB2PHY_CLK				119
+#define GCC_VIDEO_AHB_CLK					120
+#define GCC_VIDEO_AXI_CLK					121
+#define GCC_VIDEO_GPLL0_DIV_CLK_SRC				122
+#define GCC_VIDEO_THROTTLE_AXI_CLK				123
+#define GCC_VIDEO_XO_CLK					124
+
+/* GCC resets */
+#define GCC_QUSB2PHY_PRIM_BCR					0
+#define GCC_QUSB2PHY_SEC_BCR					1
+#define GCC_UFS_PHY_BCR						2
+#define GCC_USB30_PRIM_BCR					3
+#define GCC_USB3_DP_PHY_PRIM_BCR				4
+#define GCC_USB3_DP_PHY_SEC_BCR					5
+#define GCC_USB3_PHY_PRIM_BCR					6
+#define GCC_USB3_PHY_SEC_BCR					7
+#define GCC_USB3PHY_PHY_PRIM_BCR				8
+#define GCC_USB3PHY_PHY_SEC_BCR					9
+#define GCC_USB_PHY_CFG_AHB2PHY_BCR				10
+
+/* GCC GDSCRs */
+#define UFS_PHY_GDSC						0
+#define USB30_PRIM_GDSC						1
+#define HLOS1_VOTE_MMNOC_MMU_TBU_HF0_GDSC			2
+#define HLOS1_VOTE_MMNOC_MMU_TBU_SF_GDSC			3
+
+#endif
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
