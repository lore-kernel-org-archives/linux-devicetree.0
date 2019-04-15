From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 2/3] net: phy: add support for reset-controller
Date: Mon, 15 Apr 2019 19:01:04 +0200
Message-ID: <20190415170104.GC9343@lunn.ch>
References: <20190415123840.31407-1-mail@david-bauer.net>
 <20190415123840.31407-2-mail@david-bauer.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190415123840.31407-2-mail@david-bauer.net>
Sender: netdev-owner@vger.kernel.org
To: David Bauer <mail@david-bauer.net>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 15, 2019 at 02:38:39PM +0200, David Bauer wrote:
> +static int mdiobus_register_reset(struct mdio_device *mdiodev)
> +{
> +	struct reset_control *reset = NULL;
> +
> +	if (mdiodev->dev.of_node)
> +		reset = devm_reset_control_get_exclusive(&mdiodev->dev,
> +							 "phy");
> +	if (PTR_ERR(reset) == -ENOENT ||
> +	    PTR_ERR(reset) == -ENOTSUPP)
> +		reset = NULL;
> +	else if (IS_ERR(reset))
> +		return PTR_ERR(reset);
> +
> +	mdiodev->reset_ctrl = reset;
> +
> +	/* Assert the reset signal */
> +	mdio_device_reset(mdiodev, 1);

Hi David

The mdiobus_register_gpiod() function also has a call to
mdio_device_reset(). So we end up resetting the GPIO twice.

It is probably better to pull this out of here, and
mdiobus_register_gpiod(), and do it once in mdiobus_register_device().

	  Andrew
