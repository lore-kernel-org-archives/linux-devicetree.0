From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH net-next 2/3] net: phy: add amlogic g12a mdio mux support
Date: Mon, 18 Mar 2019 10:45:55 +0100
Message-ID: <c7c1af27-eb6d-d148-887c-6a069f01ad7c@baylibre.com>
References: <20190314140135.19184-1-jbrunet@baylibre.com>
 <20190314140135.19184-3-jbrunet@baylibre.com>
 <20190316025448.GD29548@lunn.ch>
 <13432d537f671c8065693b7e53348f812e8bbc04.camel@baylibre.com>
 <20190317154821.GA22226@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190317154821.GA22226@lunn.ch>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Jerome Brunet <jbrunet@baylibre.com>
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-amlogic@lists.infradead.org, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Andrew,

On 17/03/2019 16:48, Andrew Lunn wrote:
> On Sat, Mar 16, 2019 at 06:02:45PM +0100, Jerome Brunet wrote:
>> On Sat, 2019-03-16 at 03:54 +0100, Andrew Lunn wrote:
>>> On Thu, Mar 14, 2019 at 03:01:34PM +0100, Jerome Brunet wrote:
>>>>> +static int _g12a_enable_internal_mdio(struct g12a_mdio_mux *priv)
>>>
>>> You would generally use the _ prefix when you have a locked and an
>>> unlocked version. I don't see anything like this here. So please drop
>>> the _ .
>>>
>>
>> will do
>>
>>> Nice to see the generic clock framework being used. I just wonder if
>>> this is the correct place to have this clock code. Can it be made part
>>> of the SoC clock code?
>>
>> the PLL is local to this particular device.
>>
>> In 'Soc clock code' (driver/clk/meson in this case) we usually put clock
>> controllers. Those controllers feeds the different devices of the SoC but we
>> tends some more clock elements in the consumer device
>>
>> Usually, it is just a few mux, dividers and gates (like in
>> drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c) but in this case, we have
>> a PLL. IMO, it belongs here. Do you see a problem with this ?
> 
> Hi Jerome
> 
> Some maintainers like to have code in their directory structure. It
> would be good to check that the clock maintainer in happy with clock
> code under the network driver subtree. Also, the clock maintainer
> should also review this code. So please at least Cc: the clock
> maintainer and clock list on the next submission, as well as netdev. I
> personally don't know the clock code well enough to review such code.

If it can help, I also co-maintain the Amlogic Clocks drivers, and I did
not interfere with the review process in purpose, but if it can help :

For the clock code :
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Neil

> 
> 	   Andrew
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 
