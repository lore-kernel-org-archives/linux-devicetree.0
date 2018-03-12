Return-Path: <SRS0=cvpp=GC=gmail.com=f.fainelli@kernel.org>
Subject: Re: [PATCH v4 net-next 3/4] net: macb: Add phy-handle DT support
References: <20180312175956.GS27783@lunn.ch>
 <20180312213435.115174-1-brad.mouring@ni.com>
 <20180312213435.115174-4-brad.mouring@ni.com> <20180312215738.GA3674@lunn.ch>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <88aa8148-bf57-86a0-8f0d-fae7191865a6@gmail.com>
Date: Mon, 12 Mar 2018 15:30:53 -0700
MIME-Version: 1.0
In-Reply-To: <20180312215738.GA3674@lunn.ch>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>, Brad Mouring <brad.mouring@ni.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>, Michael Grzeschik <m.grzeschik@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, Julia Cartwright <julia@ni.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 03/12/2018 02:57 PM, Andrew Lunn wrote:
>> +			/* attempt to find a phy-handle */
>> +			if (!(bp->phy_node = of_parse_phandle(np, "phy-handle", 0))) {
>> +
>> +				/* fallback to standard phy registration if no phy were
>> +				 * found during dt phy registration
>> +				 */
>> +				if (!phy_find_first(bp->mii_bus)) {
>> +					for (i = 0; i < PHY_MAX_ADDR; i++) {
>> +						struct phy_device *phydev;
>> +	
>> +						phydev = mdiobus_scan(bp->mii_bus, i);
>> +						if (IS_ERR(phydev) &&
>> +						    PTR_ERR(phydev) != -ENODEV) {
>> +							ret = PTR_ERR(phydev);
>> +							break;
>> +						}
> 
> Hi Brad

I would be a bit relaxed on these warnings because the existing function
indentation really makes it easy to be over 80 columns. Unless you have
a preliminary patch which, as I was suggesting earlier, re-arranges the
branches such that if (!np) is the first thing you test, I don't see how
this can look any better...

> 
> ./scipts/checkpatch.pl ~/brad.mouring 
> WARNING: line over 80 characters
> #122: FILE: drivers/net/ethernet/cadence/macb_main.c:492:
> +		if (!(bp->phy_node = of_parse_phandle(np, "phy-handle", 0))) {
> 
> ERROR: do not use assignment in if condition
> #122: FILE: drivers/net/ethernet/cadence/macb_main.c:492:
> +		if (!(bp->phy_node = of_parse_phandle(np, "phy-handle", 0))) {
> 
> CHECK: Blank lines aren't necessary after an open brace '{'
> #123: FILE: drivers/net/ethernet/cadence/macb_main.c:493:
> +		if (!(bp->phy_node = of_parse_phandle(np, "phy-handle", 0))) {
> +
> 
> WARNING: line over 80 characters
> #124: FILE: drivers/net/ethernet/cadence/macb_main.c:494:
> +			/* fallback to standard phy registration if no phy were
> 
> ERROR: trailing whitespace
> #130: FILE: drivers/net/ethernet/cadence/macb_main.c:500:
> +^I$
> 
> WARNING: line over 80 characters
> #131: FILE: drivers/net/ethernet/cadence/macb_main.c:501:
> +					phydev = mdiobus_scan(bp->mii_bus, i);
> 
> WARNING: Too many leading tabs - consider code refactoring
> #132: FILE: drivers/net/ethernet/cadence/macb_main.c:502:
> +					if (IS_ERR(phydev) &&
> 
> etc
> 
> 	Andrew
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


-- 
Florian
