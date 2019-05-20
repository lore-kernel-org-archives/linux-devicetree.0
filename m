From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH 1/2] ARM: dts: rockchip: Limit GPU frequency on veyron
 mickey to 300 MHz when the CPU gets very hot
Date: Mon, 20 May 2019 14:12:15 -0700
Message-ID: <20190520211215.GG40515@google.com>
References: <20190520170132.91571-1-mka@chromium.org>
 <CAD=FV=VGA_i=vM4_OrqXnv0WC__Fcdced3oOZjzcPO=i8Q+SdA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=VGA_i=vM4_OrqXnv0WC__Fcdced3oOZjzcPO=i8Q+SdA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 20, 2019 at 01:16:46PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Mon, May 20, 2019 at 10:01 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > On rk3288 the CPU and GPU temperatures are correlated. Limit the GPU
> > frequency on veyron mickey to 300 MHz for CPU temperatures >= 85°C.
> >
> > This matches the configuration of the downstream Chrome OS 3.14 kernel,
> > the 'official' kernel for mickey.
> >
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> > Note: this patch depends on "ARM: dts: rockchip: Add #cooling-cells
> > entry for rk3288 GPU" (https://lore.kernel.org/patchwork/patch/1075005/)
> > ---
> >  arch/arm/boot/dts/rk3288-veyron-mickey.dts | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/rk3288-veyron-mickey.dts b/arch/arm/boot/dts/rk3288-veyron-mickey.dts
> > index d889ab3c8235..f118d92a49d0 100644
> > --- a/arch/arm/boot/dts/rk3288-veyron-mickey.dts
> > +++ b/arch/arm/boot/dts/rk3288-veyron-mickey.dts
> > @@ -125,6 +125,12 @@
> >                                          <&cpu2 8 THERMAL_NO_LIMIT>,
> >                                          <&cpu3 8 THERMAL_NO_LIMIT>;
> >                 };
> > +
> > +               /* At very hot, don't let GPU go over 300 MHz */
> > +               cpu_very_hot_limit_gpu {
> > +                       trip = <&cpu_alert_very_hot>;
> > +                       cooling-device = <&gpu 2 2>;
> > +               };
> 
> Two things:
> 
> A) If I'm reading things properly, you're actually limiting things to
> 400 MHz.  This is because you don't have <https://crrev.com/c/1574579>
> which deletes the 500 MHz GPU operating point.  So on upstream the
> available points are:
> 
> 0: 600 MHz
> 1: 500 MHz
> 2: 400 MHz
> 3: 300 MHz
> 4: 200 MHz
> 5: 100 MHz
> 
> ...and downstream:
> 
> 0: 600 MHz
> 1: 400 MHz
> 2: 300 MHz
> 3: 200 MHz
> 4: 100 MHz

Thanks spotting this!

> Thinking about it more, I bet Heiko would actually be OK deleting the
> 500 MHz GPU operating point for veyron.  Technically it's not needed
> upstream because upstream doesn't have our hacks to allow re-purposing
> NPLL for HDMI (so they _can_ make 500 MHz) but maybe we can make the
> argument that these laptops have only ever been tested with the 500
> MHz operating point removed and also that eventually someonje will
> probably figure out a way to re-purpose NPLL for HDMI even upstream...

Looks like Heiko is indeed ok with it, so let's remove the OPP and be
in sync with downstream on this.

> B) It seems like in the same patch you'd want to introduce
> "cpu_warm_limit_gpu", AKA:
> 
> cpu_warm_limit_gpu {
>   trip = <&cpu_alert_warm>;
>   cooling-device =
>   <&gpu 1 1>;
> };

Makes sense to do it in the same patch, will add it in v2.
