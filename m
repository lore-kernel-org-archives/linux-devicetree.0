From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2] mtd: nand: Add OX820 NAND Support
Date: Thu, 20 Oct 2016 11:00:25 +0200
Message-ID: <20161020110025.11b06090@bbrezillon>
References: <20161020084901.6486-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161020084901.6486-1-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-oxnas-Xt5XgHjqiBU06sgRBLv0+0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, daniel-g5gK2j5usbvCyp4qypjU+w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 20 Oct 2016 10:49:01 +0200
Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:

> Add NAND driver to support the Oxford Semiconductor OX820 NAND Controller.
> This is a simple memory mapped NAND controller with single chip select and
> software ECC.
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>  .../devicetree/bindings/mtd/oxnas-nand.txt         |  41 +++++
>  drivers/mtd/nand/Kconfig                           |   5 +
>  drivers/mtd/nand/Makefile                          |   1 +
>  drivers/mtd/nand/oxnas_nand.c                      | 196 +++++++++++++++++++++
>  4 files changed, 243 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/oxnas-nand.txt
>  create mode 100644 drivers/mtd/nand/oxnas_nand.c
> 
> Changes since v1 http://lkml.kernel.org/r/20161019145523.6763-1-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org :
>  - Simplify cmd_ctrl command and drop the ctrl address offset
>  - Change oxnas_nand struct name to oxnas_nand_ctrl
>  - Update DT-Bindings example to reflect the ctrl->chip->partitions hierarchy
> 
> Changes since RFC http://lkml.kernel.org/r/20161018090927.1990-1-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org :
>  - Avoid using chip->IO_ADDR*
>  - Use new DT structure
>  - Assign a chip for the subnode
>  - Use the nand_hw_control structure
>  - Cleanup probe
>  - Cleanup cmd_ctrl by using a context ctrl offset used in write_bytes
> 
> diff --git a/Documentation/devicetree/bindings/mtd/oxnas-nand.txt b/Documentation/devicetree/bindings/mtd/oxnas-nand.txt
> new file mode 100644
> index 0000000..33a77b8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/oxnas-nand.txt
> @@ -0,0 +1,41 @@
> +* Oxford Semiconductor OXNAS NAND Controller
> +
> +Please refer to nand.txt for generic information regarding MTD NAND bindings.
> +
> +Required properties:
> + - compatible: "oxsemi,ox820-nand"
> + - reg: Base address and length for NAND mapped memory.
> +
> +Optional Properties:
> + - clocks: phandle to the NAND gate clock if needed.
> + - resets: phandle to the NAND reset control if needed.
> +
> +Example:
> +
> +nand: nand-controller@41000000 {

'nandc:' or 'nand_ctrl:'

Otherwise it may conflict with a NAND chip alias.
The rest looks good, so no need to send a new version (I can fix it when
applying the patch).

One last thing, I saw there was other people owning boards with this
controller. Can I get one or two Tested-by?

Thanks taking my reviews into account.

Regards,

Boris
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
