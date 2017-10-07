From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/2] pinctrl: rza1: add support for RZ/A1L
Date: Sat, 7 Oct 2017 13:19:52 +0200
Message-ID: <CACRpkdaQf=O19op+0kWHtsfHps80JQZbXT+ajVxQMtHZ_Te7bQ@mail.gmail.com>
References: <20171004210724.59797-1-chris.brandt@renesas.com> <20171004210724.59797-2-chris.brandt@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20171004210724.59797-2-chris.brandt@renesas.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>, Jacopo Mondi <jacopo+renesas@jmondi.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 4, 2017 at 11:07 PM, Chris Brandt <chris.brandt@renesas.com> wrote:

> Aspects like the number of ports and the location where peripherals are
> brought out differ between the RZ/A1H and RZ/A1L.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
> v2:
>  * added Reviewed-by

Looks good, I expect Geert to queue this for me with a pull
request like with other Renesas stuff.

Yours,
Linus Walleij
