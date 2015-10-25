From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v4 3/3] ARM: dts: rockchip: Add the OTP gpio pinctrl
Date: Sun, 25 Oct 2015 08:55:03 +0100
Message-ID: <2741625.HAsG2fX6yg@diego>
References: <1445599528-18825-1-git-send-email-wxt@rock-chips.com> <1445599528-18825-4-git-send-email-wxt@rock-chips.com> <CAD=FV=WBCD8WsXV2mAGUD6y=BFScbFc9U3XA7jAB-rqOLp4qGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=WBCD8WsXV2mAGUD6y=BFScbFc9U3XA7jAB-rqOLp4qGA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Freitag, 23. Oktober 2015, 08:25:08 schrieb Doug Anderson:
> On Fri, Oct 23, 2015 at 4:25 AM, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> > Add the "init" anf "sleep" pinctrl as the OTP gpio state.
> > We need the OTP pin is gpio state before resetting the TSADC controller,
> > since the tshut polarity will generate a high signal.
> > 
> > "init" pinctrl property is defined by Doug's Patch[0].
> > 
> > Patch[0]:
> > https://patchwork.kernel.org/patch/7454311/
> > 
> > Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> > Reviewed-by: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > ---
> > 
> > Changes in v4: None
> > 
> > Changes in v3:
> >   - Add the "sleep" pinctrl as the gpio state in PATCH[3/3]
> > 
> > Changes in v2:
> >   - Add some commits for more obvious in PATCH[2/2]
> > 
> > Changes in v1:
> >   - As the Doug comments, drop the thermal driver patchs since
> >   
> >     we can with pinctrl changing to work.
> >   
> >   - As the Doug's patch to add the 'init' property.
> >  
> >  arch/arm/boot/dts/rk3288.dtsi | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> I realized that the subject of this patch should probably contain the
> word rk3288, but I presume Heiko would rather add that himself than
> for you to spin this again.  ;)

yep :-) ... no need to respin for such an easy change.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
