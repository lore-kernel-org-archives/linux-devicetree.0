From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v2 4/7] net: phy: mscc: read
 'vsc8531,edge-slowdown' as an u32
Date: Mon, 3 Sep 2018 15:27:56 +0200
Message-ID: <20180903132756.GD4445@lunn.ch>
References: <20180903084853.18092-1-quentin.schulz@bootlin.com>
 <20180903084853.18092-4-quentin.schulz@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180903084853.18092-4-quentin.schulz@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>
Cc: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, allan.nielsen@microchip.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com
List-Id: devicetree@vger.kernel.org

On Mon, Sep 03, 2018 at 10:48:50AM +0200, Quentin Schulz wrote:
> In the DT binding, it is specified nowhere that 'vsc8531,edge-slowdown'
> is an u8, even though it's read as an u8 in the driver.

Hi Quentin

of_property_read_u8() will perform bounds checking. Is that important
here?

	Thanks
		Andrew
