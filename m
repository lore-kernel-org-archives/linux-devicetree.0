MIME-Version: 1.0
In-Reply-To: <1523956215-28154-7-git-send-email-t-kristo@ti.com>
References: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
	<1523956215-28154-7-git-send-email-t-kristo@ti.com>
Date: Wed, 18 Apr 2018 19:19:33 -0500
Message-ID: <CAL_JsqJ7Gfy33hP3FfcWnwaR1eyEfB18SHGAUhMceOUV2xs=sQ@mail.gmail.com>
Subject: Re: [RFC 06/13] ARM: dts: am57xx-evm: add AM57xx-evm DT overlay
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Tero Kristo <t-kristo@ti.com>
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "Mills, William" <wmills@ti.com>, Tony Lindgren <tony@atomide.com>, Tom Rini <trini@konsulko.com>, Russell King <linux@armlinux.org.uk>
List-ID: <devicetree@vger.kernel.org>

On Tue, Apr 17, 2018 at 4:10 AM, Tero Kristo <t-kristo@ti.com> wrote:
> The AM57xx-evm is an overlay on top of beagle-x15 board. This contains
> a display extension macro, and a few extra peripherals. Two versions
> of the evm are supported, the base evm and the latest rev A3 evm. A
> common overlay file is used for both boards.
>
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  arch/arm/boot/dts/ti/am57xx-evm-common.dtso | 175 ++++++++++++++++++++++++++++

Why do this as an overlay? To what level is an AM57xx-evm functional
using a beagle-x15 dtb?

>  arch/arm/boot/dts/ti/am57xx-evm-reva3.dtso  |  11 ++
>  arch/arm/boot/dts/ti/am57xx-evm.dtso        |  11 ++

I think I'd structure this as just the A3 is an overlay. Applying it
will override everything in am57xx-evm.dtso, so what's the point to
making users of both board variations apply an overlay. Plus, you
could have only known the differences in the board revisions after you
had both boards. That wouldn't work if you developed this as new
boards appear.

Rob
