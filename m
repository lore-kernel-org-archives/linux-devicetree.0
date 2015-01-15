From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: at91: dts: sama5d3/sama5d4: reduce NFC command
 registers memory region
Date: Thu, 15 Jan 2015 09:45:27 +0100
Message-ID: <20150115094527.3fde882a@bbrezillon>
References: <1421305683-8739-1-git-send-email-josh.wu@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421305683-8739-1-git-send-email-josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Josh,

On Thu, 15 Jan 2015 15:08:03 +0800
Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org> wrote:

> To get NFC status, we need to read the NFC command registers, which is a
> 256M memory mapping address. To check the status, you just read such
> address from NFC command registers.
> For example, to check NFCBUSY (bit 27), you need to read 0x08000000
> (bit 27 is set to 1) of the NFC command register.
> If you want to check NFCBUSY (bit 27) and NFCWR (bit 26) in same time,
> you need to read 0x0c000000 (bit 27 and bit 26 are set to 1).

Are NFCBUSY and NFCWR found in NFCDATA_STATUS and those found in HSMC_SR
representing the same thing.
If they are, I think you can just use HSMC_SR instead of NFCDATA_STATUS
to check the status [1] and drop the last bit in the NFC Command
Resgiters range.

> 
> But mapping such huge memory address only for multiple NFC status check
> is not very economic.
> 
> The economic way is we check the NFC status one bit a time, then we don't
> have to mapping such huge address.
> 
> Now we reduce the memory mapping from 256M to 128M+4 (include 0x08000000),
> the only difference is NFCBUSY (bit 27) status. You cannot check NFCBUSY
> bit with other NFC status bit.
> 
> Since current atmel_nand driver check the NFCBUSY status without combine
> other bits, so this change (reduce 256M to 128M+4) will not be harmful.
> 
> Signed-off-by: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> 
> ---
> 
>  arch/arm/boot/dts/sama5d3.dtsi | 2 +-
>  arch/arm/boot/dts/sama5d4.dtsi | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/sama5d3.dtsi b/arch/arm/boot/dts/sama5d3.dtsi
> index d701ddd..d243732 100644
> --- a/arch/arm/boot/dts/sama5d3.dtsi
> +++ b/arch/arm/boot/dts/sama5d3.dtsi
> @@ -1426,7 +1426,7 @@
>  				#address-cells = <1>;
>  				#size-cells = <1>;
>  				reg = <
> -					0x70000000 0x10000000	/* NFC Command Registers */
> +					0x70000000 0x08000004	/* NFC Command Registers */

This would give the following range:

					0x70000000 0x08000000


Best Regards,

Boris

[1]http://code.bulix.org/2noozv-87724


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
