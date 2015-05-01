From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: Add empty of_get_next_parent() for !OF
Date: Thu, 30 Apr 2015 20:26:12 -0500
Message-ID: <CAL_JsqJ_0LZ0i6BD4ECFJgaEPUkRM5qrDS1jKextB+bM5_iz5w@mail.gmail.com>
References: <1430347479-1715-1-git-send-email-ilkka.koskinen@linux.intel.com>
 <CAL_JsqJEQmJT9+4t=PSc_K6yRxuTRObewfdghXmBgDTg=Sm+qQ@mail.gmail.com> <57872.10.24.5.56.1430436421.squirrel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57872.10.24.5.56.1430436421.squirrel-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ilkka Koskinen <ilkka.koskinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 30, 2015 at 6:27 PM, Ilkka Koskinen
<ilkka.koskinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
> Hi,
>
> On Wed, April 29, 2015 16:03, Rob Herring wrote:
>> On Wed, Apr 29, 2015 at 5:44 PM, Ilkka Koskinen
>> <ilkka.koskinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
>>> From: Ilkka Koskinen <ilkka.koskinen-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
>>>
>>> Add an empty version of of_get_next_parent() in order to avoid
>>> build error.
>>
>> Some details on the build error and what introduced it please.
>
> I agree. I'll add a better description of the issue in the commit message.
>
> Some background: I'm basically implementing a parser that deals
> with both device tree and ACPI. If OF hasn't been enabled, there's no
> declaration or implementation of the function. I'm not aware if any
> existing code in the kernel introduces the bug though.

Then the build error is meaningless. Generally something like walking
up parents is only something core code would do and is why there is no
empty version. Your case may fit, but I'll have to wait and see your
code. So just include this in the series with the rest of your work.
I'll try not to run the other way when I see something ACPI related.
;)

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
