From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH v3 01/20] usb: ehci-orion: Fix clock reference leaking
Date: Wed, 7 May 2014 11:38:48 +0200
Message-ID: <20140507113848.037bb94d@free-electrons.com>
References: <1399335255-589-2-git-send-email-gregory.clement@free-electrons.com>
	<Pine.LNX.4.44L0.1405061027490.1312-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44L0.1405061027490.1312-100000@iolanthe.rowland.org>
Sender: stable-owner@vger.kernel.org
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Dear Alan Stern,

On Tue, 6 May 2014 10:30:57 -0400 (EDT), Alan Stern wrote:

> >  err2:
> > -	if (!IS_ERR(clk))
> > -		clk_disable_unprepare(clk);
> > +	usb_put_hcd(hcd);
> 
> At this point, priv has just become a dangling pointer, because it
> points to something that was allocated along with hcd.

Right.

> > +
> > +	if (!IS_ERR(priv->clk))
> > +		clk_disable_unprepare(priv->clk);
> 
> And now you are dereferencing memory that has been deallocated.  The
> real problem is that you get and enable the clock _after_ creating hcd,
> but you don't disable it _before_ deallocating hcd.

Correct.

> 
> >  err1:
> >  	dev_err(&pdev->dev, "init %s fail, %d\n",
> >  		dev_name(&pdev->dev), err);
> > @@ -260,14 +273,14 @@ err1:
> >  static int ehci_orion_drv_remove(struct platform_device *pdev)
> >  {
> >  	struct usb_hcd *hcd = platform_get_drvdata(pdev);
> > -	struct clk *clk;
> > +	struct orion_ehci_hcd *priv = hcd_to_orion_priv(hcd);
> >  
> >  	usb_remove_hcd(hcd);
> >  	usb_put_hcd(hcd);
> >  
> > -	clk = devm_clk_get(&pdev->dev, NULL);
> > -	if (!IS_ERR(clk))
> > -		clk_disable_unprepare(clk);
> > +	if (!IS_ERR(priv->clk))
> > +		clk_disable_unprepare(priv->clk);
> 
> This has the same problem as above.

Indeed. Will fix in v4.

> Also, for both this patch and 02/20, it would be better to replace the
> "errN" labels with something more descriptive, so that it's not
> necessary to renumber them every time something changes.

Sure. I've added an additional commit prior to this patch that renames
the goto labels to something more meaningful. This will be part of v4.

Thanks for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
