From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 02/10] pinctrl: generic: Add macros to unpack properties
Date: Fri, 28 Apr 2017 10:16:22 +0200
Message-ID: <CACRpkdbkBtJGJ_5MVy2QSAa0zcKVm=_H+vC_kH4AUcX58TiaLg@mail.gmail.com>
References: <1493281194-5200-1-git-send-email-jacopo+renesas@jmondi.org> <1493281194-5200-3-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1493281194-5200-3-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 27, 2017 at 10:19 AM, Jacopo Mondi
<jacopo+renesas@jmondi.org> wrote:

> Add PIN_CONF_UNPACK_PARAM and PIN_CONF_UNPACK_ARGS macros useful to
> unpack generic properties and their arguments
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

(...)

/*
  * Helpful configuration macro to be used in tables etc.

Then this should say "macros" rather than "macro".

> -#define PIN_CONF_PACKED(p, a) ((a << 8) | ((unsigned long) p & 0xffUL))
> +#define PIN_CONF_PACKED(p, a) (((a) << 8) | ((unsigned long) (p) & 0xffUL))

Also adding some extra parantheses I see.

> +#define PIN_CONF_UNPACK_PARAM(c) ((c) & 0xffUL)
> +#define PIN_CONF_UNPACK_ARGS(c) ((c) >> 8)

But why.

I have these two static inlines just below your new macros:

static inline enum pin_config_param pinconf_to_config_param(unsigned
long config)
{
        return (enum pin_config_param) (config & 0xffUL);
}

static inline u32 pinconf_to_config_argument(unsigned long config)
{
        return (u32) ((config >> 8) & 0xffffffUL);
}

Why can't you use this in your code instead of macros?

We generally prefer static inlines over macros because they are easier
to read.

Yours,
Linus Walleij
