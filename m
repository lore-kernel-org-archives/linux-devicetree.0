From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH V2 2/3] ARM: kirkwood: Convert orion-nand to fdt
Date: Sat, 24 Mar 2012 19:01:00 +0000
Message-ID: <201203241901.00405.arnd@arndb.de>
References: <1332594876-8673-1-git-send-email-jm@lentin.co.uk>
 <1332594876-8673-3-git-send-email-jm@lentin.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1332594876-8673-3-git-send-email-jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Saturday 24 March 2012, Jamie Lentin wrote:
> Convert orion-nand to use fdt and add common setup to kirkwood.dtsi, including
> a default value for chip-delay (all current boards seem to use 25 anyway).
> 
> Add placeholder documentation for the bindings, for someone more knowledgable
> than me to fill in the details of the properties.

Looks very good. Two small comments:

> diff --git a/Documentation/devicetree/bindings/mtd/orion-nand.txt b/Documentation/devicetree/bindings/mtd/orion-nand.txt
> new file mode 100644
> index 0000000..d347999
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/orion-nand.txt
> @@ -0,0 +1,46 @@
> +NAND support for Marvell Orion SoC platforms
> +
> +Required properties:
> +- compatible : "mrvl,orion-nand".
> +- reg : Base physical address of the NAND and length of memory mapped
> +	region
> +
> +Optional properties:
> +- cle :
> +- ale :
> +- width :
> +- chip-delay :

I think the "width" property should be called "bank-width" to match the other
bindings.

> +Examples:
> +
> +nand@f4000000 {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	cle = <0>;
> +	ale = <1>;
> +	width = <8>;
> +	chip-delay = <25>;
> +	compatible = "mrvl,orion-nand";
> +	reg = <0xf4000000 0x400>;
> +
> +	partition@0 {
> +		label = "u-boot";
> +		reg = <0x0000000 0x100000>;
> +		read-only;
> +	};

You don't describe the partitions in the binding. Others have the same omission,
but I think it's worth mentioning. Either point to the mtd-physmap.txt file,
or make your patch move the partition support into a new file that everything
else can refer to.

	Arnd
