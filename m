From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 06/12] dt-bindings: Document the Rockchip ISP1 bindings
Date: Thu, 7 Dec 2017 17:20:33 -0600
Message-ID: <20171207232033.itx4pvdgkyl4a5qp@rob-hp-laptop>
References: <20171206111939.1153-1-jacob-chen@iotwrt.com>
 <20171206111939.1153-7-jacob-chen@iotwrt.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171206111939.1153-7-jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, zyc-TNX95d0MmH7DzftRWevZcw@public.gmane.org, eddie.cai.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org, allon.huang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, Joao.Pinto-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, Luis.Oliveira-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, Jacob Chen <jacob2.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 06, 2017 at 07:19:33PM +0800, Jacob Chen wrote:
> From: Jacob Chen <jacob2.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> 
> Add DT bindings documentation for Rockchip ISP1
> 
> Signed-off-by: Jacob Chen <jacob2.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
>  .../devicetree/bindings/media/rockchip-isp1.txt    | 57 ++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/rockchip-isp1.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip-isp1.txt b/Documentation/devicetree/bindings/media/rockchip-isp1.txt
> new file mode 100644
> index 000000000000..0971ed94ed69
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/rockchip-isp1.txt
> @@ -0,0 +1,57 @@
> +Rockchip SoC Image Signal Processing unit v1
> +----------------------------------------------
> +
> +Rockchip ISP1 is the Camera interface for the Rockchip series of SoCs
> +which contains image processing, scaling, and compression funcitons.
> +
> +Required properties:
> +  - compatible: value should be one of the following
> +      "rockchip,rk3288-cif-isp";
> +      "rockchip,rk3399-cif-isp";
> +  - reg : offset and length of the register set for the device.
> +  - interrupts: should contain ISP interrupt.
> +  - clocks: phandle to the required clocks.
> +  - clock-names: required clock name.
> +  - iommus: required a iommu node.
> +
> +The device node should contain one 'port' child node with child 'endpoint'
> +nodes, according to the bindings defined in Documentation/devicetree/bindings/
> +media/video-interfaces.txt.
> +
> +For sensor with a parallel video bus, it could be linked directly to the isp.
> +For sensor with a MIPI CSI-2 video bus, it should be linked through the
> +MIPI-DPHY, which is defined in rockchip-mipi-dphy.txt.

As I mentioned on the last version, you need to list that there are 2 
endpoints for the port and what their assignment is.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
