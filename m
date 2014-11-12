From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH V2 1/1] ARM: dts: sunxi: Banana Pi: increase
 startup-delay for the GMAC PHY regulator
Date: Wed, 12 Nov 2014 14:37:27 +0100
Message-ID: <20141112133727.GO14919@lukather>
References: <1415539714-7652-1-git-send-email-merker@debian.org>
 <1415746906-20835-1-git-send-email-merker@debian.org>
 <1415746906-20835-2-git-send-email-merker@debian.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eHmdSDY+kY2au76U"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBN6GRWRQKGQELCGSUHQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1415746906-20835-2-git-send-email-merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--eHmdSDY+kY2au76U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2014 at 12:01:46AM +0100, Karsten Merker wrote:
> On the LeMaker Banana Pi, probing the external ethernet PHY connected
> to the SoC's internal GMAC module sometimes fails. The PHY power
> supply is handled via a GPIO-controlled regulator, and the existing
> regulator startup-delay of 50000us is too short to make sure that the
> PHY is always fully powered up when it is queried by phylib. Tests
> have shown that to provide a reliable PHY detection, the startup-delay
> has to be increased to at least 60000us. To have a certain safety margin
> and to cater for manufacturing variations between different boards,
> the delay gets set to 100000us as discussed on the linux-arm-kernel
> mailinglist.
>=20
> Signed-off-by: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> Acked-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Merged, thanks.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--eHmdSDY+kY2au76U
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUY2KXAAoJEBx+YmzsjxAg7zgP/1IKd6W+p5LjWaHSFVKsQSv8
GTsVexwjqLodPgjVfDvQC0EwXlmd0sPWaqgfkVvAogrL75tddRelYv+MVbNtDeIP
6Iqg78ONFyrnxum9mufT9xnsUk//pfAh9mum85vRoXmynKazPDWSaDDDEHZLXtaM
SBXjOs4eIHtYut6oIS/7movIMsstwximDQWVGgJwI+x19Uye095oMwRALFZs5dsQ
lkkbTjvS98QCmaVeylGRVN10IXDu50hlCfAxvRiN7nmveFU9K+9KBo0Zydu3V5Ch
2FFr0JDHGTAVF5VTnSzVxXb11GJc0KYUvnNQrgdBCVWrABDLOc+AEvxhazJGZ9F8
LchI2bMCidN8/H5gmfbBW1BMEXNj2rwkWsUstiMNQ4RZSbQ9W07j+VIcDOntAnVO
zU+2/8jM5U6LGBk+QE9dW2cuRZbyqVuEEA5LQYlUWtIZGWM2aVpH97MymkzWvm8z
bjBmibB0x9lc8lHBHStCUeSTpMNvwSu08tHxCwszczmQtPvjm0V0yq9VOrpfAxuy
WLL+4JIFbpe+0UJOIkIV6+MPrnL861/4FH+e9+S/fY181ygriDWv7uHYKuhUQmM+
EMJK6iESuSmL7JPygR1QOnDEJ3MOZLgsUTDbboKEXMQhJ1tLRH8PedVkRHcV6aMv
q+ptx03gXDjpAZTFMhtO
=Dr7/
-----END PGP SIGNATURE-----

--eHmdSDY+kY2au76U--
