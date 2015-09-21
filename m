From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH v2] gpio: mention in DT binding doc that <name>-gpio is deprecated
Date: Mon, 21 Sep 2015 14:57:25 +0200
Message-ID: <1442840245-7982-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <acourbot@nvidia.com>, devicetree@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Benoit Parrot <bparrot@ti.com>, Kumar Gala <galak@codeaurora.org>, Masahiro Yamada <yamada.m@jp.panasonic.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

The gpiolib supports parsing DT properties of the form <name>-gpio but it
was only added for compatibility with older DT bindings that got it wrong
and should not be used in newer bindings.

The commit that added support for this was:

dd34c37aa3e8 ("gpio: of: Allow -gpio suffix for property names")

but didn't update the documentation to explain this so it's been a source
of confusion. So let's make this clear in the GPIO DT binding doc.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

Changes in v2:
- Explain that <name>-gpio is deprecated instead of saying that is
  supported. Suggested by Alexandre Courbot.

 Documentation/devicetree/bindings/gpio/gpio.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index 5788d5cf1252..82d40e2505f6 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -16,7 +16,9 @@ properties, each containing a 'gpio-list':
 GPIO properties should be named "[<name>-]gpios", with <name> being the purpose
 of this GPIO for the device. While a non-existent <name> is considered valid
 for compatibility reasons (resolving to the "gpios" property), it is not allowed
-for new bindings.
+for new bindings. Also, GPIO properties named "[<name>-]gpio" are valid and old
+bindings use it, but are only supported for compatibility reasons and should not
+be used for newer bindings since it has been deprecated.
 
 GPIO properties can contain one or more GPIO phandles, but only in exceptional
 cases should they contain more than one. If your device uses several GPIOs with
-- 
2.4.3

