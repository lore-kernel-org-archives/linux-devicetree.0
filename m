From: David Miller <davem@davemloft.net>
Subject: Re: [PATCHv4 1/5] net: dsa: Support internal phy on 'cpu' port
Date: Wed, 17 Jan 2018 16:04:13 -0500 (EST)
Message-ID: <20180117.160413.747358293505706002.davem@davemloft.net>
References: <20180116101958.19711-1-sebastian.reichel@collabora.co.uk>
        <20180116101958.19711-2-sebastian.reichel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180116101958.19711-2-sebastian.reichel@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: sebastian.reichel@collabora.co.uk
Cc: andrew@lunn.ch, vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com, shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com, ian.ray@ge.com, nandor.han@ge.com, robh+dt@kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Date: Tue, 16 Jan 2018 11:19:54 +0100

> This adds support for enabling the internal PHY for a 'cpu' port.
> It has been tested on GE B850v3,  B650v3 and B450v3, which have a
> built-in MV88E6240 switch hardwired to a PCIe based network card
> making use of the internal PHY. Since mv88e6xxx driver resets the
> chip during probe, the PHY is disabled without this patch resulting
> in missing link and non-functional switch device.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>

Andrew, Florian, Vivien, please review.
