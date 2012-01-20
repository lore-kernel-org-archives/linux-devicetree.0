From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/6] tegra: fdt: Add NAND controller binding and
 definitions
Date: Thu, 19 Jan 2012 18:03:10 -0700
Message-ID: <4F18BD4E.1080702@nvidia.com>
References: <1326496256-5559-1-git-send-email-sjg@chromium.org>
 <1326496256-5559-4-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1326496256-5559-4-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Albert ARIBAUD <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/13/2012 04:10 PM, Simon Glass wrote:
> Add a NAND controller along with a bindings file for review.

A few questions to start with:

> diff --git a/doc/device-tree-bindings/nand/nvidia-nand.txt b/doc/device-tree-bindings/nand/nvidia-nand.txt

> +NAND Flash
> +----------
> +
> +(there isn't yet a generic binding in Linux, so this describes what is in
> +U-Boot)
> +
> +The device node for a NAND flash device is as described in the document
> +"Open Firmware Recommended Practice : Universal Serial Bus" with the
> +following modifications and additions :
> +
> +Required properties :
> + - compatible : Should be "manufacture,device", "nand-flash"
> + - page-data-bytes : Number of bytes in the data area
> + - page-spare-bytes : * Number of bytes in spare area
> +       spare area = skipped-spare-bytes + data-ecc-bytes + tag-bytes
> +			+ tag-ecc-bytes
> + - skipped-spare-bytes : Number of bytes to skip at start of spare area
> +	(these are typically used for bad block maintenance)
> + - data-ecc-bytes : Number of ECC bytes for data area
> + - tag-bytes :Number of tag bytes in spare area
> + - tag-ecc-bytes : Number ECC bytes to be generated for tag bytes

Are any of those values really needed?

I looked through all the NAND references I could find in the Linux
kernel in arch/*/boot/dts/* and none of them seem to have this kind of
information.

Looking at the drivers, they execute some form of identification command
on the NAND device which gives back a device ID, which is then looked up
in a table of known devices to give the information above.

I checked the Tegra NAND driver that's in the kernel chromeos-3.0
branch, and it does the same thing, albeit it open-codes some of the
identification routines rather than just calling into the common code.

Judging by arch/*/boot/dts/*, it is standard practice to have a node for
the NAND device itself though; it's used to house (optional) partition
definitions. In the kernel,
Documentation/devicetree/bindings/mtd/mtd-physmap.txt discusses the
format of these partition nodes, and e.g.
arch/powerpc/boot/dts/canyonlands.dts (amongst many) uses this on NAND.

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
> +width : bus width of the NAND device in bits
> +
> +For now here is something specific to the Nvidia controller, with naming
> +based on Nvidia's original (non-fdt) NAND driver:
> +
> + - nvidia,nand-timing : Timing parameters for the NAND. Each is in ns.
> +	Order is: MAX_TRP_TREA, TWB, Max(tCS, tCH, tALS, tALH),
> +	TWHR, Max(tCS, tCH, tALS, tALH), TWH, TWP, TRH, TADL
> +
> +	MAX_TRP_TREA is:
> +		non-EDO mode: Max(tRP, tREA) + 6ns
> +		EDO mode: tRP timing

At first glance, it seems reasonable to have this in the NAND node; it's
certainly impossible to probe the timing parameters. Since NAND is so
standardized though, I wonder if there is a standard set of timing
parameters so that we could have a standard device tree binding for this?

> +Example:
> +
> +nand-controller@0x70008000 {
> +	compatible = "nvidia,tegra20-nand";
> +	wp-gpios = <&gpio 59 0>;		/* PH3 */
> +	width = <8>;
> +	nvidia,timing = <26 100 20 80 20 10 12 10 70>;
> +	nand@0 {
> +		compatible = "hynix,hy27uf4g2b", "nand-flash";
> +		page-data-bytes = <2048>;
> +		tag-ecc-bytes = <4>;
> +		tag-bytes = <20>;
> +		data-ecc-bytes = <36>;
> +		skipped-spare-bytes = <4>;
> +		page-spare-bytes = <64>;
> +	};
> +};

-- 
nvpublic
