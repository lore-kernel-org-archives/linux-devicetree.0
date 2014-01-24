From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] clk: corenet: Update the clock bindings
Date: Thu, 23 Jan 2014 20:47:44 -0600
Message-ID: <1390531664.24905.640.camel@snotra.buserror.net>
References: <1390269732-22798-1-git-send-email-Yuantian.Tang@freescale.com>
	 <1390437863.24905.549.camel@snotra.buserror.net>
	 <d61cabaec0af4aada9fadf93e7c0bb61@BL2PR03MB115.namprd03.prod.outlook.com>
	 <1390511008.24905.581.camel@snotra.buserror.net>
	 <a0800d606e364b5980fe5c17efca9d9e@BL2PR03MB115.namprd03.prod.outlook.com>
	 <1390530934.24905.639.camel@snotra.buserror.net>
	 <ac1c6cb1a6e54f6e87b76e2a3006b64a@BL2PR03MB115.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ac1c6cb1a6e54f6e87b76e2a3006b64a-AZ66ij2kwaY2zE7nYf+DgeO6mTEJWrR4XA4E9RH9d+qIuWR1G4zioA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tang Yuantian-B29983 <Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org" <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kushwaha Prabhakar-B32579 <prabhakar-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2014-01-23 at 20:46 -0600, Tang Yuantian-B29983 wrote:
> > -----Original Message-----
> > From: Wood Scott-B07421
> > Sent: 2014=E5=B9=B41=E6=9C=8824=E6=97=A5 =E6=98=9F=E6=9C=9F=E4=BA=94=
 10:36
> > To: Tang Yuantian-B29983
> > Cc: galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org; linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org;
> > devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Kushwaha Prabhakar-B32579
> > Subject: Re: [PATCH] clk: corenet: Update the clock bindings
> >=20
> > On Thu, 2014-01-23 at 20:33 -0600, Tang Yuantian-B29983 wrote:
> > > > > > Instead, how about a note like this near the top of the fil=
e:
> > > > > >
> > > > > > All references to "1.0" and "2.0" refer to the QorIQ chassi=
s
> > > > > > version to which the chip complies.
> > > > > >
> > > > > > Chassis Version		Example Chips
> > > > > > ---------------		-------------
> > > > > > 1.0			p4080, p5020, p5040
> > > > > > 2.0			t4240, b4860, t1040
> > > > > >
> > > > > Better, I will update.
> > > > >
> > > > > >
> > > > > > BTW, this binding and the associated driver really should b=
e
> > > > > > called "qoriq-clock", not "corenet-clock".  This would matc=
h the
> > > > > > compatible string, and it doesn't really have much to do wi=
th
> > > > > > corenet (which is part of the QorIQ chassis v1 and v2, but =
not
> > > > > > *this* part).  Do you know if the chassis v3 clock interfac=
e
> > > > > > will be similar enough to
> > > > share a driver?
> > > > > >
> > > > > Doesn't QorIQ include some low-end socs, like p1022, p1020?
> > > >
> > > > Yes, but those aren't "QorIQ Chassis 1.0" or "QorIQ Chassis 2.0=
".
> > > > They're mpc85xx-family chips.
> > > >
> > > > In any case, if "qoriq" makes sense for the compatible, I don't=
 see
> > > > why it doesn't make sense for the driver.
> > > >
> > > So, "Corenet" is appropriate for driver.
> > > If something should change, that must be compatible string.
> >=20
> > No.  Corenet is a bus interconnect, not a chip family (despite abus=
e of
> > the name in other contexts in Linux/U-Boot).  And the binding with =
qoriq
> > has already been accepted.
> >=20
> QorIQ is not the best name either since it include the low-end socs.
> What the name should be?=20

Again, those low-end chips do not implement "QorIQ Chassis 1.0" or
"QorIQ Chassis 2.0".  That they have "QorIQ" in their name is
irrelevant.

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
