From: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v8 02/34] [media] dt-bindings: Add bindings for i.MX media
 driver
Date: Thu, 8 Jun 2017 09:45:14 -0700
Message-ID: <18997640-8cbd-734d-160e-a930f887d14f@gmail.com>
References: <1496860453-6282-1-git-send-email-steve_longerbeam@mentor.com>
 <1496860453-6282-3-git-send-email-steve_longerbeam@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496860453-6282-3-git-send-email-steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob, Mark,

Are there any remaining technical issues with this
binding doc? At this point an Ack from you is the only
thing holding up merge of the imx-media driver.

Thanks,
Steve


On 06/07/2017 11:33 AM, Steve Longerbeam wrote:
> Add bindings documentation for the i.MX media driver.
> 
> Signed-off-by: Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> ---
>   Documentation/devicetree/bindings/media/imx.txt | 47 +++++++++++++++++++++++++
>   1 file changed, 47 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/imx.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/imx.txt b/Documentation/devicetree/bindings/media/imx.txt
> new file mode 100644
> index 0000000..c1e1e2b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/imx.txt
> @@ -0,0 +1,47 @@
> +Freescale i.MX Media Video Device
> +=================================
> +
> +Video Media Controller node
> +---------------------------
> +
> +This is the media controller node for video capture support. It is a
> +virtual device that lists the camera serial interface nodes that the
> +media device will control.
> +
> +Required properties:
> +- compatible : "fsl,imx-capture-subsystem";
> +- ports      : Should contain a list of phandles pointing to camera
> +		sensor interface ports of IPU devices
> +
> +example:
> +
> +capture-subsystem {
> +	compatible = "fsl,imx-capture-subsystem";
> +	ports = <&ipu1_csi0>, <&ipu1_csi1>;
> +};
> +
> +
> +mipi_csi2 node
> +--------------
> +
> +This is the device node for the MIPI CSI-2 Receiver, required for MIPI
> +CSI-2 sensors.
> +
> +Required properties:
> +- compatible	: "fsl,imx6-mipi-csi2", "snps,dw-mipi-csi2";
> +- reg           : physical base address and length of the register set;
> +- clocks	: the MIPI CSI-2 receiver requires three clocks: hsi_tx
> +		  (the D-PHY clock), video_27m (D-PHY PLL reference
> +		  clock), and eim_podf;
> +- clock-names	: must contain "dphy", "ref", "pix";
> +- port@*        : five port nodes must exist, containing endpoints
> +		  connecting to the source and sink devices according to
> +		  of_graph bindings. The first port is an input port,
> +		  connecting with a MIPI CSI-2 source, and ports 1
> +		  through 4 are output ports connecting with parallel
> +		  bus sink endpoint nodes and correspond to the four
> +		  MIPI CSI-2 virtual channel outputs.
> +
> +Optional properties:
> +- interrupts	: must contain two level-triggered interrupts,
> +		  in order: 100 and 101;
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
