From: "long.wanglong" <long.wanglong@huawei.com>
Subject: Re: [PATCH] drivers/of/fdt.c: replace pr_warning by pr_warn
Date: Mon, 27 Jul 2015 09:47:56 +0800
Message-ID: <55B58DCC.6080208@huawei.com>
References: <1437465693-143982-1-git-send-email-long.wanglong@huawei.com> <CAL_JsqKY7hTurOdR4kgXZBT922-s-paM-CgU5rv_fB4qinfxSA@mail.gmail.com> <55B2DEE2.8080509@huawei.com> <CAL_JsqKQ5y_iNezoTOty3ogC9Gmv4728Vf-BfoufN58u10vW7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKQ5y_iNezoTOty3ogC9Gmv4728Vf-BfoufN58u10vW7Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, peifeiyue@huawei.com, wanglong@laoqinren.net
List-Id: devicetree@vger.kernel.org

On 2015/7/27 4:39, Rob Herring wrote:
> On Fri, Jul 24, 2015 at 7:57 PM, long.wanglong <long.wanglong@huawei.com> wrote:
>> On 2015/7/25 3:00, Rob Herring wrote:
>>> On Tue, Jul 21, 2015 at 3:01 AM, Wang Long <long.wanglong@huawei.com> wrote:
>>>> Update the last pr_warning callsite in drivers/of.
>>>
>>> That is obvious in the diff, but can you tell me why?
>>
>> Hi Rob,
>>
>> When we use script "./scripts/checkpatch.pl" to check a patch, using pr_warning
>> will produce WARNING:
>>
>>         WARNING: Prefer pr_warn(... to pr_warning(...
>>         #22: FILE: drivers/of/fdt.c:428:
>>         +               pr_warning("End of tree marker overwritten: %08x\n",
>>
>> So,we should convert pr_warning to pr_warn.
> 
> Okay, but don't explain to me. Explain this in the commit message.
> 
> Rob
> 
> 

OK, i will send another patch and explain this in the commit message.

Wang Long
