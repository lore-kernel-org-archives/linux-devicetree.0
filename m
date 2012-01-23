From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [RFC PATCH 6/7] ARM: mtd: nand: davinci: add OF support for
 davinci nand controller
Date: Mon, 23 Jan 2012 17:59:33 -0600
Message-ID: <4F1DF465.60206@freescale.com>
References: <1327308967-8092-1-git-send-email-hs@denx.de>
 <1327308967-8092-7-git-send-email-hs@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1327308967-8092-7-git-send-email-hs-ynQEQJNshbs@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/23/2012 02:56 AM, Heiko Schocher wrote:
> diff --git a/Documentation/devicetree/bindings/arm/davinci/nand.txt b/Documentation/devicetree/bindings/arm/davinci/nand.txt
> new file mode 100644
> index 0000000..7e8d6db
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/davinci/nand.txt
> @@ -0,0 +1,72 @@
> +* Texas Instruments Davinci NAND
> +
> +This file provides information, what the device node for the
> +davinci nand interface contain.
> +
> +Required properties:
> +- compatible: "ti,davinci-nand";
> +- reg : contain 2 offset/length values:
> +        - offset and length for the access window
> +        - offset and length for accessing the aemif control registers
> +- id: id of the controller

What does "id of the controller" mean, specfically?  From this I can't
even tell if it's a number or a string, much less how to use it
semantically.  If it's just a "match what's in the manual" thing,
perhaps an alias would be better here.  Or, if it's a value with a
specific meaning (e.g. that you need to program into a register) use a
more specific name.

> +Recommended properties :
> +- mask_ale: mask for ale
> +- mask_cle: mask for cle
> +- mask_chipsel: mask for chipselect
> +- ecc_mode: ECC mode, see NAND_ECC_* defines
> +- ecc_bits: used ECC bits
> +- options: nand options, defined in
> +           include/linux/mtd/nand.h, grep for NAND_NO_AUTOINCR
> +- bbt_options: NAND_BBT_* defines

Binding-specific properties should have a vendor prefix.  Dashes are
preferred to underscores.

Don't specify Linux internals by reference -- they could change and
invalidate existing device trees and non-Linux code that accepts them
(e.g. U-Boot).  If you want them to line up, copy the definition here,
and if Linux changes, write glue code to convert.  It would probably be
better to define specific properties for anything that must be specified
here (neither deteted dynamically nor defined by compatible =
"ti,davinci-nand").

Do all of these properties really belong here?  I can see providing some
information about ECC or BBT mode, if there are multiple conventions
already in use (or that are reasonably justifiable for different
situations), as that must agree with how the flash has already been
programmed.  How much of the rest can vary from one "ti,davinci-nand" to
another?  Maybe it's obvious to someone more familiar with davinci, but
what does "mask for ale/cle/chipselect" mean?

> +	nandflash@3,0 {

PowerPC's ePAPR document -- not directly relevant to ARM, but contains a
more recently updated list of generic names than the IEEE1275
recommended pratice -- specifies "flash@".  If you don't want to do
that, "nand@" is used in many existing trees.  Why introduce a new name?

-Scott
