Return-Path: <SRS0=7p7P=U3=vger.kernel.org=devicetree-owner@kernel.org>
Received: from smtp.missinglinkelectronics.com ([94.130.14.54]:54308 "EHLO
        smtp.missinglinkelectronics.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726558AbfF1NEN (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 28 Jun 2019 09:04:13 -0400
Message-ID: <a1af77a8b6d6832f888e6a55f5732982.squirrel@mail.missinglinkelectronics.com>
Date: Fri, 28 Jun 2019 14:57:50 +0200
Subject: [PATCH] dt-bindings: ASoC: tlv320aic32x4: Fix property name
From: "David Epping" <david.epping@missinglinkelectronics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Sender: devicetree-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, trivial@kernel.org
List-ID: <devicetree@vger.kernel.org>

From: David Epping <david.epping@missinglinkelectronics.com>

dt-bindings: ASoC: tlv320aic32x4: Fix property name

The 'supply' string is a suffix to the actual supply name, not a prefix.
Also extend the example section with required supply properties.

Signed-off-by: David Epping <david.epping@missinglinkelectronics.com>
---
 Documentation/devicetree/bindings/sound/tlv320aic32x4.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/tlv320aic32x4.txt
b/Documentation/devicetree/bindings/sound/tlv320aic32x4.txt
index ca75890..439eaf7 100644
--- a/Documentation/devicetree/bindings/sound/tlv320aic32x4.txt
+++ b/Documentation/devicetree/bindings/sound/tlv320aic32x4.txt
@@ -7,7 +7,7 @@ Required properties:
        "ti,tlv320aic32x4" TLV320AIC3204
        "ti,tlv320aic32x6" TLV320AIC3206, TLV320AIC3256
  - reg: I2C slave address
- - supply-*: Required supply regulators are:
+ - *-supply: Required supply regulators are:
     "iov" - digital IO power supply
     "ldoin" - LDO power supply
     "dv" - Digital core power supply
@@ -31,6 +31,8 @@ codec: tlv320aic32x4@18 {
        reg = <0x18>;
        clocks = <&clks 201>;
        clock-names = "mclk";
+       iov-supply = <&reg_3v3>;
+       ldoin-supply = <&reg_3v3>;
        aic32x4-gpio-func= <
                        0xff /* AIC32X4_MFPX_DEFAULT_VALUE */
                        0xff /* AIC32X4_MFPX_DEFAULT_VALUE */
-- 
2.7.4
