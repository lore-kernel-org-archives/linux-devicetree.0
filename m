From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2 2/7] clk: sunxi: Implement A31 PLL6 as a divs clock for
 2x output
Date: Tue, 30 Sep 2014 23:50:38 +0800
Message-ID: <CAGb2v67PQBkHaXareOHM5s+HXfCtbaESYqBhXxUAY59LV4zTxw@mail.gmail.com>
References: <1411807795-6575-1-git-send-email-wens@csie.org>
 <1411807795-6575-3-git-send-email-wens@csie.org> <20140930153957.GM4081@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140930153957.GM4081@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Sep 30, 2014 at 11:39 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Hi,
>
> On Sat, Sep 27, 2014 at 04:49:50PM +0800, Chen-Yu Tsai wrote:
>> Some clock modules on the A31 use PLL6x2 as one of their inputs.
>> This patch changes the PLL6 implementation for A31 to a divs clock,
>> i.e. clock with multiple outputs that have different dividers.
>> The first output will be the normal PLL6 output, and the second
>> will be PLL6x2.
>>
>> This patch fixes the PLL6 N factor in the clock driver, and removes
>> any /2 dividers in the PLL6 factors clock part. The N factor counts
>> from 1 to 32, mapping to values 0 to 31, as shown in the A31 manual.
>>
>> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/clock/sunxi.txt |  5 ++--
>>  drivers/clk/sunxi/clk-sunxi.c                     | 28 +++++++++++++----------
>>  2 files changed, 19 insertions(+), 14 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Documentation/devicetree/bindings/clock/sunxi.txt
>> index d3a5c3c..0d84f4b 100644
>> --- a/Documentation/devicetree/bindings/clock/sunxi.txt
>> +++ b/Documentation/devicetree/bindings/clock/sunxi.txt
>> @@ -59,8 +59,9 @@ Required properties for all clocks:
>>       multiplexed clocks, the list order must match the hardware
>>       programming order.
>>  - #clock-cells : from common clock binding; shall be set to 0 except for
>> -     "allwinner,*-gates-clk", "allwinner,sun4i-pll5-clk" and
>> -     "allwinner,sun4i-pll6-clk" where it shall be set to 1
>> +     the following compatibles where it shall be set to 1:
>> +     "allwinner,*-gates-clk", "allwinner,sun4i-pll5-clk",
>> +     "allwinner,sun4i-pll6-clk", "allwinner, sun6i-a31-pll6-clk"
>                                                ^ Drop this extra space
>
> And you're still not documenting what outputs you might have on pll6,
> and what the extra argument correspond to.

Sorry. Missed that part.

ChenYu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
