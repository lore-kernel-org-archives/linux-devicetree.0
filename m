From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Subject: Re: [PATCH V3 2/2] pinctrl: Add Pistachio SoC pin control driver
Date: Fri, 17 Apr 2015 02:27:11 -0300
Message-ID: <553099AF.3060108@imgtec.com>
References: <1428435862-14354-1-git-send-email-abrestic@chromium.org> <1428435862-14354-3-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1428435862-14354-3-git-send-email-abrestic@chromium.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Andrew Bresticker <abrestic@chromium.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Damien Horsley <Damien.Horsley@imgtec.com>, Govindraj Raja <govindraj.raja@imgtec.com>, Kevin Cernekee <cernekee@chromium.org>, Paul Bolle <pebolle@tiscali.nl>
List-Id: devicetree@vger.kernel.org


Hi Andrew,

On 04/07/2015 04:44 PM, Andrew Bresticker wrote:
[..]
> +static int pistachio_gpio_register(struct pistachio_pinctrl *pctl)
> +{
> +	struct device_node *node = pctl->dev->of_node;
> +	struct pistachio_gpio_bank *bank;
> +	unsigned int i;
> +	int irq, ret = 0;
> +
> +	for (i = 0; i < pctl->nbanks; i++) {
> +		char child_name[sizeof("gpioXX")];
> +		struct device_node *child;

The first submission used for_each_child_of_node, and I can't find
any review comments explaining why you've changed it to a regular for
loop.

> +
> +		snprintf(child_name, sizeof(child_name), "gpio%d", i);

This assumes the GPIO bank nodes are called gpio0, gpio1, ... and so on.
Do we really want to assume that?

Thanks,
-- 
Ezequiel
