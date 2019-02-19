From: Pascal PAILLET-LME <p.paillet@st.com>
Subject: [PATCH 4/8] dt-bindings: regulator: remove regulator pull-down
 support for stpmic1
Date: Tue, 19 Feb 2019 10:04:33 +0000
Message-ID: <1550570647-9555-5-git-send-email-p.paillet@st.com>
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

Regulator high pull down are enabled by default so remove support in the
driver.

Signed-off-by: Pascal Paillet <p.paillet@st.com>
---
 Documentation/devicetree/bindings/regulator/st,stpmic1-regulator.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/st,stpmic1-regulator.txt b/Documentation/devicetree/bindings/regulator/st,stpmic1-regulator.txt
index de27897..bf9385b 100644
--- a/Documentation/devicetree/bindings/regulator/st,stpmic1-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/st,stpmic1-regulator.txt
@@ -23,8 +23,6 @@ Switches are fixed voltage regulators with only enable/disable capability.
 Optional properties:
 - st,mask-reset: mask reset for this regulator: the regulator configuration
   is maintained during pmic reset.
-- regulator-pull-down: enable high pull down
-  if not specified light pull down is used
 - regulator-over-current-protection:
     if set, all regulators are switched off in case of over-current detection
     on this regulator,
-- 
1.9.1
