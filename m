From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: rockchip: remove arm, mali-midgard compatible from rk3288
Date: Tue, 11 Jul 2017 13:47:03 +0200
Message-ID: <1865386.qPV9dVK26y@phil>
References: <20170710121227.14264-1-heiko@sntech.de> <20170710121227.14264-2-heiko@sntech.de> <972bed58-76c2-04e3-f2ab-d5b8065a92dd@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <972bed58-76c2-04e3-f2ab-d5b8065a92dd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Caesar Wang <caesar.upstream-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Caesar,

Am Dienstag, 11. Juli 2017, 16:04:38 CEST schrieb Caesar Wang:
> Heiko,
> 
> 在 2017年07月10日 20:12, Heiko Stuebner 写道:
> > The binding specifies the actual implementations only (mali-t760
> > for example) but not the arm,mali-midgard used in some vendor kernels.
> > So drop that compatible property from the rk3288 where it had slipped in.
> >
> > Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> > ---
> >   arch/arm/boot/dts/rk3288.dtsi | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
> > index cb1d415d1201..e99d7ff4c939 100644
> > --- a/arch/arm/boot/dts/rk3288.dtsi
> > +++ b/arch/arm/boot/dts/rk3288.dtsi
> > @@ -1135,7 +1135,7 @@
> >   	};
> >   
> >   	gpu: mali@ffa30000 {
> > -		compatible = "rockchip,rk3288-mali", "arm,mali-t760", "arm,mali-midgard";
> > +		compatible = "rockchip,rk3288-mali", "arm,mali-t760";
> 
> If we remove the "arm,mali-midgard", the mali driver maybe need update 
> first.
>
>  From the lastest MALI driver on ARM supply, the compatible only two 
> property.
> mali_kbase_core_linux.c
> 4163:    { .compatible = "arm,malit6xx" },
> 4164:    { .compatible = "arm,mali-midgard" },
> 
> That's odd with the two compatible, the driver should support the more.

Correct, the driver should be updated anyway. In general the official
dt-binding (the one in the linux kernel) should be followed, not the random
out-of-tree one distributed by vendor drivers :-) .

If you look for example at utgard (mali400 for example), the sane binding
used in the kernel, differs a lot from the binding used by the vendor-driver
as well (io-areas, irq-names etc).

In any case, as you use the mali vendor-driver with you vendor-tree,
it should be possible to do both in sync (dt-change from mainline; driver
change to use better compatibles).


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
