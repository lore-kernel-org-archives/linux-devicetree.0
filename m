From: Henry Chen <henryc.chen@mediatek.com>
Subject: [RFC V2 02/11] dt-bindings: soc: Add opp table on scpsys bindings
Date: Tue, 30 Apr 2019 16:50:56 +0800
Message-ID: <1556614265-12745-3-git-send-email-henryc.chen@mediatek.com>
References: <1556614265-12745-1-git-send-email-henryc.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1556614265-12745-1-git-send-email-henryc.chen@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <swboyd@chromium.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>, Nicolas Boichat <drinkcat@google.com>, linux-kernel@vger.kernel.org, Henry Chen <henryc.chen@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add opp table on scpsys dt-bindings for Mediatek SoC.

Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
---
 .../devicetree/bindings/soc/mediatek/scpsys.txt    | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
index b4728ce..33df802 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
+++ b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
@@ -63,6 +63,10 @@ Optional properties:
 - mfg_2d-supply: Power supply for the mfg_2d power domain
 - mfg-supply: Power supply for the mfg power domain
 
+- operating-points-v2: Phandle to the OPP table for the Power domain.
+	Refer to Documentation/devicetree/bindings/power/power_domain.txt
+	and Documentation/devicetree/bindings/opp/opp.txt for more details
+
 Example:
 
 	scpsys: scpsys@10006000 {
@@ -75,6 +79,27 @@ Example:
 			 <&topckgen CLK_TOP_VENC_SEL>,
 			 <&topckgen CLK_TOP_VENC_LT_SEL>;
 		clock-names = "mfg", "mm", "venc", "venc_lt";
+		operating-points-v2 = <&dvfsrc_opp_table>;
+
+		dvfsrc_opp_table: opp-table {
+			compatible = "operating-points-v2-level";
+
+			dvfsrc_vol_min: opp1 {
+				opp,level = <MT8183_DVFSRC_LEVEL_1>;
+			};
+
+			dvfsrc_freq_medium: opp2 {
+				opp,level = <MT8183_DVFSRC_LEVEL_2>;
+			};
+
+			dvfsrc_freq_max: opp3 {
+				opp,level = <MT8183_DVFSRC_LEVEL_3>;
+			};
+
+			dvfsrc_vol_max: opp4 {
+				opp,level = <MT8183_DVFSRC_LEVEL_4>;
+			};
+		};
 	};
 
 Example consumer:
@@ -82,4 +107,21 @@ Example consumer:
 	afe: mt8173-afe-pcm@11220000 {
 		compatible = "mediatek,mt8173-afe-pcm";
 		power-domains = <&scpsys MT8173_POWER_DOMAIN_AUDIO>;
+		operating-points-v2 = <&aud_opp_table>;
+	};
+
+	aud_opp_table: aud-opp-table {
+		compatible = "operating-points-v2";
+		opp1 {
+			opp-hz = /bits/ 64 <793000000>;
+			required-opps = <&dvfsrc_vol_min>;
+		};
+		opp2 {
+			opp-hz = /bits/ 64 <910000000>;
+			required-opps = <&dvfsrc_vol_max>;
+		};
+		opp3 {
+			opp-hz = /bits/ 64 <1014000000>;
+			required-opps = <&dvfsrc_vol_max>;
+		};
 	};
-- 
1.9.1
