From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] extcon: fsa9480: Support the FSA880 variant
Date: Tue, 23 Jul 2019 19:43:01 +0200
Message-ID: <20190723174301.31278-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Mike Lockwood <lockwood@google.com>, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The older compatible variant of this chip is called FSA880
and works the same way, if we need some quirks in the future,
it is good to let it have its own compatible string.

Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/devicetree/bindings/extcon/extcon-fsa9480.txt | 4 +++-
 drivers/extcon/extcon-fsa9480.c                             | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/extcon/extcon-fsa9480.txt b/Documentation/devicetree/bindings/extcon/extcon-fsa9480.txt
index d592c21245f2..624bd76f468e 100644
--- a/Documentation/devicetree/bindings/extcon/extcon-fsa9480.txt
+++ b/Documentation/devicetree/bindings/extcon/extcon-fsa9480.txt
@@ -5,7 +5,9 @@ controlled using I2C and enables USB data, stereo and mono audio, video,
 microphone, and UART data to use a common connector port.
 
 Required properties:
- - compatible : Must be "fcs,fsa9480"
+ - compatible : Must be one of
+   "fcs,fsa9480"
+   "fcs,fsa880"
  - reg : Specifies i2c slave address. Must be 0x25.
  - interrupts : Should contain one entry specifying interrupt signal of
    interrupt parent to which interrupt pin of the chip is connected.
diff --git a/drivers/extcon/extcon-fsa9480.c b/drivers/extcon/extcon-fsa9480.c
index 350fb34abfa0..8405512f5199 100644
--- a/drivers/extcon/extcon-fsa9480.c
+++ b/drivers/extcon/extcon-fsa9480.c
@@ -363,6 +363,7 @@ MODULE_DEVICE_TABLE(i2c, fsa9480_id);
 
 static const struct of_device_id fsa9480_of_match[] = {
 	{ .compatible = "fcs,fsa9480", },
+	{ .compatible = "fcs,fsa880", },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, fsa9480_of_match);
-- 
2.21.0
