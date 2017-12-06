From: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH net-next v3 4/4] net: fec: add
 phy_reset_after_clk_enable() support
Date: Wed, 6 Dec 2017 09:12:14 +0100
Message-ID: <1e7b3e7f-251d-4101-1441-702e891f2ca9@skidata.com>
References: <20171205132600.13796-1-dev@g0hl1n.net>
 <20171205132600.13796-5-dev@g0hl1n.net>
 <DB6PR0401MB2264B5060F745CEB5405FFBCFF320@DB6PR0401MB2264.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <DB6PR0401MB2264B5060F745CEB5405FFBCFF320-2mNvjAGDOPl4towakvZX7o3W/0Ik+aLCnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Duan <fugang.duan-3arQi8VN3Tc@public.gmane.org>, Richard Leitner <dev-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "andrew-g2DYL2Zd6BY@public.gmane.org" <andrew-g2DYL2Zd6BY@public.gmane.org>, "f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, "geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org" <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, "sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org" <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, "baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org" <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>, "david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org" <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "lukma-ynQEQJNshbs@public.gmane.org" <lukma-ynQEQJNshbs@public.gmane.org>, "netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Andy,

On 12/06/2017 02:50 AM, Andy Duan wrote:
> From: Richard Leitner <dev-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org> Sent: Tuesday, December 05, 2017 9:26 PM
>> Some PHYs (for example the SMSC LAN8710/LAN8720) doesn't allow turning
>> the refclk on and off again during operation (according to their datasheet).
>> Nonetheless exactly this behaviour was introduced for power saving reasons
>> by commit e8fcfcd5684a ("net: fec: optimize the clock management to save
>> power").
>> Therefore add support for the phy_reset_after_clk_enable function from
>> phylib to mitigate this issue.

...

>> diff --git a/drivers/net/ethernet/freescale/fec_main.c
>> b/drivers/net/ethernet/freescale/fec_main.c
>> index 610573855213..8c3d0fb7db20 100644
>> --- a/drivers/net/ethernet/freescale/fec_main.c
>> +++ b/drivers/net/ethernet/freescale/fec_main.c
>> @@ -1862,6 +1862,8 @@ static int fec_enet_clk_enable(struct net_device
>> *ndev, bool enable)
>> 		ret = clk_prepare_enable(fep->clk_ref);
>> 		if (ret)
>> 			goto failed_clk_ref;
>> +
>> +		phy_reset_after_clk_enable(ndev->phydev);
>> 	} else {
>> 		clk_disable_unprepare(fep->clk_ahb);
>> 		clk_disable_unprepare(fep->clk_enet_out);
>> @@ -2860,6 +2862,11 @@ fec_enet_open(struct net_device *ndev)
>> 	if (ret)
>> 		goto err_enet_mii_probe;
>>
>> +	/* reset phy if needed here, due to the fact this is the first time we
>> +	 * have the net_device to phy_driver link
>> +	 */
>> +	phy_reset_after_clk_enable(ndev->phydev);
>> +
> 
> The patch series look better.
> But why does it need to reset phy here since phy already is hard reset after clock enable.

The problem here is that in fec_enet_open() the fec_enet_clk_enable()
call is done before the phy is probed. Therefore (as mentioned in the
comment) there's no link from the net_device (ndev) to the phy_driver
(which holds the flags).

Any suggestions for a better solution are highly appreciated here! Thanks!

regards;Richard.L
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
