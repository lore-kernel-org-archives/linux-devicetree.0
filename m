From: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH RESEND 2/5] pinctrl: berlin: add a pinctrl driver for
 Marvell Berlin SoCs
Date: Fri, 11 Apr 2014 16:27:16 +0800
Message-ID: <20140411162716.74e739e1@xhacker>
References: <1397135274-10764-1-git-send-email-antoine.tenart@free-electrons.com>
	<1397135274-10764-3-git-send-email-antoine.tenart@free-electrons.com>
	<20140411144431.04fb148d@xhacker>
	<20140411081839.GB20147@kwain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140411081839.GB20147@kwain>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Antoine =?UTF-8?B?VMOpbmFydA==?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: "sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jimmy Xu <zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Antoine,

On Fri, 11 Apr 2014 01:18:39 -0700
Antoine T=C3=A9nart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> Hi Jisheng,
>=20
> On Fri, Apr 11, 2014 at 02:44:31PM +0800, Jisheng Zhang wrote:
> > On Thu, 10 Apr 2014 06:07:51 -0700
> > Antoine T=C3=A9nart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> >=20
> > ...
> > > +static int berlin_pinmux_enable(struct pinctrl_dev *pctrl_dev,
> > > +                               unsigned function,
> > > +                               unsigned group)
> > > +{
> > > +       struct berlin_pinctrl *pctrl =3D
> > > pinctrl_dev_get_drvdata(pctrl_dev);
> > > +       struct berlin_pinctrl_group *group_desc =3D pctrl->groups=
 + group;
> > > +       struct berlin_pinctrl_function *function_desc =3D
> > > +               pctrl->functions + function;
> > > +       unsigned long flags;
> > > +       u32 regval;
> > > +
> > > +       spin_lock_irqsave(&pctrl->lock, flags);
> > > +
> > > +       regval =3D readl(group_desc->reg);
> > > +       regval &=3D group_desc->mask;
> > > +       regval |=3D function_desc->muxval << group_desc->lsb;
> > > +       writel(regval, group_desc->reg);
> >=20
> > Could we use relaxed version instead?
>=20
> We could, but this is not a performance issue here at all, so I guess=
 we can
> keep writel().

Yes it's not a performance issue here but an issue for the system which=
 is doing
PL310 L2 cache maintenance. If pinmux operation hold the l2x0_lock due =
to writel()
the important video/audio process which is cleaning PL310 cache must wa=
it, thus
cause jitter. So I'd like relaxed version if we can. Then I don't need =
to add this
patch to mainline kernel when we upgrade internal tree.

Thanks,
Jisheng


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
