From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] hwmon: (ads1015) Add devicetree documentation
Date: Thu, 3 Mar 2011 14:25:49 +0100
Message-ID: <20110303132549.GG3649@pengutronix.de>
References: <1299143805-13133-1-git-send-email-eibach@gdsys.de>
	<20110303115151.GF3649@pengutronix.de>
	<20110303132025.51e0d92e@endymion.delvare>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0467658715751417705=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110303132025.51e0d92e-R0o5gVi9kd7kN2dkZ6Wm7A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>
Cc: Dirk Eibach <eibach-dJ+jgKLZIg4@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============0467658715751417705==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Z0mFw3+mXTC5ycVe"
Content-Disposition: inline


--Z0mFw3+mXTC5ycVe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > Hmm, device tree bindings should be OS-neutral, sysfs is not.
>=20
> Why do we document this in the Linux kernel tree then?

To describe which bindings Linux supports.

> > with the active channels. Then again, what is the drawback of exporting
> > all channels?
>=20
> Performance and user-friendliness. libsensors-based applications will
> read all available attributes by default, and each reading takes time.
> Letting the platform declare how the inputs are used allows for a sane
> output for "sensors" and other similar tools out of the box, without
> the user having to tinker with ignore statements in configuration files
> to discard the nonsensical values.

OK, that's fine I'd say.

> > Is there another hwmon-driver doing so (couldn't find one)?
>=20
> If "doing so" means "letting the user define how the ADC inputs are
> used", then yes, the pcf8591 driver does something similar, except that
> it uses a module parameter for the setting, for historical reasons.
> Platform-provided, per-device data is better in my opinion.

OK. The thing is you can't map platform_data 1:1 to bindings, because
most are very specific to the Linux-driver. Do you think something like
"active-channels" would be sufficent for those other hwmon devices, too?
(I still do not like "exported-channels", because there is no need to
export the channels for the OS. The devicetree is primarily a hardware
description language) Or maybe we go specific and say "ads1015,channel1
=3D 1"? Maybe somebody knows of a similar chips as a reference?

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--Z0mFw3+mXTC5ycVe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk1vlt0ACgkQD27XaX1/VRvV1QCgjaQ9BP1I4aFmi3IT31LdSg/N
O7QAmQF418k+5XdzyJI86pn/Jkma1ghO
=bw2/
-----END PGP SIGNATURE-----

--Z0mFw3+mXTC5ycVe--

--===============0467658715751417705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0467658715751417705==--
