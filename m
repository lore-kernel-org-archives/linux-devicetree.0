From: John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH V2 RFC 1/6] usb: dwc2: core: Avoid nonsense error in
 gadget mode
Date: Mon, 15 Aug 2016 18:30:46 -0700
Message-ID: <92280b0f-4dd3-bcf5-57ed-277a9f91653d@synopsys.com>
References: <1469559213-16160-1-git-send-email-stefan.wahren@i2se.com>
 <1469559213-16160-2-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1469559213-16160-2-git-send-email-stefan.wahren@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stefan Wahren <stefan.wahren@i2se.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eric Anholt <eric@anholt.net>, John Youn <John.Youn@synopsys.com>
Cc: Felipe Balbi <balbi@kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 7/26/2016 11:54 AM, Stefan Wahren wrote:
> In gadget mode On bcm2835 platform the host tx fifo size could be zero.
> So add zero to range and avoid such nonsense errors:
> 
> dwc2 20980000.usb: 0 invalid for host_nperio_tx_fifo_size.
> dwc2 20980000.usb: Setting host_nperio_tx_fifo_size to 0
> dwc2 20980000.usb: 0 invalid for host_perio_tx_fifo_size.
> dwc2 20980000.usb: Setting host_perio_tx_fifo_size to 0

Hi Stefan,

Are those the power on reset values of GNPTXFSIZ and HPTXFSIZ?

If these values can be 0, I think the patch is ok. But I'm not sure
about that. I can check with some hardware engineers to see under what
conditions this is possible.

Regards,
John


> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
>  drivers/usb/dwc2/core.c |   10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc2/core.c b/drivers/usb/dwc2/core.c
> index 4135a5f..5645528 100644
> --- a/drivers/usb/dwc2/core.c
> +++ b/drivers/usb/dwc2/core.c
> @@ -819,7 +819,10 @@ void dwc2_set_param_host_nperio_tx_fifo_size(struct dwc2_hsotg *hsotg, int val)
>  {
>  	int valid = 1;
>  
> -	if (val < 16 || val > hsotg->hw_params.host_nperio_tx_fifo_size)
> +	if (val && (val < 16))
> +		valid = 0;
> +
> +	if (val > hsotg->hw_params.host_nperio_tx_fifo_size)
>  		valid = 0;
>  
>  	if (!valid) {
> @@ -839,7 +842,10 @@ void dwc2_set_param_host_perio_tx_fifo_size(struct dwc2_hsotg *hsotg, int val)
>  {
>  	int valid = 1;
>  
> -	if (val < 16 || val > hsotg->hw_params.host_perio_tx_fifo_size)
> +	if (val && (val < 16))
> +		valid = 0;
> +
> +	if (val > hsotg->hw_params.host_perio_tx_fifo_size)
>  		valid = 0;
>  
>  	if (!valid) {
> 
