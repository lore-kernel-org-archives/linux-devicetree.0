From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH 3/3] usb: phy-generic: Add ULPI VBUS support
Date: Tue, 3 Dec 2013 10:15:56 +0200
Message-ID: <20131203081556.GA26423@xps8300>
References: <1385967919-13258-1-git-send-email-chris.ruehl@gtsys.com.hk>
 <1385967919-13258-4-git-send-email-chris.ruehl@gtsys.com.hk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1385967919-13258-4-git-send-email-chris.ruehl@gtsys.com.hk>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Ruehl <chris.ruehl@gtsys.com.hk>
Cc: balbi@ti.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 02, 2013 at 03:05:19PM +0800, Chris Ruehl wrote:
> @@ -154,6 +164,27 @@ int usb_phy_gen_create_phy(struct device *dev, struct usb_phy_gen_xceiv *nop,
>  {
>  	int err;
>  
> +	if (nop->ulpi_vbus > 0) {
> +		unsigned int flags = 0;
> +
> +		if (nop->ulpi_vbus & 0x1)
> +			flags |= ULPI_OTG_DRVVBUS;
> +		if (nop->ulpi_vbus & 0x2)
> +			flags |= ULPI_OTG_DRVVBUS_EXT;
> +		if (nop->ulpi_vbus & 0x4)
> +			flags |= ULPI_OTG_EXTVBUSIND;
> +		if (nop->ulpi_vbus & 0x8)
> +			flags |= ULPI_OTG_CHRGVBUS;
> +
> +		nop->ulpi = otg_ulpi_create(&ulpi_viewport_access_ops, flags);
> +		if (!nop->ulpi) {
> +			dev_err(dev, "Failed create ULPI Phy\n");
> +			return -ENOMEM;
> +		}
> +		dev_dbg(dev, "Create ULPI Phy\n");
> +		nop->ulpi->io_priv =  nop->viewport;
> +	}

This is so wrong. You are registering one kind of usb phy driver from
an other. Change drivers/usb/phy/ulpi.c to be a platform device. The
whole flag system in it is pretty horrid. While you are at it, change
that so it sets the values based on boolean flags from OF properties
or platform data.

NAK for the whole set.


-- 
heikki
