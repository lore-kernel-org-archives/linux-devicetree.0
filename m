From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] usb: devio: update max count of DPs per interval for ISOC
Date: Fri, 28 Dec 2018 11:51:48 +0100
Message-ID: <20181228105148.GA22073@kroah.com>
References: <1545992864-9530-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1545992864-9530-1-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 28, 2018 at 06:27:44PM +0800, Chunfeng Yun wrote:
> The host shall be able to accept and send up to 96 DPs for
> devices operating at Gen 2 speed.

Why?  What is this keeping from working properly today?

I need a much better changelog text here in order to be able to accept
this patch.

> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/usb/core/devio.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> index a75bc0b8a50f..82c16210e34c 100644
> --- a/drivers/usb/core/devio.c
> +++ b/drivers/usb/core/devio.c
> @@ -1564,12 +1564,10 @@ static int proc_do_submiturb(struct usb_dev_state *ps, struct usbdevfs_urb *uurb
>  		}
>  		for (totlen = u = 0; u < number_of_packets; u++) {
>  			/*
> -			 * arbitrary limit need for USB 3.0
> -			 * bMaxBurst (0~15 allowed, 1~16 packets)
> -			 * bmAttributes (bit 1:0, mult 0~2, 1~3 packets)
> -			 * sizemax: 1024 * 16 * 3 = 49152
> +			 * arbitrary limit need for USB 3.1 Gen2
> +			 * sizemax: 96 DPs at SSP, 96 * 1024 = 98304
>  			 */
> -			if (isopkt[u].length > 49152) {
> +			if (isopkt[u].length > 98304) {

Are we going to have to keep bumping this up as speeds get faster and
faster?

thanks,

greg k-h
