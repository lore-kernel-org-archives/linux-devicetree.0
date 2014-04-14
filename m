From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: Re: [PATCH 3/4] ALSA: sound/atmel/ac97c.c: Add device tree
 support
Date: Tue, 15 Apr 2014 01:21:34 +0200
Message-ID: <20140414232134.GB2967@piout.net>
References: <1397293707-26890-1-git-send-email-alexanders83@web.de>
 <5369289.Xz059aMMT6@kongar>
 <1397299697.719282244@f331.i.mail.ru>
 <11572820.ByGz2BLudS@kongar>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <11572820.ByGz2BLudS@kongar>
Sender: linux-doc-owner@vger.kernel.org
To: Alexander Stein <alexanders83@web.de>
Cc: Alexander Shiyan <shc_work@mail.ru>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Pawel Moll <pawel.moll@arm.com>, linux-doc@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jaroslav Kysela <perex@perex.cz>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Andrew Victor <linux@maxim.org.za>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 13/04/2014 at 10:32:09 +0200, Alexander Stein wrote :
> On Saturday 12 April 2014, 14:48:17 wrote Alexander Shiyan:
> > Sat, 12 Apr 2014 12:42:18 +0200 =D0=BE=D1=82 Alexander Stein <alexa=
nders83@web.de>:
> > > On Saturday 12 April 2014, 14:31:28 wrote Alexander Shiyan:
> > > > Sat, 12 Apr 2014 11:08:26 +0200 =D0=BE=D1=82 Alexander Stein <a=
lexanders83@web.de>:
> > > > > Signed-off-by: Alexander Stein <alexanders83@web.de>
> > > > > ---
> > > > >  .../devicetree/bindings/sound/atmel_ac97c.txt      | 20 ++++=
+++++
> > > > >  sound/atmel/ac97c.c                                | 52 ++++=
++++++++++++++++--
> > > > >  2 files changed, 69 insertions(+), 3 deletions(-)
> > > > >  create mode 100644 Documentation/devicetree/bindings/sound/a=
tmel_ac97c.txt
> > > > >=20
> > > > > diff --git a/Documentation/devicetree/bindings/sound/atmel_ac=
97c.txt b/Documentation/devicetree/bindings/sound/atmel_ac97c.txt
> > > > > new file mode 100644
> > > > > index 0000000..9839403
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/sound/atmel_ac97c.txt
> > > > > @@ -0,0 +1,20 @@
> > > > > +* Atmel AC97 controller
> > > > > +
> > > > > +Required properties:
> > > > > +  - compatible: "atmel,atmel_ac97c"
> > > > > +  - reg: Address and length of the register set for the devi=
ce
> > > > > +  - interrupts: Should contain AC97 interrupt
> > > > > +  - atmel,reset-pin: GPIO for resetting the codec
> > > >=20
> > > > Why standard "gpios" property cannot be used here?
> > >=20
> > > I guess they can. I have no experience defining a devicetree bind=
ing, so I just stuck to the platformdata member name.
> > > If this is the recommended way, I'll gladly change that.
> >=20
> > Another question is whether this property should refer to the contr=
oller,
> > as it is clear that it refers to the codec ....
>=20
> AFAICT the codec itself has no representation in the devicetree. It g=
ets detected by the controller which uses the reset GPIO.
>

Yeah, maybe we can already go for ac97-gpios, there. It actually takes =
a
list of gpios: ac97-sync, ac97-sdata and ac97-reset. You may want to
have a look at Documentation/devicetree/bindings/sound/soc-ac97link.txt
and snd_soc_set_ac97_ops_of_reset(), snd_soc_ac97_parse_pinctl() in
sound/soc/core.c

The goal would be to be able to keep the same bindings when switching
over to ASoC.

--=20
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
