From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: sun8i: v3s: add EHCI/OHCI0 device nodes
Date: Thu, 21 Dec 2017 16:22:41 +0100
Message-ID: <20171221152241.igwjbnj2tu3zpa7x@flea.lan>
References: <20171221150537.20304-1-icenowy@aosc.io>
 <20171221150537.20304-2-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="y3ew3rq7gz5kpiaa"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171221150537.20304-2-icenowy-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--y3ew3rq7gz5kpiaa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 21, 2017 at 11:05:36PM +0800, Icenowy Zheng wrote:
> The USB PHY 0 on V3s SoC can also be routed to a pair of EHCI/OHCI
> controllers.
>=20
> Add the device nodes for the controllers.
>=20
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-v3s.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i-v=
3s.dtsi
> index 443b083c6adc..cc315dc742d2 100644
> --- a/arch/arm/boot/dts/sun8i-v3s.dtsi
> +++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
> @@ -264,6 +264,25 @@
>  			#phy-cells =3D <1>;
>  		};
> =20
> +		ehci0: usb@01c1a000 {

And you should also drop the leading zero on your two nodes
unit-address.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--y3ew3rq7gz5kpiaa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlo70cAACgkQ0rTAlCFN
r3TFDw/+ISQbmslZu8HztBSH4G/cw1FiT1YolkzkppYzYuTJXrsoyiMk1YA8YjGG
XaX+3rcfbQVHGBB6ZMgOQOiTtOi4P+elRm7dwMvzP7yCZ8enOTgFKEXTNBAWiTT0
MA4w1E64dO1DE6c10qvR12s1SlQzDNWAL2AXmXdNXeymRtqVNgsjrHg1VwPJBPMO
7H7vQq7mBApreQZlFPZjH717HhnsQgsUmp4SovN37+k9ePO0HVxb8FzR05wTTl2U
duRpzLX0Ex/7jFbrrM29n76K8QSo/9UJV/BNtW9UD4ZZM3NhasPsL6xnH13LDU2w
vFgs6tS1ITBvxaHxaatPyPRQNi/9rna7xrQI9ZibI+CYbfuA0i3ifMtC1BUbTTar
MXrB/gC5UqSmMa4Efiq0vK1KzGOvLR/mRyUHTAIWpE4kqug28rJUiFLLxXnaCsQ6
eqvNDBFeTQiLe6vysn0uds6ZUDGT568bo9qKpRoNz3nzw8zNMWWsv69xtenXdE4y
P1mF53AH9EJnLFUoDJ7TOoMaQBtpeCsDsIUFzNj6SG9W5spAdxFM4h3XxHbt9cvO
6RX44+Z2Xc4ervAiDBH1Cn3RMc00OQ1VNfnw9+3kn5b9Jth6NHzGNYRvXji0yy21
HJI1pUc86djZi37UPjxC0uyx/oVA++wzjkSpbdBDAiHwP5awAbk=
=s2ep
-----END PGP SIGNATURE-----

--y3ew3rq7gz5kpiaa--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
