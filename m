From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: rockchip: add i2c-bus subnode to edp
Date: Fri, 21 Oct 2016 10:25:29 +0200
Message-ID: <1681294.eoXpQL8f8l@phil>
References: <1476950845-28242-1-git-send-email-tomeu.vizoso@collabora.com> <7604646.6yosK0XMNL@diego> <6083453f-08e1-643a-9638-1db38c704aa5@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6083453f-08e1-643a-9638-1db38c704aa5-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Randy Li <randy.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 20. Oktober 2016, 15:47:56 CEST schrieb Tomeu Vizoso:
> On 10/20/2016 03:45 PM, Heiko Stübner wrote:
> > Am Donnerstag, 20. Oktober 2016, 10:07:25 schrieb Tomeu Vizoso:
> >> Add an empty 'i2c-bus' subnode to the edp node just so that the I2C core
> >> doesn't attemp to parse the 'ports' subnode as containing i2c devices.
> >> 
> >> This is to avoid spurious failure messages such as:
> >> 
> >> i2c i2c-6: of_i2c: modalias failure on /dp@ff970000/ports
> > 
> > On the one hand, the edp really has an i2c bus - with its only client the
> > EDID listening at 0x50 (and maybe 0x30).
> > 
> > On the other hand, adding an empty bus to the (implementation independent)
> > devicetree just to make the Linux i2c subsystem happy sounds heavily like
> > a
> > implementation-specific hack, as the edp i2c bus doesn't leak into the
> > outside world otherwise.
> > 
> > I guess this empty i2c bus not being part of the binding document points
> > heavily into the implementation-specific corner :-) .
> > 
> > My short search on other patches touching this didn't reveal anything but
> > maybe this was already discussed somewhere and found to be ok?
> 
> Here it is:
> 
> http://www.spinics.net/lists/linux-tegra/msg27862.html

thanks ... I'm still not sure about the placeholder though, aka needing an 
undocumented subnode to make a Linux error message silent.

In the thread you pointed to I also did not see any dt-maintainer involvement 
pointing one way or another, but spinics is often not easy to navigate 
threads, so I may have missed that.


> > Another option could be to just make of_i2c_register_device silent if
> > of_modalias_node returns -ENODEV?


Heiko

> >> Signed-off-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> >> Cc: Randy Li <randy.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> >> Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >> ---
> >> 
> >>  arch/arm/boot/dts/rk3288.dtsi | 5 +++++
> >>  1 file changed, 5 insertions(+)
> >> 
> >> diff --git a/arch/arm/boot/dts/rk3288.dtsi
> >> b/arch/arm/boot/dts/rk3288.dtsi
> >> index 2f814ffeb605..94f4b7eecca2 100644
> >> --- a/arch/arm/boot/dts/rk3288.dtsi
> >> +++ b/arch/arm/boot/dts/rk3288.dtsi
> >> @@ -1075,6 +1075,11 @@
> >> 
> >>  				};
> >>  			
> >>  			};
> >>  		
> >>  		};
> >> 
> >> +
> >> +		i2c-bus {
> >> +			#address-cells = <1>;
> >> +			#size-cells = <0>;
> >> +		};
> >> 
> >>  	};
> >>  	
> >>  	hdmi: hdmi@ff980000 {


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
