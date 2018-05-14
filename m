From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] net: phy: micrel: workaround for errata #2 for KSZ9031
Date: Mon, 14 May 2018 14:11:35 +0200
Message-ID: <20180514121135.GB25241@lunn.ch>
References: <20180514082218.29158-1-m.felsch@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180514082218.29158-1-m.felsch@pengutronix.de>
Sender: netdev-owner@vger.kernel.org
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, Markus Niebel <Markus.Niebel@tqs.de>
List-Id: devicetree@vger.kernel.org

On Mon, May 14, 2018 at 10:22:18AM +0200, Marco Felsch wrote:
> From: Markus Niebel <Markus.Niebel@tqs.de>
> 
> handle errata #2 for KSZ9031: force 1000Base-T master
> 
> Attention: enabling the workaround will cause no link to
> other GIGE master.

Hi Marco

It would be good to document why this is needed, when to use it, what
problems it fixes, etc. At the moment, there is not enough information
to decide if you should turn it on.

   Andrew
