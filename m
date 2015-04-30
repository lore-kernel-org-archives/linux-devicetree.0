From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/4] clk: si5351: Some fixes
Date: Fri, 01 May 2015 00:21:20 +0200
Message-ID: <5542AAE0.5020204@gmail.com>
References: <1430415954-29517-1-git-send-email-sebastian.hesselbarth@gmail.com> <20150430193317.GC22000@deathray> <55429417.4070103@gmail.com> <20150430212059.GA14026@deathray>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150430212059.GA14026@deathray>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Welling <mwelling-EkmVulN54Sk@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, Russell King <rmk+linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 30.04.2015 23:20, Michael Welling wrote:
> On Thu, Apr 30, 2015 at 10:44:07PM +0200, Sebastian Hesselbarth wrote:
[...]
>> What I noticed about your clk2 that you always measure as 0 Hz is
>> that none of your clocks is prepared/enabled.
>>
>> Currently, the si5351 driver only ensures the output is enabled
>> when si5351_clkout_prepare() is called.
>>
>> As long as you do not have a clk consumer that properly prepare/enables
>> the clock output, it may remain disabled.
>>
>> We should probably have additional DT properties and corresponding
>> pdata to force clkoutN always on.
>
> Does the silabs,disable-state of 3 (SI5351_DISABLE_NEVER) take care
> of this?

That would be the HW version of never disabling the clock output.
I never really tried the property, does it work as expected?

> Otherwise is there a simple registration that will do this?

The SW version of such a property would involve CLK_IGNORE_UNUSED
and enabling all requested clock outputs on probe().

If above HW property already works, I think it should be enough.

[...]
>>> It should be noted that if I program the device's register map in the
>>> bootloader the device keeps the correct frequency outputs.
>>
>> "keeps"? You mean "generates", don't you?
>>
>
> Yes the clocks are generated and do not get effected by the driver.

IIRC, clk API does check if requested rate and current rate match
already. If they do, it does not request the same rate again.

Sebastian

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
