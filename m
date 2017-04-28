From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC 1/3] dt-binding: soc: qcom: Add binding for RFSA
Date: Fri, 28 Apr 2017 12:42:39 -0500
Message-ID: <20170428174239.x62opv5vzx2ce2wt@rob-hp-laptop>
References: <20170422173519.5782-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170422173519.5782-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Apr 22, 2017 at 10:35:17AM -0700, Bjorn Andersson wrote:
> This adds the binding for describing shared memory buffers for
> implementing the remote filesystem protocol.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> My initial attempt was to mimic the ramoops of just adding the compatible to
> the reserved-memory node, but I have not been able to figure out a sane way of
> getting hold of the base address in the case that the memory region is
> described my a "size" only (done on some platforms).

I prefer the ramoops way.

> The problem is that we create the reserved_mem objects (and remove the
> memblocks) while we're still operating on the flattened representation, so
> without a phandle it doesn't seem like we have anything to perform the
> comparison with later on.

I'm not sure I follow.

> 
>  .../devicetree/bindings/soc/qcom/qcom,rfsa.txt     | 43 ++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,rfsa.txt
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,rfsa.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,rfsa.txt
> new file mode 100644
> index 000000000000..b4de0de74e46
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,rfsa.txt
> @@ -0,0 +1,43 @@
> +Qualcomm Remote File System Access binding
> +
> +This binding describes the Qualcomm RFSA, which serves the purpose of managing
> +the shared memory region used for remote processors to access block device data
> +using the Remote Filesystem protocol.
> +
> +- compatible:
> +	Usage: required
> +	Value type: <stringlist>
> +	Definition: must be:
> +		    "qcom,rfsa"

No versioning?

> +
> +- memory-region:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: handle to memory reservation the associated rfsa region.
> +
> +- qcom,client-id:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: identifier of the client to use this region for buffers.

What determines these numbers?

> +
> += EXAMPLE
> +The following example shows the RFSA setup for APQ8016, with the RFSA region
> +for the Hexagon DSP (id #1) located at 0x86700000.
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		rmtfs: rmtfs@86700000 {

I think you should have a compatible here even with the 2 node approach.

> +			reg = <0x0 0x86700000 0x0 0xe0000>;
> +			no-map;
> +		};
> +	};
> +
> +	hexagon-rfsa {
> +		compatible = "qcom,rfsa";
> +		memory-region = <&rmtfs>;
> +
> +		qcom,client-id = <1>;
> +	};
> -- 
> 2.12.0
> 
