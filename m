From: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH 2/2] ARM: bcm2835: dt: Add the ethernet to the device tree
Date: Thu, 4 Feb 2016 06:28:38 +0000
Message-ID: <HE1PR04MB14503FBA55F4F9C19EE669B68BD10@HE1PR04MB1450.eurprd04.prod.outlook.com>
References: <1454511759-24827-1-git-send-email-lkundrak@v3.sk>
	<1454511759-24827-3-git-send-email-lkundrak@v3.sk>
 <m37fil8iq4.fsf@euphor.blino.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <m37fil8iq4.fsf-sb2orAewljU5LtT840wCHw@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olivier Blin <dev-RZzICDNEOQ/YtjvyW6yDsg@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
Cc: "linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

 
> Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org> writes:
> 
> > diff --git a/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
> > b/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
> > index ef54050..32bbd2a 100644
> > --- a/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
> > +++ b/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
> 
> Hi,
> 
> Shouldn't this be common to all RPi1 B and RPi2 models, instead of being
> specific to just RPi B+?
> 
> > +&usb {
> > +	usb1@01 {
> > +		compatible = "usb1d6b,0002";
> > +		reg = <01>;
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		ethernet: usbether@01 {
> > +			compatible = "usb0424,9514";
> > +			reg = <01>;
> > +		};
> > +	};
> > +};
> 
> For reference, on RPi2:

Using "lsusb -t" you may get bus topology.

> Bus 001 Device 003: ID 0424:ec00 Standard Microsystems Corp. SMSC9512/9514 Fast Ethernet Adapter

It is the ethernet device, you may need to change vid/pid in dts. 

> Bus 001 Device 002: ID 0424:9514 Standard Microsystems Corp. SMC9514 Hub

It is the hub device, you may need to change vid/pid in dts.

> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> 
 
It is root hub, it doesn't need to be described at dts.

Best regards,
Peter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
