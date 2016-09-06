From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH RESEND] ARM: dts: ls1021a: Add of_graph dt nodes to
 describe the panel
Date: Tue, 06 Sep 2016 11:32:31 -0700
Message-ID: <7a10161e5c9d546ac81acbf3de475b75@agner.ch>
References: <1473155134-36896-1-git-send-email-meng.yi@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473155134-36896-1-git-send-email-meng.yi-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Meng Yi <meng.yi-3arQi8VN3Tc@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2016-09-06 02:45, Meng Yi wrote:
> add of_graph dt nodes to describe the panel, and removed
> "fsl,panel" property
> 
> Signed-off-by: Meng Yi <meng.yi-3arQi8VN3Tc@public.gmane.org>

Shawn, the changes required to the DCU driver made it into v4.8, so this
can be applied now. I will send out a patch which does the same
conversion for the remaining boards.

Acked-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>

--
Stefan

> ---
>  arch/arm/boot/dts/ls1021a-twr.dts | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/ls1021a-twr.dts
> b/arch/arm/boot/dts/ls1021a-twr.dts
> index 75ecaed..a8b148a 100644
> --- a/arch/arm/boot/dts/ls1021a-twr.dts
> +++ b/arch/arm/boot/dts/ls1021a-twr.dts
> @@ -108,12 +108,23 @@
>  
>  	panel: panel {
>  		compatible = "nec,nl4827hc19-05b";
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&dcu_out>;
> +			};
> +		};
>  	};
>  };
>  
>  &dcu {
> -	fsl,panel = <&panel>;
>  	status = "okay";
> +
> +	port {
> +		dcu_out: endpoint {
> +			remote-endpoint = <&panel_in>;
> +		};
> +	};
>  };
>  
>  &dspi1 {
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
