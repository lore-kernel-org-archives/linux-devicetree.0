From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [RFC PATCH v2 2/3] dt-bindings: fpga: Add bindings for ZynqMP
 nvmem driver
Date: Sun, 16 Sep 2018 15:10:33 +0100
Message-ID: <62a85f77-ee9d-e6fa-1356-9b68f65882c6@linaro.org>
References: <1536054754-3119-1-git-send-email-nava.manne@xilinx.com>
 <1536054754-3119-3-git-send-email-nava.manne@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1536054754-3119-3-git-send-email-nava.manne@xilinx.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Nava kishore Manne <nava.manne@xilinx.com>, robh+dt@kernel.org, mark.rutland@arm.com, michal.simek@xilinx.com, rajanv@xilinx.com, jollys@xilinx.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

Do you have any comments on the bindings side of it.

I would like to queue this for next release..


On 04/09/18 10:52, Nava kishore Manne wrote:
> Add documentation to describe Xilinx ZynqMP nvmem driver
> bindings.
> 
> Signed-off-by: Nava kishore Manne <nava.manne@xilinx.com>
> ---
> Changes for v2:
> 		-Moved nvmem_firmware node as a child to
> 		 firwmare node.
> 
>   .../firmware/xilinx/xlnx,zynqmp-firmware.txt       | 35 ++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt
> index 1b431d9..4b95fcc 100644
> --- a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt
> +++ b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt
> @@ -17,6 +17,19 @@ Required properties:
>   		  - "smc" : SMC #0, following the SMCCC
>   		  - "hvc" : HVC #0, following the SMCCC
>   
> +--------------------------------------------------------------------------
> +=  Zynq UltraScale+ MPSoC nvmem firmware driver binding =
> +--------------------------------------------------------------------------
> +The nvmem_firmware node provides access to the hardware related data
> +like soc revision, IDCODE... etc, By using the firmware interface.
> +
> +Required properties:
> +- compatible: should be "xlnx,zynqmp-nvmem-fw"
> +
> += Data cells =
> +Are child nodes of silicon id, bindings of which as described in
> +bindings/nvmem/nvmem.txt
> +
>   -------
>   Example
>   -------
> @@ -25,5 +38,27 @@ firmware {
>   	zynqmp_firmware: zynqmp-firmware {
>   		compatible = "xlnx,zynqmp-firmware";
>   		method = "smc";
> +		nvmem_firmware {
> +			compatible = "xlnx,zynqmp-nvmem-fw";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			/* Data cells */
> +			soc_revision: soc_revision {
> +				reg = <0x0 0x4>;
> +			};
> +		};
>   	};
>   };
> +
> += Data consumers =
> +Are device nodes which consume nvmem data cells.
> +
> +For example:
> +
> +	pcap {
> +		...
> +		nvmem-cells = <&soc_revision>;
> +		nvmem-cell-names = "soc_revision";
> +	};
> +
> 
Thanks,
srni
