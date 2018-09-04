From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 01/13] ASoC: dt-bindings: update wcd9335
	bindings.
Date: Tue,  4 Sep 2018 11:24:48 +0100
Message-ID: <20180904102500.30318-2-srinivas.kandagatla@linaro.org>
References: <20180904102500.30318-1-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20180904102500.30318-1-srinivas.kandagatla@linaro.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: lee.jones@linaro.org, robh+dt@kernel.org, broonie@kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, vkoul@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch updates wcd9335 bindings with recommended properties.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../devicetree/bindings/sound/qcom,wcd9335.txt         | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd9335.txt b/Documentation/devicetree/bindings/sound/qcom,wcd9335.txt
index 1d8d49e30af7..5d6ea66a863f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd9335.txt
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd9335.txt
@@ -34,12 +34,12 @@ Required properties with SLIMbus Interface:
 	Definition: Interrupt names of WCD INTR1 and INTR2
 	Should be: "intr1", "intr2"
 
-- reset-gpio:
+- reset-gpios:
 	Usage: required
 	Value type: <String Array>
 	Definition: Reset gpio line
 
-- qcom,ifd:
+- slim-ifc-dev:
 	Usage: required
 	Value type: <phandle>
 	Definition: SLIM interface device
@@ -104,13 +104,13 @@ Required properties with SLIMbus Interface:
 	Value type: <u32>
 	Definition: Must be 1
 
-codec@1{
+audio-codec@1{
 	compatible = "slim217,1a0";
 	reg  = <1 0>;
 	interrupts = <&msmgpio 54 IRQ_TYPE_LEVEL_HIGH>;
 	interrupt-names = "intr2"
-	reset-gpio = <&msmgpio 64 0>;
-	qcom,ifd  = <&wc9335_ifd>;
+	reset-gpios = <&msmgpio 64 0>;
+	slim-ifc-dev  = <&wc9335_ifd>;
 	clock-names = "mclk", "native";
 	clocks = <&rpmcc RPM_SMD_DIV_CLK1>,
 		 <&rpmcc RPM_SMD_BB_CLK1>;
-- 
2.18.0
