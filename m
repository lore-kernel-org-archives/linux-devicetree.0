From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] dt-bindings: soc: qcom: Fix default clock-freq for qcom,geni-i2c
Date: Wed, 13 Jun 2018 10:50:11 -0700
Message-ID: <20180613175011.217585-1-dianders@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, bjorn.andersson@linaro.org
Cc: kramasub@codeaurora.org, wsa@the-dreams.de, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

In an early version of the I2C patch that was posted to the list the
default I2C frequency (if none was specified) was 400 kHz.  There was
debate on the list and we decided that it would be more consistent
with the rest of i2c if we defaulted to 100 kHz.  ...but we never
updated the bindings.  Let's fix this.

NOTE: since the i2c driver itself hasn't actually landed yet and the
SoC here is very new it seems terribly unlikely that anyone was
relying on the old 400 kHz number, so I'll assume this is an OK
"incompatible" device tree change.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
index d330c73de9a2..68b7d6207e3d 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
@@ -39,7 +39,7 @@ Required properties:
 
 Optional property:
 - clock-frequency:	Desired I2C bus clock frequency in Hz.
-			When missing default to 400000Hz.
+			When missing default to 100000Hz.
 
 Child nodes should conform to I2C bus binding as described in i2c.txt.
 
-- 
2.18.0.rc1.244.gcf134e6275-goog
