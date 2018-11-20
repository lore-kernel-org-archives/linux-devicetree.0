From: "dbasehore ." <dbasehore@chromium.org>
Subject: Re: [PATCH] arm64: dts: rockchip: rk3399: Add xin32k clk
Date: Mon, 19 Nov 2018 18:05:52 -0800
Message-ID: <CAGAzgsrWCo97un9WT2DvkHV5ga7rpg05sxd5PsbEN8_w2Dh3rQ@mail.gmail.com>
References: <20181116051719.23376-1-dbasehore@chromium.org>
 <CAGAzgsq7uF=E3dzhyCjK4gq09_UV_aZhQbyaTnz7yDY_ErQYKQ@mail.gmail.com>
 <CAD=FV=XVDAjLt+VtxedHEma1FRrG0LuFZ2c7L5-MsdCZkgEcsw@mail.gmail.com> <11718017.ngvMPIPJQJ@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <11718017.ngvMPIPJQJ@diego>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Doug Anderson <dianders@chromium.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, =?UTF-8?B?6LCi5L+u6ZGr?= <tony.xie@rock-chips.com>, Chris Zhong <zyw@rock-chips.com>, ayaka@soulik.info, "nickey.yang" <nickey.yang@rock-chips.com>, Shunqian Zheng <zhengsq@rock-chips.com>, klaus.goger@theobroma-systems.com, Brian Norris <briannorris@chromium.org>, enric.balletbo@collabora.com, Mark Rutland <mark.rutland@arm.com>, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 19, 2018 at 1:41 AM Heiko St=C3=BCbner <heiko@sntech.de> wrote:
>
> Am Freitag, 16. November 2018, 19:23:59 CET schrieb Doug Anderson:
> > Hi,
> >
> > On Fri, Nov 16, 2018 at 9:39 AM dbasehore . <dbasehore@chromium.org> wr=
ote:
> > > On Fri, Nov 16, 2018 at 8:01 AM Doug Anderson <dianders@chromium.org>
> wrote:
> > > > Hi,
> > > >
> > > > On Thu, Nov 15, 2018 at 9:17 PM Derek Basehore <dbasehore@chromium.=
org>
> wrote:
> > > > > This adds the xin32k clock to the RK3399 CPU. Even though it's no=
t
> > > > > directly used, muxes will end up traversing the entire clk tree o=
n
> > > > > calls to determine_rate if it doesn't exist.
> > > > >
> > > > > Signed-off-by: Derek Basehore <dbasehore@chromium.org>
> > > > > ---
> > > > >
> > > > >  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 7 +++++++
> > > > >  1 file changed, 7 insertions(+)
> > > >
> > > > nit: I would have expected ${SUBJECT} to have v2 in it somewhere.
> > > >
> > > > > diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> > > > > b/arch/arm64/boot/dts/rockchip/rk3399.dtsi index
> > > > > 99e7f65c1779..3d09472978f8 100644
> > > > > --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> > > > > +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> > > >
> > > > Aww crud.  I was at the airport yesterday and so I didn't notice th=
at
> > > > you were touching rk3399, not rk3399-gru.  This belongs in the gru
> > > > device tree file, not in the top level rk3399.  As you have written
> > >
> > > > this it will break rk3399 boards that have an rk808 on them, AKA:
> > > Should this be moved to the rk3399.dtsi file? The RK3399 assumes that
> > > this clk exists (same as the 24MHz clk which is in rk3399.dtsi). Whil=
e
> > > it can function without it defined, it really shouldn't. We can just
> > > assign the existing labels in the dts files you pointed out.
> >
> > No, it should be in the board files.  Each board may produce the 32k
> > clock through a different component.  On gru-based devices we produce
> > the 32k clock through a silego part.
>
> That would also be a great part of the commit message, like
> "...on Gru boards the 32kHz clock gets produced by a Silego oscillator"
> or so when you move it over to rk3399-gru.dtsi .
>
>
> > Technically you could say that we don't _truly_ need to model this
> > clock and we could have just inserted a dummy/fixed 32k clock in the
> > clk-rk3399.c file.  ...but we did model it so that means we should
> > probably model it semi-properly.
> >
> > If a given board forgets to provide a 32k clock then that's a bug for
> > them like it was for us.
>
> Yep and as I said in my other mail, on these pmic generated clocks
> the clock generation often even is configurable (rate, on/off), so it
> should really be a real clock not some hack ;-) .
>

Ok, I'll make that change in about a week after I get back from
vacation in about a week.

>
> Heiko
>
>
