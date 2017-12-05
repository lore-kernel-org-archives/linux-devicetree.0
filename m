From: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH net-next v3 2/4] phylib: add reset after clk enable
 support
Date: Tue, 5 Dec 2017 19:08:04 +0100
Message-ID: <d5ef3c99-afa2-4ecb-79eb-1d6c877a2892@skidata.com>
References: <20171205132600.13796-1-dev@g0hl1n.net>
 <20171205132600.13796-3-dev@g0hl1n.net> <20171205173407.GN12805@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171205173407.GN12805-g2DYL2Zd6BY@public.gmane.org>
Content-Language: de-AT
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Richard Leitner <dev-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, fugang.duan-3arQi8VN3Tc@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org, david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, lukma-ynQEQJNshbs@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Andrew,

On 12/05/2017 06:34 PM, Andrew Lunn wrote:
> On Tue, Dec 05, 2017 at 02:25:58PM +0100, Richard Leitner wrote:
>> From: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
>>
>> Some PHYs need the refclk to be a continuous clock. Therefore they don't
>> allow turning it off and on again during operation. Nonetheless such a
>> clock switching is performed by some ETH drivers (namely FEC [1]) for
>> power saving reasons. An example for an affected PHY is the
>> SMSC/Microchip LAN8720 in "REF_CLK In Mode".
>>
>> In order to provide a uniform method to overcome this problem this patch
>> adds a new phy_driver flag (PHY_RST_AFTER_CLK_EN) and corresponding
>> function phy_reset_after_clk_enable() to the phylib. These should be
>> used to trigger reset of the PHY after the refclk is switched on again.
>>
>> This patch depends on the "phylib: Add device reset GPIO support" patch
>> submitted by Geert Uytterhoeven/Sergei Shtylyov [2].
>>
>> [1] commit e8fcfcd5684a ("net: fec: optimize the clock management to save power")
>> [2] https://patchwork.kernel.org/patch/10090149/
>>
>> Signed-off-by: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
> 
> Hi Richard
> 
> Same comment about moving text below the ---

Ok. Thanks for your feedback and review.

> 
> Reviewed-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
> 

regards;Richard.L

>      Andrew
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
