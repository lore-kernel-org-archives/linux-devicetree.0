From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH][v2] powerpc/fsl: Add/update miscellaneous missing
 bindings
Date: Tue, 18 Feb 2014 18:20:55 -0600
Message-ID: <1392769255.6733.752.camel@snotra.buserror.net>
References: <1392276554-10368-1-git-send-email-harninder.rai@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392276554-10368-1-git-send-email-harninder.rai-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Harninder Rai <harninder.rai-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2014-02-13 at 12:59 +0530, Harninder Rai wrote:
> Missing bindings were found on running checkpatch.pl on bsc9132
> device tree. This patch add/update the following
> 
> - Add bindings for L2 cache controller
> - Add bindings for memory controller
> - Update bindings for USB controller
> 
> Signed-off-by: Harninder Rai <harninder.rai-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> Changes since base version:
> Incorporated Scott's comments
> - Rename l2cc.txt to l2cache.txt
> - Add information about ePAPR compliance
> - Add missing "cache" in compatible
> - Miscellaneous minors
> 
>  .../devicetree/bindings/powerpc/fsl/l2cache.txt    |   26 ++++++++++++++++++++
>  .../devicetree/bindings/powerpc/fsl/mem-ctrlr.txt  |   16 ++++++++++++
>  Documentation/devicetree/bindings/usb/fsl-usb.txt  |    2 +
>  3 files changed, 44 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/powerpc/fsl/l2cache.txt
>  create mode 100644 Documentation/devicetree/bindings/powerpc/fsl/mem-ctrlr.txt
> 
> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/l2cache.txt b/Documentation/devicetree/bindings/powerpc/fsl/l2cache.txt
> new file mode 100644
> index 0000000..79ef4a1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/powerpc/fsl/l2cache.txt
> @@ -0,0 +1,26 @@
> +Freescale L2 Cache Controller
> +
> +L2 cache is present in Freescale's QorIQ and QorIQ Qonverge platforms.
> +The cache bindings explained below are ePAPR compliant
> +
> +Required Properties:
> +
> +- compatible	: Should include "fsl,chip-l2-cache-controller" and "cache"
> +		  where chip is the processor (bsc9132, npc8572 etc.)
> +- reg		: Address and size of L2 cache controller registers
> +- cache-size	: Size of the entire L2 cache
> +- interrupts	: Error interrupt of L2 controller
> +
> +Optional Properties:
> +
> +- cache-line-size : Size of L2 cache lines

cache-line-size is required as per ePAPR.

> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/mem-ctrlr.txt b/Documentation/devicetree/bindings/powerpc/fsl/mem-ctrlr.txt
> new file mode 100644
> index 0000000..70b42bb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/powerpc/fsl/mem-ctrlr.txt
> @@ -0,0 +1,16 @@
> +Freescale DDR memory controller
> +
> +Properties:
> +
> +- compatible	: Should include "fsl,chip-memory-controller" where
> +		  chip is the processor (bsc9132, mpc8572 etc.)

Please also cover newer device trees that use
"fsl,qoriq-memory-controller" and don't have
"fsl,CHIP-memory-controller" (they also use a variant with the block
version, but since the block version is readable in a register I don't
think it's necessary to specify that here).

> diff --git a/Documentation/devicetree/bindings/usb/fsl-usb.txt b/Documentation/devicetree/bindings/usb/fsl-usb.txt
> index bd5723f..afa5809 100644
> --- a/Documentation/devicetree/bindings/usb/fsl-usb.txt
> +++ b/Documentation/devicetree/bindings/usb/fsl-usb.txt
> @@ -9,6 +9,8 @@ Required properties :
>   - compatible : Should be "fsl-usb2-mph" for multi port host USB
>     controllers, or "fsl-usb2-dr" for dual role USB controllers
>     or "fsl,mpc5121-usb2-dr" for dual role USB controllers of MPC5121
> +   Wherever applicable, the IP version of the USB controller should
> +   also be mentioned (for eg. fsl-usb2-dr-v2.2 for bsc9132).

Please terminate the previous sentence with a period.

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
