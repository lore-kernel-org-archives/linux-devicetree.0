From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 0/5] Renesas R9A06G032 PINCTRL Driver
Date: Mon, 18 Jun 2018 10:46:07 +0200
Message-ID: <CACRpkdbX0R+ipasLfZi80yf2OBU0TuDT-0KoUJBvrQz3Zj6eFQ@mail.gmail.com>
References: <1528974029-29617-1-git-send-email-michel.pollet@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1528974029-29617-1-git-send-email-michel.pollet@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michel Pollet <michel.pollet@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Phil Edworthy <phil.edworthy@renesas.com>, Michel Pollet <buserror+upstream@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Magnus Damm <damm+renesas@opensource.se>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 14, 2018 at 1:00 PM, Michel Pollet
<michel.pollet@bp.renesas.com> wrote:

> *WARNING* -- this requires:
> + R9A06G032 base patch v9
> + R9A06G032 SMP patch v5

Is that required for the pin controller itself (compile-time dependence)
or is it required to boot the system (run-time dependence)?

We can merge support for pin control ahead, that's fine.

> This implements the pinctrl driver for the R9A06G032.

Geert Uytterhoeven and Laurent Pinchart maintains the Renesas pin
controllers, and this one is for some reason a totally new one in
drivers/pinctrl/pinctrl-r9a06g032.c

Is it totally different from the other "great old ones" in the SuperH-PFC
series or is there some other reason why it was done like this?

Please include Geert and Laurent on subsequent postings,
their review is pretty much required to move forward with
this.

Yours,
Linus Walleij
