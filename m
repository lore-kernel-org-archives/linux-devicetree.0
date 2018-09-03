From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v2 4/7] net: phy: mscc: read
 'vsc8531,edge-slowdown' as an u32
Date: Mon, 3 Sep 2018 22:05:54 +0200
Message-ID: <20180903200554.GJ4445@lunn.ch>
References: <20180903084853.18092-1-quentin.schulz@bootlin.com>
 <20180903084853.18092-4-quentin.schulz@bootlin.com>
 <20180903132756.GD4445@lunn.ch>
 <20180903133746.wsvezy3rbdivnjfs@qschulz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180903133746.wsvezy3rbdivnjfs@qschulz>
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>
Cc: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, allan.nielsen@microchip.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com
List-Id: devicetree@vger.kernel.org

> Just to be sure, we're talking here about making sure the value stored
> in the DT is not bigger than the specified value (here an u8)? If so,
> that isn't the reason why I'm suggesting those two patches.
> 
> Without /bits 8/ in the DT property, whatever were the values I put in
> the property, I'd always get a 0. So I need to fix it either in the DT
> (but Rob does not really like it) or in the driver.

Hi Quentin

Ah, you are fixing endian issues. That was not clear to me from the
commit message.

I don't know enough about how DT stores values in the blob. Is there
type info? Can the DT core tell if a value in the blob is a u8 or a
u32?  It would be nice if it warned about reading a u8 from a u32
blob.

Anyway, this change still removes some bounds checking. Are they
important? Do they need to be added back?

Thanks
	Andrew
