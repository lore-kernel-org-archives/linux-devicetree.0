From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/3 v2] usb: host: fotg2: add device tree probing
Date: Fri, 10 Feb 2017 14:34:19 +0100
Message-ID: <20170210133419.GA8547@kroah.com>
References: <20170208200010.21522-1-ulli.kroll@googlemail.com>
 <20170208200010.21522-2-ulli.kroll@googlemail.com>
 <alpine.LNX.2.00.1702091513580.6226@T420s>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.00.1702091513580.6226@T420s>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 09, 2017 at 03:20:49PM +0100, Hans Ulli Kroll wrote:
> 
> Add device tree probe for fotg2 driver
> 
> v2:
> fix in wrong MODULE_DEVICE_TABLE
> 
> Signed-off-by: Hans Ulli Kroll <ulli.kroll@googlemail.com>
> ---
>  drivers/usb/host/fotg210-hcd.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/usb/host/fotg210-hcd.c b/drivers/usb/host/fotg210-hcd.c
> index 9d0b0518290a..2acc51b0be5a 100644
> --- a/drivers/usb/host/fotg210-hcd.c
> +++ b/drivers/usb/host/fotg210-hcd.c
> @@ -23,6 +23,7 @@
>   * Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
>   */
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/device.h>
>  #include <linux/dmapool.h>
>  #include <linux/kernel.h>
> @@ -5600,6 +5601,15 @@ static int fotg210_hcd_probe(struct platform_device *pdev)
>  	if (usb_disabled())
>  		return -ENODEV;
>  
> +	/* Right now device-tree probed devices don't get dma_mask set.
> +	 * Since shared usb code relies on it, set it here for now.
> +	 * Once we have dma capability bindings this can go away.
> +	 */
> +
> +	retval = dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> +	if (retval)
> +		goto fail_create_hcd;
> +

This change doesn't match up with what the changelog describes :(
