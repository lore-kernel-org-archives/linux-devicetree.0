From: Richard Leitner <richard.leitner@skidata.com>
Subject: Re: [PATCH net-next v3 1/4] phylib: Add device reset delay support
Date: Tue, 5 Dec 2017 19:06:36 +0100
Message-ID: <964bce1a-4f18-575e-1274-e5c2d877b706@skidata.com>
References: <20171205132600.13796-1-dev@g0hl1n.net>
 <20171205132600.13796-2-dev@g0hl1n.net> <20171205172852.GM12805@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171205172852.GM12805@lunn.ch>
Content-Language: de-AT
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Richard Leitner <dev@g0hl1n.net>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, fugang.duan@nxp.com, f.fainelli@gmail.com, frowand.list@gmail.com, davem@davemloft.net, geert+renesas@glider.be, sergei.shtylyov@cogentembedded.com, baruch@tkos.co.il, david.wu@rock-chips.com, lukma@denx.de, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Andrew,

On 12/05/2017 06:28 PM, Andrew Lunn wrote:
> Hi Richard
> 
>> +++ b/drivers/of/of_mdio.c
>> @@ -77,6 +77,14 @@ static int of_mdiobus_register_phy(struct mii_bus *mdio,
>>   	if (of_property_read_bool(child, "broken-turn-around"))
>>   		mdio->phy_ignore_ta_mask |= 1 << addr;
>>   
>> +	if (of_property_read_u32(child, "reset-delay-us",
>> +				 &phy->mdio.reset_delay))
>> +		phy->mdio.reset_delay = 0;
>> +
>> +	if (of_property_read_u32(child, "reset-post-delay-us",
>> +				 &phy->mdio.reset_post_delay))
>> +		phy->mdio.reset_post_delay = 0;
> 
> of_property_read_u32() should not change the variable you pass to it,
> if it does not find the property. So you can change this to:
> 
> 	phy->mdio.reset_delay = 0;
> 	phy->mdio.reset_post_delay = 0;
> 
> 	of_property_read_u32(child, "reset-delay-us",
> 			     &phy->mdio.reset_delay);
> 
> 	of_property_read_u32(child, "reset-post-delay-us",
> 			     &phy->mdio.reset_post_delay);

Geert already pointed this out, but he said it's possible to omit also 
the zeroing of the variables.

 > On 12/05/2017 02:54 PM, Geert Uytterhoeven wrote:
 >> If of_property_read_u32() fails, it doesn't write to its output
 >> parameter.
 >> As the structure should be zeroed during allocation, you can just
 >> write:
 >>
 >> of_property_read_u32(child, "reset-delay-us",&phy->mdio.reset_delay);
 >> of_property_read_u32(child, "reset-post-delay-us",
 >>                      &phy->mdio.reset_post_delay);

If that's ok I'll take the shorter (Geerts) suggestion for v4.

Nonetheless thanks for your quick feedback!

regards;Richard.L
