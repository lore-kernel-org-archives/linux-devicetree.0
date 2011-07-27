From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] mtd: gpio-nand: add device tree bindings
Date: Wed, 27 Jul 2011 14:45:01 -0500
Message-ID: <20110727144501.7e0420cd@schlenkerla.am.freescale.net>
References: <1311775410-5158-1-git-send-email-jamie@jamieiles.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1311775410-5158-1-git-send-email-jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Artem Bityutskiy <Artem.Bityutskiy-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 27 Jul 2011 15:03:30 +0100
Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org> wrote:

> diff --git a/Documentation/devicetree/bindings/mtd/gpio-nand.txt b/Documentation/devicetree/bindings/mtd/gpio-nand.txt
> new file mode 100644
> index 0000000..98cb152
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/gpio-nand.txt
> @@ -0,0 +1,43 @@
> +GPIO assisted NAND flash
> +
> +Required properties:
> +- compatible : "gpio-nand"
> +- reg : should specify localbus chip select and size used for the chip.  For
> +  ARM platforms where a dummy read is needed to provide synchronisation with
> +  regards to bus reordering, an optional second resource describes the
> +  location to read from.

I don't see how a pure "gpio nand" device would have any memory mapped
I/O.  I think you need a more specific compatible for this.

> +Optional properties:
> +- bank-width : Width (in bytes) of the bank.  Equal to the device width times
> +  the number of interleaved chips.

Interleaved NAND chips?  Is that actually done?

> +Examples:
> +
> +gpio-nand@1,0 {
> +	compatible = "gpio-nand";
> +	reg = <1 0x0000 0x1000>;
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	gpios = <&banka 1 0	/* rdy */
> +		 &banka 2 0 	/* nce */
> +		 &banka 3 0 	/* ale */
> +		 &banka 4 0 	/* cle */
> +		 0		/* nwp */>;
> +
> +	flash {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "...";
> +
> +		partition@0 {
> +			...
> +		};
> +	};
> +};

Here you have a separate flash node underneath the gpio-nand node, but
earlier in the patch comment you show the partitions being directly under
gpio-nand, and from a quick glance it appears the latter is what the code
supports.

-Scott
