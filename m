From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next v2 1/7] net: phy: mscc: factorize code for
 LEDs mode
Date: Tue, 04 Sep 2018 10:48:27 -0700 (PDT)
Message-ID: <20180904.104827.447303663667237271.davem@davemloft.net>
References: <20180903084853.18092-1-quentin.schulz@bootlin.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180903084853.18092-1-quentin.schulz@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: quentin.schulz@bootlin.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, andrew@lunn.ch, f.fainelli@gmail.com, allan.nielsen@microchip.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com
List-Id: devicetree@vger.kernel.org

From: Quentin Schulz <quentin.schulz@bootlin.com>
Date: Mon,  3 Sep 2018 10:48:47 +0200

> LEDs modes are set the same way, except they are offset by 4 times the
> index of the LED.
> 
> Let's factorize all the code so that it's easier to add support for the
> 4 LEDs of the VSC8584 PHY.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>

Entire series applied to net-next.

Please provide a proper "0/N ..." cover letter next time.

Thank you.
