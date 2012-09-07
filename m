From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] leds: leds-gpio: adopt pinctrl support
Date: Fri, 7 Sep 2012 23:36:41 +0200
Message-ID: <CACRpkdYE_ysxatAoVwDCf25+-1LLffVnQhbtzwpEWMMAWSnE8A@mail.gmail.com>
References: <1346487390-11399-1-git-send-email-anilkumar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1346487390-11399-1-git-send-email-anilkumar@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: AnilKumar Ch <anilkumar@ti.com>
Cc: bryan.wu@canonical.com, rpurdie@rpsys.net, tony@atomide.com, devicetree-discuss@lists.ozlabs.org, linux-leds@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sat, Sep 1, 2012 at 10:16 AM, AnilKumar Ch <anilkumar@ti.com> wrote:

> Adopt pinctrl support to leds-gpio driver based on leds-gpio
> device pointer, pinctrl driver configure SoC pins to GPIO
> mode according to definitions provided in .dts file.
>
> Signed-off-by: AnilKumar Ch <anilkumar@ti.com>

Looks good from a pinctrl point of view!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
