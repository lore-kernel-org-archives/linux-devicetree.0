From: Sergey Matyukevich <geomatsi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] arm64: dts: orange-pi-zero-plus2: fix sdcard detect
Date: Sat, 4 Nov 2017 18:42:21 +0300
Message-ID: <20171104154221.ao7kkcwqhnja3cxe@speedy.hunter>
References: <20171103195855.15283-1-geomatsi@gmail.com>
 <20171103195855.15283-2-geomatsi@gmail.com>
 <CAMty3ZCs8kq1vUGLOi0ZghY7n0iXgUQ1E=ngBO6Y4wm7wMLF7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMty3ZCs8kq1vUGLOi0ZghY7n0iXgUQ1E=ngBO6Y4wm7wMLF7Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> > The sdcard detect pin on orange-pi-zero-plus2 is pulled up.
> > Fix cd-gpio description to enable sdcard detect.
> >
> > Signed-off-by: Sergey Matyukevich <geomatsi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> > index b6b7a561df8c..a42fd79a62a3 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> > @@ -71,7 +71,7 @@
> >         pinctrl-0 = <&mmc0_pins_a>, <&mmc0_cd_pin>;
> >         vmmc-supply = <&reg_vcc3v3>;
> >         bus-width = <4>;
> > -       cd-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>;
> > +       cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;
> 
> Was able to detect and do mount with existing dts

Did you try to boot from sdcard ? I am not able to boot my board from
sd-card without this change. As I mentioned earlier in my email
to buildroot mailing list, with mmc debug enabled I see that mmc
tries to init sd-card when I remove it from the slot.

Maybe there is a minor differences between h/w versions or batches ?
What is you board version ? I tested on board v1.0.

Regards,
Sergey
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
