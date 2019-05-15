From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] ARM: dts: rockchip: Add #cooling-cells entry for rk3288 GPU
Date: Wed, 15 May 2019 11:43:28 -0700
Message-ID: <CAD=FV=WQ-yAeB_xU5UVHGWgsC=a9t_CtN9bHvZnoxkfuA9=zGw@mail.gmail.com>
References: <20190424162827.5297-1-mka@chromium.org> <CAD=FV=W+QGLmhEaqGc-=wNFzmaCr_f4rb5e8KQ4ZmeRaNi_xCw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD=FV=W+QGLmhEaqGc-=wNFzmaCr_f4rb5e8KQ4ZmeRaNi_xCw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, May 15, 2019 at 10:59 AM Doug Anderson <dianders@chromium.org> wrote:

> Hi,
>
> On Wed, Apr 24, 2019 at 9:28 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> > The Mali GPU of the rk3288 can be used as cooling device, add
> > a #cooling-cells entry for it.
> >
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> >  arch/arm/boot/dts/rk3288.dtsi | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
> > index ca7d52daa8fb..767e62908a6e 100644
> > --- a/arch/arm/boot/dts/rk3288.dtsi
> > +++ b/arch/arm/boot/dts/rk3288.dtsi
> > @@ -1275,6 +1275,7 @@
> >                 interrupt-names = "job", "mmu", "gpu";
> >                 clocks = <&cru ACLK_GPU>;
> >                 operating-points-v2 = <&gpu_opp_table>;
> > +               #cooling-cells = <2>; /* min followed by max */
> >                 power-domains = <&power RK3288_PD_GPU>;
> >                 status = "disabled";
> >         };
>
> Seems like a good idea to me.  Presumably we should also add this to
> the bindings?
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

I guess we could now also do a follow-up CL that starts using the GPU
as a cooling device.  Presumably it's still OK to specify this and it
will just be ignored if there's no GPU driver?  It's a little funny
because the upstream device tree uses the CPU to cool things down if
the GPU temperature sensor trips.  Downstream uses the GPU to cool
down the GPU.  ...though, of course, it's not really all that simple
since everything is packed in so tightly.

The other case that sticks as a sore thumb is the upstream
"rk3288-veyron-mickey" where all the comments still talk about the GPU
cooling but we have only the CPU cooling actually in the device tree.
:-)

-Doug
