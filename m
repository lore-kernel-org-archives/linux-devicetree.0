From: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
Subject: [v4, 4/8] dt-bindings: devfreq: add compatible for mt8183 cci devfreq
Date: Tue, 13 Aug 2019 21:31:49 +0800
Message-ID: <1565703113-31479-5-git-send-email-andrew-sh.cheng@mediatek.com>
References: <1565703113-31479-1-git-send-email-andrew-sh.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1565703113-31479-1-git-send-email-andrew-sh.cheng@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Rob
 Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Nishanth Menon <nm@ti.com>, Stephen
 Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>, srv_heupstream@mediatek.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, fan.chen@mediatek.com, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>

This adds dt-binding documentation of cci devfreq
for Mediatek MT8183 SoC platform.

Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
---
 .../bindings/devfreq/mt8183-cci-devfreq.txt          | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/devfreq/mt8183-cci-devfreq.txt

diff --git a/Documentation/devicetree/bindings/devfreq/mt8183-cci-devfreq.txt b/Documentation/devicetree/bindings/devfreq/mt8183-cci-devfreq.txt
new file mode 100644
index 000000000000..a65a70bb9f09
--- /dev/null
+++ b/Documentation/devicetree/bindings/devfreq/mt8183-cci-devfreq.txt
@@ -0,0 +1,20 @@
+* Mediatek Cache Coherent Interconnect(CCI) frequency device
+
+Required properties:
+- compatible: should contain "mediatek,mt8183-cci" for frequency scaling of CCI
+- clocks: for frequency scaling of CCI
+- clock-names: for frequency scaling of CCI driver to reference
+- regulator: for voltage scaling of CCI
+- operating-points-v2: for frequency scaling of CCI opp table
+
+Example:
+	cci: cci {
+		compatible = "mediatek,mt8183-cci";
+		clocks = <&apmixedsys CLK_APMIXED_CCIPLL>;
+		clock-names = "cci_clock";
+		operating-points-v2 = <&cci_opp>;
+	};
+
+	&cci {
+		proc-supply = <&mt6358_vproc12_reg>;
+	};
\ No newline at end of file
-- 
2.12.5
