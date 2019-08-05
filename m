From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/3] rtc: sun6i: Add support for H6 RTC
Date: Mon, 5 Aug 2019 13:10:37 +0200
Message-ID: <20190805111037.76vmanzcurffpbdf@core.my.home>
References: <20190412120730.473-1-megous@megous.com>
 <20190412120730.473-3-megous@megous.com>
 <CAGb2v675j-aCLMgPJOzr9yx1XxsUvHRr_K7VnL=p8mSdwpu2jw@mail.gmail.com>
 <20190805104529.z3mex3m2tss7lzlr@core.my.home>
 <CAGb2v67pcxdxjdRX_HN4133A32eA566DDtUJUKV7pqzxDtOaeg@mail.gmail.com>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDXLF6FR5INBBL45UDVAKGQEQZDVZWA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAGb2v67pcxdxjdRX_HN4133A32eA566DDtUJUKV7pqzxDtOaeg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 05, 2019 at 06:54:17PM +0800, Chen-Yu Tsai wrote:
> On Mon, Aug 5, 2019 at 6:45 PM Ond=C5=99ej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org> wro=
te:
> >
> > On Mon, Aug 05, 2019 at 06:16:14PM +0800, Chen-Yu Tsai wrote:
> > > On Fri, Apr 12, 2019 at 8:07 PM megous via linux-sunxi
> > > <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org> wrote:
> > > >
> > > > From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> > > >
> > > > RTC on H6 is mostly the same as on H5 and H3. It has slight differe=
nces
> > > > mostly in features that are not yet supported by this driver.
> > > >
> > > > Some differences are already stated in the comments in existing cod=
e.
> > > > One other difference is that H6 has extra bit in LOSC_CTRL_REG, cal=
led
> > > > EXT_LOSC_EN to enable/disable external low speed crystal oscillator=
.
> > > >
> > > > It also has bit EXT_LOSC_STA in LOSC_AUTO_SWT_STA_REG, to check whe=
ther
> > > > external low speed oscillator is working correctly.
> > > >
> > > > This patch adds support for enabling LOSC when necessary:
> > > >
> > > > - during reparenting
> > > > - when probing the clock
> > > >
> > > > H6 also has capacbility to automatically reparent RTC clock from
> > > > external crystal oscillator, to internal RC oscillator, if external
> > > > oscillator fails. This is enabled by default. Disable it during
> > > > probe.
> > > >
> > > > Signed-off-by: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> > > > ---
> > > >  drivers/rtc/rtc-sun6i.c | 40 +++++++++++++++++++++++++++++++++++++=
+--
> > > >  1 file changed, 38 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> > > > index 11f56de52179..7375a530c565 100644
> > > > --- a/drivers/rtc/rtc-sun6i.c
> > > > +++ b/drivers/rtc/rtc-sun6i.c
> > > > @@ -41,9 +41,11 @@
> > > >  /* Control register */
> > > >  #define SUN6I_LOSC_CTRL                                0x0000
> > > >  #define SUN6I_LOSC_CTRL_KEY                    (0x16aa << 16)
> > > > +#define SUN6I_LOSC_CTRL_AUTO_SWT_BYPASS                BIT(15)
> > >
> > > Manual says bit 14? Or is this different from LOSC_AUTO_SWT_EN?
> > >
> > > The rest looks ok.
> >
> > To give you more information. This is a new thing in H6 BSP, compared
> > to BSPs for previous SoCs (H5/H3).
> >
> >  20 #define REG_CLK32K_AUTO_SWT_EN                  BIT(14)
> >  21 #define REG_CLK32K_AUTO_SWT_BYPASS              BIT(15)
> >
> > Init sequence changed in H6 BSP to:
> >
> > 646         /*
> > 647          * Step1: select RTC clock source
> > 648          */
> > 649         tmp_data =3D readl(chip->base + SUNXI_LOSC_CTRL);
> > 650         tmp_data &=3D (~REG_CLK32K_AUTO_SWT_EN);
> > 651
> > 652         /* Disable auto switch function */
> > 653         tmp_data |=3D REG_CLK32K_AUTO_SWT_BYPASS;
> > 654         writel(tmp_data, chip->base + SUNXI_LOSC_CTRL);
> > 655
> > 656         tmp_data =3D readl(chip->base + SUNXI_LOSC_CTRL);
> > 657         tmp_data |=3D (RTC_SOURCE_EXTERNAL | REG_LOSCCTRL_MAGIC);
> > 658         writel(tmp_data, chip->base + SUNXI_LOSC_CTRL);
> > 659
> > 660         /* We need to set GSM after change clock source */
> > 661         udelay(10);
> > 662         tmp_data =3D readl(chip->base + SUNXI_LOSC_CTRL);
> > 663         tmp_data |=3D (EXT_LOSC_GSM | REG_LOSCCTRL_MAGIC);
> > 664         writel(tmp_data, chip->base + SUNXI_LOSC_CTRL);
> > 665
>=20
> I don't have this in my H6 BSPs. One is H6 Lichee v1.1 downloaded from Pi=
ne64.
> The link was from linux-sunxi wiki's H6 page.
>=20
> The other is a 4.9 kernel tree, which I believe is from Allwinner's githu=
b:
>=20
>     https://github.com/Allwinner-Homlet/H6-BSP4.9-linux

