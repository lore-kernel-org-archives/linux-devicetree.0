From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH 2/2] ARM: dts: rockchip: Configure the GPU thermal zone
 for mickey
Date: Mon, 20 May 2019 14:21:02 -0700
Message-ID: <20190520212102.GH40515@google.com>
References: <20190520170132.91571-1-mka@chromium.org>
 <20190520170132.91571-2-mka@chromium.org>
 <CAD=FV=Vr2thgHYTH_khqka27_SdGcSEShpSRp+u2E=O5eyxLMQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=Vr2thgHYTH_khqka27_SdGcSEShpSRp+u2E=O5eyxLMQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 20, 2019 at 01:21:33PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Mon, May 20, 2019 at 10:01 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > mickey crams a lot of hardware into a tiny package, which requires
> > more aggressive thermal throttling than for devices with a larger
> > footprint. Configure the GPU thermal zone to throttle the GPU
> > progressively at temperatures >= 60°C. Heat dissipated by the
> > CPUs also affects the GPU temperature, hence we cap the CPU
> > frequency to 1.4 GHz for temperatures above 65°C. Further throttling
> > of the CPUs may be performed by the CPU thermal zone.
> >
> > The configuration matches that of the downstram Chrome OS 3.14
> 
> s/downstram/downstream

ack

> 
> > +       cooling-maps {
> > +               /* After 1st level throttle the GPU down to as low as 400 MHz */
> > +               gpu_warmish_limit_gpu {
> > +                       trip = <&gpu_alert_warmish>;
> > +                       cooling-device = <&gpu THERMAL_NO_LIMIT 1>;
> 
> As per my comment in patch #1, you are probably ending up throttling
> to 500 MHz, not 400 MHz.  Below will all have similar problems unless
> we actually delete the 500 MHz operating point.

Thanks for pointing that out. As per disussion on patch #1 we'll
disable the 500 MHz OPP to stay in sync with downstream and avoid
problems in case someone decides to re-purpose NPLL.

> > +               };
> > +
> > +               /*
> > +                * Slightly after we throttle the GPU, we'll also make sure that
> > +                * the CPU can't go faster than 1.4 GHz.  Note that we won't
> > +                * throttle the CPU lower than 1.4 GHz due to GPU heat--we'll
> > +                * let the CPU do the rest itself.
> > +                */
> > +               gpu_warm_limit_cpu {
> > +                       trip = <&gpu_alert_warm>;
> > +                       cooling-device = <&cpu0 4 4>;
> 
> Shouldn't you list cpu1, cpu2, and cpu3 too?  That'd match what
> upstream did elsewhere in this file?

ack, should have noticed, I 'yelled' at others before for not doing this ...
