From: jmondi <jacopo@jmondi.org>
Subject: Re: [PATCH v5 01/10] pinctrl: generic: Add bi-directional and
 output-enable
Date: Mon, 8 May 2017 18:01:20 +0200
Message-ID: <20170508160120.GB25206@w540>
References: <1493281194-5200-1-git-send-email-jacopo+renesas@jmondi.org>
 <1493281194-5200-2-git-send-email-jacopo+renesas@jmondi.org>
 <CAHp75Vcy1OE+9htFx9k3kQhGARQPT1C0gg3SEKZd7ULu_vkUMA@mail.gmail.com>
 <CACRpkdayW0qPXDcc_JofkwtX5UHhDPxiY_8deZZ7+hPNJkjgeQ@mail.gmail.com>
 <SG2PR06MB1165E7E651BE96CD7B7738B08A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAHp75Vcp_eMWrjZRX-x3=Tt3JRXcL_wWG43MymF=oyLLP4EJwg@mail.gmail.com>
 <SG2PR06MB11658EC3A3A80C57E6F539AC8A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAHp75VeLtOuty=iaxuCaH43rnBZDTT03iH7JyjDJBQhTD-EjzA@mail.gmail.com>
 <CACRpkdZkNGSUvTrEdjbGKO1hr799QpJBGSHPVbsBibph7Jx61A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZkNGSUvTrEdjbGKO1hr799QpJBGSHPVbsBibph7Jx61A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Chris Brandt <Chris.Brandt@renesas.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On Sun, May 07, 2017 at 09:52:49AM +0200, Linus Walleij wrote:
> On Fri, Apr 28, 2017 at 4:53 PM, Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>
> > Linus, for me it looks like better to revert that change, until we
> > will have clear picture why existing configuration parameters can't
> > work.
>
> Yeah I'll revert the binding for fixes.
>

As it seems we won't be able to proceed with the currently proposed solution,
would that be acceptable now that we use the "pinmux" property to add
flags as BIDIR and SWIO_[INPUT|OUTPUT] directly there?
This was my original proposal, rejected because we were using the "pins"
property at the time.

Quoting to the description of "pinmux":

"Each individual pin controller driver bindings documentation shall
specify how those values (pin IDs and pin multiplexing configuration)
are defined and assembled together"

Do you think the "flags" we have failed to describe as generic pin
configuration properties, fit the definition of "pin multiplexing
configuration" to be assembled with pin IDs?

As a reference this was the proposed bindings in v3:
https://www.spinics.net/lists/linux-renesas-soc/msg12792.html

Have a look at Pin multiplexing sub-nodes examples 2 and 3, with
"pinmux" in place of "renesas,pins" property.

Thanks
   j

> Yours,
> Linus Walleij
