Return-Path: <SRS0=cvpp=GC=gmail.com=f.fainelli@kernel.org>
Subject: Re: [PATCH v3 net-next 2/4] net: macb: Remove redundant poll irq
 assignment
References: <20180310161718.GC29174@lunn.ch>
 <20180312171001.129209-1-brad.mouring@ni.com>
 <20180312171001.129209-3-brad.mouring@ni.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <9acef349-121f-4a92-062a-65c0582730ae@gmail.com>
Date: Mon, 12 Mar 2018 10:17:26 -0700
MIME-Version: 1.0
In-Reply-To: <20180312171001.129209-3-brad.mouring@ni.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Brad Mouring <brad.mouring@ni.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>, Michael Grzeschik <m.grzeschik@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>
Cc: Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, Julia Cartwright <julia@ni.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 03/12/2018 10:09 AM, Brad Mouring wrote:
> In phy_device's general probe, this device will already be set for
> phy register polling, rendering this code redundant.
> 
> Signed-off-by: Brad Mouring <brad.mouring@ni.com>
> Suggested-by: Andrew Lunn <andrew@lunn.ch>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
