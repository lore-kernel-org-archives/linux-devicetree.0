From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v2 1/2] soc: qcom: Add device tree binding for SMEM
Date: Thu, 23 Apr 2015 14:01:28 -0600
Message-ID: <55394F98.3060600@codeaurora.org>
References: <1428795178-24312-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1428795178-24312-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Andry Gross <agross@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 4/11/2015 5:32 PM, Bjorn Andersson wrote:
> Add device tree binding documentation for the Qualcom Shared Memory
> manager.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
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
> +	};
>

For my information, is there any intention to support the relocatable 
smem_region by looking it up at init time?  It does not seem like it 
would be possible to support that with this binding.

-- 
Jeffrey Hugo
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, a Linux Foundation Collaborative Project
