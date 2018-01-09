From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net, v3] of_mdio: avoid MDIO bus removal when a PHY is
 missing
Date: Tue, 9 Jan 2018 14:58:48 +0100
Message-ID: <20180109135848.GC27447@lunn.ch>
References: <1515501814-11517-1-git-send-email-madalin.bucur@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1515501814-11517-1-git-send-email-madalin.bucur@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Madalin Bucur <madalin.bucur@nxp.com>
Cc: f.fainelli@gmail.com, davem@davemloft.net, geert+renesas@glider.be, robh+dt@kernel.org, frowand.list@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 09, 2018 at 02:43:34PM +0200, Madalin Bucur wrote:
> If one of the child devices is missing the of_mdiobus_register_phy()
> call will return -ENODEV. When a missing device is encountered the
> registration of the remaining PHYs is stopped and the MDIO bus will
> fail to register. Propagate all errors except ENODEV to avoid it.
> 
> Signed-off-by: Madalin Bucur <madalin.bucur@nxp.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
