From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: [RFCv4 3/7] dt-bindings: devfreq: imx: Describe interconnect
 properties
Date: Fri, 23 Aug 2019 17:36:56 +0300
Message-ID: <3f27038292c09c8bf07a086eac759132c100aedb.1566570260.git.leonard.crestez@nxp.com>
References: <cover.1566570260.git.leonard.crestez@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1566570260.git.leonard.crestez@nxp.com>
In-Reply-To: <cover.1566570260.git.leonard.crestez@nxp.com>
References: <cover.1566570260.git.leonard.crestez@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@partner.samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Dong Aisheng <aisheng.dong@nxp.com>, linux-arm-kernel@lists.infradead.org, Saravana Kannan <saravanak@google.com>, linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Alexandre Bailon <abailon@baylibre.com>, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

The interconnect-node-id property is parsed by the imx interconnect
driver to find nodes on which frequencies can be adjusted.

Add #interconnect-cells so that device drivers can request paths from
bus nodes instead of requiring a separate "virtual" node to represent
the interconnect itself.

Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
---
 Documentation/devicetree/bindings/devfreq/imx-ddrc.yaml | 5 +++++
 Documentation/devicetree/bindings/devfreq/imx.yaml      | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/devfreq/imx-ddrc.yaml b/Documentation/devicetree/bindings/devfreq/imx-ddrc.yaml
index 31db204e6845..014449a9dd01 100644
--- a/Documentation/devicetree/bindings/devfreq/imx-ddrc.yaml
+++ b/Documentation/devicetree/bindings/devfreq/imx-ddrc.yaml
@@ -31,10 +31,15 @@ properties:
       - const: dram_alt
       - const: dram_apb
 
   operating-points-v2: true
 
+  interconnect-node-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+  '#interconnect-cells':
+    const: 1
+
   devfreq-events:
     description: Phandle of PMU node
     $ref: "/schemas/types.yaml#/definitions/phandle"
 
 required:
diff --git a/Documentation/devicetree/bindings/devfreq/imx.yaml b/Documentation/devicetree/bindings/devfreq/imx.yaml
index 634870496d5e..f2f9b76c752f 100644
--- a/Documentation/devicetree/bindings/devfreq/imx.yaml
+++ b/Documentation/devicetree/bindings/devfreq/imx.yaml
@@ -43,10 +43,15 @@ properties:
   clocks:
     maxItems: 1
 
   operating-points-v2: true
 
+  interconnect-node-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+  '#interconnect-cells':
+    const: 1
+
   devfreq:
     description: |
       Phandle to another devfreq device to match OPPs with by using the
       passive governor.
     $ref: "/schemas/types.yaml#/definitions/phandle"
-- 
2.17.1
