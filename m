From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH v3 4/7] tegra: fdt: Add NAND controller binding
	and definitions
Date: Tue, 17 Apr 2012 14:06:56 -0500
Message-ID: <4F8DBF50.5060700@freescale.com>
References: <1334688614-4977-1-git-send-email-sjg@chromium.org>
	<1334688614-4977-5-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1334688614-4977-5-git-send-email-sjg@chromium.org>
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

On 04/17/2012 01:50 PM, Simon Glass wrote:
> diff --git a/doc/device-tree-bindings/nand/nvidia,tegra20-nand.txt b/doc/device-tree-bindings/nand/nvidia,tegra20-nand.txt
> new file mode 100644
> index 0000000..2484556
> --- /dev/null
> +++ b/doc/device-tree-bindings/nand/nvidia,tegra20-nand.txt
> @@ -0,0 +1,68 @@
> +NAND Flash
> +----------
> +
> +(there isn't yet a generic binding in Linux, so this describes what is in
> +U-Boot. There should not be Linux-specific or U-Boot specific binding, just
> +a binding that describes this hardware. But agreeing a binding in Linux in
> +the absence of a driver may be beyond my powers.)
> +
> +The device node for a NAND flash device is as follows:
> +
> +Required properties :
> + - compatible : Should be "manufacturer,device", "nand-flash"

Again, "nand-flash" is not an appropriate compatible.  There is no
generic nand-flash binding.

> + - nvidia,page-data-bytes : Number of bytes in the data area
> + - nvidia,page-spare-bytes : Number of bytes in spare area
> +       spare area = skipped-spare-bytes + data-ecc-bytes + tag-bytes
> +			+ tag-ecc-bytes

Do you really need this stuff to be in the device tree?  You should be
able to determine this information from the ID table.

> + - nvidia,skipped-spare-bytes : Number of bytes to skip at start of spare area
> +	(these are typically used for bad block maintenance)

So this binding can't deal with the bad block marker being somewhere
other than the beginning of the spare area (e.g. 8-bit small page NAND)?

> + - nvidia,data-ecc-bytes : Number of ECC bytes for data area

Number of ECC bytes per page?  Number of ECC bytes per ECC block?
Number of data bytes per ECC block?

> + - nvidia,tag-bytes :Number of tag bytes in spare area

What are tag bytes?

> +Nvidia NAND Controller
> +----------------------
> +
> +The device node for a NAND flash controller is as follows:
> +
> +Optional properties:
> +
> +nvidia,wp-gpios : GPIO of write-protect line, three cells in the format:
> +		phandle, parameter, flags

Doesn't the number of cells depend on the GPIO controller binding?

> +nvidia,nand-width : bus width of the NAND device in bits
> +
> + - nvidia,nand-timing : Timing parameters for the NAND. Each is in ns.
> +	Order is: MAX_TRP_TREA, TWB, Max(tCS, tCH, tALS, tALH),
> +	TWHR, Max(tCS, tCH, tALS, tALH), TWH, TWP, TRH, TADL

Might want to point out that there's one cell per timing parameter.

-Scott
