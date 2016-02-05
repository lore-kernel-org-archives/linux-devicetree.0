From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v4 1/1] USB: core: let USB device know device node
Date: Fri, 05 Feb 2016 10:18:33 +0100
Message-ID: <11643765.fRmuASojtz@wuerfel>
References: <1453706679-18948-1-git-send-email-peter.chen@freescale.com> <1454582690.3356.18.camel@pengutronix.de> <20160205061124.GB1858@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160205061124.GB1858@shlinux2>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 05 February 2016 14:11:25 Peter Chen wrote:
> On Thu, Feb 04, 2016 at 11:44:50AM +0100, Philipp Zabel wrote:
> > Am Montag, den 25.01.2016, 15:24 +0800 schrieb Peter Chen:
> > > diff --git a/Documentation/devicetree/bindings/usb/usb-device.txt b/Documentation/devicetree/bindings/usb/usb-device.txt
> > > new file mode 100644
> > > index 0000000..c702885
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/usb/usb-device.txt
> > > @@ -0,0 +1,25 @@
> > > +Generic USB Device Properties
> > > +
> > > +Usually, we only use device tree for hard wired USB device.
> > > +The reference binding doc is from:
> > > +http://www.firmware.org/1275/bindings/usb/usb-1_0.ps
> > > +
> > > +Required properties:
> > > +- compatible: usbVID,PID
> > 
> > The reference recommendation states that for single-configuration USB
> > devices the compatible should contain all of the applicable strings from
> > the list starting with 2) "usbVID,PID.REV" and ending with 11)
> > "usb,device". Are we going to ignore this?
> > 
> 
> I have not seen benefits if we write several compatibles in dts,
> the information of compatibles listed in doc can be got during
> the enumeration.
> 
> I suggest we use the simple pattern for this compatible, in that
> case, every one can be easy to follow it, and will not be confused
> which compatibles should be used, and the style can be unify.

It seems fine, as we don't expect any OS to ever use the compatible
strings for binding to the driver. I think you should add a sentence
to explain this, and maybe clarify that the compatible strings from
the standard binding may also be used, but that a device adhering
to this binding may leave out all except for usbVID,PID

> > 
> > > +		compatible = "usb05e3,0608";
> > > +		reg = <0x1>;
> > > +	};
> > 
> > I'd have written this node as:
> > 
> > 	hub: hub@1 {
> > 		compatible = "usb5e3,608", "usb5e3,class9",
> > 			     "usb,class9", "usb,device";
> > 		reg = <1>;
> > 	};
> 
> The reg should be hexadecimal, do we need to add "0x" before the value?

The formatting of the numbers in properties is not normative, either
one works and has the same meaning. I would leave out the leading 0x
here too, as we are just enumerating the ports.

I don't think that any USB hub has more than 9 ports, so it's not
ambiguous to the reader.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
