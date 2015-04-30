From: Jeffrey Hugo <jhugo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 1/2] soc: qcom: Add device tree binding for SMEM
Date: Thu, 30 Apr 2015 09:38:32 -0600
Message-ID: <55424C78.3020506@codeaurora.org>
References: <1428795178-24312-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428795178-24312-1-git-send-email-bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andry Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 4/11/2015 5:32 PM, Bjorn Andersson wrote:
> Add device tree binding documentation for the Qualcom Shared Memory
> manager.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> ---
>
> Changes since v1:
> - None
>
>   .../devicetree/bindings/soc/qcom/qcom,smem.txt     | 49 ++++++++++++++++++++++
>   1 file changed, 49 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smem.txt
>
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smem.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,smem.txt
> new file mode 100644
> index 0000000..d90f839
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smem.txt
> @@ -0,0 +1,49 @@
> +Qualcomm Shared Memory binding
> +
> +This binding describes the Qualcomm Shared Memory, used to share data between
> +various subsystems and OSes in Qualcomm platforms.
> +
> +- compatible:
> +	Usage: required
> +	Value type: <stringlist>
> +	Definition: must be:
> +		    "qcom,smem"
> +
> +- memory-region:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: handle to memory reservation for main smem memory region.
> +
> +- reg:
> +	Usage: optional
> +	Value type: <prop-encoded-array>
> +	Definition: base address and size pair for any additional memory areas
> +		    of the shared memory.
> +
> +- hwspinlocks:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: reference to a hwspinlock used to protect allocations from
> +		    the shared memory
> +
> += EXAMPLE
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		smem_region: smem@fa00000 {
> +			reg = <0xfa00000 0x200000>;
> +			no-map;
> +		};
> +	};
> +
> +	smem@fa00000 {
> +		compatible = "qcom,smem";
> +
> +		memory-region = <&smem_region>;
> +		reg = <0xfc428000 0x4000>;
> +
> +		hwlocks = <&tcsr_mutex 3>;

Just noticed, this looks like a typo.  The description of the field 
above calls it "hwspinlocks".  Would to please determine which of the 
two labels you most prefer, and change things so that label is used in 
both the description and the example?  Thanks

> +	};
>


-- 
Jeffrey Hugo
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
