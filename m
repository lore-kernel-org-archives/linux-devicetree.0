From: Matheus Castello <matheus@castello.eng.br>
Subject: [PATCH v6 3/3] pinctrl: bcm2835: Add support for output-low output-high properties
Date: Sun, 29 Apr 2018 15:28:12 -0400
Message-ID: <1525030092-3643-3-git-send-email-matheus@castello.eng.br>
References: <CACRpkdaH6kgbM+3UHVJ_JfKZ367XXRhSjXhvsZ-8b0Ovbkpmew@mail.gmail.com>
 <1525030092-3643-1-git-send-email-matheus@castello.eng.br>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525030092-3643-1-git-send-email-matheus@castello.eng.br>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, stefan.wahren@i2se.com, eric@anholt.net
Cc: swarren@wwwdotorg.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Matheus Castello <matheus@castello.eng.br>
List-Id: devicetree@vger.kernel.org

Properties to set initial value of pin output buffer.
This can be useful for configure hardware in overlay files, and in early
boot for checking it states in QA sanity tests.

Signed-off-by: Matheus Castello <matheus@castello.eng.br>
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index 0231107..3bc0d04 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -965,6 +965,11 @@ static int bcm2835_pinconf_set(struct pinctrl_dev *pctldev,
 			bcm2835_pull_config_set(pc, pin, BCM2835_PUD_UP);
 			break;
 
+		/* Set output-high or output-low */
+		case PIN_CONFIG_OUTPUT:
+			bcm2835_gpio_set_bit(pc, arg ? GPSET0 : GPCLR0, pin);
+			break;
+
 		default:
 			return -EINVAL;
 
-- 
2.7.4
