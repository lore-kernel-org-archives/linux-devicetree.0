From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/3] Documentation: dt: dwc3: Add snps,configure-fladj
 property
Date: Thu, 23 Jul 2015 09:34:56 -0500
Message-ID: <20150723143456.GA21984@saruman.tx.rr.com>
References: <1437646161-1764-1-git-send-email-nikhil.badola@freescale.com>
 <20150723095635.GA12330@leverpostej>
 <SN1PR0301MB1629C9F2083C8C4F5CE8CE4EF3820@SN1PR0301MB1629.namprd03.prod.outlook.com>
 <20150723105729.GB12330@leverpostej>
 <SN1PR0301MB162957FD79F00321A42243F3F3820@SN1PR0301MB1629.namprd03.prod.outlook.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <SN1PR0301MB162957FD79F00321A42243F3F3820-VLIetriUNoaGKSHTzYJB25wN6zqB+hSMnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Badola Nikhil <nikhil.badola-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2015 at 11:07:09AM +0000, Badola Nikhil wrote:
> > -----Original Message-----
> > From: Mark Rutland [mailto:mark.rutland-5wv7dgnIgG8@public.gmane.org]
> > Sent: Thursday, July 23, 2015 4:27 PM
> > To: Badola Nikhil-B46172
> > Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; balbi@ti.=
com
> > Subject: Re: [PATCH 1/3] Documentation: dt: dwc3: Add snps,configure-fl=
adj
> > property
> >=20
> > On Thu, Jul 23, 2015 at 11:52:19AM +0100, Badola Nikhil wrote:
> > > > -----Original Message-----
> > > > From: Mark Rutland [mailto:mark.rutland-5wv7dgnIgG8@public.gmane.org]
> > > > Sent: Thursday, July 23, 2015 3:27 PM
> > > > To: Badola Nikhil-B46172
> > > > Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> > > > balbi-l0cyMroinI0@public.gmane.org
> > > > Subject: Re: [PATCH 1/3] Documentation: dt: dwc3: Add
> > > > snps,configure-fladj property
> > > >
> > > > On Thu, Jul 23, 2015 at 11:09:21AM +0100, Nikhil Badola wrote:
> > > > > Add property snps,configure-fladj for enabling post silicon frame
> > > > > length adjustment
> > > > >
> > > > > Signed-off-by: Nikhil Badola <nikhil.badola-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > > > ---
> > > > >  Documentation/devicetree/bindings/usb/dwc3.txt | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt
> > > > > b/Documentation/devicetree/bindings/usb/dwc3.txt
> > > > > index 0815eac..90c3972 100644
> > > > > --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> > > > > +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> > > > > @@ -40,6 +40,7 @@ Optional properties:
> > > > >   - snps,hird-threshold: HIRD threshold
> > > > >   - snps,hsphy_interface: High-Speed PHY interface selection
> > > > > between
> > > > "utmi" for
> > > > >     UTMI+ and "ulpi" for ULPI when the DWC_USB3_HSPHY_INTERFACE
> > > > > has
> > > > value 3.
> > > > > + - snps,configure-fladj: enables post-silicon frame length
> > > > > + adjustment
> > > >
> > > > Could you elaborate on what this means and why you think it's
> > necessary?
> > >
> > > This property enables the use of GFLADJ_30MHZ field value of gfladj
> > > register for frame length adjustment instead of considering from the
> > sideband input signal fladj_30mhz_reg from SOC.
> > > This is required when signal fladj_30mhz_reg is connected to a wrong
> > > value or is not valid as in our case, hence post-silicon.
> >=20
> > Ok, so this is basically an override for the GFLADJ_30MHZ field of the =
gfladj
> > register when there was a problem at integration time.
> >
>=20
> That's right.=20
> =20
> > > However this field can be used to adjust any offset ranging from 00h
> > > to 3Fh, from the clock source generating SOF(start of frame) packets.
> > > Thus, this property can be added to device tree with appropriate
> > adjustment value.
> >=20
> > It takes a value? The description above makes it sound like a boolean
> > property.
> >=20
> > I'd expect a description more like:
> >=20
> > - snps,fladj-override: Value for GFLADJ_30MHZ when the fladj_30mhz_reg
> >   signal is invalid or incorrect.
> >=20
> > Which makes it clear what the value is and when it should be set.
>=20
> Agreed. Will change and send a new version of the patch-set.

BTW, I'm not going to accept this without a glue layer making use of it.
Also, this patch needs to go to linux-usb as well, please resend.

--=20
balbi

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVsPuQAAoJEIaOsuA1yqRE14wP/RXDFJ0FshI8eOpMzaIlc4r5
M+RLTyMHVM2d8Oova5R9TQSr4FNVTEFIeDHN3zthQn4wTrIREzlGc4+upLwww5Fa
PwFySd9u3SG+OmWC/ENI8c4mWi6Au9N4Ea5jqBYnpmPvP1VJyPZczgKRtRhGhmZv
pV+MKpPNFou3rDstNpLQ0gp9mRJUZKwjk7IyyoyQdLnja8gyN4qTisS5LyJHllWm
fw0rrHuC2DNdNSPz2JUO9fVqZF2Y9t7WvH5GAQ8ZKLCg6gOSkzsShmM2LkROVM0W
O6M3yfL1N8Eeh2QVhgmisxavXn4pzLboJR925t2PXVSY6qbYIimVHk8UK+YkmaR+
IQtCe2U8ExrC7PeOq8hsqLP98q36IaoMLaVZ+JyUD41UtfKtOKjT1ODrJQjEhAoG
txazP3c73teqJq3fcxuyPNm84EK1dqHNc8ivNbopusJTFb0f281SKmuoKl8teB0f
G5/cfYpDeBHxM5h2m5SDr2Pj8QdhP0ditkVxU9bTuJAuA3abT5nRKxu3GvyMui5Y
JH9u/CJO0Gxg4i2F67LpvtgPmvtH1Vdg8F72mVGcTHw9Y1afDiCuNbw1qIINC4Gm
8cmo3ZiPSaLOQoL/fB0GrG66YjP5rYEF7DgiPW3Co7YZHctFrGHWpEBkIdg67S4A
Z9PxoTSLOAsMod9kzyEs
=kCVR
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
