From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 4/6] ARM: dts: sun8i: add rtc device node
Date: Wed, 30 Jul 2014 10:48:05 +0200
Message-ID: <20140730084805.GW3952@lukather>
References: <1406535661-25072-1-git-send-email-wens@csie.org>
 <1406535661-25072-5-git-send-email-wens@csie.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mz5eWKkhz39mMVQV"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBPPD4KPAKGQEG4UKWMA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1406535661-25072-5-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--mz5eWKkhz39mMVQV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 28, 2014 at 04:20:59PM +0800, Chen-Yu Tsai wrote:
> sun8i shares the same rtc hardware as sun6i. Now that we have a driver
> for it, add a device node to the DTSI for it so we can use it.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Applied, thanks

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--mz5eWKkhz39mMVQV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJT2LFFAAoJEBx+YmzsjxAg2SQP/3rzzjyl2rHrsooW6w8AcDoN
3jo5qrlnyG7bgh7le7MPMEK00HRGiKctL8jHgFWvIHqxSvitvodpmljqkOxksosa
7+9Q+P/ys16Qd8IHv4JlA+oNU61QhlW6cj/eRUBsZtISH0usF9f8/X8NqnoEUyul
O/SGnXf2z5jc03BWw/zEzx9DyNQuzTUEkbKCBG2+vNCt4lJYULj6mjhL01y/+JyL
RltahruZmIetRXefnR2AvzIvIdQAfjjtJtuR2446V8LjUdNBANP2+0CNNWci7Kl9
TCuHMPhtjiMhR0Qd8sb8EsxfaZvuufB9cMYykQE9ubrGNFFHoDAaxmi9WF42Z47v
jqlRdh3CviLpMrfsuP4y3qeodKHa6LWKauUn8CigC1wfeNR5EbgrTVwVbL1mevhT
YKOJ5FyHOurG3J42osA9/NbxzLWA4zFhoXTauWOZRmwiJI4EuN2yfkFqhK/97QBf
lWJgCHaa0cc68vpPiSfW/3JYmt7hwMP8MkHvxitRan8SrrvIeYsLx2ZeyEAJQMcB
BXVnI0dMa2pxWq1VWw1T5RpRR7q1XlL5lQDw6H7ACr6yZ8J7kba6UeE79uw3yU+B
klaTjJ4eMg/KRsO6TG4pLs0KKPWnIy9lIHRo62S6h9twTkM2Fl6dYjxCFTRn/QkS
nZitOQ80w0al96rFa2JO
=/+qa
-----END PGP SIGNATURE-----

--mz5eWKkhz39mMVQV--
