From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 1/4] clk: rockchip: protect critical clocks from getting disabled
Date: Fri, 8 Aug 2014 14:58:11 -0700
Message-ID: <CAD=FV=XA31T9i6nLaDhVS+BkJ=U-PiMye_ouC1QY8EMoKqMCiQ@mail.gmail.com>
References: <1406661128-7614-1-git-send-email-heiko@sntech.de>
	<4047366.k35vzjcKGH@diego>
	<20140801003025.4463.76384@quantum>
	<2434370.xFIeZvuJnT@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2434370.xFIeZvuJnT@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Eddie Cai <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Heiko,

On Fri, Aug 1, 2014 at 1:15 AM, Heiko St=C3=BCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wr=
ote:
> Am Donnerstag, 31. Juli 2014, 17:30:25 schrieb Mike Turquette:
>> Quoting Heiko St=C3=BCbner (2014-07-31 16:29:34)
>>
>> > Hi Mike,
>> >
>> > Am Donnerstag, 31. Juli 2014, 15:45:23 schrieb Mike Turquette:
>> > > Quoting Heiko Stuebner (2014-07-29 12:12:05)
>> > >
>> > > > The clock-tree contains clocks that should never get disabled
>> > > > automatically. One example are the base ACLKs, the base suppli=
es for
>> > > > all
>> > > > peripherals.
>> > > >
>> > > > Therefore add a structure similar to the sunxi clock-tree to p=
rotect
>> > > > these
>> > > > special clocks from being disabled.
>> > > >
>> > > > Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
>> > > > ---
>> > > >
>> > > >  drivers/clk/rockchip/clk-rk3188.c |  7 +++++++
>> > > >  drivers/clk/rockchip/clk-rk3288.c |  7 +++++++
>> > > >  drivers/clk/rockchip/clk.c        | 13 +++++++++++++
>> > > >  drivers/clk/rockchip/clk.h        |  1 +
>> > > >  4 files changed, 28 insertions(+)
>> > > >
>> > > > diff --git a/drivers/clk/rockchip/clk-rk3188.c
>> > > > b/drivers/clk/rockchip/clk-rk3188.c index a83a6d8..5aef277 100=
644
>> > > > --- a/drivers/clk/rockchip/clk-rk3188.c
>> > > > +++ b/drivers/clk/rockchip/clk-rk3188.c
>> > > > @@ -599,6 +599,11 @@ static struct rockchip_clk_branch
>> > > > rk3188_clk_branches[] __initdata =3D {>
>> > > >
>> > > >         GATE(ACLK_GPS, "aclk_gps", "aclk_peri", 0,
>> > > >         RK2928_CLKGATE_CON(8),
>> > > >         13, GFLAGS),>
>> > > >
>> > > >  };
>> > > >
>> > > > +static const char *rk3188_critical_clocks[] __initconst =3D {
>> > > > +       "aclk_cpu",
>> > > > +       "aclk_peri",
>> > >
>> > > I'm not against the idea of critical clocks, but I want to verif=
y that
>> > > there is no other driver out there that is a better fit for clai=
ming
>> > > these clks via clk_get and enabling them the normal way via clk_=
enable?
>> >
>> > In the clock hierarchy of Rockchip SoCs, both aclks listed here, a=
re
>> > sources for pclk and hclk, as well as sourcing some other peripher=
al
>> > gates further below too. So from what I've seen from the clock dia=
grams,
>> > there is nothing that would claim these clocks directly, and it wo=
uldn't
>> > also make any sense to let them get disabled as there will always =
be
>> > something using them (for example the dram-controller).
>>
>> Sounds good. Just out of curiosity, under what circumstances would y=
ou
>> want to gate them? Is there a use case for it?
>
> hmm, I don't see a use-case for gating these at runtime right now, si=
mply
> because there should be a user for them all the time. (both aclks com=
bined
> have at least 68 consumers on the rk3288 and a similar number on the =
previous
> socs)
>
> The only thing I could think of would be something suspend related - =
which we
> don't have yet. But then this would probably happen in the clock cont=
roller
> itself anyway in some late suspend-related action, so it could take i=
nto
> account them being defined as critical clocks.

I know Rockchip has some funky stuff planned for memory scaling too.
Perhaps Kever can comment whether these two clocks might need to be
disabled in that case?

In any case, this patch fixes a hang at boot when using the PWM driver
that just landed, so:

Tested-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
