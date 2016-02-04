From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 0/5] mtd: atmel_nand: Add support for NAND Flash on
 SAMA5D2
Date: Thu, 4 Feb 2016 14:33:40 +0100
Message-ID: <20160204143340.1ffa2292@bbrezillon>
References: <1454322360-8666-1-git-send-email-romain.izard.pro@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454322360-8666-1-git-send-email-romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Josh Wu <rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Yang Wenyou <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Romain,

Just a remark that is not directly related to your work: when people
take the time to review your work, try to keep them in Cc of the
following versions of your patchset.

On Mon,  1 Feb 2016 11:25:55 +0100
Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> The NAND Flash controller for SAMA5D2 has small differences that make it
> impossible to use the existing driver for SAMA5D3. This patchset uses the
> device tree's compatible string to get those differences, and the code is
> slightly modified to handle them.
> 
> Base on linux-mtd-next, commit 15c0be7bec002f9a529dd0966d0db96dde176fd0
> 
> See previous revisions to apply on the Atmel Linux 4.1 branch.
> 
> Compile tested for sama5_defconfig, and tested on SAMA5D3xek as there is no
> existing SAMA5D2 board with NAND Flash memory (yet).

Overall, it looks good to me (even if I don't fully agree on how you
decided to define NFC_SR_RB_EDGEX values :-P, but that's just a
nitpick).

Reviewed-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

> 
> V3 -> V2:
> - Rebase on linux-mtd-next
> - Skip patches already in the tree
> 
> V2 -> V1:
> - Rebase on v4.4
> - Use of_device_get_match_data
> - Split message cleanup
> - Reword a small part of the atmel_nand device tree binding
> - Use 'caps' for all private data structures
> 
> RFC -> V1:
> - Split the support of 32-bit ECC on SAMA5D2 in two commits
> - Fix the missing ECC strength configuration code
> 
> Romain Izard (5):
>   mtd: atmel_nand: Support variable RB_EDGE interrupts
>   dt-bindings: atmel_nand: Reword the documenation
>   mtd: atmel_nand: Support PMECC on SAMA5D2
>   mtd: atmel_nand: Support 32-bit ECC strength
>   ARM: at91/dt: sama5d2: add nand0 and nfc0 nodes
> 
>  .../devicetree/bindings/mtd/atmel-nand.txt         | 31 +++++----
>  arch/arm/boot/dts/sama5d2.dtsi                     | 38 +++++++++++
>  drivers/mtd/nand/atmel_nand.c                      | 77 ++++++++++++++++++----
>  drivers/mtd/nand/atmel_nand_ecc.h                  |  9 ++-
>  drivers/mtd/nand/atmel_nand_nfc.h                  |  3 +-
>  5 files changed, 131 insertions(+), 27 deletions(-)
> 



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
