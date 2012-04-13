From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v2 4/7] tegra: fdt: Add NAND controller binding
	and definitions
Date: Fri, 13 Apr 2012 15:05:01 -0600
Message-ID: <4F8894FD.70307@wwwdotorg.org>
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
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>, Scott Wood <scottwood@freescale.com>
List-Id: devicetree@vger.kernel.org

On 04/13/2012 12:29 PM, Simon Glass wrote:
> Add a NAND controller along with a bindings file for review.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>

> +++ b/doc/device-tree-bindings/nand/nvidia-nand.txt

I'd prefer this be called nvidia,tegra20-nand.txt so filenames are named
according to compatible value. This makes it easier to look things up.

> +The device node for a NAND flash device is as described in the document
> +"Open Firmware Recommended Practice : Universal Serial Bus" with the

This is really based on USB?

> +Required properties :
> + - compatible : Should be "manufacture,device", "nand-flash"
> + - nvidia,page-data-bytes : Number of bytes in the data area
> + - nvidia,page-spare-bytes : * Number of bytes in spare area

Not sure what that "*" is?

> +Nvidia NAND Controller
> +----------------------
> +
> +The device node for a NAND flash controller is as described in the document
> +"Open Firmware Recommended Practice : Universal Serial Bus" with the

USB again?

> +nand-controller@0x70008000 {
> +	compatible = "nvidia,tegra20-nand";
> +	wp-gpios = <&gpio 59 0>;		/* PH3 */
> +	nvidia,width = <8>;
> +	nvidia,timing = <26 100 20 80 20 10 12 10 70>;
> +	nand@0 {
> +		compatible = "hynix,hy27uf4g2b", "nand-flash";

The TRM says there can be up to 8 chip selects. Don't the NAND device
sub-nodes need a reg property to indicate which chip-select they're on?

Also, the TRM mentions async vs. ONFI devices. Don't we need properties
somewhere to configure that kind of thing?

> +		nvidia,page-data-bytes = <2048>;
> +		nvidia,tag-ecc-bytes = <4>;
> +		nvidia,tag-bytes = <20>;
> +		nvidia,data-ecc-bytes = <36>;
> +		nvidia,skipped-spare-bytes = <4>;
> +		nvidia,page-spare-bytes = <64>;
> +	};
> +};
