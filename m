From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/4] irqchip: sun4i: Fix irq 0 not working
Date: Thu, 13 Mar 2014 10:29:17 +0100
Message-ID: <20140313092917.GE2815@lukather>
References: <1394644627-12315-1-git-send-email-hdegoede@redhat.com>
 <1394644627-12315-3-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3199z2xwsLUuj0Hj"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBH7VQWMQKGQEDA4Y3XY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1394644627-12315-3-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--3199z2xwsLUuj0Hj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2014 at 06:17:05PM +0100, Hans de Goede wrote:
> SUN4I_IRQ_VECTOR_REG containing 0 can mean one of 3 things:
> 1) no more irqs pending
> 2) irq 0 pending
> 3) spurious irq
>=20
> So if we immediately get a reading of 0, check the irq-pending reg
> to differentiate between 2 and 3. We only do this once to avoid
> the extra check in the common case of 1) hapening after having
> read the vector-reg once.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--3199z2xwsLUuj0Hj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTIXptAAoJEBx+YmzsjxAgDJUP/2ofr5IXee0nNVXFOEVHWUfh
e9/l9br7wFpzc7D1qBKYpyWZiCTNYXqzq2BBDzuJhQ7KH1auv91A6MUGbxNVXJpy
XrjLyqrYoT+7RkFC23QPfvGwpduhUrULELZu1AX3KZCOEIo74xKU1SQaT7Odlc1Q
Q6v2NYur/9S26CuxNBNnHbS8J8icok7vY54beX3GKQj7nGWyJdHlKY3lHk9sonG4
W2lmsbsYqhHOF+BaeC/zo9Kbcz8E6KNFbMkDOzEFC3CGBFV2auq2yM6jwC8HqYWt
jAZFsueqeHXCf8RRKyhHZu/3q58zmSka54UXF1PkY+Xcs89RKMMZ3svieOIUZftI
GprLuCWwsCWO2hmZSc3mmOgyqKub2sd7NojUjC5CrydQzNBN5+/Hx/FBVR8GZBSO
I5Y1LINPADc9D+i64nTMGo44BIHF8ldI3hpVfU4k3Jy2Za8rddlgrQIzNlIOfCq7
c7d03Jhs0XdFRg4xLigq/Q/ZhkfSXV2Gqbxx9NVT+3AznIPz/gofDoZ/UrmlavUr
VPpKfOmHZv6wF73cmNUJ8ojVyugK5ddJquavtpt01/GQezxume8tqrh1gzizqliG
8qIrAG6ogAHeTXKQQyPH2Q1MkoGSFKBQrAO9AJ2NirjDxRcmP7PAS5PaDHdpNmKN
5RZotXzjfKgVNbWaQCXe
=tzIA
-----END PGP SIGNATURE-----

--3199z2xwsLUuj0Hj--
