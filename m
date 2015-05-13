From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] of: base: upgrade initcall level of of_init from core
 to pure
Date: Wed, 13 May 2015 17:54:16 +0100
Message-ID: <555381B8.5020504@arm.com>
References: <1431452282-10207-1-git-send-email-sudeep.holla@arm.com> <CAL_JsqJ19OfTJjtrZ9vs_9VYRHzOyF=GZdz4ftHT=nonEVWWgw@mail.gmail.com> <55532186.5060803@arm.com> <CAL_JsqL_pEZ0qMgk3j7fwuWLTVZEm2UpPR=e4jAMN4shHAtNnA@mail.gmail.com> <555364AA.7030703@arm.com> <CAL_JsqK6cZ+rYiox0=EE5wjwtk6T8edCzDG0=uj2ZdK-QHoX3g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqK6cZ+rYiox0=EE5wjwtk6T8edCzDG0=uj2ZdK-QHoX3g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org



On 13/05/15 17:34, Rob Herring wrote:
> On Wed, May 13, 2015 at 9:50 AM, Sudeep Holla <sudeep.holla@arm.com> wrote:
>> On 13/05/15 14:46, Rob Herring wrote:
>>> On Wed, May 13, 2015 at 5:03 AM, Sudeep Holla <sudeep.holla@arm.com>
>>> wrote:
>
> [...]
>
>>>> Yes I read and was bit hesitant initially to do this change, but found
>>>> no better way. I posted mainly to discuss other possibilities to solve
>>>> the issue.
>>>
>>>
>>> Perhaps of_init should not be an initcall at all and it should go into
>>> driver_init().
>>
>>
>> That seems ideal place to me as most of kset and kobjects are created
>> there. Something like below patch ? However found that PPC had a
>> function with same name which can conflict and we need to rename one of
>> these two.
>
> It looks like the PPC one is in the boot wrapper. They shouldn't
> collide. If they do, then how about of_core_init.
>

Thanks for the review, will check the PPC build and change accordingly
if required.

Regards,
Sudeep
