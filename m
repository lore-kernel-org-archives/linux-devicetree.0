From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: firmware: Add bindings for ZynqMP
 firmware
Date: Tue, 30 Jan 2018 11:08:18 -0600
Message-ID: <20180130170818.tz4hoqvyekrl7uio@rob-hp-laptop>
References: <1516836074-4149-1-git-send-email-jollys@xilinx.com>
 <1516836074-4149-2-git-send-email-jollys@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1516836074-4149-2-git-send-email-jollys@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jolly Shah <jolly.shah@xilinx.com>
Cc: ard.biesheuvel@linaro.org, mingo@kernel.org, gregkh@linuxfoundation.org, matt@codeblueprint.co.uk, sudeep.holla@arm.com, hkallweit1@gmail.com, keescook@chromium.org, dmitry.torokhov@gmail.com, michal.simek@xilinx.com, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jolly Shah <jollys@xilinx.com>, Rajan Vaja <rajanv@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 24, 2018 at 03:21:11PM -0800, Jolly Shah wrote:
> Add documentation to describe Xilinx ZynqMP firmware driver
> bindings. Firmware driver provides an interface to firmware
> APIs. Interface APIs can be used by any driver to communicate
> to PMUFW (Platform Management Unit).
> 
> Signed-off-by: Jolly Shah <jollys@xilinx.com>
> Signed-off-by: Rajan Vaja <rajanv@xilinx.com>
> ---
>  .../bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt    | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt
> 
> diff --git a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt
> new file mode 100644
> index 0000000..a7aaf56
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt
> @@ -0,0 +1,16 @@
> +Xilinx Zynq MPSoC Firmware Device Tree Bindings
> +
> +The zynqmp-firmware node describes the interface to platform firmware.

Please define this a is child of /firmware.

Also, some brief summary of what functions the firmware provides would 
be nice.

> +
> +Required properties:
> + - compatible:	Must contain:  "xlnx,zynqmp-firmware"
> + - method:	The method of calling the PM-API firmware layer.
> +		Permitted values are:
> +		 - "smc" : To be used in configurations without a hypervisor
> +		 - "hvc" : To be used when hypervisor is present

Do you really need to support hvc?

> +
> +Examples:
> +	zynqmp_firmware: zynqmp-firmware {
> +		compatible = "xlnx,zynqmp-firmware";
> +		method = "smc";
> +	};
> -- 
> 2.7.4
> 
