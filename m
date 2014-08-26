From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] Documentation: dts: fsl-usb: Document USB node
 compatible string for IP version
Date: Tue, 26 Aug 2014 17:53:01 -0500
Message-ID: <1409093581.6510.94.camel@snotra.buserror.net>
References: <1408612727-6774-1-git-send-email-nikhil.badola@freescale.com>
	 <1408659774.2395.21.camel@snotra.buserror.net>
	 <af7cc70458bf471cb20938ce6498ccfe@BN1PR0301MB0593.namprd03.prod.outlook.com>
	 <3fdd7732a9954d13a90ece684771d932@BL2PR03MB161.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3fdd7732a9954d13a90ece684771d932-AZ66ij2kwaabJzs9G/iQcuO6mTEJWrR4XA4E9RH9d+qIuWR1G4zioA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mehresh Ramneek-B31383 <ramneek.mehresh-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Badola Nikhil-B46172 <nikhil.badola-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2014-08-22 at 00:05 -0500, Mehresh Ramneek-B31383 wrote:
> 
> -----Original Message-----
> From: Badola Nikhil-B46172 
> Sent: Friday, August 22, 2014 10:18 AM
> To: Wood Scott-B07421
> Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Mehresh Ramneek-B31383
> Subject: RE: [PATCH] Documentation: dts: fsl-usb: Document USB node compatible string for IP version
> 
> Adding Ramneek
> 
> > -----Original Message-----
> > From: Wood Scott-B07421
> > Sent: Friday, August 22, 2014 3:53 AM
> > To: Badola Nikhil-B46172
> > Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > Subject: Re: [PATCH] Documentation: dts: fsl-usb: Document USB node 
> > compatible string for IP version
> > 
> > On Thu, 2014-08-21 at 14:48 +0530, Nikhil Badola wrote:
> > > Document compatible string containing IP version in USB device tree 
> > > node
> > >
> > > Signed-off-by: Nikhil Badola <nikhil.badola-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > ---
> > >  Documentation/devicetree/bindings/usb/fsl-usb.txt | 13 
> > > ++++++++-----
> > >  1 file changed, 8 insertions(+), 5 deletions(-)
> > 
> > Please CC devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org on all device tree patches (in 
> > addition to linuxppc-dev).
> > 
> > >
> > > diff --git a/Documentation/devicetree/bindings/usb/fsl-usb.txt
> > > b/Documentation/devicetree/bindings/usb/fsl-usb.txt
> > > index 4779c02..5a3a0a8 100644
> > > --- a/Documentation/devicetree/bindings/usb/fsl-usb.txt
> > > +++ b/Documentation/devicetree/bindings/usb/fsl-usb.txt
> > > @@ -10,7 +10,10 @@ Required properties :
> > >     controllers, or "fsl-usb2-dr" for dual role USB controllers
> > >     or "fsl,mpc5121-usb2-dr" for dual role USB controllers of MPC5121.
> > >     Wherever applicable, the IP version of the USB controller should
> > > -   also be mentioned (for eg. fsl-usb2-dr-v2.2 for bsc9132).
> > > +   also be mentioned in another string.
> > > +   For multi port host USB controller with IP version <IP_Ver>, it should be
> > > +   "fsl-usb2-mph-<IP_Ver>". For dual role USB controller with IP version
> > > +   <IP_Ver>, it should be "fsl-usb2-dr-<IP_Ver>".
> > 
> > It was documented before -- this is just making it more explicit, right?
> > 
> > FWIW, the version number can be read out of a USB register, so I'd 
> > rather remove the suggestion to specify the version number and replace 
> > it with a reference to the ID register.
> we have following two issues -
> (a) our USBIP version register doesn't have consistent "version field size" over 
> multiple version(s). This is why we couldn't use it for reading version info across
> various IP versions
> (b) this register is not exposed in all SoC RMs (probably because of above reason)

:-(

If this is just a problem with older chips, we could have a new
compatible name that designates the family of USB block versions with a
sane version register.

> > > @@ -55,9 +58,9 @@ Example multi port host USB controller device node :
> > >  		port1;
> > >  	};
> > >
> > > -Example dual role USB controller device node :
> > > +Example dual role USB controller version 2.5 device node :
> > >  	usb@23000 {
> > > -		compatible = "fsl-usb2-dr";
> > > +		compatible = "fsl-usb2-dr-v2.5", "fsl-usb2-dr";
> > >  		reg = <23000 1000>;
> > >  		#address-cells = <1>;
> > >  		#size-cells = <0>;
> > 
> > This example doesn't correspond to any device tree I see.  Even after 
> > your next patch that sets t2080's USB to v2.5, the addresses are different.
> > 
> I reckon that the example emphasizes on showing how IP version information is
> to be stored in "compatible string". Is it necessary to make sure that we should 
> always site actual values already used?

The more realistic the examples are, the better.

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
