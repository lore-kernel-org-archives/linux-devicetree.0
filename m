From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 4/6] edac: Document Krait L1/L2 EDAC driver binding
Date: Mon, 28 Oct 2013 18:34:55 -0700
Message-ID: <20131029013454.GJ4763@kartoffel>
References: <1383006690-6754-1-git-send-email-sboyd@codeaurora.org>
 <1383006690-6754-5-git-send-email-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1383006690-6754-5-git-send-email-sboyd@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 29, 2013 at 12:31:28AM +0000, Stephen Boyd wrote:
> The Krait L1/L2 error reporting device is made up of two
> interrupts, one per-CPU interrupt for the L1 caches and one
> interrupt for the L2 cache.
> 
> Cc: <devicetree@vger.kernel.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>  .../devicetree/bindings/arm/qcom,krait-cache-erp.txt     | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/qcom,krait-cache-erp.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,krait-cache-erp.txt b/Documentation/devicetree/bindings/arm/qcom,krait-cache-erp.txt
> new file mode 100644
> index 0000000..01fe8a8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/qcom,krait-cache-erp.txt
> @@ -0,0 +1,16 @@
> +* Qualcomm Krait L1 / L2 cache error reporting
> +
> +Required properties:
> +- compatible: Should be "qcom,krait-cache-erp"
> +- interrupts: Should contain the L1/CPU error interrupt number and
> +  then the L2 cache error interrupt number
> +
> +Optional properties:
> +- interrupt-names: Should contain the interrupt names "l1_irq" and
> +  "l2_irq"

As with my comment on the parsing code, I'd prefer that if interrupt-names was
present it defined the order of interrupts. Otherwise it's redundant and of no
value.

Otherwise, the binding looks fine to me:

Acked-by: Mark Rutland <mark.rutland@arm.com>

> +
> +Example:
> +	edac {
> +		compatible = "qcom,krait-cache-erp";
> +		interrupts = <1 9 0xf04>, <0 2 0x4>;
> +	};
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> hosted by The Linux Foundation
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
