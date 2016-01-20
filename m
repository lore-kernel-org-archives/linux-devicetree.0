From: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/1] USB: core: let USB device know device node
Date: Wed, 20 Jan 2016 11:48:39 +0800
Message-ID: <20160120034839.GA16222@shlinux2>
References: <4405270.vcz87Q878u@wuerfel>
 <Pine.LNX.4.44L0.1601191009190.1727-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1601191009190.1727-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 19, 2016 at 10:12:56AM -0500, Alan Stern wrote:
> On Tue, 19 Jan 2016, Arnd Bergmann wrote:
> 
> > On Tuesday 19 January 2016 11:08:59 Peter Chen wrote:
> > > 
> > > I am afraid I have no USB 3.0 PC running Linux.
> > > 
> > > > > - Which the value of hub->descriptor->bNbrPorts for root hub?
> > > > 
> > > > In the example above, the legacy root hub would have bNbrPorts set to 6 
> > > > and the SS root hub would have bNbrPorts set to 3.
> > > > 
> > > 
> > > Ok, so the maximum physical port number is 6 as well as bNbrports value.
> > > The "reg" value at dts should be from 1 to 6. "reg" stands for physical
> > > port number for individual physical port, eg if "reg" equals to 1, it
> > > stands for the device connects at port 1, no matter the device is HS or
> > > SS, it can use the node whose "reg" is 1.
> > 
> > As I understand it, you could have two devices that are both
> > connected to port '1', when one is using HS and the other is using
> > SS. This means that we can't use the same 'reg' value for both, and
> > we have to define a particular way to disambiguate them.
> > 
> > As Alan says, there is an established ordering that just sorts the
> > ports form 1 to 9 in the example, and that would be the most
> > straightforward to use here.
> 
> There is even a documented callback (find_raw_port_number) in the
> hc_driver structure for converting between the numbering schemes.  I
> don't know if all the existing USB-3 host controller drivers implement
> that callback, but they should.
> 
> > Alternatively, you could use one of the high bits of the 'reg' value
> > to indicate which root hub is used. I'm sure that would work as
> > well, but be less obvious.
> 
> It's probably best to stick with the same numbering that the hardware 
> uses.

Seems we are talking about root hub, not the device in the
root hub. So for multiple ports controller, we have to own node for 
root hub. Assume your example, there is a genesys HUB at physical
port 1, I suggest a dts node description like below, please correct
me if anything wrong.

&usb1 {
	roothub_1: nxp@1 {
		compatible = "usb15a2,007d";
		reg = <0x01>;

		hub: genesys@1 {
			compatible = "usb05e3,0608";
			reg = <0x01>;
		};
	};

	roothub_2: nxp@2 {
		compatible = "usb15a2,007d";
		reg = <0x02>;
	};

	...

	roothub_7: nxp@7 {
		compatible = "usb15a2,007d";
		reg = <0x07>;

		hub: genesys@1 {
			compatible = "usb05e3,0608";
			reg = <0x01>;
		};
	};

	...

	roothub_9: nxp@9 {
		compatible = "usb15a2,007d";
		reg = <0x09>;
	};
};

-- 

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
