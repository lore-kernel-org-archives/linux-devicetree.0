From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v3 4/4] arm64: dts: rockchip: add regulator info for Kevin digitizer
Date: Thu, 23 Mar 2017 00:57:26 +0100
Message-ID: <2959157.AbEJJVO0Z2@phil>
References: <20170320235344.126298-1-briannorris@chromium.org> <20415662.PctC9IM4SC@phil> <20170322181441.GC98450@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170322181441.GC98450-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Barber <smbarber-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 22. März 2017, 11:14:42 CET schrieb Brian Norris:
> On Wed, Mar 22, 2017 at 09:26:41AM +0100, Heiko Stuebner wrote:
> > Am Montag, 20. März 2017, 16:53:44 CET schrieb Brian Norris:
> > > We need to enable this regulator before the digitizer can be used. Wacom
> > > recommended waiting for 100 ms before talking to the HID.
> > > 
> > > Signed-off-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > > ---
> > > v3:
> > >  * reintroduced into patch set; bindings are in linux-next
> > > ---
> > >  arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
> > > b/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts index
> > > 2f720cf2fd07..f4714c4606f3 100644
> > > --- a/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
> > > +++ b/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
> > > @@ -232,6 +232,9 @@ ap_i2c_dig: &i2c2 {
> > 
> > according to the hid-over-i2c binding, this should use a special compatible 
> > like
> > 
> > 	compatible = "wacom,w9013", "hid-over-i2c"
> > 
> > As the binding patch is from Caesar, I assume that is the Kevin component and
> > I can add that myself, just need confirmation that this is actually the correct 
> > component :-) .
> 
> *Sigh.* The I2C (and SPI) framework is still broken w.r.t. multiple
> compatible strings and drivers built as modules [1]. So I'd really
> rather not do this...

It seems I had repressed that knowledge :-), but now that you mention it,
I remember seeing (or reading about) this issue before.
So yes I agree as well :-)


> ...but yes, that's a fair component description.

I've applied the patch and simply added the wacom,w9013 as comment,
so it doesn't get lost.

Now this can simmer a bit in linux-next till the weekend.


Heiko

> [1] Some discussion about SPI:
>     https://patchwork.kernel.org/patch/7630571/
>     And the discussion about I2C (25% through that thread):
>     https://patchwork.kernel.org/patch/9455245/
> 
> 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
