From: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: drm/bridge: Document Cadence DSI
 bridge bindings
Date: Fri, 01 Sep 2017 08:28:13 +0200
Message-ID: <3371dbd2-9539-d746-0982-71112d5d98a0@samsung.com>
References: <20170831155519.3704-1-boris.brezillon@free-electrons.com>
        <CGME20170831155542epcas1p386204b629825977fbd824ca195d47e59@epcas1p3.samsung.com>
        <20170831155519.3704-2-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20170831155519.3704-2-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Content-language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cyprian Wronka <cwronka-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Simon Hatliff <hatliff-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Alan Douglas <adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Sproul <sproul-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Neil Webb <neilw-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 31.08.2017 17:55, Boris Brezillon wrote:
> Document the bindings used for the Cadence DSI bridge.
>
> Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
> Changes in v3:
> - Fix clock names in the example
> - Document how to represent DSI devices that are controller through
>   an external bus like I2C or SPI
>
> Changes in v2:
> - None
> ---
>  .../bindings/display/bridge/cdns,dsi.txt           | 109 +++++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt
> new file mode 100644
> index 000000000000..c70008bd8c0d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt
> @@ -0,0 +1,109 @@
> +Cadence DSI bridge
> +==================
> +
> +The Cadence DSI bridge is a DPI to DSI bridge supporting up to 4 DSI lanes.
> +
> +Required properties:
> +- compatible: should be set to "cdns,dsi-1.3.1".
> +- reg: physical base address and length of the controller's registers.
> +- interrupts: interrupt line connected to the DSI bridge.
> +- clocks: DSI bridge clocks.
> +- clock-names: must contain "pclk" and "sysclk".
> +- phys: phandle link to the MIPI D-PHY controller.
> +- phy-names: must contain "dphy".
> +- #address-cells: must be set to 1.
> +- #size-cells: must be set to 0.
> +
> +Required subnodes:
> +- ports: Ports as described in Documentation/devicetree/bindings/graph.txt.
> +  2 ports are available:
> +  * port 0: this port is only needed if some of your DSI devices are
> +	    controlled through  an external bus like I2C or SPI. Can have at
> +	    most 4 endpoints. The endpoint number is directly encoding the
> +	    DSI virtual channel used by this device.
> +  * port 1: represents the DPI input.
> +  Other ports will be added later to support the new kind of inputs.

I think usual practice is to use lower numbers for input ports, higher
for output ports.
Is there a reason to do it this way?

Regards
Andrzej

> +
> +- one subnode per DSI device connected on the DSI bus. Each DSI device should
> +  contain a reg property encoding its virtual channel.
> +
> +Example:
> +
> +	dsi0: dsi@fd0c0000 {
> +		compatible = "cdns,dsi-1.3.1";
> +		reg = <0x0 0xfd0c0000 0x0 0x1000>;
> +		clocks = <&pclk>, <&sysclk>;
> +		clock-names = "pclk", "sysclk";
> +		interrupts = <1>;
> +		phys = <&dphy1>;
> +		phy-names = "dphy";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@1 {
> +				reg = <1>;
> +				dsi0_dpi_input: endpoint {
> +					remote-endpoint = <&xxx_dpi_output>;
> +				};
> +			};
> +		};
> +
> +		panel: dsi-dev@0 {
> +			compatible = "<vendor,panel>";
> +			reg = <0>;
> +		};
> +	};
> +
> +or
> +
> +	dsi0: dsi@fd0c0000 {
> +		compatible = "cdns,dsi";
> +		reg = <0x0 0xfd0c0000 0x0 0x1000>;
> +		clocks = <&pclk>, <&sysclk>;
> +		clock-names = "pclk", "sysclk";
> +		interrupts = <1>;
> +		phys = <&dphy1>;
> +		phy-names = "dphy";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				dsi0_output: endpoint@0 {
> +					reg = <0>;
> +					remote-endpoint = <&dsi_panel_input>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				dsi0_dpi_input: endpoint {
> +					remote-endpoint = <&xxx_dpi_output>;
> +				};
> +			};
> +		};
> +	};
> +
> +	i2c@xxx {
> +		panel: panel@59 {
> +			compatible = "<vendor,panel>";
> +			reg = <0x59>;
> +
> +			port {
> +				dsi_panel_input: endpoint {
> +					remote-endpoint = <&dsi0_output>;
> +				};
> +			};
> +		};
> +	};


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
