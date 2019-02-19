From: Pascal PAILLET-LME <p.paillet@st.com>
Subject: [PATCH 7/8] dt-bindings: regulator: Add active discharge support for
 stpmic1
Date: Tue, 19 Feb 2019 10:04:34 +0000
Message-ID: <1550570647-9555-8-git-send-email-p.paillet@st.com>
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

Add support for active discharge for USB power switches.

Signed-off-by: pascal paillet <p.paillet@st.com>
---
 Documentation/devicetree/bindings/regulator/st,stpmic1-regulator.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/regulator/st,stpmic1-regulator.txt b/Documentation/devicetree/bindings/regulator/st,stpmic1-regulator.txt
index bf9385b..6189df7 100644
--- a/Documentation/devicetree/bindings/regulator/st,stpmic1-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/st,stpmic1-regulator.txt
@@ -30,6 +30,7 @@ Optional properties:
 - interrupts: index of current limit detection interrupt
 - <regulator>-supply: phandle to the parent supply/regulator node
 	each regulator supply can be described except vref_ddr.
+- regulator-active-discharge: can be used on pwr_sw1 and pwr_sw2.
 
 Example:
 regulators {
-- 
1.9.1
