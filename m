From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v3 01/20] usb: ehci-orion: Fix clock reference leaking
Date: Tue, 6 May 2014 10:30:57 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1405061027490.1312-100000@iolanthe.rowland.org>
References: <1399335255-589-2-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1399335255-589-2-git-send-email-gregory.clement@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Mathias Nyman <mathias.nyman@intel.com>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Felipe Balbi <balbi@ti.com>, Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Rob Herring <robh+dt@kernel.org>, stable@vger.kernel.org, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Grant Likely <grant.likely@linaro.org>, Tawfik Bayouk <tawfik@marvell.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tue, 6 May 2014, Gregory CLEMENT wrote:

> In order to disable the clock while the module was removing, a call to
> devm_clk_get() was made. This was wrong and lead to a leak module
> ref-counts.
> 
> In order to have a reference of the clock get, a private structure was
> added using the override mechanism provided by the ehci framework.
> 
> The bug was introduced in v3.6, however the ehci framework allowing to
> use the override mechanism have only been introduced in v3.8, so this
> patch won't apply before it.
> 
> Fixes: 8c869edaee07c623066266827371235fb9c12e01 ('ARM: Orion: EHCI: Add support for enabling clocks')
> Cc: <stable@vger.kernel.org> # v3.8+
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>


>  	hcd = usb_create_hcd(&ehci_orion_hc_driver,
>  			&pdev->dev, dev_name(&pdev->dev));
>  	if (!hcd) {
>  		err = -ENOMEM;
> -		goto err2;
> +		goto err1;
>  	}
>  
>  	hcd->rsrc_start = res->start;
> @@ -211,6 +215,15 @@ static int ehci_orion_drv_probe(struct platform_device *pdev)
>  	ehci->caps = hcd->regs + 0x100;
>  	hcd->has_tt = 1;
>  
> +	priv = hcd_to_orion_priv(hcd);
> +	/*
> +	 * Not all platforms can gate the clock, so it is not an error if
> +	 * the clock does not exists.
> +	 */
> +	priv->clk = devm_clk_get(&pdev->dev, NULL);
> +	if (!IS_ERR(priv->clk))
> +		clk_prepare_enable(priv->clk);
> +
>  	/*
>  	 * (Re-)program MBUS remapping windows if we are asked to.
>  	 */
> @@ -240,16 +253,16 @@ static int ehci_orion_drv_probe(struct platform_device *pdev)
>  
>  	err = usb_add_hcd(hcd, irq, IRQF_SHARED);
>  	if (err)
> -		goto err3;
> +		goto err2;
>  
>  	device_wakeup_enable(hcd->self.controller);
>  	return 0;
>  
> -err3:
> -	usb_put_hcd(hcd);
>  err2:
> -	if (!IS_ERR(clk))
> -		clk_disable_unprepare(clk);
> +	usb_put_hcd(hcd);

At this point, priv has just become a dangling pointer, because it
points to something that was allocated along with hcd.

> +
> +	if (!IS_ERR(priv->clk))
> +		clk_disable_unprepare(priv->clk);

And now you are dereferencing memory that has been deallocated.  The
real problem is that you get and enable the clock _after_ creating hcd,
but you don't disable it _before_ deallocating hcd.

>  err1:
>  	dev_err(&pdev->dev, "init %s fail, %d\n",
>  		dev_name(&pdev->dev), err);
> @@ -260,14 +273,14 @@ err1:
>  static int ehci_orion_drv_remove(struct platform_device *pdev)
>  {
>  	struct usb_hcd *hcd = platform_get_drvdata(pdev);
> -	struct clk *clk;
> +	struct orion_ehci_hcd *priv = hcd_to_orion_priv(hcd);
>  
>  	usb_remove_hcd(hcd);
>  	usb_put_hcd(hcd);
>  
> -	clk = devm_clk_get(&pdev->dev, NULL);
> -	if (!IS_ERR(clk))
> -		clk_disable_unprepare(clk);
> +	if (!IS_ERR(priv->clk))
> +		clk_disable_unprepare(priv->clk);

This has the same problem as above.

Also, for both this patch and 02/20, it would be better to replace the
"errN" labels with something more descriptive, so that it's not
necessary to renumber them every time something changes.

Alan Stern
