From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [RFC/PATCH 1/2] doc: bindings: Add bindings documentation for
 mtd otp nvmem
Date: Thu, 26 May 2016 10:04:06 +0200
Message-ID: <20160526100406.783c6f2d@bbrezillon>
References: <1464211607-8843-1-git-send-email-moritz.fischer@ettus.com>
	<1464211607-8843-2-git-send-email-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464211607-8843-2-git-send-email-moritz.fischer@ettus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: dwmw2@infradead.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, computersforpeace@gmail.com
List-Id: devicetree@vger.kernel.org

Hi Moritz,

On Wed, 25 May 2016 14:26:46 -0700
Moritz Fischer <moritz.fischer@ettus.com> wrote:

> This commit adds documentation describing the bindings for
> exposing mtd flash otp regions as nvmem providers via devicetree.
> 
> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
> ---
>  .../devicetree/bindings/mtd/otp-nvmem.txt          | 62 ++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/otp-nvmem.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/otp-nvmem.txt b/Documentation/devicetree/bindings/mtd/otp-nvmem.txt
> new file mode 100644
> index 0000000..a83a7da
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/otp-nvmem.txt
> @@ -0,0 +1,62 @@
> +Representing OTP regions in devicetree
> +
> +OTP regions can be represented by sub-nodes of an mtd device.
> +
> +The partition table should be a subnode of the mtd node and should be names
> +'otp-partitions'. This node should have the following property:
> +
> +- compatible: (required) must be 'fixed-partitions'
> +
> +OTP regions are then defined in subnodes of the partitions node.
> +
> +Required properties for OTP regions:
> +- reg: The region's offset and size within the mtd device
> +
> +Optional properties:
> +- label: The label / name for this region. If ommited, the label is taken
> +  from the node name (excluding the unit address).
> +
> +Example:
> +
> +flash@0 {
> +	partitions {
> +		compatible = "fixed-partitions";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		partition@0 {
> +			label = "uboot-spl";
> +			reg = <0x0 0xe0000>;
> +		};
> +		partition@1 {
> +			label = "uboot-env";
> +			reg = <0xe0000 0x20000>;
> +		};
> +		partition@2 {
> +			label = "uboot";
> +			reg = <0x100000 0x100000>;
> +		};
> +	};
> +
> +	otp-partitions {
> +		compatible = "fixed-partitions";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		region@0 {
> +			label = "factory-data";
> +			reg = <0x0 0x40>;
> +
> +			#address-cells = <0x1>;
> +			#size-cells = <0x1>;
> +
> +			product: nvmem@0 {
> +				reg = <0x0 0x2>;
> +			};
> +
> +			revision: nvmem@3 {
> +				reg = <0x3 0x2>;
> +			};
> +		};
> +	};
> +}

I think the MTD partition -> nvmem connection could benefit to non-OTP
partitions too.

So, how about defining the nvmem regions under the partition nodes,
like that:

flash@0 {
	partitions {
		compatible = "fixed-partitions";
		#address-cells = <1>;
		#size-cells = <1>;

		partition@0 {
			label = "uboot-spl";
			reg = <0x0 0xe0000>;
		};

		/* ... */

		partition@X{
			label = "factory-data-part";
			reg = <0x200000 0x100000>;
			#address-cells = <1>;
			#size-cells = <1>;

			product: nvmem@0 {
				reg = <0x0 0x2>;
			};

			revision: nvmem@3 {
				reg = <0x3 0x2>;
			};
		};
	};

	otp-partitions {
		compatible = "fixed-partitions";
		#address-cells = <1>;
		#size-cells = <1>;

		partition@X{
			label = "factory-data-part";
			reg = <0x0 0x40>;
			#address-cells = <1>;
			#size-cells = <1>;

			product: nvmem@0 {
				reg = <0x0 0x2>;
			};

			revision: nvmem@3 {
				reg = <0x3 0x2>;
			};
		};
	};
};

I know this requires changing the implementation to select the
appropriate nvmem wrapper to use depending on whether we're interfacing
with an OTP area or a regular one, but that should be doable.

Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
