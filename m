From: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: msm8974: Hook up adsp-pil's xo clock
Date: Mon, 20 Feb 2017 16:00:41 -0600
Message-ID: <20170220220041.GA3170@hector>
References: <20170215045157.11659-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170215045157.11659-1-j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 15, 2017 at 05:51:56AM +0100, Jonathan Neuschäfer wrote:
> Without this patch (and with CONFIG_QCOM_ADSP_PIL), I get this error:
> 
> 	[    0.711529] qcom_adsp_pil adsp-pil: failed to get xo clock
> 	[    0.711540] remoteproc remoteproc0: releasing adsp-pil
> 
> With this patch, adsp-pil can initialize correctly.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
> 
> ---
> NOTE: I don't know if I actually chose the right clock source.
>       Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
>       suggests that adsp-pil's xo should be controlled by the RPM
>       processor; Existing devicetrees and a recent patch to msm8996.dtsi
>       use &xo_board, though:
>       https://www.spinics.net/lists/linux-arm-msm/msg25711.html
> ---
>  arch/arm/boot/dts/qcom-msm8974.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> index d3e1a61b8671..cccd8cba8872 100644
> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> @@ -250,6 +250,9 @@
>  
>  		cx-supply = <&pm8841_s2>;
>  
> +		clocks = <&xo_board>;
> +		clock-names = "xo";
> +

I have to wonder if this wasn't done specifically so that the board specific DTS
file would specify the XO clock.  If you do it here, it applies to all boards
using msm8974.

Maybe someone can answer that question.  Adding Bjorn to the CC.

Regards,

Andy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
