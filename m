From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v2 2/4] ARM64: dts: meson-gx: Add Graphic Controller nodes
Date: Wed, 30 Nov 2016 18:02:03 +0200
Message-ID: <10006210.eA8q2ZWXP0@avalon>
References: <1480520625-13269-1-git-send-email-narmstrong@baylibre.com> <1480520625-13269-3-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480520625-13269-3-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: airlied-cv59FeDIM0c@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, victor.wan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, jerry.cao-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, Xing.Xu-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Neil,

Thank you for the patch.

On Wednesday 30 Nov 2016 16:43:43 Neil Armstrong wrote:
> Add Video Processing Unit and CVBS Output nodes, and enable CVBS on selected
> boards.
> 
> Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi             | 19 ++++++++++++++++
>  .../arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts | 15 +++++++++++++++
>  arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi      | 15 +++++++++++++++
>  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi           |  4 ++++
>  arch/arm64/boot/dts/amlogic/meson-gxl-nexbox-a95x.dts | 15 +++++++++++++++
>  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi            |  4 ++++
>  arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts   | 15 +++++++++++++++
>  arch/arm64/boot/dts/amlogic/meson-gxm.dtsi            |  4 ++++
>  8 files changed, 91 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi index fc033c0..a27f881 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> @@ -356,5 +356,24 @@
>  				status = "disabled";
>  			};
>  		};
> +
> +		vpu: vpu@d0100000 {
> +			compatible = "amlogic,meson-gx-vpu";
> +			reg = <0x0 0xd0100000 0x0 0x100000>,
> +			      <0x0 0xc883c000 0x0 0x1000>,
> +			      <0x0 0xc8838000 0x0 0x1000>;
> +			reg-names = "vpu", "hhi", "dmc";
> +			interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			/* CVBS VDAC output port */
> +			port@0 {
> +				reg = <0>;
> +
> +				cvbs_vdac_out: endpoint {
> +				};

Endpoints require a remote-endpoint property. You should move the endpoint to 
board DT files.

> +			};
> +		};
>  	};
>  };
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
> b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts index
> 9696820..390f7db 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
> @@ -142,6 +142,17 @@
>  		clocks = <&wifi32k>;
>  		clock-names = "ext_clock";
>  	};
> +
> +	cvbs-connector {
> +		compatible = "composite-video-connector";
> +		label = "cvbs";

Unless the board has a label for the connector (either on the board, on the 
casing or in the user manual) I'd leave this out. Same comment for the other 
boards.

Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>

> +
> +		port {
> +			cvbs_connector_in: endpoint {
> +				remote-endpoint = <&cvbs_vdac_out>;
> +			};
> +		};
> +	};
>  };
> 
>  &uart_AO {
> @@ -229,3 +240,7 @@
>  	clocks = <&clkc CLKID_FCLK_DIV4>;
>  	clock-names = "clkin0";
>  };
> +
> +&cvbs_vdac_out {
> +	remote-endpoint = <&cvbs_connector_in>;
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
> b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi index 203be28..44bdebf
> 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
> @@ -125,6 +125,17 @@
>  		clocks = <&wifi32k>;
>  		clock-names = "ext_clock";
>  	};
> +
> +	cvbs-connector {
> +		compatible = "composite-video-connector";
> +		label = "cvbs";
> +
> +		port {
> +			cvbs_connector_in: endpoint {
> +				remote-endpoint = <&cvbs_vdac_out>;
> +			};
> +		};
> +	};
>  };
> 
>  /* This UART is brought out to the DB9 connector */
> @@ -234,3 +245,7 @@
>  	clocks = <&clkc CLKID_FCLK_DIV4>;
>  	clock-names = "clkin0";
>  };
> +
> +&cvbs_vdac_out {
> +	remote-endpoint = <&cvbs_connector_in>;
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi index ac5ad3b..5353a20 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> @@ -506,3 +506,7 @@
>  		 <&clkc CLKID_FCLK_DIV2>;
>  	clock-names = "core", "clkin0", "clkin1";
>  };
> +
> +&vpu {
> +	compatible = "amlogic,meson-gxbb-vpu", "amlogic,meson-gx-vpu";
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-nexbox-a95x.dts
> b/arch/arm64/boot/dts/amlogic/meson-gxl-nexbox-a95x.dts index
> e99101a..7bd0538 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-nexbox-a95x.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-nexbox-a95x.dts
> @@ -117,6 +117,17 @@
>  		clocks = <&wifi32k>;
>  		clock-names = "ext_clock";
>  	};
> +
> +	cvbs-connector {
> +		compatible = "composite-video-connector";
> +		label = "cvbs";
> +
> +		port {
> +			cvbs_connector_in: endpoint {
> +				remote-endpoint = <&cvbs_vdac_out>;
> +			};
> +		};
> +	};
>  };
> 
>  &uart_AO {
> @@ -203,3 +214,7 @@
>  	clocks = <&clkc CLKID_FCLK_DIV4>;
>  	clock-names = "clkin0";
>  };
> +
> +&cvbs_vdac_out {
> +	remote-endpoint = <&cvbs_connector_in>;
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi index 9f89b99..5c7a8fa 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> @@ -299,3 +299,7 @@
>  		 <&clkc CLKID_FCLK_DIV2>;
>  	clock-names = "core", "clkin0", "clkin1";
>  };
> +
> +&vpu {
> +	compatible = "amlogic,meson-gxl-vpu", "amlogic,meson-gx-vpu";
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
> b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts index
> d320727..5b99749 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
> @@ -90,6 +90,17 @@
>  		compatible = "mmc-pwrseq-emmc";
>  		reset-gpios = <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
>  	};
> +
> +	cvbs-connector {
> +		compatible = "composite-video-connector";
> +		label = "cvbs";
> +
> +		port {
> +			cvbs_connector_in: endpoint {
> +				remote-endpoint = <&cvbs_vdac_out>;
> +			};
> +		};
> +	};
>  };
> 
>  /* This UART is brought out to the DB9 connector */
> @@ -167,3 +178,7 @@
>  		max-speed = <1000>;
>  	};
>  };
> +
> +&cvbs_vdac_out {
> +	remote-endpoint = <&cvbs_connector_in>;
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi
> b/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi index c1974bb..eb2f0c3 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi
> @@ -112,3 +112,7 @@
>  		};
>  	};
>  };
> +
> +&vpu {
> +	compatible = "amlogic,meson-gxm-vpu", "amlogic,meson-gx-vpu";
> +};

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
