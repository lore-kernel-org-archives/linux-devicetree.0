From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v1 2/3] usb: phy: convert gpio-vbus to gpio_desc
Date: Wed, 5 Nov 2014 13:50:15 -0600
Message-ID: <20141105195015.GU6548@saruman>
References: <1414951910-16075-1-git-send-email-robert.jarzmik@free.fr>
 <1414951910-16075-2-git-send-email-robert.jarzmik@free.fr>
 <20141105192957.GM6548@saruman>
 <87sihx1lcd.fsf@free.fr>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HC0F8i/BfMshQzR8"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87sihx1lcd.fsf-GANU6spQydw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--HC0F8i/BfMshQzR8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 05, 2014 at 08:46:58PM +0100, Robert Jarzmik wrote:
> Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> writes:
>=20
> > Hi,
> >
> > On Sun, Nov 02, 2014 at 07:11:49PM +0100, Robert Jarzmik wrote:
> >> In order to prepare device-tree conversion, port gpio_vbus to use
> >> gpio_desc.
> >>=20
> >> Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
> >
> > Can we just convert users of this to a phy-generic.c with a regulator ?
> Maybe, let's see what is missing.
>=20
> > This is basically what gpio-vbus is doing, it's basically a regulator.
> And a detector too. The basic thing is that it request an interrupt, and =
upon
> this interrupt it schedules through a workqueue a usb_gadget_vbus_connect=
() and
> the regulator stuff.
>=20
> I don't see the interrupt+ usb_gadget_vbus_connect() stuff that in the
> phy-generic. Am I missing something ?

Well, let's add that :-) Just make it optional. It's pointless to have
80% duplicated code just because of 20% missing in phy-generic :-)

Then we avoid adding gpio-vbus specific DT properties too.

--=20
balbi

--HC0F8i/BfMshQzR8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUWn93AAoJEIaOsuA1yqREDNkP/3vmEwQTW+t0Gz9hYGdGTjym
mQ6te0yObiMnXigYbnQplizOvmDCrv+r36e0fuT3DTcx/Nf4JONjhz8HRyq8O29n
hKvxRfuOOGMWl+wPJxMscWCweUdSQLaY6627VUMURLXt9Ov/rGNFSMHaRRyxQzP3
rhxjxE2OzsYQaHPGty7wGiPxN9SbysK1GLLzfwwZrCQFAWiQaBni/CGaQR1spnB7
TxMIq3OfwjQT3t3qq7UCL4zV6jLr4QF0/iqaf67lPjLya5fjaCET5jL4J/sgVMxy
aEuriSkGgNg1psw7Qb5JD8abGnoNZoVVrBmrUgT+tG59JxPCd2fD/9mZJirJna/w
9lanFPM7jCRlZdYECZHFpfTxG1471+rAcbCAhfc3+rMawtJluL/ES4vd3Ullt+Vl
/mvR+P4PyEzcybI/EgOj9G/Mq3C39lVA2+fbPa91UpO/i+hri1tvBKKCaOJ9WsD5
8mxUorO95wKmI0CmsdNZc232A95U+QLXUlKSUNtBaxeQVZsfrztW6NGQ8jI+0Tm/
Uj8rupzXhifCSv9kM/7mL213DcSrlqyYL7gpe1QRJRarMNeQmRHv/wZOw6TtkNKe
IPNbkxqf8t4pDaX61iHmZX1d65HIKt/ufs/hnfNIxtTsZmor0O+bsG3GU+jmKWFt
4rUfoz7XE7yem469Cqne
=oPX3
-----END PGP SIGNATURE-----

--HC0F8i/BfMshQzR8--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
