From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH v4 1/2] Documentation: dt: Add Xilinx zynqmp dma device
 tree binding documentation
Date: Mon, 24 Aug 2015 15:47:09 +0200
Message-ID: <55DB205D.7090802@metafoo.de>
References: <1438831173-8761-1-git-send-email-punnaia@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438831173-8761-1-git-send-email-punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kalluripunnaiahchoudary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kpc528-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Punnaiah Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/06/2015 05:19 AM, Punnaiah Choudary Kalluri wrote:
[...]
> +Optional properties:
> +- xlnx,include-sg: Indicates the controller to operate in simple or scatter
> +		   gather dma mode
> +- xlnx,ratectrl: Scheduling interval in terms of clock cycles for
> +		 source AXI transaction
> +- xlnx,overfetch: Tells whether the channel is allowed to over fetch the data
> +- xlnx,src-issue: Number of AXI outstanding transactions on source side
> +- xlnx,desc-axi-cohrnt: Tells whether the AXI transactions generated for the
> +			descriptor read are marked Non-coherent
> +- xlnx,src-axi-cohrnt: Tells whether the AXI transactions generated for the
> +			source descriptor payload are marked Non-coherent
> +- xlnx,dst-axi-cohrnt: Tells whether the AXI transactions generated for the
> +			dst descriptor payload are marked Non-coherent
> +- xlnx,desc-axi-qos: AXI QOS bits to be used for descriptor fetch
> +- xlnx,src-axi-qos: AXI QOS bits to be used for data read
> +- xlnx,dst-axi-qos: AXI QOS bits to be used for data write
> +- xlnx,desc-axi-cache: AXI cache bits to be used for descriptor fetch.
> +- xlnx,desc-axi-cache: AXI cache bits to be used for data read
> +- xlnx,desc-axi-cache: AXI cache bits to be used for data write
> +- xlnx,src-burst-len: AXI length for data read. Support only power of 2 values
> +		      i.e 1,2,4,8 and 16
> +- xlnx,dst-burst-len: AXI length for data write. Support only power of 2 values
> +		      i.e 1,2,4,8 and 16

None of these really belong into the devicetree. This is all runtime
configuration data.

- Lars
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
