From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: Fix issue where code would fall through to error
 case.
Date: Sat, 26 Nov 2016 13:39:28 -0800
Message-ID: <583A0110.4090603@gmail.com>
References: <1479425157-6235-1-git-send-email-moritz.fischer@ettus.com>
 <582E3FFC.80305@gmail.com> <582E452E.3080909@gmail.com>
 <CAJYdmeNnKtecshe3QSZCPnwEuNUFAW9cUsNS-Z1Chw7OPUJ2jQ@mail.gmail.com>
 <CAL_JsqJK=Jf7JCmqD8EgEg3ngONWz=1Fu-Jj5h6-wkskTk_iXw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJK=Jf7JCmqD8EgEg3ngONWz=1Fu-Jj5h6-wkskTk_iXw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Moritz Fischer <moritz.fischer.private-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, moritz-62aBmqa6xEOcmJEhUYGoYg@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/23/16 13:58, Rob Herring wrote:
> On Thu, Nov 17, 2016 at 6:10 PM, Moritz Fischer
> <moritz.fischer.private-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Thu, Nov 17, 2016 at 4:02 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> On 11/17/16 15:40, Frank Rowand wrote:
>>>> On 11/17/16 15:25, Moritz Fischer wrote:
>>>>> No longer fall through into the error case that prints out
>>>>> an error if no error (err = 0) occurred.
>>>>>
>>>>> Fixes d9181b20a83(of: Add back an error message, restructured)
>>>>> Signed-off-by: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
>>>>> ---
>>>>>  drivers/of/resolver.c | 6 +++++-
>>>>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
>>>>> index 783bd09..785076d 100644
>>>>> --- a/drivers/of/resolver.c
>>>>> +++ b/drivers/of/resolver.c
>>>>> @@ -358,9 +358,13 @@ int of_resolve_phandles(struct device_node *overlay)
>>>>>
>>>>>              err = update_usages_of_a_phandle_reference(overlay, prop, phandle);
>>>>>              if (err)
>>>>> -                    break;
>>>>> +                    goto err_out;
>>>>>      }
>>>>>
>>>>> +    of_node_put(tree_symbols);
>>>>> +
>>>>> +    return 0;
>>>>> +
>>>>>  err_out:
>>>>>      pr_err("overlay phandle fixup failed: %d\n", err);
>>>>>  out:
>>>>
>>>> Thanks for catching that.
>>>>
>>>> Rob, please apply.
>>>>
>>>> Reviewed-by: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
>>>>
>>>> -Frank
>>>
>>> On second thought, isn't the common pattern when clean up is needed for
>>> both the no-error path and the error path something like:
>>>
>>>
>>>         out:
>>>                 of_node_put(tree_symbols);
>>>                 return err;
>>>
>>>         err_out:
>>>                 pr_err("overlay phandle fixup failed: %d\n", err);
>>>                 goto out;
>>>         }
>>>
>>>
>>> I don't have a strong opinion, whatever Rob wants to take is fine with me.
>>
>> Same here. I tried to avoid the jumping back part, but if that's the
>> common pattern,
>> I can submit a v2 doing that instead.
> 
> Both are ugly. Just do:
> 
> if (err)
>   pr_err(...);
> 
> Rob

Agreed.  Thanks for the touch of sanity Rob.

-Frank

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
