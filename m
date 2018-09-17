From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] net: macb: disable scatter-gather for macb on sama5d3
Date: Mon, 17 Sep 2018 07:58:13 -0700 (PDT)
Message-ID: <20180917.075813.1145409055019392182.davem@davemloft.net>
References: <20180914154811.12090-1-nicolas.ferre@microchip.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180914154811.12090-1-nicolas.ferre@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nicolas.ferre@microchip.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, claudiu.beznea@microchip.com, alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Nicolas Ferre <nicolas.ferre@microchip.com>
Date: Fri, 14 Sep 2018 17:48:10 +0200

> Create a new configuration for the sama5d3-macb new compatibility string.
> This configuration disables scatter-gather because we experienced lock down
> of the macb interface of this particular SoC under very high load.
> 
> Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Applied, but are you really sure it isn't just some bug in the driver
or somesuch?
