From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v4 1/1] USB: core: let USB device know device node
Date: Fri, 05 Feb 2016 10:37:00 +0100
Message-ID: <1454665020.6406.21.camel@pengutronix.de>
References: <1453706679-18948-1-git-send-email-peter.chen@freescale.com>
	 <1454582690.3356.18.camel@pengutronix.de> <20160205061124.GB1858@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160205061124.GB1858@shlinux2>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Freitag, den 05.02.2016, 14:11 +0800 schrieb Peter Chen:
[...]
> > The reference recommendation states that for single-configuration USB
> > devices the compatible should contain all of the applicable strings from
> > the list starting with 2) "usbVID,PID.REV" and ending with 11)
> > "usb,device". Are we going to ignore this?
>
> I have not seen benefits if we write several compatibles in dts,
> the information of compatibles listed in doc can be got during
> the enumeration.
> 
> I suggest we use the simple pattern for this compatible, in that
> case, every one can be easy to follow it, and will not be confused
> which compatibles should be used, and the style can be unify.

Just pointing it out, a comment why this differs from the recommendation
would be nice to avoid confusion.

[...]
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

The unit-address name part should be hexadecimal, the reg property value
doesn't have to be. As long as the value is < 10 I don't see a problem.

> > As another example, I'd like to introduce the USB WLAN Adapter soldered
> > onto the imx6q-gk802 board to its power enable GPIO via the device tree:
> > 
> > /* Internal USB port (USBH1) */
> > &usbh1 {
> > 	#address-cells = <1>;
> > 	#size-cells = <0>;
> > 	status = "okay";
> > 
> > 	/* RTL8192CU 802.11n WLAN Adapter */
> > 	device@1 {
> > 		compatible = "usbbda,8176.200", "usbbda,8176",
> > 			     "usb,device";
> > 		reg = <1>;
> > 
> > 		enable-gpios = <&gpio2 0 GPIO_ACTIVE_LOW>;
> > 	};
> > };
> > 
> 
> It is okay to use your example, but I still insist like below:

Sorry for being imprecise. The hub example is fine for the
documentation. I just wanted to illustrate how and why I am interested
in this discussion.

best regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
