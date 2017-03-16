From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 1/7] pinctrl: Renesas RZ/A1 pin and gpio controller
Date: Thu, 16 Mar 2017 14:43:57 +0000
Message-ID: <SG2PR06MB11659B314B3B385F4B2835728A260@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <1487610788-6939-1-git-send-email-jacopo+renesas@jmondi.org>
 <1487610788-6939-2-git-send-email-jacopo+renesas@jmondi.org>
 <SG2PR06MB1165969D5D3072A3A19DEDCE8A210@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <6804f0d9-3768-c792-e4c7-2512fac83d2d@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <6804f0d9-3768-c792-e4c7-2512fac83d2d@jmondi.org>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: jacopo mondi <jacopo@jmondi.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Jacopo,

> > I would suggest:
> >    PIBC_REG =3D 1 /* always gets set for GPIO mode */
> >  input:
> >    PM_REG =3D 1
> >    PBDC_REG =3D 0
> > output:
> >    PM_REG =3D 0
> >    PBDC_REG =3D 1
> >
>=20
> I assumed "set_direction()" to always be called after a "request()", so
> that the pin is always in reset state.
> This is obviously not true, so I'm going to fix this as you suggested.
> I'm just wondering why we should keep input buffer enabled even if we're
> running in output mode. This seems to be "safe" according to TRM but I'm =
a
> bit afraid of unexpected consequences (am I too paranoid?)

In the hardware manual, look at "Table 54.4 PPRnm Read Values"

When PM_REG is '0', the input buffer value (PIBC_REG) is don't care (X)



> > I would suggest something like this:
> >
> > 	if (bidir)
> > 		rza1_set_bit(port, PBDC_REG, offset, 1);
> > 	else {
> > 		rza1_set_bit(port, PBDC_REG, offset, 0);
> > 		rza1_set_bit(port, PM_REG, offset, swio_in);
> > 	}
> >
> > 	rza1_set_bit(port, PMC_REG, offset, 1);
> >
> >
>=20
> This looks nicer, for sure, but from my testing I found out that the
> sequence reported in section 54.19-c of TRM has to be carefully respected=
,
> particularly setting PM after PMC (and iirc setting PBDC before PFC*) Am =
I
> wrong? I will give your suggestion spin anyway...

I admit, I didn't really look at the suggested flow that the manual said.
I just want off the fact that PMC_REG was the last thing being set, so all
the other registers were irrelevant until that point.

However, you can change the order if you like, as longs as the register
settings still end up the same way as I outlined.


> This apart, you suggestion is tied to your comment on [2/7] on replacing
> INPUT_EN with BIDIR and introduce SWIO_IN and SWIO_OUT, which I mostly
> agree on (I'll comment on that as well).
>=20
> A sort of middle-ground to get rid of horrible conditions like "if
> ((!swio_en && input_en) || (swio_en && !input_en))"
> which requires a 7 lines comments to be explained and I still found
> obscure after a month I was not looking at it, would be making BIDIR and
> SWIO_[IN|OUT] exclusive, as if a pin is set to be SWIO it already has
> direction specified, and if it is said to be BIDIR, it means its directio=
n
> is decided by the alternate function, not by software.
> Does this fly for you?

Yes, my suggestion is to make BIDIR and SWIO_[IN|OUT] exclusive in the DT. =
You
only choose one (or nothing). You can specify that in the DT bindings docum=
ent.

> Do you see cases where those flags may have to be
> specified together?

There should not be case. Actually...when I went through this, I think the =
HW manual
prohibits this anyway...or rather one cancels the other....but I can't reme=
mber which.
But, I did spend a good amount of time re-reading the chapter when I was re=
viewing
your code.


Thank you,
Chris

