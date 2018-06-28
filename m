From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 0/5] Renesas R9A06G032 PINCTRL Driver
Date: Thu, 28 Jun 2018 16:10:45 +0200
Message-ID: <CACRpkdag1snZfeCC1y5TJdgVzAXbv+nDJrA-3R=49haTM8Kxpw@mail.gmail.com>
References: <1528974029-29617-1-git-send-email-michel.pollet@bp.renesas.com>
 <CACRpkdbX0R+ipasLfZi80yf2OBU0TuDT-0KoUJBvrQz3Zj6eFQ@mail.gmail.com> <CAMuHMdVL-00gb7ZfgNGr8-VawFUpg+iY5mpPF6UZPfjFqM1_jg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdVL-00gb7ZfgNGr8-VawFUpg+iY5mpPF6UZPfjFqM1_jg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michel Pollet <michel.pollet@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Phil Edworthy <phil.edworthy@renesas.com>, Michel Pollet <buserror+upstream@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Magnus Damm <damm+renesas@opensource.se>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 18, 2018 at 10:57 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Mon, Jun 18, 2018 at 10:46 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Thu, Jun 14, 2018 at 1:00 PM, Michel Pollet
> > <michel.pollet@bp.renesas.com> wrote:

> > Is it totally different from the other "great old ones" in the SuperH-PFC
> > series or is there some other reason why it was done like this?
>
> Yes it is, cfr. drivers/pinctrl/pinctrl-rza1.c, which lives outside sh-pfc, too.

OK I see.

I take it that it is also totally different from the rza1 HW?

It's fine like this, if there are many of them we might want
to create something like a renesas/ subfolder at some point
and stash them in there.

> Of course I can take it through my sh-pfc tree, once the rough edges have been
> removed.

That's best I think, it always works smooth.

Yours,
Linus Walleij
