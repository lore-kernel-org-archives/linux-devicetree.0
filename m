From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 1/4] ARM: sunxi: Add driver for sunxi usb phy
Date: Mon, 24 Feb 2014 10:27:43 +0100
Message-ID: <20140224092743.GF3468@lukather>
References: <1393157352-21104-1-git-send-email-hdegoede@redhat.com>
 <1393157352-21104-2-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jKBxcB1XkHIR0Eqt"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBG5CVSMAKGQEBJL4HYY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1393157352-21104-2-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--jKBxcB1XkHIR0Eqt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Feb 23, 2014 at 01:09:09PM +0100, Hans de Goede wrote:
> The Allwinner A1x / A2x SoCs have 2 or 3 usb phys which are all accessed
> through a single set of registers. Besides this there are also some other
> phy related bits which need poking, which are per phy, but shared between=
 the
> ohci and ehci controllers, so these are also controlled from this new phy
> driver.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--jKBxcB1XkHIR0Eqt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTCxCPAAoJEBx+YmzsjxAgVNgQAIMpgwTixjTyXHokrupowIQs
G7xftpOl4xt2vQvo5Nq+8mhEb2Gd7oLq17abyi+ju+UA3S/PaLiI5cpXZPzvAlQ5
Jg+oyZHvzqD0NcE5guf1RvP14ktJz8Eo+cI6Ffi335JHisvFKw0VUckn9cjYUdUp
JG2Da1SCFK9q5OjObG9SSrOSkfNkU1WQYG0Abg3nXuxZo05sC2WgYk/laklL7/7L
ZnA2wi1mmsQql+oEP5ydlqbwEE/jUZagU1Nk/C1tZTEEBF/zQeOtfrwl4cef6jEe
ddbzX5VQnxlDK74zh+XXNUZh7VbLghwyBROJuEGcdhoAZeBIR8pJzktAKjCbN2u2
gwN4/KZ7lbKcqQ50zJ+qzUtPPuHwY+54jZph0xnfO5UE3MzriFhvRZtKFK8wx1JX
xp1b8/qxoN5Vahah4URifouqujZUXPERpLhY8lFdtsSk3F5gZWn1cNofkRrdt/Q8
EQFvI0lGsCbwA5rsnf/DgDWJ9CJNWg9L+JOxP0UJaoD7DqRiz0dTuK2uls4xB0bj
31MSHtcdZVf7UCm/zJle6YEQyROddNqBmSV/AF26eCo7FfzumvvB4gYwgt6VKRYq
/ue10cqvYDLxUxOrx0hKfbLu7aI3x669S694A0Ui26ddpb1+XuiF6HbKCOXTK45J
HhfIrijBtnGdZrVi+iu5
=E+o8
-----END PGP SIGNATURE-----

--jKBxcB1XkHIR0Eqt--
