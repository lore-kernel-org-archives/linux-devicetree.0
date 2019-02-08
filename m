From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v2 1/3] net/macb: bindings doc/trivial: fix
 documentation for sama5d3 10/100 interface
Date: Fri, 08 Feb 2019 15:20:27 -0800 (PST)
Message-ID: <20190208.152027.24602364093155878.davem@davemloft.net>
References: <20190206175610.26773-1-nicolas.ferre@microchip.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190206175610.26773-1-nicolas.ferre@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nicolas.ferre@microchip.com
Cc: alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Nicolas Ferre <nicolas.ferre@microchip.com>
Date: Wed, 6 Feb 2019 18:56:08 +0100

> This removes a line left while adding the correct compatibility string for
> sama5d3 10/100 interface. Now use the "atmel,sama5d3-macb" string.
> 
> Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to net-next.
