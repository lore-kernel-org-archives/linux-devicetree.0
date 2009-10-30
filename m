From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [Socketcan-users] [PATCH] mscan: add non-polling rx
Date: Fri, 30 Oct 2009 18:48:11 +0100
Message-ID: <20091030174811.GB30697@pengutronix.de>
References: <1256902073-22328-1-git-send-email-l.fu@pengutronix.de>
	<4AEB2328.6090009@grandegger.com> <4AEB240F.1080408@grandegger.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6329668922019893488=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4AEB240F.1080408-5Yr1BZd7O62+XT7JhA+gdA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Wolfgang Grandegger <wg-5Yr1BZd7O62+XT7JhA+gdA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, socketcan-users-0fE9KPoRgkgATYTw5x5z8w@public.gmane.org, Luotao Fu <l.fu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============6329668922019893488==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IpbVkmxF4tDyP/Kb"
Content-Disposition: inline


--IpbVkmxF4tDyP/Kb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2009 at 06:36:15PM +0100, Wolfgang Grandegger wrote:
> Wolfgang Grandegger wrote:
> > Luotao Fu wrote:
> >> This one adds an option to turn of napi and process rx directly in msc=
an isr. As
> >> for mpc52xx this feature can be turned on by setting a rx-irq property=
 int the
> >> device tree, e.g:
> >> can@980 {
> >>     compatible =3D "fsl,mpc5200b-mscan","fsl,mpc5200-mscan";
> >>     interrupts =3D <2 18 0>;
> >>     rx-irq;
> >>     reg =3D <0x980 0x80>;
> >> };
> >> Default is the polling rx.
> >>
> >> Signed-off-by: Luotao Fu <l.fu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> >=20
> > This has little chance to be accepted as the device tree is about
> > hardware. It should not be used to tell the driver what to do (software
> > settings). I have CCed the devicetree-discuss ML for clarification.

I second Wolfgang's opinion. Pity I can't provide a suitable alternative.

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--IpbVkmxF4tDyP/Kb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkrrJtsACgkQD27XaX1/VRswLACdHOIhF5xh43xhDXcfqduyfenO
irUAn2Dc8TQIJmbYNoxQJ8W853jcW52C
=u49Z
-----END PGP SIGNATURE-----

--IpbVkmxF4tDyP/Kb--

--===============6329668922019893488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============6329668922019893488==--
