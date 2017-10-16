From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] of: overlay: fix memory leak related to duplicated property
Date: Mon, 16 Oct 2017 15:54:49 -0500
Message-ID: <CAL_JsqLnSQzZuOZQX330q_WS6tsvM4eGOCSRGYnhbTPNTwHu=g@mail.gmail.com>
References: <1507859591-2337-1-git-send-email-alan.1.wang@nokia-sbell.com>
 <1507864056-52089-1-git-send-email-alan.1.wang@nokia-sbell.com>
 <59E13876.5020801@gmail.com> <VI1PR07MB342187128B48F66C464401A2A24F0@VI1PR07MB3421.eurprd07.prod.outlook.com>
 <59E44CAE.8050600@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <59E44CAE.8050600@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: "Wang, Alan 1. (NSB - CN/Hangzhou)" <alan.1.wang@nokia-sbell.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 16, 2017 at 1:07 AM, Frank Rowand <frowand.list@gmail.com> wrote:
> Hi Alan,
>
> It is Rob's choice of which order to take the patches in.

If we have a choice, better to take fixes first so they can be more
easily backported.

Rob

> Either order, it will be a trivial fixup to the second patchset
> to go in.
>
> -Frank
>
>
> On 10/15/17 19:35, Wang, Alan 1. (NSB - CN/Hangzhou) wrote:
>> Hi Frank,
>>
>> Could I continue to send my patch since conflict with your patches? Or I have to wait for your patches merged? Thanks.
>>
>> -----Original Message-----
>> From: Frank Rowand [mailto:frowand.list@gmail.com]
>> Sent: Saturday, October 14, 2017 6:05 AM
>> To: Wang, Alan 1. (NSB - CN/Hangzhou) <alan.1.wang@nokia-sbell.com>; Pantelis Antoniou <pantelis.antoniou@konsulko.com>; Rob Herring <robh+dt@kernel.org>
>> Cc: linux-kernel@vger.kernel.org; devicetree@vger.kernel.org
>> Subject: Re: [PATCH] of: overlay: fix memory leak related to duplicated property
>>
>> Hi Rob,
>>
>> On 10/12/17 20:07, Lixin Wang wrote:
>>> From: alawang <alan.1.wang@nokia-sbell.com>
>>>
>>> Hello,
>>>
>>> Sorry It was my fault in last email that wrote the wrong subject and sign off name.
>>> Correct them this time.
>>> Thanks
>>>
>>> Function of_changeset_add_property or of_changeset_update_property may
>>> fails. In this case the property just allocated is never deallocated.
>>>
>>> Signed-off-by: Lixin Wang <alan.1.wang@nokia-sbell.com>
>>> ---
>>>  drivers/of/overlay.c | 15 +++++++++++----
>>>  1 file changed, 11 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c index
>>> 8ecfee3..af3b9a1 100644
>>> --- a/drivers/of/overlay.c
>>> +++ b/drivers/of/overlay.c
>>> @@ -162,6 +162,7 @@ static int of_overlay_apply_single_property(struct of_overlay *ov,
>>>              bool is_symbols_node)
>>>  {
>>>      struct property *propn = NULL, *tprop;
>>> +    int ret = 0;
>>>
>>>      /* NOTE: Multiple changes of single properties not supported */
>>>      tprop = of_find_property(target, prop->name, NULL); @@ -186,10
>>> +187,16 @@ static int of_overlay_apply_single_property(struct
>>> of_overlay *ov,
>>>
>>>      /* not found? add */
>>>      if (tprop == NULL)
>>> -            return of_changeset_add_property(&ov->cset, target, propn);
>>> -
>>> -    /* found? update */
>>> -    return of_changeset_update_property(&ov->cset, target, propn);
>>> +            ret = of_changeset_add_property(&ov->cset, target, propn);
>>> +    else /* found? update */
>>> +            ret = of_changeset_update_property(&ov->cset, target, propn);
>>> +
>>> +    if (ret) {
>>> +            kfree(propn->name);
>>> +            kfree(propn->value);
>>> +            kfree(propn);
>>> +    }
>>> +    return ret;
>>>  }
>>>
>>>  static int of_overlay_apply_single_device_node(struct of_overlay *ov,
>>>
>>
>> Just a heads up.
>>
>> This will conflict with my patch series "[PATCH 00/12] of: overlay: clean up device tree overlay code" [1].  The issue that Lixin has identified will still remain after applying my patch series, and can be fixed in the same manner as his patch, just different context, including variable names.
>>
>> [1] https://lkml.org/lkml/2017/10/2/679
>>
>> -Frank
>>
>
