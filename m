From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v7 2/2] drivers: soc: Add LLCC driver
Date: Tue, 22 May 2018 23:46:07 +0300
Message-ID: <CAHp75VdmUrSo+Vu3CebEWwc=CbsnS95ZzGC3zv1+zd5MsVgdUA@mail.gmail.com>
References: <1526492623-20527-1-git-send-email-rishabhb@codeaurora.org>
 <1526492623-20527-3-git-send-email-rishabhb@codeaurora.org>
 <CAHp75VdO7+u-PQ+RBH71sxHHG0WkAyEVxv0BNPaycbcRnrZang@mail.gmail.com>
 <f1970a64be17267e0f044242dc0764d6@codeaurora.org> <CAHp75Vd8HZU+BT38-OfXHiihv1yZG6YBeMWyfweBA+kAwk6HUw@mail.gmail.com>
 <19968f96da0c548dd7d96e7520ce899e@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <19968f96da0c548dd7d96e7520ce899e@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc: linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm@lists.infradead.org, tsoni@codeaurora.org, ckadabi@codeaurora.org, Evan Green <evgreen@chromium.org>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 22, 2018 at 11:40 PM,  <rishabhb@codeaurora.org> wrote:
> On 2018-05-22 12:38, Andy Shevchenko wrote:
>> On Tue, May 22, 2018 at 9:33 PM,  <rishabhb@codeaurora.org> wrote:
>>> On 2018-05-18 14:01, Andy Shevchenko wrote:

>>>>> +struct llcc_slice_desc *llcc_slice_getd(u32 uid)
>>>>> +{
>>>>> +       const struct llcc_slice_config *cfg;
>>>>> +       struct llcc_slice_desc *desc;
>>>>> +       u32 sz, count = 0;
>>>>> +
>>>>> +       cfg = drv_data->cfg;
>>>>> +       sz = drv_data->cfg_size;
>>>>> +
>>>>
>>>>
>>>>
>>>>> +       while (cfg && count < sz) {
>>>>> +               if (cfg->usecase_id == uid)
>>>>> +                       break;
>>>>> +               cfg++;
>>>>> +               count++;
>>>>> +       }
>>>>> +       if (cfg == NULL || count == sz)
>>>>> +               return ERR_PTR(-ENODEV);

>>>> if (!cfg)
>>>>           return ERR_PTR(-ENODEV);
>>>>
>>>> while (cfg->... != uid) {
>>>>   cfg++;
>>>>   count++;
>>>> }
>>>>
>>>> if (count == sz)
>>>>  return ...
>>>>
>>>> Though I would rather put it to for () loop.
>>>>
>>> In each while loop iteration the cfg pointer needs to be checked for
>>> NULL. What if the usecase id never matches the uid passed by client
>>> and we keep iterating. At some point it will crash.

>> do {
>>   if (!cfg || count == sz)
>>    return ...(-ENODEV);
>>  ...
>> } while (...);
>>
>> Though, as I said for-loop will look slightly better I think.
>
> Is this fine?
> for (count = 0; count < sz; count++) {
>    if (!cfg)
>         return ERR_PTR(-ENODEV);
>    if (cfg->usecase_id == uid)
>         break;
>    cfg++;
> }
> if (count == sz)
>    return ERR_PTR(-ENODEV);

for (count = 0; cfg && count < sz; count++, cfg++)
 if (_id == uid)
  break;

if (!cfg || count == sz)
    return ERR_PTR(-ENODEV);

Simpler ?

-- 
With Best Regards,
Andy Shevchenko
