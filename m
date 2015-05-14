From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH 5/5] usb: add pxa1928 ehci support
Date: Thu, 14 May 2015 11:55:36 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1505141152300.1107-100000@iolanthe.rowland.org>
References: <1431557340-5421-6-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431557340-5421-6-git-send-email-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kishon Vijay Abraham I <kishon@ti.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 13 May 2015, Rob Herring wrote:

> Add platform driver for Marvell PXA1928 SOC. This is different from the
> mv-ehci driver in that it uses the generic phy framework, uses DT, does
> not use platform_data, is host only, and has a specific HSIC PHY and
> controller initialization handshake.

One more thing, which I had intended to include in my earlier review 
but then forgot about...

> +static int mv_ehci_probe(struct platform_device *pdev)
> +{

...

> +	hcd->phy = devm_of_phy_get(&pdev->dev, pdev->dev.of_node, NULL);
> +	if (IS_ERR_OR_NULL(hcd->phy)) {
> +		retval = PTR_ERR(hcd->phy);
> +		if (retval != -EPROBE_DEFER && retval != -ENODEV)
> +			dev_err(&pdev->dev, "failed to get the phy\n");
> +		else
> +			return -EPROBE_DEFER;
> +		goto err_put_hcd;
> +	}

Please straighten out this convoluted logic.  It should go like this:

	hcd->phy = devm_of_phy_get(&pdev->dev, pdev->dev.of_node, NULL);
	if (IS_ERR_OR_NULL(hcd->phy)) {
		retval = PTR_ERR(hcd->phy);
		if (retval == -EPROBE_DEFER || retval == -ENODEV)
			return -EPROBE_DEFER;
		dev_err(&pdev->dev, "failed to get the phy\n");
		goto err_put_hcd;
	}

Alan Stern
