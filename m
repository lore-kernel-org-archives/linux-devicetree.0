From: "Ilkka Koskinen" <ilkka.koskinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH] of: Add empty of_get_next_parent() for !OF
Date: Fri, 1 May 2015 23:11:07 -0700 (PDT)
Message-ID: <61192.10.254.5.120.1430547067.squirrel@linux.intel.com>
References: <1430347479-1715-1-git-send-email-ilkka.koskinen@linux.intel.com>
    <CAL_JsqJEQmJT9+4t=PSc_K6yRxuTRObewfdghXmBgDTg=Sm+qQ@mail.gmail.com>
    <57872.10.24.5.56.1430436421.squirrel@linux.intel.com>
    <CAL_JsqJ_0LZ0i6BD4ECFJgaEPUkRM5qrDS1jKextB+bM5_iz5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJ_0LZ0i6BD4ECFJgaEPUkRM5qrDS1jKextB+bM5_iz5w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ilkka Koskinen <ilkka.koskinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, April 30, 2015 18:26, Rob Herring wrote:
> On Thu, Apr 30, 2015 at 6:27 PM, Ilkka Koskinen
> <ilkka.koskinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
>> Hi,
>>
>> On Wed, April 29, 2015 16:03, Rob Herring wrote:
>>> On Wed, Apr 29, 2015 at 5:44 PM, Ilkka Koskinen
>>> <ilkka.koskinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
>>>> From: Ilkka Koskinen <ilkka.koskinen-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
>>>>
>>>> Add an empty version of of_get_next_parent() in order to avoid
>>>> build error.
>>>
>>> Some details on the build error and what introduced it please.
>>
>> I agree. I'll add a better description of the issue in the commit
>> message.
>>
>> Some background: I'm basically implementing a parser that deals
>> with both device tree and ACPI. If OF hasn't been enabled, there's no
>> declaration or implementation of the function. I'm not aware if any
>> existing code in the kernel introduces the bug though.
>
> Then the build error is meaningless. Generally something like walking
> up parents is only something core code would do and is why there is no
> empty version. Your case may fit, but I'll have to wait and see your
> code. So just include this in the series with the rest of your work.
> I'll try not to run the other way when I see something ACPI related.
> ;)

Ok, sounds good to me.

Thanks,
Ilkka

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
