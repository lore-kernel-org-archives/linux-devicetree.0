From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] ARM: dts: at91: add new compatibility string for macb
 on sama5d3
Date: Mon, 17 Sep 2018 07:57:57 -0700 (PDT)
Message-ID: <20180917.075757.1999375645169903821.davem@davemloft.net>
References: <20180914154811.12090-1-nicolas.ferre@microchip.com>
        <20180914154811.12090-2-nicolas.ferre@microchip.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180914154811.12090-2-nicolas.ferre@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nicolas.ferre@microchip.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, claudiu.beznea@microchip.com, alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Nicolas Ferre <nicolas.ferre@microchip.com>
Date: Fri, 14 Sep 2018 17:48:11 +0200

> We need this new compatibility string as we experienced different behavior
> for this 10/100Mbits/s macb interface on this particular SoC.
> Backward compatibility is preserved as we keep the alternative strings.
> 
> Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Applied.
