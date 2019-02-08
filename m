From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v2 3/3] net: macb: add sam9x60-macb compatibility string
Date: Fri, 08 Feb 2019 15:20:41 -0800 (PST)
Message-ID: <20190208.152041.1940768604724106089.davem@davemloft.net>
References: <20190206175610.26773-1-nicolas.ferre@microchip.com>
        <20190206175610.26773-3-nicolas.ferre@microchip.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190206175610.26773-3-nicolas.ferre@microchip.com>
Sender: netdev-owner@vger.kernel.org
To: nicolas.ferre@microchip.com
Cc: alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Nicolas Ferre <nicolas.ferre@microchip.com>
Date: Wed, 6 Feb 2019 18:56:10 +0100

> Add a new compatibility string for this product. It's using
> at91sam9260-macb layout but has a newer hardware revision: it's safer
> to use its own string.
> 
> Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Applied to net-next.
