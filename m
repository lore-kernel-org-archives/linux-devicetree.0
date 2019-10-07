From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v10 5/6] arm64: dts: allwinner: a64: Add MIPI DSI pipeline
Date: Mon, 7 Oct 2019 12:57:08 +0200
Message-ID: <20191007105708.raxavxk4n7bvxh7x@gilmour>
References: <20191005141913.22020-1-jagan@amarulasolutions.com>
 <20191005141913.22020-6-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7007235537250047114=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191005141913.22020-6-jagan@amarulasolutions.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, linux-sunxi <linux-sunxi@googlegroups.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, michael@amarulasolutions.com, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org


--===============7007235537250047114==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="msd5tjzsj4hwrcaz"
Content-Disposition: inline


--msd5tjzsj4hwrcaz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 05, 2019 at 07:49:12PM +0530, Jagan Teki wrote:
> Add MIPI DSI pipeline for Allwinner A64.
>
> - dsi node, with A64 compatible since it doesn't support
>   DSI_SCLK gating unlike A33
> - dphy node, with A64 compatible with A33 fallback since
>   DPHY on A64 and A33 is similar
> - finally, attach the dsi_in to tcon0 for complete MIPI DSI
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> Tested-by: Merlijn Wajer <merlijn@wizzup.org>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> index 69128a6dfc46..ad4170b8aee0 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -382,6 +382,12 @@
>  					#address-cells = <1>;
>  					#size-cells = <0>;
>  					reg = <1>;
> +
> +					tcon0_out_dsi: endpoint@1 {
> +						reg = <1>;
> +						remote-endpoint = <&dsi_in_tcon0>;
> +						allwinner,tcon-channel = <1>;
> +					};
>  				};
>  			};
>  		};
> @@ -1003,6 +1009,38 @@
>  			status = "disabled";
>  		};
>
> +		dsi: dsi@1ca0000 {
> +			compatible = "allwinner,sun50i-a64-mipi-dsi";
> +			reg = <0x01ca0000 0x1000>;
> +			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_MIPI_DSI>;
> +			clock-names = "bus";

This won't validate with the bindings you have either here, since it
still expects bus and mod.

I guess in that cas, we can just drop clock-names, which will require
a bit of work on the driver side as well.

Maxime

--msd5tjzsj4hwrcaz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXZsaBAAKCRDj7w1vZxhR
xXn6AQCt+htvtym5wdP+F2AnazteXITvMk5Rfl6c9YFMfW0GswD+MILpcTLFvoCd
opCA2BNbbbbCbvP1aXhnkHjZupGsbg4=
=Qm2A
-----END PGP SIGNATURE-----

--msd5tjzsj4hwrcaz--


--===============7007235537250047114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7007235537250047114==--
