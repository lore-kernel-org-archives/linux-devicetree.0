From: Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH RESEND 2/5] pinctrl: berlin: add a pinctrl driver for
 Marvell Berlin SoCs
Date: Fri, 11 Apr 2014 11:21:57 +0200
Message-ID: <20140411092157.GD20147@kwain>
References: <1397135274-10764-1-git-send-email-antoine.tenart@free-electrons.com>
 <1397135274-10764-3-git-send-email-antoine.tenart@free-electrons.com>
 <20140411144431.04fb148d@xhacker> <20140411081839.GB20147@kwain>
 <20140411162716.74e739e1@xhacker>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20140411162716.74e739e1@xhacker>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jisheng Zhang <jszhang@marvell.com>
Cc: Jimmy Xu <zmxu@marvell.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "alexandre.belloni@free-electrons.com" <alexandre.belloni@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Jisheng,

On Fri, Apr 11, 2014 at 04:27:16PM +0800, Jisheng Zhang wrote:
> Hi Antoine,
> =

> On Fri, 11 Apr 2014 01:18:39 -0700
> Antoine T=E9nart <antoine.tenart@free-electrons.com> wrote:
> =

> > Hi Jisheng,
> > =

> > On Fri, Apr 11, 2014 at 02:44:31PM +0800, Jisheng Zhang wrote:
> > > On Thu, 10 Apr 2014 06:07:51 -0700
> > > Antoine T=E9nart <antoine.tenart@free-electrons.com> wrote:
> > > =

> > > ...
> > > > +static int berlin_pinmux_enable(struct pinctrl_dev *pctrl_dev,
> > > > +                               unsigned function,
> > > > +                               unsigned group)
> > > > +{
> > > > +       struct berlin_pinctrl *pctrl =3D
> > > > pinctrl_dev_get_drvdata(pctrl_dev);
> > > > +       struct berlin_pinctrl_group *group_desc =3D pctrl->groups +=
 group;
> > > > +       struct berlin_pinctrl_function *function_desc =3D
> > > > +               pctrl->functions + function;
> > > > +       unsigned long flags;
> > > > +       u32 regval;
> > > > +
> > > > +       spin_lock_irqsave(&pctrl->lock, flags);
> > > > +
> > > > +       regval =3D readl(group_desc->reg);
> > > > +       regval &=3D group_desc->mask;
> > > > +       regval |=3D function_desc->muxval << group_desc->lsb;
> > > > +       writel(regval, group_desc->reg);
> > > =

> > > Could we use relaxed version instead?
> > =

> > We could, but this is not a performance issue here at all, so I guess w=
e can
> > keep writel().
> =

> Yes it's not a performance issue here but an issue for the system which i=
s doing
> PL310 L2 cache maintenance. If pinmux operation hold the l2x0_lock due to=
 writel()
> the important video/audio process which is cleaning PL310 cache must wait=
, thus
> cause jitter. So I'd like relaxed version if we can. Then I don't need to=
 add this
> patch to mainline kernel when we upgrade internal tree.

I'm not sure I got that. As I understand it, you will need to play video/au=
dio
*while* configuring the pinmux. But the pinmuxing configuration is done at =
boot
time, and I don't think a video/audio is being played then. So I'm not cert=
ain a
jitter will appear. What do you think ?

Antoine

-- =

Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
