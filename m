From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: nvmem: Add Spreadtrum eFuse
 controller documentation
Date: Tue, 1 Oct 2019 11:32:16 +0100
Message-ID: <9da5f5f9-885f-3131-d700-e1d8e2628884@linaro.org>
References: <20f750aab0e16e45fa2d4e32843cee08395c7350.1568094534.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20f750aab0e16e45fa2d4e32843cee08395c7350.1568094534.git.baolin.wang@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>, robh+dt@kernel.org, mark.rutland@arm.com
Cc: orsonzhai@gmail.com, zhang.lyra@gmail.com, freeman.liu@unisoc.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 10/09/2019 06:52, Baolin Wang wrote:
> From: Freeman Liu <freeman.liu@unisoc.com>
> 
> This patch adds the binding documentation for Spreadtrum eFuse controller.
> 
> Signed-off-by: Freeman Liu <freeman.liu@unisoc.com>
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied both,

Thanks,
srini
> Changes from v1:
>   - Add reviewed tag from Rob.
> ---
>   .../devicetree/bindings/nvmem/sprd-efuse.txt       |   39 ++++++++++++++++++++
>   1 file changed, 39 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/nvmem/sprd-efuse.txt
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/sprd-efuse.txt b/Documentation/devicetree/bindings/nvmem/sprd-efuse.txt
> new file mode 100644
> index 0000000..96b6fee
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/sprd-efuse.txt
> @@ -0,0 +1,39 @@
> += Spreadtrum eFuse device tree bindings =
> +
> +Required properties:
> +- compatible: Should be "sprd,ums312-efuse".
> +- reg: Specify the address offset of efuse controller.
> +- clock-names: Should be "enable".
> +- clocks: The phandle and specifier referencing the controller's clock.
> +- hwlocks: Reference to a phandle of a hwlock provider node.
> +
> += Data cells =
> +Are child nodes of eFuse, bindings of which as described in
> +bindings/nvmem/nvmem.txt
> +
> +Example:
> +
> +	ap_efuse: efuse@32240000 {
> +		compatible = "sprd,ums312-efuse";
> +		reg = <0 0x32240000 0 0x10000>;
> +		clock-names = "enable";
> +		hwlocks = <&hwlock 8>;
> +		clocks = <&aonapb_gate CLK_EFUSE_EB>;
> +
> +		/* Data cells */
> +		thermal_calib: calib@10 {
> +			reg = <0x10 0x2>;
> +		};
> +	};
> +
> += Data consumers =
> +Are device nodes which consume nvmem data cells.
> +
> +Example:
> +
> +	thermal {
> +		...
> +
> +		nvmem-cells = <&thermal_calib>;
> +		nvmem-cell-names = "calibration";
> +	};
> 
