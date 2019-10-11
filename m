From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v8 2/3] dt-bindings: ASoC: WSA881x: Add missing
	#sound-dai-cells
Date: Fri, 11 Oct 2019 16:24:45 +0100
Message-ID: <20191011152446.5925-3-srinivas.kandagatla@linaro.org>
References: <20191011152446.5925-1-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20191011152446.5925-1-srinivas.kandagatla@linaro.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: broonie@kernel.org, robh@kernel.org
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org, spapothi@codeaurora.org, lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com, vkoul@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

As this codec now exposes dai, add missing #sound-dai-cells.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
index faa90966a33a..ea44d03e58ca 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
@@ -29,11 +29,15 @@ properties:
   '#thermal-sensor-cells':
     const: 0
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
   - powerdown-gpios
   - "#thermal-sensor-cells"
+  - "#sound-dai-cells"
 
 additionalProperties: false
 
@@ -49,6 +53,7 @@ examples:
             reg = <0 1>;
             powerdown-gpios = <&wcdpinctrl 2 0>;
             #thermal-sensor-cells = <0>;
+            #sound-dai-cells = <0>;
         };
 
         speaker@0,2 {
@@ -56,6 +61,7 @@ examples:
             reg = <0 2>;
             powerdown-gpios = <&wcdpinctrl 2 0>;
             #thermal-sensor-cells = <0>;
+            #sound-dai-cells = <0>;
         };
     };
 
-- 
2.21.0
