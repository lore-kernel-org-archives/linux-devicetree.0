From: Henry Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH V3 08/10] dt-bindings: interconnect: add MT8183 interconnect
 dt-bindings
Date: Wed, 28 Aug 2019 20:28:46 +0800
Message-ID: <1566995328-15158-9-git-send-email-henryc.chen@mediatek.com>
References: <1566995328-15158-1-git-send-email-henryc.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1566995328-15158-1-git-send-email-henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Viresh Kumar <vireshk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Boyd <swboyd-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Ryan Case <ryandcase-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Weiyi Lu <weiyi.lu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Nicolas Boichat <drinkcat-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Henry Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Fan Chen <fan.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add interconnect provider dt-bindings for MT8183.

Signed-off-by: Henry Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 .../devicetree/bindings/soc/mediatek/dvfsrc.txt        |  9 +++++++++
 include/dt-bindings/interconnect/mtk,mt8183-emi.h      | 18 ++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 include/dt-bindings/interconnect/mtk,mt8183-emi.h

diff --git a/Documentation/devicetree/bindings/soc/mediatek/dvfsrc.txt b/Documentation/devicetree/bindings/soc/mediatek/dvfsrc.txt
index 7f43499..da98ec9 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/dvfsrc.txt
+++ b/Documentation/devicetree/bindings/soc/mediatek/dvfsrc.txt
@@ -12,6 +12,11 @@ Required Properties:
 - clock-names: Must include the following entries:
 	"dvfsrc": DVFSRC module clock
 - clocks: Must contain an entry for each entry in clock-names.
+- #interconnect-cells : should contain 1
+- interconnect : interconnect providers support dram bandwidth requirements.
+	The provider is able to communicate with the DVFSRC and send the dram
+	bandwidth to it. shall contain only one of the following:
+	"mediatek,mt8183-emi"
 
 Example:
 
@@ -20,4 +25,8 @@ Example:
 		reg = <0 0x10012000 0 0x1000>;
 		clocks = <&infracfg CLK_INFRA_DVFSRC>;
 		clock-names = "dvfsrc";
+		ddr_emi: interconnect {
+			compatible = "mediatek,mt8183-emi";
+			#interconnect-cells = <1>;
+		};
 	};
diff --git a/include/dt-bindings/interconnect/mtk,mt8183-emi.h b/include/dt-bindings/interconnect/mtk,mt8183-emi.h
new file mode 100644
index 0000000..2a54856
--- /dev/null
+++ b/include/dt-bindings/interconnect/mtk,mt8183-emi.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __DT_BINDINGS_INTERCONNECT_MTK_MT8183_EMI_H
+#define __DT_BINDINGS_INTERCONNECT_MTK_MT8183_EMI_H
+
+#define MT8183_SLAVE_DDR_EMI			0
+#define MT8183_MASTER_MCUSYS			1
+#define MT8183_MASTER_GPU			2
+#define MT8183_MASTER_MMSYS			3
+#define MT8183_MASTER_MM_VPU			4
+#define MT8183_MASTER_MM_DISP			5
+#define MT8183_MASTER_MM_VDEC			6
+#define MT8183_MASTER_MM_VENC			7
+#define MT8183_MASTER_MM_CAM			8
+#define MT8183_MASTER_MM_IMG			9
+#define MT8183_MASTER_MM_MDP			10
+
+#endif
-- 
1.9.1
