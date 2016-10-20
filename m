From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] soc: qcom: Add SoC info driver
Date: Thu, 20 Oct 2016 15:09:11 +0100
Message-ID: <20161020140911.GH10234@leverpostej>
References: <1476972386-28655-1-git-send-email-kimran@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1476972386-28655-1-git-send-email-kimran-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Imran Khan <kimran-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 20, 2016 at 07:36:22PM +0530, Imran Khan wrote:
> The SoC info driver provides information such as Chip ID,
> Chip family, serial number and other such details about
> Qualcomm SoCs.
> 
> Signed-off-by: Imran Khan <kimran-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  .../devicetree/bindings/soc/qcom/qcom,socinfo.txt  |   18 +
>  drivers/soc/qcom/socinfo.c                         | 1173 ++++++++++++++++++++
>  include/linux/soc/qcom/socinfo.h                   |  198 ++++
>  3 files changed, 1389 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,socinfo.txt
>  create mode 100644 drivers/soc/qcom/socinfo.c
>  create mode 100644 include/linux/soc/qcom/socinfo.h
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,socinfo.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,socinfo.txt
> new file mode 100644
> index 0000000..1f26299
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,socinfo.txt
> @@ -0,0 +1,18 @@
> +Qualcomm SoC Information (socinfo) Driver binding
> +
> +This binding describes the Qualcomm SoC Information Driver, which provides
> +information such as chip id, chip family, serial number and other such
> +details about Qualcomm SoCs.
> +
> +- compatible:
> +	Usage: required
> +	Value type: <stringlist>
> +	Definition: must be "qcom,socinfo"
> +
> += EXAMPLE
> +
> +The following example represents a socinfo node.
> +
> +	socinfo {
> +		compatible = "qcom,socinfo";
> +	};

Binding should describe *hardware*, not *drivers*.

This clearly does not describe a paerticular piece of hardware, and as
such does not make sense.

If this is trying to describe some paritcular hardware, please describe
that in the binding explicitly.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
