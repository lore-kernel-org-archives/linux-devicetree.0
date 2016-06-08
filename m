From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH] ehci-platform: Add support for shared reset controllers
Date: Wed, 8 Jun 2016 13:47:45 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1606081346340.2191-100000@iolanthe.rowland.org>
References: <1465404880-28374-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1465404880-28374-1-git-send-email-hdegoede@redhat.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: devicetree <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb <linux-usb@vger.kernel.org>, Tony Prisk <linux@prisktech.co.nz>, Philipp Zabel <p.zabel@pengutronix.de>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, 8 Jun 2016, Hans de Goede wrote:

> Add support for shared platform controllers by using
> devm_reset_control_get_shared_by_index instead of
> of_reset_control_get_by_index.
> 
> Note we use the devm function because there is no
> of_reset_control_get_shared_by_index, this also leads
> to a nice cleanup of the cleanup code.
> 
> This brings the ehci-platform reset handling code inline
> with ohci-platform.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---

This is just the difference between what Greg has merged and what you 
wanted to add, right?  If so, then

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

>  drivers/usb/host/ehci-platform.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
> index bc33f45..6816b8c 100644
> --- a/drivers/usb/host/ehci-platform.c
> +++ b/drivers/usb/host/ehci-platform.c
> @@ -236,8 +236,8 @@ static int ehci_platform_probe(struct platform_device *dev)
>  	}
>  
>  	for (rst = 0; rst < EHCI_MAX_RSTS; rst++) {
> -		priv->rsts[rst] = of_reset_control_get_by_index(
> -					dev->dev.of_node, rst);
> +		priv->rsts[rst] = devm_reset_control_get_shared_by_index(
> +					&dev->dev, rst);
>  		if (IS_ERR(priv->rsts[rst])) {
>  			err = PTR_ERR(priv->rsts[rst]);
>  			if (err == -EPROBE_DEFER)
> @@ -247,10 +247,8 @@ static int ehci_platform_probe(struct platform_device *dev)
>  		}
>  
>  		err = reset_control_deassert(priv->rsts[rst]);
> -		if (err) {
> -			reset_control_put(priv->rsts[rst]);
> +		if (err)
>  			goto err_reset;
> -		}
>  	}
>  
>  	if (pdata->big_endian_desc)
> @@ -307,10 +305,8 @@ err_power:
>  	if (pdata->power_off)
>  		pdata->power_off(dev);
>  err_reset:
> -	while (--rst >= 0) {
> +	while (--rst >= 0)
>  		reset_control_assert(priv->rsts[rst]);
> -		reset_control_put(priv->rsts[rst]);
> -	}
>  err_put_clks:
>  	while (--clk >= 0)
>  		clk_put(priv->clks[clk]);
> @@ -335,10 +331,8 @@ static int ehci_platform_remove(struct platform_device *dev)
>  	if (pdata->power_off)
>  		pdata->power_off(dev);
>  
> -	for (rst = 0; rst < EHCI_MAX_RSTS && priv->rsts[rst]; rst++) {
> +	for (rst = 0; rst < EHCI_MAX_RSTS && priv->rsts[rst]; rst++)
>  		reset_control_assert(priv->rsts[rst]);
> -		reset_control_put(priv->rsts[rst]);
> -	}
>  
>  	for (clk = 0; clk < EHCI_MAX_CLKS && priv->clks[clk]; clk++)
>  		clk_put(priv->clks[clk]);
> 
