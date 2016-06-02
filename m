From: "Peter Senna Tschudin" <peter.senna-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: =?utf-8?q?Re=3A?==?utf-8?q?_=5BPATCH?==?utf-8?q?_3=2F5=5D?=
 =?utf-8?q?_Documentation=2Fdevicetree=2Fbindings=3A?= Add
 =?utf-8?q?b850v3=5Flvds=5Fdp?=
Date: Fri, 03 Jun 2016 00:19:35 +0100
Message-ID: <7088-5750bf00-5-4a882000@180860528>
References: <1464871741.3307.16.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
in-reply-to: <1464871741.3307.16.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: martin.donnelly-JJi787mZWgc@public.gmane.org, martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, jslaby-AlSwsSmVLrQ@public.gmane.org, rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

 Hi Philipp,

Thank you very much for the review! I'll send V2 soon, doing my best to avoid collisions with other patches that are under review.

On Thursday, June 2, 2016 14:49 CEST, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote: 
 
> Hi Peter,
> 
> Am Montag, den 30.05.2016, 18:39 +0200 schrieb Peter Senna Tschudin:

> > Devicetree bindings documentation for the GE B850v3 LVDS/DP++
> > display bridge.
> > 
> > Signed-off-by: Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> > ---
> >  .../devicetree/bindings/ge/b850v3_lvds_dp.txt      | 38 ++++++++++++++++++++++
> >  1 file changed, 38 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/ge/b850v3_lvds_dp.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/ge/b850v3_lvds_dp.txt b/Documentation/devicetree/bindings/ge/b850v3_lvds_dp.txt
> > new file mode 100644
> > index 0000000..32e123a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/ge/b850v3_lvds_dp.txt
> > @@ -0,0 +1,38 @@
> > +Driver for GE B850v3 LVDS/DP++ display bridge
> > +
> > +Required properties:
> > +  - compatible : should be "ge,b850v3_lvds_dp".
> 
> In the cover mail you write that this is a combination of the STDP4028
> DP transmitter and STDP2690 DP/DP++ converter. So shouldn't this binding
> comprise two device tree nodes, one with compatible "st,stdp4028", one
> with "st,stdp2690", then?
> Is the stdp2690 connected to the stdp4028's i2c master?

The hardware and firmware made it complicated for this binding to comprise two device tree nodes. The hardware and firmware are designed to configure both bridges based on the LVDS signal. This part works very well, but it leave the driver powerless to control the video processing pipeline. The bridges sort of behave as a single bridge, the sort of part is the need of interacting with both bridges: EDID from the STDP2690 and HPD events from the STDP4028. So the driver is only needed for telling the host about EDID / HPD, and for giving the host powers to ack interrupts.

I would find it nicer to be author of two drivers instead of one, but as the behavior handled by the driver is specific of the B850v3, and do not reflect the standard behavior of each bridge, I find it unlikely that the driver could be useful to handle STDP4028 and STPD2690 with stock firmware, or in other designs. On the other hand, I made sure to use the chip name on the defines to maximize chances of reuse.

Peter

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
