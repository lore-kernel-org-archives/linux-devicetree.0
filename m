From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: media: Add Allwinner V3s Camera
 Sensor Interface (CSI)
Date: Fri, 28 Jul 2017 18:03:53 +0200
Message-ID: <20170728160353.gqb2f47v6ujozvxz@flea.lan>
References: <1501131697-1359-1-git-send-email-yong.deng@magewell.com>
 <1501131697-1359-3-git-send-email-yong.deng@magewell.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="l4yhxtsyrl7uef4x"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1501131697-1359-3-git-send-email-yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jean-Christophe Trotin <jean-christophe.trotin-qxv4g6HH51o@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, lin
List-Id: devicetree@vger.kernel.org


--l4yhxtsyrl7uef4x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jul 27, 2017 at 01:01:36PM +0800, Yong Deng wrote:
> Add binding documentation for Allwinner V3s CSI.
>=20
> Signed-off-by: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
> ---
>  .../devicetree/bindings/media/sun6i-csi.txt        | 49 ++++++++++++++++=
++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/sun6i-csi.txt
>=20
> diff --git a/Documentation/devicetree/bindings/media/sun6i-csi.txt b/Docu=
mentation/devicetree/bindings/media/sun6i-csi.txt
> new file mode 100644
> index 0000000..f8d83f6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/sun6i-csi.txt
> @@ -0,0 +1,49 @@
> +Allwinner V3s Camera Sensor Interface
> +------------------------------
> +
> +Required properties:
> +  - compatible: value must be "allwinner,sun8i-v3s-csi"
> +  - reg: base address and size of the memory-mapped region.
> +  - interrupts: interrupt associated to this IP
> +  - clocks: phandles to the clocks feeding the CSI
> +    * ahb: the CSI interface clock

We've been bad at this, but we're trying to have the same clock name
here across all devices, and to use "bus" instead of "ahb".

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--l4yhxtsyrl7uef4x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZe2BpAAoJEBx+YmzsjxAgwt4P/ih9Y9bcu4IXwbKWesaz5mCE
/y6QgGIfJTcajWs70lmp/6Uk9ASw/RY13XUEvBUQulnhnrDfILLnlSkgHz8NZ7up
3n++OERZZwzhqb7GfP/UwM+0NZJlkGcHTbZksE2C9tfDWtImQALwH0k3xY/23o+G
v9SbfCNWp3g49YzV6BWcFq11z4Ml4y0DWM0kJW4IJTqcr4DX3SLDn0znpvYm7wto
rlB5QSk6c6K5Eg9F69NYSMxVfm9zQt4qANt249B00tmdgHXxoBwfRzw4i0KLeshv
gWoT8LO+9mjiYhtUZSTUPhocxns1WMihsi4qeWrr5ox6RX+TxO71Aol63hpdDzk/
RxwWh+8NXg4ww0Lygi02+Qy6I0nH/ZCBtUrd4hsMzvDByxArCbIQR9KVqShYgJnL
gtqnyfX5PYV87b38Mmf7C3n5h4Ua980Mucd4SCEDRObQGSAPvcy3etrRGCZXUJzy
YJCBiL5Mxx8T6HL6DWhDyckp5GzTX0Svmlf7W6aaSrML+yK2KXdZCQwDMHupJIuN
N7i3MqM767h1fU16fENP2wAr+OIpEZKlNEjvCMYUqzyss78G3JVONnhkZ4AKNZXy
LYM5yjN2meJgY/P9SrR1A5v1xSfaWZ0787Vb5X5j2qJSiGKAfWfsbuVEOsMVXh/d
73MLNH2a3Chc1Y2oDV42
=/q+Z
-----END PGP SIGNATURE-----

--l4yhxtsyrl7uef4x--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
