From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: msm8996-pcie-phy: add support for
 msm8996 pcie phy
Date: Fri, 16 Sep 2016 08:52:20 -0500
Message-ID: <20160916135220.GA10405@rob-hp-laptop>
References: <1473245733-17260-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1473245733-17260-2-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1473245733-17260-2-git-send-email-srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 07, 2016 at 11:55:32AM +0100, Srinivas Kandagatla wrote:
> This patch adds bindings for pcie phy on MSM8996.
> 
> This PHY has 3 Ports, including a common block. Each port is connected
> to one root complex. Each port has dedicated reset control lines apart
> from common reset and clocks for common block.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  .../bindings/phy/qcom-msm8996-pcie-phy.txt         | 62 ++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom-msm8996-pcie-phy.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom-msm8996-pcie-phy.txt b/Documentation/devicetree/bindings/phy/qcom-msm8996-pcie-phy.txt
> new file mode 100644
> index 0000000..51930ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom-msm8996-pcie-phy.txt
> @@ -0,0 +1,62 @@
> +Qualcomm msm8996 pcie PHY
> +------------------------
> +
> +Required properties:
> +- compatible: compatible list, contains "qcom,msm8996-pcie-phy".

8994 has PCIe, this phy is completely different? And Archit mentioned 
another SoC, too.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
