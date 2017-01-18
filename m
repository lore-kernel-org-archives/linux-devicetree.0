From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH V7 1/4] Documentation/devicetree/bindings: b850v3_lvds_dp
Date: Wed, 18 Jan 2017 23:10:58 +0200
Message-ID: <2088084.GDlN6tZSQv@avalon>
References: <74f0-58704480-5-27259840@173563636> <6276161.johxDync2u@avalon> <20170116083711.GA18775@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170116083711.GA18775-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Peter Senna Tschudin <peter.senna-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Peter Senna Tschudin <peter.senna-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, martin.donnelly-JJi787mZWgc@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, enric.balletb
List-Id: devicetree@vger.kernel.org

Hi Peter,

On Monday 16 Jan 2017 09:37:11 Peter Senna Tschudin wrote:
> On Tue, Jan 10, 2017 at 11:04:58PM +0200, Laurent Pinchart wrote:
> > On Saturday 07 Jan 2017 01:29:52 Peter Senna Tschudin wrote:
> >> On 04 January, 2017 21:39 CET, Rob Herring wrote:
> >>> On Tue, Jan 3, 2017 at 5:34 PM, Peter Senna Tschudin wrote:
> >>>> On 03 January, 2017 23:51 CET, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> >>>>> On Sun, Jan 01, 2017 at 09:24:29PM +0100, Peter Senna Tschudin wrote:
> >>>>>> Devicetree bindings documentation for the GE B850v3 LVDS/DP++
> >>>>>> display bridge.
> >>>>>> 
> >>>>>> Cc: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
> >>>>>> Cc: Martin Donnelly <martin.donnelly-JJi787mZWgc@public.gmane.org>
> >>>>>> Cc: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
> >>>>>> Cc: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> >>>>>> Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> >>>>>> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >>>>>> Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> >>>>>> Signed-off-by: Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> >>>>>> ---
> >>>>>> There was an Acked-by from Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> for V6,
> >>>>>> but I changed the bindings to use i2c_new_secondary_device() so I
> >>>>>> removed it from the commit message.
> >>>>>> 
> >>>>>>  .../devicetree/bindings/ge/b850v3-lvds-dp.txt      | 39 +++++++++++
> >>>>> 
> >>>>> Generally, bindings are not organized by vendor. Put in
> >>>>> bindings/display/bridge/... instead.
> >>>> 
> >>>> Will change that.
> >>>> 
> >>>>>>  1 file changed, 39 insertions(+)
> >>>>>>  create mode 100644
> >>>>>>  Documentation/devicetree/bindings/ge/b850v3-lvds-dp.txt
> >>>>>> 
> >>>>>> diff --git
> >>>>>> a/Documentation/devicetree/bindings/ge/b850v3-lvds-dp.txt
> >>>>>> b/Documentation/devicetree/bindings/ge/b850v3-lvds-dp.txt new file
> >>>>>> mode 100644
> >>>>>> index 0000000..1bc6ebf
> >>>>>> --- /dev/null
> >>>>>> +++ b/Documentation/devicetree/bindings/ge/b850v3-lvds-dp.txt
> >>>>>> @@ -0,0 +1,39 @@
> >>>>>> +Driver for GE B850v3 LVDS/DP++ display bridge
> >>>>>> +
> >>>>>> +Required properties:
> >>>>>> +  - compatible : should be "ge,b850v3-lvds-dp".
> >>>>> 
> >>>>> Isn't '-lvds-dp' redundant? The part# should be enough.
> >>>> 
> >>>> b850v3 is the name of the product, this is why the proposed name.
> >>>> What about, b850v3-dp2 dp2 indicating the second DP output?
> >>> 
> >>> Humm, b850v3 is the board name? This node should be the name of the
> >>> bridge chip.
> >> 
> >> From the cover letter:
> >> 
> >> -- // --
> >> There are two physical bridges on the video signal pipeline: a
> >> STDP4028(LVDS to DP) and a STDP2690(DP to DP++).  The hardware and
> >> firmware made it complicated for this binding to comprise two device
> >> tree nodes, as the design goal is to configure both bridges based on
> >> the LVDS signal, which leave the driver powerless to control the video
> >> processing pipeline. The two bridges behaves as a single bridge, and
> >> the driver is only needed for telling the host about EDID / HPD, and
> >> for giving the host powers to ack interrupts. The video signal pipeline
> >> is as follows:
> >>   Host -> LVDS|--(STDP4028)--|DP -> DP|--(STDP2690)--|DP++ -> Video
> >>   output
> >> -- // --
> > 
> > You forgot to prefix your patch series with [HACK] ;-)
> > 
> > How about fixing the issues that make the two DT nodes solution difficult
> > ? What are they ?
> 
> The Firmware and the hardware design. Both bridges, with stock firmware,
> are fully capable of providig EDID information and handling interrupts.
> But on this specific design, with this specific firmware, I need to read
> EDID from one bridge, and handle interrupts on the other.

Which firmware are you talking about ? Firmware running on the bridges, or 
somewhere else ?

> Back when I was starting the development I could not come up with a proper
> way to split EDID and interrupts between two bridges in a way that would
> result in a fully functional connector. Did I miss something?

You didn't, we did :-) I've been telling for quite some time now that we must 
decouple bridges from connectors, and this is another example of why we have 
such a need. Bridges should expose additional functions needed to implement 
connector operations, and the connector should be instantiated by the display 
driver with the help of bridge operations. You could then create a connector 
that relies on one bridge to read the EDID and on the other bridge to handle 
HPD.

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
