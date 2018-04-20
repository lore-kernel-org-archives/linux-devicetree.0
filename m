Return-Path: <SRS0=Yg38=HJ=rock-chips.com=shawn.lin@kernel.org>
From: Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH v3 1/2] Documentation: mmc: add optional cd-delay-ms property
Date: Fri, 20 Apr 2018 14:59:14 +0800
Message-Id: <1524207555-165403-1-git-send-email-shawn.lin@rock-chips.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>
List-ID: <devicetree@vger.kernel.org>

slot-gpio uses a fixed delay, 200ms, before detecting card after the card
is inserted. 200ms doesn't work for some platforms, so some host drivers
added their own properties for parsing that from DT, for instance,
dw_mmc and pxamci. That being said, it should also be tunable when using
cd-gpios.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

---

Changes in v3:
- fix misleading typo in commit msg

Changes in v2: None

 Documentation/devicetree/bindings/mmc/mmc.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmc.txt b/Documentation/devicetree/bindings/mmc/mmc.txt
index 467cd7b..215b9a2 100644
--- a/Documentation/devicetree/bindings/mmc/mmc.txt
+++ b/Documentation/devicetree/bindings/mmc/mmc.txt
@@ -19,6 +19,8 @@ Optional properties:
 - wp-gpios: Specify GPIOs for write protection, see gpio binding
 - cd-inverted: when present, polarity on the CD line is inverted. See the note
   below for the case, when a GPIO is used for the CD line
+- cd-delay-ms: Set delay time before detecting card after card insert interrupt.
+  It's only valid when cd-gpios is present.
 - wp-inverted: when present, polarity on the WP line is inverted. See the note
   below for the case, when a GPIO is used for the WP line
 - disable-wp: When set no physical WP line is present. This property should
-- 
1.9.1
