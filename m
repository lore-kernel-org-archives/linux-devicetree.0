From: "Ilkka Koskinen" <ilkka.koskinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH] of: Add empty of_get_next_parent() for !OF
Date: Thu, 30 Apr 2015 16:27:01 -0700 (PDT)
Message-ID: <57872.10.24.5.56.1430436421.squirrel@linux.intel.com>
References: <1430347479-1715-1-git-send-email-ilkka.koskinen@linux.intel.com>
    <CAL_JsqJEQmJT9+4t=PSc_K6yRxuTRObewfdghXmBgDTg=Sm+qQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJEQmJT9+4t=PSc_K6yRxuTRObewfdghXmBgDTg=Sm+qQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ilkka Koskinen <ilkka.koskinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, April 29, 2015 16:03, Rob Herring wrote:
> On Wed, Apr 29, 2015 at 5:44 PM, Ilkka Koskinen
> <ilkka.koskinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
>> From: Ilkka Koskinen <ilkka.koskinen-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
>>
>> Add an empty version of of_get_next_parent() in order to avoid
>> build error.
>
> Some details on the build error and what introduced it please.

I agree. I'll add a better description of the issue in the commit message.

Some background: I'm basically implementing a parser that deals
with both device tree and ACPI. If OF hasn't been enabled, there's no
declaration or implementation of the function. I'm not aware if any
existing code in the kernel introduces the bug though.

Thanks,
Ilkka

>> Signed-off-by: Ilkka Koskinen <ilkka.koskinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>> ---
>>  include/linux/of.h | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/include/linux/of.h b/include/linux/of.h
>> index dfde07e..416158f 100644
>> --- a/include/linux/of.h
>> +++ b/include/linux/of.h
>> @@ -425,6 +425,11 @@ static inline struct device_node
>> *of_get_parent(const struct device_node *node)
>>         return NULL;
>>  }
>>
>> +static inline struct device_node *of_get_next_parent(struct device_node
>> *node)
>> +{
>> +       return NULL;
>> +}
>> +
>>  static inline struct device_node *of_get_next_child(
>>         const struct device_node *node, struct device_node *prev)
>>  {
>> --
>> 1.9.1
>>
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
