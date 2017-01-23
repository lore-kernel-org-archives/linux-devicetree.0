From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v4 2/9] ARM: dts: rockchip: update compatible property for rk3228 timer
Date: Mon, 23 Jan 2017 17:12:28 +0100
Message-ID: <4475824.nuxyXyzqsG@diego>
References: <1480343486-25539-1-git-send-email-al.kochet@gmail.com> <1480436092-10728-3-git-send-email-al.kochet@gmail.com> <20170123154046.GF2166@mai>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170123154046.GF2166@mai>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Huang Tao <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Montag, 23. Januar 2017, 16:40:46 CET schrieb Daniel Lezcano:
> On Tue, Nov 29, 2016 at 07:14:45PM +0300, Alexander Kochetkov wrote:
> > Property set to '"rockchip,rk3228-timer", "rockchip,rk3288-timer"'
> > to match devicetree bindings.
> > 
> > Signed-off-by: Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> > 
> >  arch/arm/boot/dts/rk3228-evb.dts |    4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/rk3228-evb.dts
> > b/arch/arm/boot/dts/rk3228-evb.dts index 904668e..38eab87 100644
> > --- a/arch/arm/boot/dts/rk3228-evb.dts
> > +++ b/arch/arm/boot/dts/rk3228-evb.dts
> > @@ -70,3 +70,7 @@
> > 
> >  &uart2 {
> >  
> >  	status = "okay";
> >  
> >  };
> > 
> > +
> > +&timer {
> > +	compatible = "rockchip,rk3228-timer", "rockchip,rk3288-timer";
> > +};
> 
> I'm not sure this is correct, to which timer &timer will refer ?
> 
>         timer {
>                 compatible = "arm,armv7-timer";
> 		...
> 	}
> 
>         timer: timer@110c0000 {
>                 compatible = "rockchip,rk3288-timer";
> 		...
> 	}
> 
> Why not change the compatible string in the timer definition in rk322x.dtsi
> ?
> 
> Same comment for the other patches doing these changes.

I think Alexander didn't know which timer name to use.
Both the rk3228 and rk3229 are so similar that so far no-one has seen any 
difference and thus they really share the whole rk322x.dtsi file.

On the other hand compatibles are supposed to be explicit, so a rk322x-timer 
compatible is not allowed.


But as the socs are soooo similar, I'd suggest just using the rk3228-timer 
compatible in the rk322x.dtsi and not changing individual board files.
Similar to what Daniel suggested.

Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
