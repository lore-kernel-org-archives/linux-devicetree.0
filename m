From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 05/14] DEVICETREE: Add bindings for PIC32/MZDA platforms
Date: Sun, 22 Nov 2015 15:35:05 -0600
Message-ID: <20151122213505.GA24204@rob-hp-laptop>
References: <1448065205-15762-1-git-send-email-joshua.henderson@microchip.com>
 <1448065205-15762-6-git-send-email-joshua.henderson@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1448065205-15762-6-git-send-email-joshua.henderson@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joshua Henderson <joshua.henderson@microchip.com>
Cc: linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 20, 2015 at 05:17:17PM -0700, Joshua Henderson wrote:
> This adds support for the Microchip PIC32 platform along with the
> specific variant PIC32MZDA on a PIC32MZDA Starter Kit.
> 
> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>

Acked-by: Rob Herring <robh@kernel.org>


> ---
>  .../bindings/mips/pic32/microchip,pic32mzda.txt    |   33 ++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/pic32/microchip,pic32mzda.txt
> 
> diff --git a/Documentation/devicetree/bindings/mips/pic32/microchip,pic32mzda.txt b/Documentation/devicetree/bindings/mips/pic32/microchip,pic32mzda.txt
> new file mode 100644
> index 0000000..bcf3e04
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/pic32/microchip,pic32mzda.txt
> @@ -0,0 +1,33 @@
> +* Microchip PIC32MZDA Platforms
> +
> +PIC32MZDA Starter Kit
> +Required root node properties:
> +    - compatible = "microchip,pic32mzda-sk", "microchip,pic32mzda"
> +
> +CPU nodes:
> +----------
> +A "cpus" node is required.  Required properties:
> + - #address-cells: Must be 1.
> + - #size-cells: Must be 0.
> +A CPU sub-node is also required.  Required properties:
> + - device_type: Must be "cpu".
> + - compatible: Must be "mti,mips14KEc".
> +Example:
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "mti,mips14KEc";
> +		};
> +	};
> +
> +Boot protocol

This probably belongs somewhere else if it is common.

> +--------------
> +In accordance with the MIPS UHI specification[1], the bootloader must pass the
> +following arguments to the kernel:
> + - $a0: -2.
> + - $a1: KSEG0 address of the flattened device-tree blob.
> +
> +[1] http://prplfoundation.org/wiki/MIPS_documentation
> -- 
> 1.7.9.5
> 
