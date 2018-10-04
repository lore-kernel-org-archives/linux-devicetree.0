From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH net-next v4 11/11] net: mscc: ocelot: make use of SerDes
 PHYs for handling their configuration
Date: Thu, 4 Oct 2018 13:16:45 -0700
Message-ID: <5031bcfa-d32f-3ac7-b8b6-0deaecdc06a1@gmail.com>
References: <20181004122208.32272-1-quentin.schulz@bootlin.com>
 <20181004122208.32272-12-quentin.schulz@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181004122208.32272-12-quentin.schulz@bootlin.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>, alexandre.belloni@bootlin.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net, kishon@ti.com, andrew@lunn.ch
Cc: allan.nielsen@microchip.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, thomas.petazzoni@bootlin.com
List-Id: devicetree@vger.kernel.org

On 10/04/2018 05:22 AM, Quentin Schulz wrote:
> Previously, the SerDes muxing was hardcoded to a given mode in the MAC
> controller driver. Now, the SerDes muxing is configured within the
> Device Tree and is enforced in the MAC controller driver so we can have
> a lot of different SerDes configurations.
> 
> Make use of the SerDes PHYs in the MAC controller to set up the SerDes
> according to the SerDes<->switch port mapping and the communication mode
> with the Ethernet PHY.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
