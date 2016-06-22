From: Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v9 07/10] reset: mediatek: Add MT2701 reset controller
 dt-binding file
Date: Wed, 22 Jun 2016 15:40:26 +0800
Message-ID: <1466581229-2342-8-git-send-email-erin.lo@mediatek.com>
References: <1466581229-2342-1-git-send-email-erin.lo@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1466581229-2342-1-git-send-email-erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shunli Wang <shunli.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Shunli Wang <shunli.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Dt-binding file about reset controller is used to provide
kinds of definition, which is referenced by dts file and
IC-specified reset controller driver code.

Signed-off-by: Shunli Wang <shunli.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Tested-by: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Acked-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 include/dt-bindings/reset/mt2701-resets.h | 83 +++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 include/dt-bindings/reset/mt2701-resets.h

diff --git a/include/dt-bindings/reset/mt2701-resets.h b/include/dt-bindings/reset/mt2701-resets.h
new file mode 100644
index 0000000..aaf0305
--- /dev/null
+++ b/include/dt-bindings/reset/mt2701-resets.h
@@ -0,0 +1,83 @@
+/*
+ * Copyright (c) 2015 MediaTek, Shunli Wang <shunli.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT2701
+#define _DT_BINDINGS_RESET_CONTROLLER_MT2701
+
+/* INFRACFG resets */
+#define MT2701_INFRA_EMI_REG_RST		0
+#define MT2701_INFRA_DRAMC0_A0_RST		1
+#define MT2701_INFRA_FHCTL_RST			2
+#define MT2701_INFRA_APCIRQ_EINT_RST		3
+#define MT2701_INFRA_APXGPT_RST			4
+#define MT2701_INFRA_SCPSYS_RST			5
+#define MT2701_INFRA_KP_RST			6
+#define MT2701_INFRA_PMIC_WRAP_RST		7
+#define MT2701_INFRA_MIPI_RST			8
+#define MT2701_INFRA_IRRX_RST			9
+#define MT2701_INFRA_CEC_RST			10
+#define MT2701_INFRA_EMI_RST			32
+#define MT2701_INFRA_DRAMC0_RST			34
+#define MT2701_INFRA_TRNG_RST			37
+#define MT2701_INFRA_SYSIRQ_RST			38
+
+/*  PERICFG resets */
+#define MT2701_PERI_UART0_SW_RST		0
+#define MT2701_PERI_UART1_SW_RST		1
+#define MT2701_PERI_UART2_SW_RST		2
+#define MT2701_PERI_UART3_SW_RST		3
+#define MT2701_PERI_GCPU_SW_RST			5
+#define MT2701_PERI_BTIF_SW_RST			6
+#define MT2701_PERI_PWM_SW_RST			8
+#define MT2701_PERI_AUXADC_SW_RST		10
+#define MT2701_PERI_DMA_SW_RST			11
+#define MT2701_PERI_NFI_SW_RST			14
+#define MT2701_PERI_NLI_SW_RST			15
+#define MT2701_PERI_THERM_SW_RST		16
+#define MT2701_PERI_MSDC2_SW_RST		17
+#define MT2701_PERI_MSDC0_SW_RST		19
+#define MT2701_PERI_MSDC1_SW_RST		20
+#define MT2701_PERI_I2C0_SW_RST			22
+#define MT2701_PERI_I2C1_SW_RST			23
+#define MT2701_PERI_I2C2_SW_RST			24
+#define MT2701_PERI_I2C3_SW_RST			25
+#define MT2701_PERI_USB_SW_RST			28
+#define MT2701_PERI_ETH_SW_RST			29
+#define MT2701_PERI_SPI0_SW_RST			33
+
+/* TOPRGU resets */
+#define MT2701_TOPRGU_INFRA_RST			0
+#define MT2701_TOPRGU_MM_RST			1
+#define MT2701_TOPRGU_MFG_RST			2
+#define MT2701_TOPRGU_ETHDMA_RST		3
+#define MT2701_TOPRGU_VDEC_RST			4
+#define MT2701_TOPRGU_VENC_IMG_RST		5
+#define MT2701_TOPRGU_DDRPHY_RST		6
+#define MT2701_TOPRGU_MD_RST			7
+#define MT2701_TOPRGU_INFRA_AO_RST		8
+#define MT2701_TOPRGU_CONN_RST			9
+#define MT2701_TOPRGU_APMIXED_RST		10
+#define MT2701_TOPRGU_HIFSYS_RST		11
+#define MT2701_TOPRGU_CONN_MCU_RST		12
+#define MT2701_TOPRGU_BDP_DISP_RST		13
+
+/* HIFSYS resets */
+#define MT2701_HIFSYS_UHOST0_RST		3
+#define MT2701_HIFSYS_UHOST1_RST		4
+#define MT2701_HIFSYS_UPHY0_RST			21
+#define MT2701_HIFSYS_UPHY1_RST			22
+#define MT2701_HIFSYS_PCIE0_RST			24
+#define MT2701_HIFSYS_PCIE1_RST			25
+#define MT2701_HIFSYS_PCIE2_RST			26
+
+#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT2701 */
-- 
1.9.1