Interesting. :) I have the BSP I was using saved here:

https://megous.com/git/linux/tree/drivers/rtc/rtc-sunxi.c?h=3Dh6-4.9-bsp#n6=
49

It's based of 4.9.119

https://megous.com/git/linux/log/?h=3Dh6-4.9-bsp

I don't remember where I found it. But I imported it fairly recently, and
the code you pointed to looks like an older version that I can found in som=
e
beta H6 BSP, that I imported way earlier and is based on 4.9.56:

https://megous.com/git/linux/tree/drivers/rtc/rtc-sunxi.c?h=3Dlinux-h6
https://megous.com/git/linux/log/?h=3Dlinux-h6

Hmm, archeology. :)

> > For older BSPs, the init sequence looked like this:
> >
> > 482         /*
> > 483          * Step1: select RTC clock source
> > 484          */
> > 485         tmp_data =3D sunxi_rtc_read(SUNXI_LOSC_CTRL_REG);
> > 486         tmp_data &=3D (~REG_CLK32K_AUTO_SWT_EN);
> > 487         tmp_data |=3D (RTC_SOURCE_EXTERNAL | REG_LOSCCTRL_MAGIC);
> > 488         tmp_data |=3D (EXT_LOSC_GSM);
> > 489         sunxi_rtc_write(tmp_data, SUNXI_LOSC_CTRL_REG);
> > 490
> >
> > EXT_LOSC_GSM has values 4 values from low to high, and I guess it confi=
gures
> > gain for the oscillator's amplifier in the feedback loop of the circuit=
.
> >
> > So the new code, for some reason changed from single write to sequence
> > of individual writes/config steps:
> >
> > 1) disable auto-switch and enable auto-switch bypass
> > 2) select RTC clock source (to LOSC)
> >   (wait)
>=20
> Maybe it's possible to glitch if these two are combined?

That's what I thought too. Or the programmer thought so, and was just
programming defensively, and there's no real problem in the practice.

But that specific delay() seems like someone trying to solve a real issue. =
Of
course there's no knowing if it was on H6 or on some other SoC.

regards,
	o.

>=20
> > 3) configure gain on the LOSC
> >
> > regards,
> >         o.
> >
> > > ChenYu
> >
> > --
> > You received this message because you are subscribed to the Google Grou=
ps "linux-sunxi" group.
> > To unsubscribe from this group and stop receiving emails from it, send =
an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> > To view this discussion on the web, visit https://groups.google.com/d/m=
sgid/linux-sunxi/20190805104529.z3mex3m2tss7lzlr%40core.my.home.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
To view this discussion on the web, visit https://groups.google.com/d/msgid=
/linux-sunxi/20190805111037.76vmanzcurffpbdf%40core.my.home.
