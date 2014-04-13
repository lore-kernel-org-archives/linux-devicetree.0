From: Alexander Stein <alexanders83@web.de>
Subject: Re: Re: [PATCH 3/4] ALSA: sound/atmel/ac97c.c: Add device tree support
Date: Sun, 13 Apr 2014 10:32:09 +0200
Message-ID: <11572820.ByGz2BLudS@kongar>
References: <1397293707-26890-1-git-send-email-alexanders83@web.de> <5369289.Xz059aMMT6@kongar> <1397299697.719282244@f331.i.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1397299697.719282244@f331.i.mail.ru>
Sender: linux-doc-owner@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Andrew Victor <linux@maxim.org.za>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On Saturday 12 April 2014, 14:48:17 wrote Alexander Shiyan:
> Sat, 12 Apr 2014 12:42:18 +0200 =D0=BE=D1=82 Alexander Stein <alexand=
ers83@web.de>:
> > On Saturday 12 April 2014, 14:31:28 wrote Alexander Shiyan:
> > > Sat, 12 Apr 2014 11:08:26 +0200 =D0=BE=D1=82 Alexander Stein <ale=
xanders83@web.de>:
> > > > Signed-off-by: Alexander Stein <alexanders83@web.de>
> > > > ---
> > > >  .../devicetree/bindings/sound/atmel_ac97c.txt      | 20 ++++++=
+++
> > > >  sound/atmel/ac97c.c                                | 52 ++++++=
++++++++++++++--
> > > >  2 files changed, 69 insertions(+), 3 deletions(-)
> > > >  create mode 100644 Documentation/devicetree/bindings/sound/atm=
el_ac97c.txt
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/sound/atmel_ac97=
c.txt b/Documentation/devicetree/bindings/sound/atmel_ac97c.txt
> > > > new file mode 100644
> > > > index 0000000..9839403
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/sound/atmel_ac97c.txt
> > > > @@ -0,0 +1,20 @@
> > > > +* Atmel AC97 controller
> > > > +
> > > > +Required properties:
> > > > +  - compatible: "atmel,atmel_ac97c"
> > > > +  - reg: Address and length of the register set for the device
> > > > +  - interrupts: Should contain AC97 interrupt
> > > > +  - atmel,reset-pin: GPIO for resetting the codec
> > >=20
> > > Why standard "gpios" property cannot be used here?
> >=20
> > I guess they can. I have no experience defining a devicetree bindin=
g, so I just stuck to the platformdata member name.
> > If this is the recommended way, I'll gladly change that.
>=20
> Another question is whether this property should refer to the control=
ler,
> as it is clear that it refers to the codec ....

AFAICT the codec itself has no representation in the devicetree. It get=
s detected by the controller which uses the reset GPIO.

Alexander

