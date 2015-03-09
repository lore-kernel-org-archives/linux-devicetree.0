From: Bill Pringlemeir <bpringlemeir-ygJ1pmMJ17cAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 3/6] mtd: nand: vf610_nfc: add device tree bindings
Date: Mon, 09 Mar 2015 16:11:59 -0400
Message-ID: <87385eue0g.fsf@nbsps.com>
References: <1425919132-13827-1-git-send-email-stefan@agner.ch>
	<1425919132-13827-4-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marb-Z4QKGCRq86k@public.gmane.org, aaron-yuhzfaV+M/Wz3Dx2OeFgIA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On  9 Mar 2015, stefan-XLVq0VzYD2Y@public.gmane.org wrote:

> Signed-off-by: Bill Pringlemeir <bpringlemeir-ygJ1pmMJ17cAvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> ---
> .../devicetree/bindings/mtd/vf610-nfc.txt | 39 ++++++++++++++++++++++
> 1 file changed, 39 insertions(+) create mode 100644
> Documentation/devicetree/bindings/mtd/vf610-nfc.txt
>
> diff --git a/Documentation/devicetree/bindings/mtd/vf610-nfc.txt
> b/Documentation/devicetree/bindings/mtd/vf610-nfc.txt
> new file mode 100644
> index 0000000..312c872
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/vf610-nfc.txt

[snip]

> +- reg: Address range of the mtd chip 
> +- interrupts: Should contain the STMMAC interrupts 

What is 'STMMAC'?  Is that something I cribbed from another file?  Ah, I
see 'spear_smi.txt' which is an NAND driver with a 'clock-frequency'
parameter (probably before 'assigned-clocks' support).

 https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/mtd/spear_smi.txt

I don't think 'STMMAC' makes sense.

  +- interrupts: irq to be used

Maybe?  Same as mxc-nand.txt.  It is not so helpful though.

> +- nand-bus-width: see nand.txt
> +- nand-ecc-mode: see nand.txt
> +- nand-on-flash-bbt: see nand.txt 
> +- clock-frequency : Optional clock rate to NFC in Hz

I guess this changed?  We might want to put a note about what kind of
impact this might have on the bus.  Ie,

 assigned-clocks: Input SOC clock to the NAND controller.
 assigned-clock-rates: The NAND bus timing is derived from this clock
    rate and should not exceed maximum timing for any NAND memory chip
    in a board stuffing.  Typical NAND memory timings derived from this
    clock are found in the SOC hardware reference manual.
 
Originally, the reason I made this file was because the
'clock-frequency' was non-standard.  I guess it is nice to have it
anyways.

Fwiw,
Bill Pringlemeir.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
