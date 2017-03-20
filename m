From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: add bindings for DE2 on V3s SoC
Date: Mon, 20 Mar 2017 10:56:49 +0100
Message-ID: <20170320095649.pnokqzv3akubkklm@lukather>
References: <20170316204748.8596-1-icenowy@aosc.xyz>
 <20170316204748.8596-4-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1382126277=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170316204748.8596-4-icenowy@aosc.xyz>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1382126277==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4sksu36x4iadloy5"
Content-Disposition: inline


--4sksu36x4iadloy5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2017 at 04:47:43AM +0800, Icenowy Zheng wrote:
> Allwinner V3s SoC have a display engine which have a different pipeline
> with older SoCs.
>=20
> Add document for it (new compatibles and the new "mixer" part).
>=20
> The paragraph of TCON is also refactored, for furtherly add TCONs in
> A83T/H3/A64/H5 that have only a channel 1 (used for HDMI or TV Encoder).
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
>  .../bindings/display/sunxi/sun4i-drm.txt           | 37 ++++++++++++++++=
+++---
>  1 file changed, 33 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.tx=
t b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> index b82c00449468..2c293247c41d 100644
> --- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> +++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> @@ -31,11 +31,11 @@ Required properties:
>     * allwinner,sun6i-a31-tcon
>     * allwinner,sun6i-a31s-tcon
>     * allwinner,sun8i-a33-tcon
> +   * allwinner,sun8i-v3s-tcon
>   - reg: base address and size of memory-mapped region
>   - interrupts: interrupt associated to this IP
> - - clocks: phandles to the clocks feeding the TCON. Three are needed:
> + - clocks: phandles to the clocks feeding the TCON
>     - 'ahb': the interface clocks
> -   - 'tcon-ch0': The clock driving the TCON channel 0
>   - resets: phandles to the reset controllers driving the encoder
>     - "lcd": the reset line for the TCON channel 0
> =20
> @@ -52,7 +52,12 @@ Required properties:
>    second the block connected to the TCON channel 1 (usually the TV
>    encoder)
> =20
> -On SoCs other than the A33, there is one more clock required:
> +On TCONs that have a channel 0 (currently all TCONs supported), there
> +is one more clock required:
> +   - 'tcon-ch0': The clock driving the TCON channel 0
> +
> +On TCONs that have a channel 1 (currently all TCONs except the ones in
> +A33 and V3s), there is one more clock required:
>     - 'tcon-ch1': The clock driving the TCON channel 1
> =20
>  DRC
> @@ -137,6 +142,26 @@ Required properties:
>    Documentation/devicetree/bindings/media/video-interfaces.txt. The
>    first port should be the input endpoints, the second one the outputs
> =20
> +Display Engine 2.0 Mixer
> +------------------------
> +
> +The DE2 mixer have many functionalities, currently only layer blending is
> +supported.
> +
> +Required properties:
> +  - compatible: value must be one of:
> +    * allwinner,sun8i-v3s-de2-mixer
> +  - reg: base address and size of the memory-mapped region.
> +  - clocks: phandles to the clocks feeding the frontend and backend
> +    * bus: the backend interface clock
> +    * ram: the backend DRAM clock
> +  - clock-names: the clock names mentioned above
> +  - resets: phandles to the reset controllers driving the backend
> +
> +- ports: A ports node with endpoint definitions as defined in
> +  Documentation/devicetree/bindings/media/video-interfaces.txt. The
> +  first port should be the input endpoints, the second one the output
> +
> =20
>  Display Engine Pipeline
>  -----------------------
> @@ -151,9 +176,13 @@ Required properties:
>      * allwinner,sun6i-a31-display-engine
>      * allwinner,sun6i-a31s-display-engine
>      * allwinner,sun8i-a33-display-engine
> +    * allwinner,sun8i-v3s-display-engine
> =20
>    - allwinner,pipelines: list of phandle to the display engine
> -    frontends available.
> +    pipeline entry point. For SoCs with original DE (currently
> +    all SoCs supported by display engine except V3s), this
> +    phandle should be a display frontend or backend; for SoCs
> +    with DE2, this phandle should be a mixer.

In the old ones, this should never be the backend.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--4sksu36x4iadloy5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYz6dhAAoJEBx+YmzsjxAgjtQP/208fM4WV3++1VkzGyr2eEkK
ZPJ4x0HW57Gy25tfhdyTKc0VpG/p4AdfKp+CZtjuIzBsmab7zpQBTjiMoBUyz5hj
IPNumRi/FeVp5SeQTKEV0TXhJZhy0Ft3nNxG8jTHmaO70sgL4//HUz8J3IN8BmNv
BaDc3KGLsWIwxmOm6miVWWMUA+beNPkTms6v0zin1y2gXu7396PzK4Jyrhni07GU
fcwheXSn3A3iG0+V13tBsmK9NkyE1cMNIpUJ2pX8CewzBmqfzM3oAfnfeLtVhv28
4Iq2Hf4oSs/5a9548xyFa3qZbqplyoOb1xFygmXC4Ebt1+SJeVb10PxXfDy7cuhA
3MUY8pPziz8Ac936cpmphHtyR4BmPS8v9OpC4n56v1amxOn5kwYeNPv4eanPrIt8
GoYX3jQhUH+dbkxzj4g62JXySSbMyQfuVgBZQ06MawErusY870FPhbE7jFPXguUL
Yt5Z1XiSwRb1EjEmxyKP8byh109lwXdK63muAr7xRltnq6LtINR1CiWoEphHwakj
NfF9qtIaE8/VUv1Lj/1CS+kkEoQP4Xyw7CEYuZgrfLCy+w7A8rup3XQI7H0wf9Y+
qOIZPO1a/2Dcd7P34d07wML6ngiSK9jrXcU3jjksVs0TpLEk4X7ltJmCdRwv+FK7
sHeBf81vEOrBQ/FtMzbx
=q1HR
-----END PGP SIGNATURE-----

--4sksu36x4iadloy5--

--===============1382126277==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1382126277==--
