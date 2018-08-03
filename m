From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [RESEND PATCH v5 2/3] dt-bindings: display: atmel: optional
 video-interface of endpoints
Date: Fri, 3 Aug 2018 10:11:28 +0200
Message-ID: <20180803081128.GA4528@w540>
References: <20180803072308.14962-1-peda@axentia.se>
 <20180803072308.14962-3-peda@axentia.se>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180803072308.14962-3-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>
Cc: linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@bootlin.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jyri Sarha <jsarha@ti.com>, Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <a.hajda@samsung.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Jacopo Mondi <jacopo+renesas@jmondi.org>
List-Id: devicetree@vger.kernel.org


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Peter!

On Fri, Aug 03, 2018 at 09:23:07AM +0200, Peter Rosin wrote:
> With bus-type/bus-width properties in the endpoint nodes, the video-
> interface of the connection can be specified for cases where the
> heuristic fails to select the correct output mode. This can happen
> e.g. if not all RGB pins are routed on the PCB; the driver has no
> way of knowing this, and needs to be told explicitly.
>
> This is critical for the devices that have the "conflicting output
> formats" issue (SAM9N12, SAM9X5, SAMA5D3), since the most significant
> RGB bits move around depending on the selected output mode. For
> devices that do not have the "conflicting output formats" issue
> (SAMA5D2, SAMA5D4), this is completely irrelevant.
>
> Acked-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Peter Rosin <peda@axentia.se>
> ---
>  .../devicetree/bindings/display/atmel/hlcdc-dc.txt | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/atmel/hlcdc-dc.txt b/Documentation/devicetree/bindings/display/atmel/hlcdc-dc.txt
> index 82f2acb3d374..9de434a8f523 100644
> --- a/Documentation/devicetree/bindings/display/atmel/hlcdc-dc.txt
> +++ b/Documentation/devicetree/bindings/display/atmel/hlcdc-dc.txt
> @@ -15,6 +15,14 @@ Required children nodes:
>   to external devices using the OF graph reprensentation (see ../graph.txt).
>   At least one port node is required.
>
> +Optional properties in grandchild nodes:
> + Any endpoint grandchild node may specify a desired video interface
> + according to ../../media/video-interfaces.txt, specifically
> + - bus-type: must be <0>.

Is there any value in specifying this, if it has a fixed value to
"autodetect"? I understand it's optional, so if nobody else objects,
feels free to keep it there.


> + - bus-width: recognized values are <12>, <16>, <18> and <24>, and
> +   override any output mode selection heuristic, forcing "rgb444",
> +   "rgb565", "rgb666" and "rgb888" respectively.
> +
>  Example:
>
>  	hlcdc: hlcdc@f0030000 {
> @@ -50,3 +58,21 @@ Example:
>  			#pwm-cells = <3>;
>  		};
>  	};
> +

Two blank lines here.

> +
> +Example 2: With a video interface override to force rgb565; as above
> +but with these changes/additions:
> +
> +	&hlcdc {
> +		hlcdc-display-controller {
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pinctrl_lcd_base &pinctrl_lcd_rgb565>;
> +
> +			port@0 {

The node has a unit address specified, you're missing a reg = <0>
property (no big deal, it's an example, but the other one has it)

> +				hlcdc_panel_output: endpoint@0 {

Missing reg here too.

Minors apart:

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
   j

> +					bus-type = <0>;
> +					bus-width = <16>;
> +				};
> +			};
> +		};
> +	};
> --
> 2.11.0
>

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbZA4vAAoJEHI0Bo8WoVY8aeMQAIm5HcyWTXTBWIjfHUulvw9T
F0eFetBBXbdC0VTjrB3i9w6uO282S5P9eJf3rB1BjTvFyu+OcJ5AEG7Hv2c54tpn
hScsmrXyLfpaMNVUHyGMwMwVztoJVkb28vT0+5QAxxH3odJtCqDeXgPnmVIX/gPN
chhZ/zP/hX328f/LeaO565aL7kJL1hyBgeLYO+p73PC3rFFxlOKLziqiDf69f+AI
dbcIG/xJZRQR54jReaXQPl2TcQxwjRxsEDAJaP45P1Kvg2N+mG3lMQCcTr8QHegk
vWh+BhTbhBfjo3EdumiaetL3jytjFrhlTJLSdHmJlihtGR1Z/kZwelxOaLy2gvCs
X5n5syeUD+b3+3P+f9ogKGmeaLRl962S8nmOrsAH+A1tLWXEjiLAcuWftPN/L8DQ
jUjsa60uw62DCJwl4PtIBqXgJO8avCjWOVw/msW/uOzyfG2qlAr6W2Z0tQsmjzpV
LsJb8Y7YgC/fntP5yGHNipnm7JN4iFdvUzDGaCHhROa8u07DJNAQifxgz1KJdHcW
PA1tKKHeZ5O8T+iyVxBGlIUvTLyRMW1LP2bYHz4S6CAdp5DE9463mtmtifz4n/ki
OxMOBgN9U8neyIAEv/1aMedBY9p/ufnZmNOtxgRZwWSAaaec8sfk6r/zNcnO9PcC
8CzYkWsy8xrmQ6DNeUWb
=4Hd+
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--
