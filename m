Return-Path: <SRS0=sbd0=MY=renesas.com=Chris.Brandt@kernel.org>
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v3 2/3] mmc: renesas_sdhi_internal_dmac: Add R7S9210
 support
Date: Fri, 12 Oct 2018 11:41:13 +0000
Message-ID: 
 <TY1PR01MB1562B5DCB7298E72C96B92998AE20@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20181010150642.73890-1-chris.brandt@renesas.com>
 <20181010150642.73890-3-chris.brandt@renesas.com>
 <20181012110755.qdnevfoyq5qymf42@ninjato>
In-Reply-To: <20181012110755.qdnevfoyq5qymf42@ninjato>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Wolfram,

On Friday, October 12, 2018, Wolfram Sang wrote:
> > +/* RZ/A2 does not have the ADRR_MODE bit */
> > +#define SDHI_INTERNAL_DMAC_ADRR_MODE_FIXED 2
>=20
> First, there is a typo: s/ADRR/ADDR/g

Thanks!

Even after you pointed that out...I had to stare real hard to see it. I=20
guess the brain corrects what you see.


> Also, I think it would make the code much more comprehensible if this
> macro was named SDHI_INTERNAL_DMAC_ADDR_MODE_BROKEN. Or maybe
> SDHI_INTERNAL_DMAC_FIXED_ADDR_MODE_BROKEN. Currently, on first read I
> thought this mode was fixed on this SoC and broken on all the others and
> was confused.

To be honest, I was not able to fully understand the issue in detail. I was=
 getting information through someone that was not in the design team. So to=
 be fair to the chip design guys, I want to avoid the word "broken".
They took the bit out of the hardware manual, and since the HW was designed=
 to work either way (and the default register setting is for fixed), I cons=
ider it an 'unsupported feature'.

So, how about a compromise of:

#define SDHI_INTERNAL_DMAC_ADDR_MODE_FIXED_ONLY 2


>From your other email:
> > As you can imagine, it does have this bit. And it worked fine from me.
> > But the chip guys said they found something not right with it, so they
> > removed it from the v1.0 Hardware Manual.
>=20
> Do you happen to know if this applies for Gen3 SDHI as well?

I don't think this applies to Gen3. This is just a RZ/A2 thing.

With that said, there are some Gen3 HW bugs that are in RZ/A2 HW, like the =
QSPI read bug. Since the RZ/A2 has the exact same HW as Gen3, it has the sa=
me HW bug. Now that one is a "bug", and I don't mind calling that one broke=
n.


Chris
