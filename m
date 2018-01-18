From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: Re: [PATCH v5 29/44] ARM: da8xx: add new USB PHY clock init using
 common clock framework
Date: Thu, 18 Jan 2018 12:43:59 -0600
Message-ID: <c31d26b6-fb79-4581-039f-b977d737da2d@lechnology.com>
References: <1515377863-20358-1-git-send-email-david@lechnology.com>
 <1515377863-20358-30-git-send-email-david@lechnology.com>
 <83dfab9a-be30-6313-d756-50fa018e757e@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <83dfab9a-be30-6313-d756-50fa018e757e-l0cyMroinI0@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Adam Ford <aford173-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/18/2018 09:14 AM, Sekhar Nori wrote:
> On Monday 08 January 2018 07:47 AM, David Lechner wrote:
>> +int __init da8xx_register_usb20_phy_clk(bool use_usb_refclkin)
>> +{
>> +	struct regmap *cfgchip;
>> +	struct clk *usb0_psc_clk, *clk;
>> +	struct clk_hw *parent;
>> +
>> +	cfgchip = syscon_regmap_lookup_by_compatible("ti,da830-cfgchip");
> 
> Am I right in understanding that this API is only called for non-DT
> boot? If yes, do we really need the lookup by compatible?

This code is used in DT boot until [PATCH v5 43/44] "ARM: da8xx-dt:
switch to device tree clocks". So, yes it is needed temporarily to
prevent breaking USB.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
