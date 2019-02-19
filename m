From: Pascal PAILLET-LME <p.paillet@st.com>
Subject: [PATCH 3/8] dt-bindings: regulator: remove interrupt-parent
 description on stpmic1
Date: Tue, 19 Feb 2019 10:04:32 +0000
Message-ID: <1550570647-9555-4-git-send-email-p.paillet@st.com>
References: <1550570647-9555-1-git-send-email-p.paillet@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550570647-9555-1-git-send-email-p.paillet@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "axel.lin@ingics.com" <axel.lin@ingics.com>
Cc: Pascal PAILLET-LME <p.paillet@st.com>, "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>
List-Id: devicetree@vger.kernel.org

The interrupt parent description is not needed as the parent is a parent
node with 'interrupt-controller' property.

Signed-off-by: pascal paillet <p.paillet@st.com>
---
 Documentation/devicetree/bindings/regulator/st,stpmic1-regulator.txt | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/st,stpmic1-regulator.txt b/Documentation/devicetree/bindings/regulator/st,stpmic1-regulator.txt
index a3f4762..de27897 100644
--- a/Documentation/devicetree/bindings/regulator/st,stpmic1-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/st,stpmic1-regulator.txt
@@ -29,7 +29,6 @@ Optional properties:
     if set, all regulators are switched off in case of over-current detection
     on this regulator,
     if not set, the driver only sends an over-current event.
-- interrupt-parent: phandle to the parent interrupt controller
 - interrupts: index of current limit detection interrupt
 - <regulator>-supply: phandle to the parent supply/regulator node
 	each regulator supply can be described except vref_ddr.
@@ -43,7 +42,6 @@ regulators {
 	vdd_core: buck1 {
 		regulator-name = "vdd_core";
 		interrupts = <IT_CURLIM_BUCK1 0>;
-		interrupt-parent = <&pmic>;
 		st,mask-reset;
 		regulator-pull-down;
 		regulator-min-microvolt = <700000>;
@@ -53,7 +51,6 @@ regulators {
 	v3v3: buck4 {
 		regulator-name = "v3v3";
 		interrupts = <IT_CURLIM_BUCK4 0>;
-		interrupt-parent = <&mypmic>;
 
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-- 
1.9.1
