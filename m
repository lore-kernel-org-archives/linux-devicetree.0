From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCHv3] mtd: gpio-nand: add device tree bindings
Date: Mon, 1 Aug 2011 13:38:25 -0500
Message-ID: <20110801133825.0b4fff24@schlenkerla.am.freescale.net>
References: <1312207374-14760-1-git-send-email-jamie@jamieiles.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1312207374-14760-1-git-send-email-jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
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
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Artem Bityutskiy <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 1 Aug 2011 15:02:54 +0100
Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org> wrote:

> diff --git a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
> new file mode 100644
> index 0000000..2dc52de
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
> @@ -0,0 +1,40 @@
> +GPIO assisted NAND flash
> +
> +The GPIO assisted NAND flash uses a memory mapped interface to
> +read/write the NAND commands and data and GPIO pins for the control
> +signals.
> +
> +Required properties:
> +- compatible : "gpio-control-nand"
> +- reg : should specify localbus chip select and size used for the chip.  For
> +  ARM platforms where a dummy read is needed to provide synchronisation with
> +  regards to bus reordering, an optional second resource describes the
> +  location to read from.

Specify how the reg regions behave, such as "The first reg resource is a
byte or word that represents the NAND chip's data lines.  The io-sync
resource should be read when...".  What about endianness?

What if some other binding wants to add additional reg resources, while
still being backwards compatible with this binding?  Might be better to
move the sync into its own property -- something like "gpio-nand-io-sync =
<1>" indicating that it's in reg resource #1.  And maybe it should require
some PXA-specific compatible if io-sync is needed.  Even if another chip
requires some sort of sync hack, would it necessarily work the same?

> +- #address-cells, #size-cells : Must be present if the device has sub-nodes
> +  representing partitions.  In this case, both #address-cells and #size-cells
> +  must be equal to 1.

No support for NAND chips >= 4GiB?

> +Optional properties:
> +- bank-width : Width (in bytes) of the device.
> +- chip-delay : chip dependent delay for transferring data from array to
> +  read registers (tR).

Why optional?  If there's a default assumption, document it.

> +Examples:
> +
> +gpio-nand@1,0 {
> +	compatible = "gpio-control-nand";
> +	reg = <1 0x0000 0x1000>;

4K seems a bit large for what I'm assuming this region is for.

-Scott
