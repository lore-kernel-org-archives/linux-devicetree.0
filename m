From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH anybus v1 2/4] dt-bindings: anybus-bridge: document
 devicetree binding.
Date: Fri, 26 Oct 2018 13:28:39 +0200
Message-ID: <CACRpkdaprWOr9rpsanLNZUHouWKJDkWAC1si+80zFp423eA3SQ@mail.gmail.com>
References: <20181025135515.8397-1-TheSven73@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181025135515.8397-1-TheSven73@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thesven73@gmail.com
Cc: svendev@arcx.com, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Thierry Reding <treding@nvidia.com>, David Lechner <david@lechnology.com>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, Johan Hovold <johan@kernel.org>, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>, john.garry@huawei.com, Geert Uytterhoeven <geert+renesas@glider.be>, Robin Murphy <robin.murphy@arm.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>, Icenowy Zheng <icenowy@aosc.io>, yuanzhichang@hisilicon.com, Stuart Yoder <stuyoder@gmai>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 25, 2018 at 3:55 PM <thesven73@gmail.com> wrote:

> >> +               fsl,weim-cs-timing = <0x024400b1 0x00001010 0x20081100
> >> +                               0x00000000 0xa0000240 0x00000000>;
> >
> > Is it just a copy/paste from
> > Documentation/devicetree/bindings/bus/imx-weim.txt
> > leftover?
>
> No. We attach the bridge to the i.MX WEIM bus. Every fdt WEIM child node
> requires a fsl,weim-cs-timing property, which provides the bus timing for
> that particular chip select. It's the weim driver that requires this,
> I'm only following its instructions.
>
> Should I just leave this out in the example? In theory, the bridge can be
> connected to any parallel bus, so fsl,weim-cs-timing is Too Much Information
> for the example?

No it's fine, I understand it now.

Whay you can do is write before the example that this example node
is using the WEIM bindings and reference that binding document.

Yours,
Linus Walleij
