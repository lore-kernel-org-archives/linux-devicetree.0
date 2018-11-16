From: "dbasehore ." <dbasehore@chromium.org>
Subject: Re: [PATCH] arm64: dts: rockchip: rk3399: Add xin32k clk
Date: Fri, 16 Nov 2018 09:39:09 -0800
Message-ID: <CAGAzgsq7uF=E3dzhyCjK4gq09_UV_aZhQbyaTnz7yDY_ErQYKQ@mail.gmail.com>
References: <20181116051719.23376-1-dbasehore@chromium.org> <CAD=FV=W7sYY5n609erPpTxux+0Efad_0YpPkoVZB14Kqm=baXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD=FV=W7sYY5n609erPpTxux+0Efad_0YpPkoVZB14Kqm=baXA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, =?UTF-8?B?6LCi5L+u6ZGr?= <tony.xie@rock-chips.com>, Chris Zhong <zyw@rock-chips.com>, ayaka@soulik.info, "nickey.yang" <nickey.yang@rock-chips.com>, Shunqian Zheng <zhengsq@rock-chips.com>, klaus.goger@theobroma-systems.com, Brian Norris <briannorris@chromium.org>, enric.balletbo@collabora.com, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Mark Rutland <mark.rutland@arm.com>, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 16, 2018 at 8:01 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Nov 15, 2018 at 9:17 PM Derek Basehore <dbasehore@chromium.org> wrote:
> >
> > This adds the xin32k clock to the RK3399 CPU. Even though it's not
> > directly used, muxes will end up traversing the entire clk tree on
> > calls to determine_rate if it doesn't exist.
> >
> > Signed-off-by: Derek Basehore <dbasehore@chromium.org>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 7 +++++++
> >  1 file changed, 7 insertions(+)
>
> nit: I would have expected ${SUBJECT} to have v2 in it somewhere.
>
>
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> > index 99e7f65c1779..3d09472978f8 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>
> Aww crud.  I was at the airport yesterday and so I didn't notice that
> you were touching rk3399, not rk3399-gru.  This belongs in the gru
> device tree file, not in the top level rk3399.  As you have written
> this it will break rk3399 boards that have an rk808 on them, AKA:

Should this be moved to the rk3399.dtsi file? The RK3399 assumes that
this clk exists (same as the 24MHz clk which is in rk3399.dtsi). While
it can function without it defined, it really shouldn't. We can just
assign the existing labels in the dts files you pointed out.

>
> arch/arm64/boot/dts/rockchip/rk3399-ficus.dts:
> arch/arm64/boot/dts/rockchip/rk3399-firefly.dts:
> arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi:
> arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi:
>
> -Doug
