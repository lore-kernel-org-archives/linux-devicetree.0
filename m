From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 6/7] ARM: dts: sun6i: Add required ahb1
 clock parent and rates for dma controller
Date: Thu, 11 Sep 2014 23:15:31 +0200
Message-ID: <20140911211531.GN31276@lukather>
References: <1410000448-9999-1-git-send-email-wens@csie.org>
 <1410000448-9999-7-git-send-email-wens@csie.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1SVgZ+3xbDF9VW5n"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBBFEZCQAKGQE6B4HOVA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1410000448-9999-7-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--1SVgZ+3xbDF9VW5n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 06, 2014 at 06:47:27PM +0800, Chen-Yu Tsai wrote:
> The DMA controller requires AHB1 bus clock to be clocked from PLL6.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun6i-a31.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a=
31.dtsi
> index 8eb2c6d..1117989 100644
> --- a/arch/arm/boot/dts/sun6i-a31.dtsi
> +++ b/arch/arm/boot/dts/sun6i-a31.dtsi
> @@ -317,6 +317,11 @@
>  			clocks =3D <&ahb1_gates 6>;
>  			resets =3D <&ahb1_rst 6>;
>  			#dma-cells =3D <1>;
> +
> +			/* DMA controller requires AHB1 clocked from PLL6 */
> +			assigned-clocks =3D <&ahb1>;
> +			assigned-clock-parents =3D <&pll6>;
> +			assigned-clock-rates =3D <200000000>;

Where did you get that from?

The user manual says that it should be clocked at 600MHz, and I'm not
sure it should be enforced there either.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--1SVgZ+3xbDF9VW5n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUEhDzAAoJEBx+YmzsjxAgYXgQAKbqAz/VvsbKC9OgoBnufGIb
CYQ9GHyD9v13JXvigZN59bDdE8hvqw7WYqPZdyJEHjKHSAOta+TBeqmBBLnyAJE+
wc7oyeJW55vL6GwSVZywAXqVdH/6lyKaYnCFBqcwlzoV9CcrLVXQDED/uQqbrkfn
tPkF3lxwX8OsAISqUlxFfEPmi2/VK8Gu2BgyZKZmy27QtcsRUSWmzot3Es9nFKXN
DcRbbAqBjukg4P6BXYywu6EMesba7ere7nwadKcT2qiOcYuOziO81oEzu8i/l6da
NouT2scdh3mbq89oBrYAHLzykpH3qH/FTp2MqHe+BIFrN6RDzQt/7OvSGFABKLrT
BPp/gGRHW1Tqw725KMnFKBsY0zL8oviDvni6a8iRQYiF4286Je2+MniaAFDdHFkQ
iqu/iMi38lvKzwk1r7ClA3BQIhetaMCez6fp9h0qaNGdhyWi8YsPWjrON7ZIjjBT
RDeADT+ZuKQPlyXbyEKU9AgmYNsUrQh/fVQCReV2kDPgEu6ItvhUVTjnqs43nHLX
056DdsWYXkdcWdrty244iizZXR+P7v3wxqIEClgTqVmL9nre6VFRcQVPG5AujE0u
37KfZ4YKWJhZfvF3nb2akJDdAIEJDgvkWBZCOODThhS1o4Zcy+6K/BmapR1FCGys
nW5OC3Nl4pIxIRF1Z0Vr
=67Wd
-----END PGP SIGNATURE-----

--1SVgZ+3xbDF9VW5n--
