From: Neal Liu <neal.liu@mediatek.com>
Subject: [PATCH v3 1/3] soc: mediatek: add SMC fid table for SIP interface
Date: Mon, 10 Jun 2019 18:36:22 +0800
Message-ID: <1560162984-26104-2-git-send-email-neal.liu@mediatek.com>
References: <1560162984-26104-1-git-send-email-neal.liu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560162984-26104-1-git-send-email-neal.liu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>
Cc: Neal Liu <neal.liu@mediatek.com>, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com, Crystal Guo <Crystal.Guo@mediatek.com>
List-Id: devicetree@vger.kernel.org

1. Add a header file to provide SIP interface to ATF
2. Add hwrng SMC fid

Signed-off-by: Neal Liu <neal.liu@mediatek.com>
---
 include/linux/soc/mediatek/mtk_sip_svc.h |   33 ++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 include/linux/soc/mediatek/mtk_sip_svc.h

diff --git a/include/linux/soc/mediatek/mtk_sip_svc.h b/include/linux/soc/mediatek/mtk_sip_svc.h
new file mode 100644
index 0000000..e70c325
--- /dev/null
+++ b/include/linux/soc/mediatek/mtk_sip_svc.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ */
+
+#ifndef _MTK_SECURE_API_H_
+#define _MTK_SECURE_API_H_
+
+#include <linux/kernel.h>
+
+/* Error Code */
+#define SIP_SVC_E_SUCCESS		0
+#define SIP_SVC_E_NOT_SUPPORTED		-1
+#define SIP_SVC_E_INVALID_PARAMS	-2
+#define SIP_SVC_E_INVALID_RANGE		-3
+#define SIP_SVC_E_PERMISSION_DENY	-4
+
+#ifdef CONFIG_ARM64
+#define MTK_SIP_SMC_AARCH_BIT		BIT(30)
+#else
+#define MTK_SIP_SMC_AARCH_BIT		0
+#endif
+
+/*******************************************************************************
+ * Defines for Mediatek runtime services func ids
+ ******************************************************************************/
+
+/* Security related SMC call */
+/* HWRNG */
+#define MTK_SIP_KERNEL_GET_RND \
+	(0x82000206 | MTK_SIP_SMC_AARCH_BIT)
+
+#endif /* _MTK_SECURE_API_H_ */
-- 
1.7.9.5
