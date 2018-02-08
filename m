From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 2/7] soc: davinci: new genpd driver
Date: Thu, 8 Feb 2018 20:13:06 +0530
Message-ID: <a7133585-aaa0-e361-2e88-4ab0a263837e@ti.com>
References: <20180207134553.13510-1-brgl@bgdev.pl>
 <20180207134553.13510-3-brgl@bgdev.pl>
 <65f2690c-c605-3c66-9d8a-9a882aaf446d@ti.com>
 <CAMRc=Mf+S3k_wfhUWEx2-39AZx1szkgy-u-bsZQUMiaY06UKww@mail.gmail.com>
 <34d3980b-2c94-1540-94f0-dc0c86743475@ti.com>
 <CAMRc=MeQUdzWfAgUCX5k5iwmyyVeCvjhw0CKauSY_1F0+SBPBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMRc=MeQUdzWfAgUCX5k5iwmyyVeCvjhw0CKauSY_1F0+SBPBQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bartosz Golaszewski <brgl-ARrdPY/1zhM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 08 February 2018 06:57 PM, Bartosz Golaszewski wrote:
> 2018-02-08 13:56 GMT+01:00 Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>:
>> On Thursday 08 February 2018 03:24 PM, Bartosz Golaszewski wrote:
>>> 2018-02-08 10:30 GMT+01:00 Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>:
>>>> On Wednesday 07 February 2018 07:15 PM, Bartosz Golaszewski wrote:
>>>>> +     /*
>>>>> +      * DaVinci always uses a single clock for power-management. We assume
>>>>> +      * it's the first one in the clocks property.
>>>>> +      */
>>>>> +     clk = of_clk_get(dev->of_node, 0);
>>>>> +     if (IS_ERR(clk))
>>>>> +             return PTR_ERR(clk);
>>>>
>>>> We already get this today with drivers/base/power/clock_ops.c once
>>>> .con_ids list is dropped from pm_clk_notifier_block (which I think it
>>>> should).
>>>>
>>>> If there is no reason to introduce thus functionality at this stage,
>>>> perhaps we should wait till such a time when its clearly needed?
>>>>
>>>> Thanks,
>>>> Sekhar
>>>
>>> If I understand correctly: once we drop the con_ids list, we end up
>>> calling clk_get(dev, NULL) from pm_clk_acquire(), which matches
>>> against the clock with NULL con_id, which may not necessarily be the
>>> first clock in the list.
>>
>> Hmm, not sure of this. In __of_clk_get_by_name() called by clk_get():
>>
>> int index = 0;
>>
>> /*
>>  * For named clocks, first look up the name in the
>>  * "clock-names" property.  If it cannot be found, then
>>  * index will be an error code, and of_clk_get() will fail.
>>  */
>> if (name)
>>         index = of_property_match_string(np, "clock-names", name);
>>
>> So, if no con_id is provided (name == NULL), then index is set to 0
>> which will always get the first clock in clocks = list.
>>
> 
> But we're talking here about device tree mode. In legacy mode the
> device_node pointer will be NULL, __of_clk_get_by_name() will return
> -ENOENT and we'll end up calling clk_get_sys() -> clk_find(). We'll
> then iterate over the clock entries and check the following:
> 
> (...)
> 152                 if (p->con_id) {
> 153                         if (!con_id || strcmp(p->con_id, con_id))
> 154                                 continue;
> 155                         match += 1;
> 156                 }
> (...)
> 
> So we'll skip the first clock if it has a con_id and we passed an
> empty con_id to clk_get().

You are right. I missed taking the effect on legacy boot into
consideration. Please send v2 then, and consider this objection withdrawn.

Thanks,
Sekhar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
