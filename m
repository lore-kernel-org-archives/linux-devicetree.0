From: Colin King <colin.king@canonical.com>
Subject: [PATCH] ARM: at91/at91-pinctrl documentation: fix spelling mistake: "contoller" -> "controller"
Date: Fri, 21 Apr 2017 13:07:13 +0100
Message-ID: <20170421120713.4939-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

trivial fix to spelling mistake in documentation

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
index 9a8a45d9d8ab..590e60378be3 100644
--- a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
@@ -4,7 +4,7 @@ The AT91 Pinmux Controller, enables the IC
 to share one PAD to several functional blocks. The sharing is done by
 multiplexing the PAD input/output signals. For each PAD there are up to
 8 muxing options (called periph modes). Since different modules require
-different PAD settings (like pull up, keeper, etc) the contoller controls
+different PAD settings (like pull up, keeper, etc) the controller controls
 also the PAD settings parameters.
 
 Please refer to pinctrl-bindings.txt in this directory for details of the
-- 
2.11.0

