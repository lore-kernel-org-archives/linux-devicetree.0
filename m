From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 2/3] net: phy: add support for reset-controller
Date: Wed, 17 Apr 2019 16:12:25 +0200
Message-ID: <20190417141225.GF25164@lunn.ch>
References: <20190417110032.17727-1-mail@david-bauer.net>
 <20190417110032.17727-3-mail@david-bauer.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190417110032.17727-3-mail@david-bauer.net>
Sender: netdev-owner@vger.kernel.org
To: David Bauer <mail@david-bauer.net>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> @@ -74,6 +90,12 @@ int mdiobus_register_device(struct mdio_device *mdiodev)
>  		err = mdiobus_register_gpiod(mdiodev);
>  		if (err)
>  			return err;

Hi David

The general style in this file is to put a blank line after returning
err.

	Andrew
