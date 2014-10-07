From: "duson" <dusonlin-9cfG7bMpBgR9nmWX13WWKA@public.gmane.org>
Subject: RE: [PATCH v2] Input: add i2c/smbus driver for elan touchpad
Date: Tue, 7 Oct 2014 09:15:26 +0800
Message-ID: <4D9D80FFD7AF42848710DF158445E41B@elan.corp>
References: <1389064083-11018-1-git-send-email-dusonlin@emc.com.tw> <20141003210357.GB4987@dtor-ws> <20141003210651.GC4987@dtor-ws> <20141006092452.GA24686@leverpostej> <20141006163703.GB27115@dtor-glaptop>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141006163703.GB27115@dtor-glaptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Dmitry Torokhov' <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 'Mark Rutland' <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, agnescheng-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, phoenix-9cfG7bMpBgR9nmWX13WWKA@public.gmane.org, jeff.chuang-9cfG7bMpBgR9nmWX13WWKA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Dmitry,

> -----Original Message-----
> From: Dmitry Torokhov [mailto:dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org]
> Sent: Tuesday, October 07, 2014 12:37 AM
> To: Mark Rutland
> Cc: Duson Lin; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-input-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org; agnescheng-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org; phoenix-9cfG7bMpBgR9nmWX13WWKA@public.gmane.org;
> jeff.chuang-9cfG7bMpBgR9nmWX13WWKA@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [PATCH v2] Input: add i2c/smbus driver for elan touchpad
> 
> On Mon, Oct 06, 2014 at 10:24:52AM +0100, Mark Rutland wrote:
> > On Fri, Oct 03, 2014 at 10:06:51PM +0100, Dmitry Torokhov wrote:
> > > [adding devicetree folks...]
> > >
> > > On Fri, Oct 03, 2014 at 02:03:57PM -0700, Dmitry Torokhov wrote:
> > > > diff --git a/Documentation/devicetree/bindings/input/elan_i2c.txt
> b/Documentation/devicetree/bindings/input/elan_i2c.txt
> > > > new file mode 100644
> > > > index 0000000..0a6ee7d
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/input/elan_i2c.txt
> > > > @@ -0,0 +1,34 @@
> > > > +Elantech I2C Touchpad
> > > > +
> > > > +Required properties:
> > > > +- compatible: must be "elan,i2c_touchpad".
> >
> > s/_/-/ in DT strings and property names plase.
> >
> > The name seems very generic, and you mention the driver supports a
> > variety of touchpads. Please choose a specific device name for the
> > compatible string. Other devices can have that as a fallback entry in
> > addition to a more specific string.
> 
> Duson, what would be a good model/device name here?
> 
Hmm....maybe we can rename this device name like our touch screen team
elan_i2c --> elantp_i2c
How do you feel about this.

> >
> > > > +- reg: I2C address of the chip.
> > > > +- interrupt-parent: a phandle for the gpio controller (see
interrupt
> > > > +  binding[0]).
> > > > +- interrupts: (gpio) interrupt to which the chip is connected (see
interrupt
> > > > +  binding[0]).
> >
> > If this is an interrupt from the PoV of this device, it doesn't matter
> > if the other end is connected to a hardwired interrupt controller or a
> > gpio. So drop the mention of GPIOs frmom the interrupt properties.
> >
> > > > +
> > > > +Optional properties:
> > > > +- wakeup-source: touchpad should be configured as a wakeup source.
> >
> > s/should be configured as/can be used as/
> >
> > > > +- pinctrl-names: should be "default" (see pinctrl binding [1]).
> > > > +- pinctrl-0: a phandle pointing to the pin settings for the device
(see
> > > > +  pinctrl binding [1]).
> > > > +- vcc-supply: a phandle for the regulator supplying 3.3V power.
> > > > +
> > > > +[0]:
Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> > > > +[1]: Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> > > > +
> > > > +Example:
> > > > +     &i2c1 {
> > > > +             /* ... */
> > > > +
> > > > +             touchpad@15 {
> > > > +                     compatible = "elan,i2c_touchpad";
> > > > +                     reg = <0x15>;
> > > > +                     interrupt-parent = <&gpio4>;
> > > > +                     interrupts = <0x0 IRQ_TYPE_EDGE_FALLING>;
> > > > +                     wakeup-source;
> > > > +             };
> > > > +
> > > > +             /* ... */
> > > > +     };
> >
> > Otherwise this looks ok.
> 
> Thanks Mark.
> 
> --
> Dmitry

Thanks,
Duson

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
