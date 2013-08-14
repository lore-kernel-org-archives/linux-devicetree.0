From: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 2/5] ARM: dts: add reference voltage property for MXS
 LRADC
Date: Wed, 14 Aug 2013 15:44:27 +0100
Message-ID: <1376491467.18617.41.camel@hornet>
References: <1374501843-19651-1-git-send-email-hector.palacios@digi.com>
	 <1374501843-19651-3-git-send-email-hector.palacios@digi.com>
	 <520AA3CD.1040008@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <520AA3CD.1040008-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Hector Palacios <hector.palacios-i7dp0qKlBMg@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org" <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, "fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "marex-ynQEQJNshbs@public.gmane.org" <marex-ynQEQJNshbs@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2013-08-13 at 22:23 +0100, Jonathan Cameron wrote:
> On 07/22/13 15:04, Hector Palacios wrote:
> > Some LRADC channels have fixed pre-dividers so they can measure
> > different voltages at full scale. The reference voltage allows to
> > expose a scaling attribute through the IIO sysfs so that a user can
> > compute the real voltage out of a measured sample value.
> > 
> > diff --git a/Documentation/devicetree/bindings/staging/iio/adc/mxs-lradc.txt b/Documentation/devicetree/bindings/staging/iio/adc/mxs-lradc.txt
> > index 4688205..6ec485c 100644
> > --- a/Documentation/devicetree/bindings/staging/iio/adc/mxs-lradc.txt
> > +++ b/Documentation/devicetree/bindings/staging/iio/adc/mxs-lradc.txt
> > @@ -1,9 +1,12 @@
> >  * Freescale i.MX28 LRADC device driver
> >  
> >  Required properties:
> > -- compatible: Should be "fsl,imx28-lradc"
> > +- compatible: "fsl,imx28-lradc", "fsl,imx23-lradc"
> >  - reg: Address and length of the register set for the device
> >  - interrupts: Should contain the LRADC interrupts
> > +- fsl,vref: Reference voltage (in mV) for each LRADC channel. This is the
> > +	    maximum voltage that can be measured at full scale in each channel
> > +	    considering fixed pre-dividers.

So, let me try to rephrase what I read above.

There's an ADC with X channels. And there's a reference voltage source
(one?). Now, each of the ADC channels have a (different?) voltage
divider, taking the voltage from the reference source and feeding it to
the ADC comparator. How much am I wrong?

If I'm not wrong at all, I'd say that the reference source could be
described as a standard fixed regulator
(Documentation/devicetree/bindings/regulator/fixed-regulator.txt) and
the ADC node should have some king of "reference-supply" phandle to the
regulator node. Now, if the dividers factors are *really* fixed, the
driver could know about them and calculate the effective reference
voltage on its own, couldn't it?

Let me repeat the "DT standard disclaimer": the tree, in general, should
describe the way components are *wired up*, not much more.

Pawel
