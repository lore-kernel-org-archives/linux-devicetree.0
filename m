From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: [PATCH RFC] gpio: of: document gpio-init nodes
Date: Fri, 22 Sep 2017 22:41:38 +0200
Message-ID: <20170922204138.29951-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

Sometimes it is desirable to define a "safe" configuration for a GPIO in
the device tree but let the operating system later still make use of
this pin.

This might for example be useful to initially configure a debug pin that
is usually unconnected as output to prevent floating until it is used
later.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

this picks up a discussion that pops up now and then with our customers.

Last time I discussed this topic with Linus Walleij my suggestion was to
merge this usecase with gpio-hogs, but he wasn't happy with it because
hogging implies that the pin is not free for other usage and he
suggested to use "gpio-init" instead.

Maybe it's arguable if this "initial configuration" belongs into the
device tree, but IMHO defining a "safe configuration" should have a
place and the requirements are identical. This isn't implied by the name
however, but I don't have a better idea for a different name.

Thinking further (which was also discussed last time) it would also be
nice to restrict usage. For example that a given pin that has
"output-low" as its safe setting might be configured later als high
output but not as input. Maybe:

	companion-reset {
		gpio-somethingwithsafe;
		gpios = <12 0>;
		output-low;
		fixed-direction;
	};

(Conceptually we would have a hog then when also adding "fixed-value".)

I'm not sure the early configuration should be implemented in Linux. I'd
target the bootloader for that instead, still having the blessing of a
binding document would be great.

I look forward to your comments and ideas.

Best regards
Uwe

 Documentation/devicetree/bindings/gpio/gpio.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index 802402f6cc5d..849d620cee4d 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -207,6 +207,11 @@ configuration.
 Optional properties:
 - line-name:  The GPIO label name. If not present the node name is used.
 
+Similar to hogging above GPIOs can be initialized to a certain configuration
+only which compared to hogs doesn't prevent the operating system to change the
+pin later. The syntax is similar to hog definitons, the difference is only that
+the identifying property is "gpio-init" instead of "gpio-hog".
+
 Example of two SOC GPIO banks defined as gpio-controller nodes:
 
 	qe_pio_a: gpio-controller@1400 {
@@ -221,6 +226,12 @@ Example of two SOC GPIO banks defined as gpio-controller nodes:
 			output-low;
 			line-name = "foo-bar-gpio";
 		};
+
+		companion-reset {
+			gpio-init;
+			gpios = <12 0>;
+			output-low;
+		};
 	};
 
 	qe_pio_e: gpio-controller@1460 {
-- 
2.11.0

