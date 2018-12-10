From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 5/8] dt-bindings: phy: mvebu-comphy: extend the file
 to describe a3700 bindings
Date: Mon, 10 Dec 2018 17:13:59 -0600
Message-ID: <20181210231359.GA26329@bogus>
References: <20181204191730.11516-1-miquel.raynal@bootlin.com>
 <20181204191730.11516-6-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181204191730.11516-6-miquel.raynal@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Miquel Raynal <miquel.raynal@bootlin.com>
List-Id: devicetree@vger.kernel.org

On Tue,  4 Dec 2018 20:17:27 +0100, Miquel Raynal wrote:
> Current file describe COMPHY bindings for the IP available on the
> CP110 of Armada 7k/8k. Bindings are very close (and serve the same
> purpose) as the new Armada 3700 COMPHY driver so update this file to
> describe both. Also add an example of how to use this second
> compatible (same as for the ESPRESSObin).
> 
> While doing so, enhance a bit the file by adding upper case where
> needed.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../bindings/phy/phy-mvebu-comphy.txt         | 65 +++++++++++++++----
>  1 file changed, 53 insertions(+), 12 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
