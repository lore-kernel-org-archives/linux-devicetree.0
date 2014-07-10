From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Subject: Re: [PATCH 0/4] New Qualcomm PMIC pin controller drivers
Date: Thu, 10 Jul 2014 16:39:18 +0300
Message-ID: <1404999558.16296.31.camel@iivanov-dev>
References: <1404745893-6379-1-git-send-email-iivanov@mm-sol.com>
	 <CACRpkdYcoA-nifxojO5tZUy6dL6P2PTSGW0mVLUfqG20rOg-Nw@mail.gmail.com>
	 <1404904380.16296.17.camel@iivanov-dev>
	 <CACRpkdb25foEcNroqLyZbX93FxqAZ7=2pGo6GPWP8YdrjUS8gg@mail.gmail.com>
	 <CAJAp7Og0Cr3oY=XpT4NzKUWykxkRTq1ZRDyamW6tgohfBs3dmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CAJAp7Og0Cr3oY=XpT4NzKUWykxkRTq1ZRDyamW6tgohfBs3dmg@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn@kryo.se>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <Bjorn.Andersson@sonymobile.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2014-07-09 at 07:02 -0700, Bjorn Andersson wrote:
> On Wed, Jul 9, 2014 at 4:43 AM, Linus Walleij <linus.walleij@linaro.o=
rg> wrote:
> > On Wed, Jul 9, 2014 at 1:13 PM, Ivan T. Ivanov <iivanov@mm-sol.com>=
 wrote:
> >> On Wed, 2014-07-09 at 11:43 +0200, Linus Walleij wrote:
> >>> On Mon, Jul 7, 2014 at 5:11 PM, Ivan T. Ivanov <iivanov@mm-sol.co=
m> wrote:

<snip>

> However, the device tree bindings are a different thing; as the
> properties used to describe the hardware doesn't relate to how we
> communicate with it I think we should be able to (and therefor should=
)
> use the same documentation for the two (rather 7) chips.

Agreed.

>=20
> >> Not sure. Bj=C3=B6rn patches cover older PMIC chips, if not mistak=
en, mine
> >> cover PMIC's used with APQ8074 and onward [1]. Main difference is
> >> the bus which connects them to SoC, interrupts handling, runtime
> >> pin type detection and register map.
> >
>=20
> Correct Ivan; we do however share the same issues related to how to d=
o
> interrupt handling,=20

Yep, but do we actually need to do interrupt handling in driver?
Interrupts are handled by parent device. GPIO client drivers could=20
use interrupt-controller registered by core driver?

> units for properties and how to split/reuse
> between gpio and mpp. Also we have solved the pins vs groups vs
> functions slightly different, that should all be aligned I think.

Sure.

<snip>

> > Then I guess even if the chips are totally unrelated it'd be intere=
sting
> > to have you two guys cross-review each other's drivers so the behav=
iour
> > is consistent across qualcomm platforms.
> >
>=20
> I hope we can meet somewhere in between

Sure.

Regards,
Ivan
