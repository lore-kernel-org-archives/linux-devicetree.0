From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: sun7i/sun6i: dts: Fix IRQ number
 for sun6i NMI controller
Date: Mon, 31 Mar 2014 13:02:55 +0200
Message-ID: <20140331110255.GE26751@lukather>
References: <1395939759-11135-1-git-send-email-carlo@caione.org>
 <1395939759-11135-2-git-send-email-carlo@caione.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FEz7ebHBGB6b2e8X"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBYEX4WMQKGQEQFWCCTY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1395939759-11135-2-git-send-email-carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Cc: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--FEz7ebHBGB6b2e8X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2014 at 06:02:38PM +0100, Carlo Caione wrote:
> From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>=20
> The IRQ line used in sun6i-a31.dtsi for the NMI controller is wrong.
> This causes a IRQ storm since the NMI controller is repeatedly fired.
> This patch fixes this problem assigning the correct IRQ number to the
> NMI controller.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>

Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--FEz7ebHBGB6b2e8X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTOUtfAAoJEBx+YmzsjxAg40gP/25swJtxDHRf/LeCuTWm3ZCo
t4vs5FTcDQIrBR0b696TSesHz82RHFhQtj9XRe6xyg12tNW73vwGsVHClF2n4Fak
IkwtZ/+ks1ACjxqtwdDijX3uIOfqQndQ5MxavRV/5095zBSn8FQThIhvzRPnqljs
S6Jt/ODSMvabg2XBoT5AOmxY2AgnkzwpAcKS1xQrZ+Rolwhbv5MXBSWhpjUVfhWK
nw7v5wX8qCAcoPTeUPDNufZSL/7zZW2jnyFhGFkncJeGl3HffLZF1F9hUnf9EJ7J
Y7dhKh1ZnOynsR5kV8vdRgY4SjweiZXRpyvWemhKoa8pC9b+A2ScxAVd4Z8o5Bj4
kIWugg4xOYsh12D8g7IM7MtkpD66ClMgndhhNmcLfOJpYE5aqXwcAB08bwQqUGNx
gwD2UMKjLxcqbu03hVncXgLNNNpKJM2fXeqSsJ6GjOvQvUsYEJvcrbqxeEgfRbsp
xVKFG4wrYBIH9lxw9KfLwKHViY3rdwtSnqDQDdETgxk4W5AgQYRbB0dZISxFjwKM
rwNzlTW5G0FGunq2iYBwwGF9HC2CPOW0r7E0xcDqpFb47p0M10GTw7lg2/A4Vt89
Uwy6t9OdaAhXAaLUQAwmMB5v0bA9lEpGJFJqjzKU4+r9U4m1AnasintR4u4Lic82
OptUlV9H/B7CqlNPdU5x
=uCIR
-----END PGP SIGNATURE-----

--FEz7ebHBGB6b2e8X--
