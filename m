From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 01/10] dt-bindings: display: xlnx: Add Xilinx kms bindings
Date: Mon, 8 Jan 2018 22:00:11 -0600
Message-ID: <20180109040011.crwkn5j76cmdfvfm@rob-hp-laptop>
References: <1515117959-18068-1-git-send-email-hyun.kwon@xilinx.com>
 <1515117959-18068-2-git-send-email-hyun.kwon@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1515117959-18068-2-git-send-email-hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 04, 2018 at 06:05:50PM -0800, Hyun Kwon wrote:
> The dt binding for Xilinx DRM KMS driver.

Bindings are for h/w, not drivers.

> 
> Signed-off-by: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
>  .../devicetree/bindings/display/xlnx/xlnx,kms.txt    | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/xlnx/xlnx,kms.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/xlnx/xlnx,kms.txt b/Documentation/devicetree/bindings/display/xlnx/xlnx,kms.txt
> new file mode 100644
> index 0000000..8dcd552
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/xlnx/xlnx,kms.txt
> @@ -0,0 +1,20 @@
> +Xilinx KMS Pipeline
> +-------------------
> +
> +Xilinx display pipelines can be designed with hardened video IPs and soft video
> +IPs in programmable logic. This KMS module provides the common functionality
> +of individual subdevice drivers, and glue logics between them.
> +
> +Required properties:
> +
> +- compatible: Must be "xlnx,kms".
> +
> +- ports: phandles for CRTC ports, using the DT bindings defined in
> +  Documentation/devicetree/bindings/graph.txt.

This use of ports is not part of the graph binding.

> +
> +Example:
> +
> +	xlnx_drm: xlnx_drm {
> +		compatible = "xlnx,kms";

drm and kms are Linuxisms.

Why do you need this node?

> +		ports = <&crtc_port>;
> +	};
> -- 
> 2.7.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
