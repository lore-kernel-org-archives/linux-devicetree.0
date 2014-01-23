From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] clk: corenet: Update the clock bindings
Date: Thu, 23 Jan 2014 15:03:28 -0600
Message-ID: <1390511008.24905.581.camel@snotra.buserror.net>
References: <1390269732-22798-1-git-send-email-Yuantian.Tang@freescale.com>
	 <1390437863.24905.549.camel@snotra.buserror.net>
	 <d61cabaec0af4aada9fadf93e7c0bb61@BL2PR03MB115.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d61cabaec0af4aada9fadf93e7c0bb61-AZ66ij2kwaY2zE7nYf+DgeO6mTEJWrR4XA4E9RH9d+qIuWR1G4zioA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tang Yuantian-B29983 <Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org" <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kushwaha Prabhakar-B32579 <prabhakar-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2014-01-22 at 20:47 -0600, Tang Yuantian-B29983 wrote:
> > -----Original Message-----
> > From: Wood Scott-B07421
> > Sent: 2014=E5=B9=B41=E6=9C=8823=E6=97=A5 =E6=98=9F=E6=9C=9F=E5=9B=9B=
 8:44
> > To: Tang Yuantian-B29983
> > Cc: Wood Scott-B07421; galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org; linuxppc-
> > dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Kushwaha Prabhaka=
r-
> > B32579
> > Subject: Re: [PATCH] clk: corenet: Update the clock bindings
> >=20
> > On Tue, 2014-01-21 at 10:02 +0800, Tang Yuantian wrote:
> > > From: Tang Yuantian <yuantian.tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > >
> > > Main changs include:
> > > 	- Clarified the clock nodes' version number
> > > 	- Fixed a issue in example
> > >
> > > Singed-off-by: Tang Yuantian <Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > ---
> > >  Documentation/devicetree/bindings/clock/corenet-clock.txt | 4 ++=
+-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/clock/corenet-cloc=
k.txt
> > > b/Documentation/devicetree/bindings/clock/corenet-clock.txt
> > > index 24711af..d6cadef 100644
> > > --- a/Documentation/devicetree/bindings/clock/corenet-clock.txt
> > > +++ b/Documentation/devicetree/bindings/clock/corenet-clock.txt
> > > @@ -54,6 +54,8 @@ Required properties:
> > >  		It takes parent's clock-frequency as its clock.
> > >  	* "fsl,qoriq-sysclk-2.0": for input system clock (v2.0).
> > >  		It takes parent's clock-frequency as its clock.
> > > +	Note: v1.0 and v2.0 are clock version which should align to
> > > +	clockgen node's they belong to which is chassis version.
> >=20
> > Instead, how about a note like this near the top of the file:
> >=20
> > All references to "1.0" and "2.0" refer to the QorIQ chassis versio=
n to
> > which the chip complies.
> >=20
> > Chassis Version		Example Chips
> > ---------------		-------------
> > 1.0			p4080, p5020, p5040
> > 2.0			t4240, b4860, t1040
> >=20
> Better, I will update.
>=20
> >=20
> > BTW, this binding and the associated driver really should be called
> > "qoriq-clock", not "corenet-clock".  This would match the compatibl=
e
> > string, and it doesn't really have much to do with corenet (which i=
s part
> > of the QorIQ chassis v1 and v2, but not *this* part).  Do you know =
if the
> > chassis v3 clock interface will be similar enough to share a driver=
?
> >=20
> Doesn't QorIQ include some low-end socs, like p1022, p1020?=20

Yes, but those aren't "QorIQ Chassis 1.0" or "QorIQ Chassis 2.0".
They're mpc85xx-family chips.

In any case, if "qoriq" makes sense for the compatible, I don't see why
it doesn't make sense for the driver.

> This driver has nothing to do with these boards.=20
> I have no idea about chassis v3. If it has similar clock tree, this d=
river can be shared.
> Even the driver can't be used by v3, we can easily add v3 support sin=
ce it has different
> Compatible string.

The reason I mentioned it is that chassis v3 will involve ARM chips tha=
t
have their own interconnect rather than corenet.

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
