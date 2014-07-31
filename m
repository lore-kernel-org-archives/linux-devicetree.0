From: Stefan Assmann <sassmann-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 2/2] clk: initial clock driver for TWL6030
Date: Thu, 31 Jul 2014 14:04:29 +0200
Message-ID: <53DA30CD.5020903@kpanic.de>
References: <1406728949-7560-1-git-send-email-sassmann@kpanic.de> <1406728949-7560-3-git-send-email-sassmann@kpanic.de> <20140730175033.GA17528@sirena.org.uk> <53DA12BF.1060008@kpanic.de> <20140731110531.GH17528@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140731110531.GH17528-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, peter.ujfalusi-l0cyMroinI0@public.gmane.org, t-kristo-l0cyMroinI0@public.gmane.org, =?ISO-8859-1?Q?Andreas_F=E4rbe?= =?ISO-8859-1?Q?r?= <afaerber-l3A5Bk7waGM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 31.07.2014 13:05, Mark Brown wrote:
> On Thu, Jul 31, 2014 at 11:56:15AM +0200, Stefan Assmann wrote:
>> On 30.07.2014 19:50, Mark Brown wrote:
>>> On Wed, Jul 30, 2014 at 04:02:29PM +0200, Stefan Assmann wrote:
> 
>>>> +static int twl6030_clk32kg_is_prepared(struct clk_hw *hw)
>>>> +{
>>>> +	struct twl6030_desc *desc = to_twl6030_desc(hw);
>>>> +
>>>> +	return desc->enabled;
>>>> +}
> 
>>> Why not just check the register map - can't the register be cached?  If
>>> that's not possible a comment would be good.
> 
>> I just took atl_clk_is_enabled() as template. If you say it's better
>> to read the value, that can be arranged.
> 
> It might be worth doing this if you have to go to hardware to check the
> status, if you can read a cache then just using the register is less
> error prone.

Ok.

> 
>>>> +	else
>>>> +		clk_prepare(clk);
> 
>>> Why is the clock driver defaulting to enabling the clock, and if it
>>> needs to shouldn't it be doing a prepere_enable() even if the enable
>>> happens not to do anything to the hardware?  Otherwise child clocks
>>> might get confused.
> 
>> Mike advised me to convert the functions from enable/disable to
>> prepare/unprepare because i2c transactions may sleep. That's what I did.
>> The code no longer enables the clock and just prepares it. So IIUC the
>> call to clk_prepare() should be fine.
> 
> That's not going to help consumers of the clock, you do need to move the
> operations to prepare() but users shouldn't need to know what happens in
> prepare() and what happens in enable().
> 
> You've also not addressed the comment about defaulting to enabling the
> clock in the first place.

Maybe I misinterpreted your previous comment, sorry. So if I got it right
this time you're saying that the prepare/enable, disable/unprepare should
be seen as a single step. If that's the case then using prepare_enable()
should be used indeed.

Tero suggested to look into making this a generic i2c clock driver. I'll
look into that and report back.

  Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
