From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/2] mtd: nand: dt binding documentation for
 digicolor NFC
Date: Mon, 2 Mar 2015 13:24:46 +0100
Message-ID: <20150302132446.5ee40c87@bbrezillon>
References: <fb9907fecb8b57d1b44ce03b97eb62225555de9f.1425295703.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <fb9907fecb8b57d1b44ce03b97eb62225555de9f.1425295703.git.baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Baruch,

On Mon,  2 Mar 2015 13:28:22 +0200
Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org> wrote:

> The CX92755 SoC is one of Conexant Digicolor series of SoCs. This devicetree
> binding document describes the NAND flash controller the is shared by some SoCs
> in the Digicolor series.
> 
> Not all of the properties are currently actually used by the driver.
> Specifically, the driver doesn't make use of interrupts. This may change in the
> future.
> 
> Also worth noting that the only supported ECC mode is "hw_syndrome". In the
> future the driver may add support for additional modes.
> 
> Signed-off-by: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
> ---
>  .../devicetree/bindings/mtd/digicolor-nand.txt     | 71 ++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/digicolor-nand.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/digicolor-nand.txt b/Documentation/devicetree/bindings/mtd/digicolor-nand.txt
> new file mode 100644
> index 000000000000..60e2d9085b7a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/digicolor-nand.txt
> @@ -0,0 +1,71 @@
> +Conexant Digicolor NAND Flash Controller (NFC)
> +
> +Required properties:
> +- compatible : "cnxt,cx92755-nfc".
> +- reg : shall contain registers location and length for data and reg.
> +- interrupts : shall define the nand controller interrupt.
> +- #address-cells: shall be set to 1. Encode the nand CS.
> +- #size-cells : shall be set to 0.
> +- clocks : shall reference nand controller clocks.
> +
> +Optional children nodes:
> +Children nodes represent the available nand chips.
> +
> +Required children properties:
> +- nand-ecc-mode : must be "hw_syndrome".

You could fallback to hw_syndrome when this property is not provided.
That would make it optional (and if you ever want to support other
modes, you'll just have to explicitly specify nand-ecc-mode).

> +- nand-ecc-strength : must be one of 6, 7, 8, 24, 28, 30.
> +- nand-ecc-step-size : must be either 512 or 1024.

Those 2 properties are no longer mandatory (you fallback to values
stored in _ds if they are missing).

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
