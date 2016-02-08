From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 07/11] clk: sunxi: add generic allwinner,sunxi name
Date: Mon, 8 Feb 2016 16:06:15 +0000
Message-ID: <56B8BCF7.4080701@arm.com>
References: <1454348370-3816-1-git-send-email-andre.przywara@arm.com>
 <1454348370-3816-8-git-send-email-andre.przywara@arm.com>
 <20160208155721.GB4677@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160208155721.GB4677@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?Q?Emilio_L=c3=b3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 08/02/16 15:57, Rob Herring wrote:
> On Mon, Feb 01, 2016 at 05:39:26PM +0000, Andre Przywara wrote:
>> The only difference between the different compatible matches at the
>> end of clk-sunxi.c are the critical clocks. Two SoCs get away so far
>> without any, so there is no reason to enumerate those SoCs in here
>> explicitly, though we have to keep them in for compatibility reasons.
>>
>> Rename the init function to highlight this generic feature and add a
>> new, generic DT compatible string which can be used as a fallback value
>> in the future should a particular SoC don't need any special treatment.
>>
>> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/arm/sunxi.txt |  4 ++++
>>  drivers/clk/sunxi/clk-sunxi.c                   | 14 ++++++--------
>>  2 files changed, 10 insertions(+), 8 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/sunxi.txt b/Documentation/devicetree/bindings/arm/sunxi.txt
>> index 7e79fcc..980e065 100644
>> --- a/Documentation/devicetree/bindings/arm/sunxi.txt
>> +++ b/Documentation/devicetree/bindings/arm/sunxi.txt
>> @@ -14,3 +14,7 @@ using one of the following compatible strings:
>>    allwinner,sun8i-a83t
>>    allwinner,sun8i-h3
>>    allwinner,sun9i-a80
>> +
>> +For Allwinner SoCs without any specific needs the generic fallback value of:
>> +  allwinner,sunxi
>> +can be used.
> 
> Perhaps "fallback" implies this, but be more specific that it can be 
> used in addition to a specific string.

Yeah, good point.

But Maxime's latest rework [1] made this patch here actually obsolete,
so we don't match on a root compatible string anymore to register the
sunxi clock drivers. Instead each clock is registered and matched on
it's own compatible string. Much nicer now, IMHO.

Thanks for having a look!
Andre.

[1]
https://git.kernel.org/cgit/linux/kernel/git/mripard/linux.git/commit/?h=sunxi/for-next&id=78e3fb4c745114b16a12458036d48aa96ea5b36d

>> diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
>> index e460a6b..efcce85 100644
>> --- a/drivers/clk/sunxi/clk-sunxi.c
>> +++ b/drivers/clk/sunxi/clk-sunxi.c
>> @@ -1052,14 +1052,12 @@ CLK_OF_DECLARE(sun8i_a23_clk_init, "allwinner,sun8i-a23", sun6i_init_clocks);
>>  CLK_OF_DECLARE(sun8i_a33_clk_init, "allwinner,sun8i-a33", sun6i_init_clocks);
>>  CLK_OF_DECLARE(sun8i_h3_clk_init, "allwinner,sun8i-h3", sun6i_init_clocks);
>>  
>> -static void __init sun8i_a83t_init_clocks(struct device_node *node)
>> +static void __init sunxi_generic_init_clocks(struct device_node *node)
>>  {
>>  	sunxi_init_clocks(NULL, 0);
>>  }
>> -CLK_OF_DECLARE(sun8i_a83t_clk_init, "allwinner,sun8i-a83t", sun8i_a83t_init_clocks);
>> -
>> -static void __init sun9i_init_clocks(struct device_node *node)
>> -{
>> -	sunxi_init_clocks(NULL, 0);
>> -}
>> -CLK_OF_DECLARE(sun9i_a80_clk_init, "allwinner,sun9i-a80", sun9i_init_clocks);
>> +CLK_OF_DECLARE(sun8i_a83t_clk_init, "allwinner,sun8i-a83t",
>> +	       sunxi_generic_init_clocks);
>> +CLK_OF_DECLARE(sun9i_a80_clk_init, "allwinner,sun9i-a80",
>> +	       sunxi_generic_init_clocks);
>> +CLK_OF_DECLARE(sunxi_clk_init, "allwinner,sunxi", sunxi_generic_init_clocks);
>> -- 
>> 2.6.4
>>
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
