From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v7 7/7] dt-bindings: add document for dw-hdmi
Date: Tue, 11 Nov 2014 12:24:18 +0000
Message-ID: <20141111122418.GA24306@leverpostej>
References: <1415707952-11415-1-git-send-email-andy.yan@rock-chips.com>
 <1415707952-11415-8-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1415707952-11415-8-git-send-email-andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org" <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org" <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, "djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org" <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 11, 2014 at 12:12:32PM +0000, Andy Yan wrote:
> Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
> 
> Changes in v7: None
> Changes in v6: None
> Changes in v5: None
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
> 
>  .../devicetree/bindings/drm/bridge/dw-hdmi.txt     | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/drm/bridge/dw-hdmi.txt
> 
> diff --git a/Documentation/devicetree/bindings/drm/bridge/dw-hdmi.txt b/Documentation/devicetree/bindings/drm/bridge/dw-hdmi.txt
> new file mode 100644
> index 0000000..aa7ed17
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/drm/bridge/dw-hdmi.txt
> @@ -0,0 +1,38 @@
> +DesignWare HDMI bridge bindings
> +
> +Required properities:
> +- compatibel: platform specific such as "fsl,imx6q-hdmi","fsl,imx6dl-hdmi"
> +	      "rockchip,rk3288-dw-hdmi"

s/compatibel/compatible/

This should include the _precise_ strings you expect. Please format this
as a list, e.g.

- compatible: should contain one of:
  * "fsl,imx6q-hdmi"
  * "fsl,imx6dl-hdmi"
  * "rockchip,rk3288-dw-hdmi"

> +- reg: physical base address of the controller and length
> +- ddc-i2c-bus: the ddc i2c bus
> +- interrupts: The interrupt number to the cpu

Does the device only have one interrupt? Just describe what this
logically is, and don't mention the CPU. It'll be plumbed through an
interrupt controller anyhow.

> +
> +Optional properties
> +- reg-io-width: the width of the reg:1,4, default set to 1 if not present

I don't understand this description. Could you elaborate on this?

> +
> +Example:
> +	hdmi: hdmi@0120000 {
> +		compatible = "fsl,imx6q-hdmi";
> +		reg = <0x00120000 0x9000>;
> +		interrupts = <0 115 0x04>;
> +		gpr = <&gpr>;
> +		clocks = <&clks 123>, <&clks 124>;
> +		clock-names = "iahb", "isfr";

These three properties weren't mentioned in the binding.

> +		ddc-i2c-bus = <&i2c2>;
> +
> +		port@0 {
> +			reg = <0>;
> +
> +			hdmi_mux_0: endpoint {
> +				remote-endpoint = <&ipu1_di0_hdmi>;
> +			};
> +		};

Please mention the graphics bindings that require graph info.

THanks,
Mark.

> +
> +		port@1 {
> +			reg = <1>;
> +
> +			hdmi_mux_1: endpoint {
> +				remote-endpoint = <&ipu1_di1_hdmi>;
> +			};
> +		};
> +	};
> -- 
> 1.9.1
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
