From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH net-next 6/8] MIPS: mscc: Add switch to ocelot
Date: Fri, 23 Mar 2018 15:11:23 -0700
Message-ID: <171fb3db-70f4-4818-9390-8164fab5adca@gmail.com>
References: <20180323201117.8416-1-alexandre.belloni@bootlin.com>
 <20180323201117.8416-7-alexandre.belloni@bootlin.com>
 <e488fd29-0094-d005-a078-873f6f5add13@gmail.com>
 <20180323212230.GA12808@piout.net> <20180323213344.GV24361@lunn.ch>
 <dcac43b7-2eb7-d409-a77c-4f671a8cfc3d@gmail.com>
 <20180323220657.GY24361@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180323220657.GY24361@lunn.ch>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, "David S . Miller" <davem@davemloft.net>, Allan Nielsen <Allan.Nielsen@microsemi.com>, razvan.stefanescu@nxp.com, po.liu@nxp.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, James Hogan <jhogan@kernel.org>
List-Id: devicetree@vger.kernel.org

On 03/23/2018 03:06 PM, Andrew Lunn wrote:
>>> That is the trade off of having a standalone MDIO bus driver.  Maybe
>>> add a phandle to the internal MDIO bus? The switch driver could then
>>> follow the phandle, and direct connect the internal PHYs?
>>
>> This is more or less what patch 7 does, right?
> 
> Patch 7 does it in DT. I'm suggesting it could be done in C. It is
> hard wired, so there is no need to describe it in DT. Use the phandle
> to get the mdio bus, mdiobus_get_phy(, port) to get the phydev and
> then use phy_connect().

That does not sound like a great idea. And to go back to your example
about DSA, it is partially true, you will see some switch bindings
defining the internal PHYs (e.g: qca8k), and most not doing it (b53,
mv88e6xxx, etc.). In either case, this resolves to the same thing
though. Being able to parse a phy-handle property is a lot more
flexible, and if it does matter that the PHY truly is internal, then the
'phy-mode' property can help reflect that.
-- 
Florian
