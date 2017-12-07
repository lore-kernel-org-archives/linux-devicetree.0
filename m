From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 07/12] dt-bindings: Document the Rockchip MIPI RX
 D-PHY bindings
Date: Thu, 7 Dec 2017 17:26:20 -0600
Message-ID: <20171207232620.zlralmdpiw6qseb6@rob-hp-laptop>
References: <20171206111939.1153-1-jacob-chen@iotwrt.com>
 <20171206111939.1153-8-jacob-chen@iotwrt.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171206111939.1153-8-jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, zyc-TNX95d0MmH7DzftRWevZcw@public.gmane.org, eddie.cai.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org, allon.huang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, Joao.Pinto-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, Luis.Oliveira-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, Jacob Chen <jacob2.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 06, 2017 at 07:19:34PM +0800, Jacob Chen wrote:
> From: Jacob Chen <jacob2.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> 
> Add DT bindings documentation for Rockchip MIPI D-PHY RX
> 
> Signed-off-by: Jacob Chen <jacob2.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
>  .../bindings/media/rockchip-mipi-dphy.txt          | 71 ++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/rockchip-mipi-dphy.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip-mipi-dphy.txt b/Documentation/devicetree/bindings/media/rockchip-mipi-dphy.txt
> new file mode 100644
> index 000000000000..cef9450db051
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/rockchip-mipi-dphy.txt
> @@ -0,0 +1,71 @@
> +Rockchip SoC MIPI RX D-PHY
> +-------------------------------------------------------------
> +
> +Required properties:
> +
> +- compatible: value should be one of the following
> +    "rockchip,rk3288-mipi-dphy";
> +    "rockchip,rk3399-mipi-dphy";

Drop the ';'

> +- rockchip,grf: GRF regs.
> +- bus-width : maximum number of data lanes supported (SoC specific);
> +- clocks : list of clock specifiers, corresponding to entries in
> +		    clock-names property;
> +- clock-names: required clock name.
> +
> +The device node should contain two 'port' child node, according to the bindings
> +defined in Documentation/devicetree/bindings/media/video-interfaces.txt.
> +The first port should be connected to sensor nodes, and the second port should be
> +connected to isp node. The following are properties specific to those nodes.

Need to list how many endpoints if there are more than 1.

> +
> +endpoint node
> +-------------
> +
> +- data-lanes : (required) an array specifying active physical MIPI-CSI2
> +		data input lanes and their mapping to logical lanes; the
> +		array's content is unused, only its length is meaningful;
> +
> +Device node example
> +-------------------
> +
> +    mipi_dphy_rx0: mipi-dphy-rx0 {
> +        compatible = "rockchip,rk3399-mipi-dphy";
> +        clocks = <&cru SCLK_MIPIDPHY_REF>,
> +            <&cru SCLK_DPHY_RX0_CFG>,
> +            <&cru PCLK_VIO_GRF>;
> +        clock-names = "dphy-ref", "dphy-cfg", "grf";
> +        power-domains = <&power RK3399_PD_VIO>;
> +        bus-width = <4>;

rockchip,grf?

No other registers? Can you just make this a child of the grf block with 
a proper reg property for the range of dphy registers?

> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                mipi_in_wcam: endpoint@0 {
> +                    reg = <0>;
> +                    remote-endpoint = <&wcam_out>;
> +                    data-lanes = <1 2>;
> +                };
> +                mipi_in_ucam: endpoint@1 {
> +                    reg = <1>;
> +                    remote-endpoint = <&ucam_out>;
> +                    data-lanes = <1>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                dphy_rx0_out: endpoint@0 {
> +                    reg = <0>;

Don't need reg and everything associated with it if there's only 1 
endpoint. 

> +                    remote-endpoint = <&isp0_mipi_in>;
> +                };
> +            };
> +        };
> +    };
> \ No newline at end of file

Please fix.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
