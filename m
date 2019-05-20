From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v5 3/3] net: ethernet: add ag71xx driver
Date: Mon, 20 May 2019 17:50:01 +0200
Message-ID: <20190520155001.GE22024@lunn.ch>
References: <20190520070716.23668-1-o.rempel@pengutronix.de>
 <20190520070716.23668-4-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190520070716.23668-4-o.rempel@pengutronix.de>
Sender: netdev-owner@vger.kernel.org
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Paul Burton <paul.burton@mips.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Jay Cliburn <jcliburn@gmail.com>, Chris Snook <chris.snook@gmail.com>, "David S. Miller" <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>, netdev@vger.kernel.org, Chuanhong Guo <gch981213@gmail.com>, info@freifunk-bad-gandersheim.net
List-Id: devicetree@vger.kernel.org

On Mon, May 20, 2019 at 09:07:16AM +0200, Oleksij Rempel wrote:
> Add support for Atheros/QCA AR7XXX/AR9XXX/QCA95XX built-in ethernet mac support
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

For the MDIO and PHY parts:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

I've not looked at the rest.

    Andrew
