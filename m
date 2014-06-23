From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 2/4] ARM: sunxi: Add earlyprintk support
 using R_UART (sun6i/sun8i)
Date: Mon, 23 Jun 2014 18:01:34 +0200
Message-ID: <20140623160134.GI19730@lukather>
References: <1403275973-24259-1-git-send-email-wens@csie.org>
 <1403275973-24259-3-git-send-email-wens@csie.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GFRhMCFsFD5VPY3r"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBCXJUGOQKGQEHOIXJJQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1403275973-24259-3-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--GFRhMCFsFD5VPY3r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2014 at 10:52:51PM +0800, Chen-Yu Tsai wrote:
> sun6i/sun8i have a UART in the RTC block group, which can be used
> as an early console. This is most useful on sun8i as UART0 is muxed
> with MMC0, which is not available if we boot from MMC.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Applied, thanks

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--GFRhMCFsFD5VPY3r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTqE9eAAoJEBx+YmzsjxAgDb4P+gKbCSsrMk68+3nw4yhQ59ik
XdfcoLnp+aWt73g3IcY6dP/sxsCKz+srAttHQ9ap1HGMKbsjHH3nyNq906voFaSu
xn3116SSEPDJmG825BQ6J1jAXru9rP3kx+/oyYcz6WIB3Ia1yHdsiBzqbmXtgUS0
tEMiG1wGDccdsLX9xubMVdszTjJEZWM5iC+s8sWl3glwE9TgVDHGiVmNXgE3NjVa
29AVaG9H07Br923vbngGOtE9HBzqWxaun2f7tHwnb5fwPyx4WErM/3EJ5R2Yh9en
lpT7UewqF4rD4md0CRjbX+zj4a+7NoLtOtp5n1A2PLvJDOsKVB742W7jwP1vgbm4
M/PpUegJWqhBTIW4Xb04ZvDytX2zw8lFlCSrO5b7cBL7MZP7xi17t0hHJtByPu5P
4v+A+je34mwDkb6qzZ0zICbvJMWEV2tRsPYmW6gzeOU0Df5SbnxGS2aJ2sw6lnz0
sW0LMyirOzHKDRX5AYeEmL8WtDkRmCykubBjqVtSQu+tARiCfcpDa/vTH2VKslkX
U368Qu1rFOXV5ZICNRcqwsT6sE/9laFkq478d7jQAwriRMQkJ0zMXRySaoFDM0+U
vt/8DGuehhHtT0c0vK60o+yGtFSW6j7qlO6+w0pM4uIXtOkZvQxM5fyRs4iId1JH
ruOBknFvTVjPoMeuY1cp
=Sc9s
-----END PGP SIGNATURE-----

--GFRhMCFsFD5VPY3r--
