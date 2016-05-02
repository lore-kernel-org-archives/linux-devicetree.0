From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 1/2] pinctrl: ns2: add pinmux driver support for Broadcom NS2 SoC
Date: Mon, 02 May 2016 15:36:08 +0200
Message-ID: <7673779.BeEs3iufq4@wuerfel>
References: <1461934299-14774-1-git-send-email-yendapally.reddy@broadcom.com> <1461934299-14774-2-git-send-email-yendapally.reddy@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1461934299-14774-2-git-send-email-yendapally.reddy@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Pramod Kumar <pramodku@broadcom.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Friday 29 April 2016 08:51:38 Yendapally Reddy Dhananjaya Reddy wrote:
> +static struct pinctrl_ops ns2_pinctrl_ops = {
> +       .get_groups_count = ns2_get_groups_count,
> +       .get_group_name = ns2_get_group_name,
> +       .get_group_pins = ns2_get_group_pins,
> +       .pin_dbg_show = ns2_pin_dbg_show,
> +       .dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
> +       .dt_free_map = pinctrl_utils_dt_free_map,
> +};
> +

This does not build:

drivers/pinctrl/bcm/pinctrl-ns2-mux.c:540:17: error: 'pinctrl_utils_dt_free_map' undeclared here (not in a function)
  .dt_free_map = pinctrl_utils_dt_free_map,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~

Apparently this function got renamed to pinctrl_utils_free_map

	Arnd
