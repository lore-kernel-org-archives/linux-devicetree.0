From: Jonathan Cameron <jic23-tko9wxEg+fIOOJlXag/Snyp2UmYkHbXO@public.gmane.org>
Subject: Re: [PATCH v4 2/4] Documentation: dt: iio: at91-sama5d2_adc: add hw
 trigger edge binding
Date: Sun, 11 Jun 2017 12:25:20 +0100
Message-ID: <20170611122520.2a72c37b@jic23.retrosnub.co.uk>
References: <1496992039-17964-1-git-send-email-eugen.hristev@microchip.com>
        <1496992039-17964-3-git-send-email-eugen.hristev@microchip.com>
        <20170611122413.20008d30@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170611122413.20008d30-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugen Hristev <eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Cc: nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, 11 Jun 2017 12:24:13 +0100
Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> On Fri, 9 Jun 2017 10:07:17 +0300
> Eugen Hristev <eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org> wrote:
> 
> > Add property for the edge type of the hardware trigger pin ADTRG
> > 
> > Signed-off-by: Eugen Hristev <eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>  
> Hi Eugen,
> 
> CC the device tree maintainers and list for devicetree binding changes.
> 
> I've added them.   This one is unusual enough it will need and Ack from
> that direction (and I prefer to get them even for the trivial patches
> when Rob and Mark aren't too busy!)
Sorry, I missed that you had cc'd the list - just noticed it in the
next patch and thought that was odd!

Anyhow, good work - we'll just wait for them to have a chance to look
at it :)
> 
> Jonathan
> > ---
> >   Changes in v4:
> >  - Modified bindings to be similar with interrupts
> > 
> >  Documentation/devicetree/bindings/iio/adc/at91-sama5d2_adc.txt | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/iio/adc/at91-sama5d2_adc.txt b/Documentation/devicetree/bindings/iio/adc/at91-sama5d2_adc.txt
> > index 3223684..552e7a8 100644
> > --- a/Documentation/devicetree/bindings/iio/adc/at91-sama5d2_adc.txt
> > +++ b/Documentation/devicetree/bindings/iio/adc/at91-sama5d2_adc.txt
> > @@ -11,6 +11,11 @@ Required properties:
> >    - atmel,min-sample-rate-hz: Minimum sampling rate, it depends on SoC.
> >    - atmel,max-sample-rate-hz: Maximum sampling rate, it depends on SoC.
> >    - atmel,startup-time-ms: Startup time expressed in ms, it depends on SoC.
> > +  - atmel,trigger-edge-type: One of possible edge types for the ADTRG hardware
> > +  trigger pin. When the specific edge type is detected, the conversion will
> > +  start. Possible values are rising, falling, or both.
> > +  This property uses the IRQ edge types values: IRQ_TYPE_EDGE_RISING ,
> > +  IRQ_TYPE_EDGE_FALLING or IRQ_TYPE_EDGE_BOTH
> >  
> >  Example:
> >  
> > @@ -25,4 +30,5 @@ adc: adc@fc030000 {
> >  	atmel,startup-time-ms = <4>;
> >  	vddana-supply = <&vdd_3v3_lp_reg>;
> >  	vref-supply = <&vdd_3v3_lp_reg>;
> > +	atmel,trigger-edge-type = <IRQ_TYPE_EDGE_BOTH>;
> >  }  
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
