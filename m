From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH v2 4/7] tegra: fdt: Add NAND controller binding
	and definitions
Date: Fri, 13 Apr 2012 13:43:29 -0500
Message-ID: <4F8873D1.2010701@freescale.com>
References: <1334341777-2681-1-git-send-email-sjg@chromium.org>
	<1334341777-2681-5-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1334341777-2681-5-git-send-email-sjg@chromium.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree@theia.denx.de, Discuss <devicetree-discuss@lists.ozlabs.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

On 04/13/2012 01:29 PM, Simon Glass wrote:
> Add a NAND controller along with a bindings file for review.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> Changes in v2:
> - Update NAND binding to add "nvidia," prefix
> 
>  arch/arm/dts/tegra20.dtsi                     |    6 ++
>  doc/device-tree-bindings/nand/nvidia-nand.txt |   68 +++++++++++++++++++++++++
>  2 files changed, 74 insertions(+), 0 deletions(-)
>  create mode 100644 doc/device-tree-bindings/nand/nvidia-nand.txt
> 
> diff --git a/arch/arm/dts/tegra20.dtsi b/arch/arm/dts/tegra20.dtsi
> index bc64f42..7be0462 100644
> --- a/arch/arm/dts/tegra20.dtsi
> +++ b/arch/arm/dts/tegra20.dtsi
> @@ -200,4 +200,10 @@
>  		reg = <0x7000f400 0x200>;
>  	};
>  
> +	nand: nand-controller@0x70008000 {

s/nand-controller@/flash@/ (or "nand@" if you really want -- there's
enough of that in use already)

> +		#address-cells = <0>;
> +		#size-cells = <0>;
> +		compatible = "nvidia,tegra20-nand";
> +		reg = <0x70008000 0x100>;
> +	};
>  };
> diff --git a/doc/device-tree-bindings/nand/nvidia-nand.txt b/doc/device-tree-bindings/nand/nvidia-nand.txt
> new file mode 100644
> index 0000000..b19ce8e
> --- /dev/null
> +++ b/doc/device-tree-bindings/nand/nvidia-nand.txt
> @@ -0,0 +1,68 @@
> +NAND Flash
> +----------
> +
> +(there isn't yet a generic binding in Linux, so this describes what is in
> +U-Boot)

Ideally the binding should not be Linux-specific or U-Boot specific --
it's just the binding that describes this hardware.

> +The device node for a NAND flash device is as described in the document
> +"Open Firmware Recommended Practice : Universal Serial Bus" with the
> +following modifications and additions :
> +
> +Required properties :
> + - compatible : Should be "manufacture,device", "nand-flash"

s/manufacture/manufacturer/

No "nand-flash" compatible, as there's no standard "nand-flash" binding.
 You might want something like "nvidia,tegra20-nand-chip".

> + - nvidia,page-data-bytes : Number of bytes in the data area
> + - nvidia,page-spare-bytes : * Number of bytes in spare area
> +       spare area = skipped-spare-bytes + data-ecc-bytes + tag-bytes
> +			+ tag-ecc-bytes
> + - nvidia,skipped-spare-bytes : Number of bytes to skip at start of spare area
> +	(these are typically used for bad block maintenance)
> + - nvidia,data-ecc-bytes : Number of ECC bytes for data area
> + - nvidia,tag-bytes :Number of tag bytes in spare area
> + - nvidia,tag-ecc-bytes : Number ECC bytes to be generated for tag bytes
> +
> +(replace -bytes with -size or -length?)

I like bytes -- makes the unit clear.

> +Nvidia NAND Controller
> +----------------------
> +
> +The device node for a NAND flash controller is as described in the document
> +"Open Firmware Recommended Practice : Universal Serial Bus" with the
> +following modifications and additions :
> +
> +Optional properties:
> +
> +wp-gpio : GPIO of write-protect line, three cells in the format:
> +		phandle, parameter, flags

nvidia,nand-wp-gpio

> +nvidia,,width : bus width of the NAND device in bits

s/,,width/,nand-width/

> +For now here is something specific to the Nvidia controller, 

Isn't this whole file specific to the nvidia controller?

-Scott
