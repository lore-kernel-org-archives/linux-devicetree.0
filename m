From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [RESEND PATCH 1/5] usb: mtu3: avoid TX data length truncated in
 SS/SSP mode
Date: Thu, 10 May 2018 10:16:46 +0800
Message-ID: <1525918606.32173.9.camel@mhfsdcap03>
References: <3b0c7ca576fee8220d63c9914483b70b0fbc8783.1525486663.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <3b0c7ca576fee8220d63c9914483b70b0fbc8783.1525486663.git.chunfeng.yun@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, Felipe Balbi <felipe.balbi@linux.intel.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi, Greg

   Could you please pick up the series of patches, thanks a lot
 
On Sat, 2018-05-05 at 10:21 +0800, Chunfeng Yun wrote:
> The variable of 'count' is declared as u8, this will cause an issue
> due to value truncated when works in SS or SSP mode and data length
> is greater than 255, so change it as u32.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/usb/mtu3/mtu3_gadget_ep0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/mtu3/mtu3_gadget_ep0.c b/drivers/usb/mtu3/mtu3_gadget_ep0.c
> index ebdcf7a..d67b540 100644
> --- a/drivers/usb/mtu3/mtu3_gadget_ep0.c
> +++ b/drivers/usb/mtu3/mtu3_gadget_ep0.c
> @@ -546,7 +546,7 @@ static void ep0_tx_state(struct mtu3 *mtu)
>  	struct usb_request *req;
>  	u32 csr;
>  	u8 *src;
> -	u8 count;
> +	u32 count;
>  	u32 maxp;
>  
>  	dev_dbg(mtu->dev, "%s\n", __func__);
