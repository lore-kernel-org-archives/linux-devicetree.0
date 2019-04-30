From: Henry Chen <henryc.chen@mediatek.com>
Subject: [RFC V2 09/11] dt-bindings: interconnect: Add header for interconnect node
Date: Tue, 30 Apr 2019 16:51:03 +0800
Message-ID: <1556614265-12745-10-git-send-email-henryc.chen@mediatek.com>
References: <1556614265-12745-1-git-send-email-henryc.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556614265-12745-1-git-send-email-henryc.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <swboyd@chromium.org>
Cc: Nicolas Boichat <drinkcat@google.com>, Fan Chen <fan.chen@mediatek.com>, James Liao <jamesjj.liao@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Henry Chen <henryc.chen@mediatek.com>
List-Id: devicetree@vger.kernel.org

Add header file for mt8183 interconnect node that could be shared between
the interconeect provider driver and Device Tree source files.

Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
---
 include/dt-bindings/interconnect/mtk,mt8183.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 include/dt-bindings/interconnect/mtk,mt8183.h

diff --git a/include/dt-bindings/interconnect/mtk,mt8183.h b/include/dt-bindings/interconnect/mtk,mt8183.h
new file mode 100644
index 0000000..34adbfa
--- /dev/null
+++ b/include/dt-bindings/interconnect/mtk,mt8183.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __DT_BINDINGS_INTERCONNECT_MTK_MT8183_H
+#define __DT_BINDINGS_INTERCONNECT_MTK_MT8183_H
+
+#define SLAVE_DDR_EMI			0
+#define MASTER_MCUSYS			1
+#define MASTER_GPU			2
+#define MASTER_MMSYS			3
+#define MASTER_MM_VPU			4
+#define MASTER_MM_DISP			5
+#define MASTER_MM_VDEC			6
+#define MASTER_MM_VENC			7
+#define MASTER_MM_CAM			8
+#define MASTER_MM_IMG			9
+#define MASTER_MM_MDP			10
+
+#endif
-- 
1.9.1
