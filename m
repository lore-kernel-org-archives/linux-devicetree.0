From: Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 3/3] clk: keystone: Add sci-clk driver support
Date: Fri, 9 Dec 2016 10:05:01 +0200
Message-ID: <22dacb0c-a3bc-50ce-e4b9-f74a0c706f20@ti.com>
References: <1477053961-27128-1-git-send-email-t-kristo@ti.com>
 <1477053961-27128-4-git-send-email-t-kristo@ti.com>
 <20161208001348.GC5423@codeaurora.org>
 <cb608729-b617-0eab-5ddf-d78ff47b237e@ti.com>
 <20161208211044.GI5423@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161208211044.GI5423-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nm-l0cyMroinI0@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/12/16 23:10, Stephen Boyd wrote:
> On 12/08, Tero Kristo wrote:
>> On 08/12/16 02:13, Stephen Boyd wrote:
>>> On 10/21, Tero Kristo wrote:
>>>> diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
>>>> new file mode 100644
>>>> index 0000000..f6af5bd
>>>> --- /dev/null
>>>> +++ b/drivers/clk/keystone/sci-clk.c
>>
>>>
>>>> +
>>>> +	handle = devm_ti_sci_get_handle(dev);
>>>> +	if (IS_ERR(handle))
>>>> +		return PTR_ERR(handle);
>>>> +
>>>> +	provider = devm_kzalloc(dev, sizeof(*provider), GFP_KERNEL);
>>>> +	if (!provider)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	provider->clocks = data;
>>>> +
>>>> +	provider->sci = handle;
>>>> +	provider->ops = &handle->ops.clk_ops;
>>>> +	provider->dev = dev;
>>>> +
>>>> +	ti_sci_init_clocks(provider);
>>>
>>> And if this fails?
>>
>> Yea this is kind of controversial. ti_sci_init_clocks() can fail if
>> any of the clocks registered will fail. I decided to have it this
>> way so that at least some clocks might work in failure cause, and
>> you might have a booting device instead of total lock-up.
>>
>> Obviously it could be done so that if any clock fails, we would
>> de-register all clocks at that point, but personally I think this is
>> a worse option.
>>
>> ti_sci_init_clocks could probably be modified to continue
>> registering clocks when a single clock fails though. Currently it
>> aborts at first failure.
>>
>
> That sounds like a better approach if we don't care about
> failures to register a clock. Returning a value from a function
> and not using it isn't really a great design.
>
> I worry that if we start returning errors from clk_hw_register()
> that something will go wrong though, so really I don't know why
> we want to ignore errors at all. Just for debugging a boot hang?
> Can't we use early console to at least see that this driver is
> failing to probe and debug that way?

Early console can be used to debug that, but it is kind of annoying to 
recompile most of the kernel when you suddenly need to use it.

How about modifying the ti_sci_init_clocks func to print an error for 
each failed clock?

If you insist on aborting the probe though if a single clock fails, I 
can do that also.

-Tero
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
