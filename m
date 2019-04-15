From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 3/3] net: mdio: rename mdio_device reset to reset_gpio
Date: Mon, 15 Apr 2019 19:02:28 +0200
Message-ID: <20190415170228.GD9343@lunn.ch>
References: <20190415123840.31407-1-mail@david-bauer.net>
 <20190415123840.31407-3-mail@david-bauer.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190415123840.31407-3-mail@david-bauer.net>
Sender: netdev-owner@vger.kernel.org
To: David Bauer <mail@david-bauer.net>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 15, 2019 at 02:38:40PM +0200, David Bauer wrote:
> This renames the GPIO reset of mdio devices from 'reset' to
> 'reset_gpio' to better differentiate between GPIO and
> reset-controller driven reset line.
> 
> Signed-off-by: David Bauer <mail@david-bauer.net>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
