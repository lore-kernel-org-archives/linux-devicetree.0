From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 3/3] net: mdio: rename mdio_device reset to reset_gpio
Date: Thu, 18 Apr 2019 00:17:07 +0200
Message-ID: <20190417221707.GC32553@lunn.ch>
References: <20190417215922.30472-1-mail@david-bauer.net>
 <20190417215922.30472-4-mail@david-bauer.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190417215922.30472-4-mail@david-bauer.net>
Sender: netdev-owner@vger.kernel.org
To: David Bauer <mail@david-bauer.net>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 17, 2019 at 11:59:22PM +0200, David Bauer wrote:
> This renames the GPIO reset of mdio devices from 'reset' to
> 'reset_gpio' to better differentiate between GPIO and
> reset-controller driven reset line.
> 
> Signed-off-by: David Bauer <mail@david-bauer.net>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
