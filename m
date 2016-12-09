From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] of: base: add support to get machine model name
Date: Fri, 9 Dec 2016 10:03:03 -0600
Message-ID: <CAL_JsqKioaP6JvihmJ3HK6cEfCgFRrtYr+EbJ2KvptxcrWCLnA@mail.gmail.com>
References: <1479396775-32033-1-git-send-email-sudeep.holla@arm.com>
 <20161118144651.275xz4gu6jaefhp7@rob-hp-laptop> <582F5DC0.4080804@gmail.com>
 <5834921F.2020809@gmail.com> <CAL_JsqLsw6BNSDY8pGJ8x3XF21WdciLC7WC+z796pYtDk_kvxA@mail.gmail.com>
 <195d492b-c674-e096-4f84-d37ca5448db2@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <195d492b-c674-e096-4f84-d37ca5448db2@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Frank Rowand <frowand.list@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 23, 2016 at 4:25 AM, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
>
> On 22/11/16 21:35, Rob Herring wrote:
>>
>> On Tue, Nov 22, 2016 at 12:44 PM, Frank Rowand <frowand.list@gmail.com>
>> wrote:
>
>
> [...]
>
>>>
>>> This patch adds a function that leads to conflating the "model" property
>>> and the "compatible" property. This leads to opaque, confusing and
>>> unclear
>>> code where ever it is used.   I think it is not good for the device tree
>>> framework to contribute to writing unclear code.
>>>
>>> Further, only two of the proposed users of this new function appear to
>>> be proper usage.  I do not think that the small amount of reduced lines
>>> of code is a good trade off for the reduced code clarity and for the
>>> potential for future mis-use of this function.
>>>
>>> Can I convince you to revert this patch?
>>
>>
>> Yes, I will revert.

I looked at this again and the users. They are all informational, so
I'm not worried if a compatible string could be returned with this
change. The function returns the best name for the machine and having
consistency is a good thing.

I was considering not reverting (as I'd not yet gotten around to it),
but I'm still going to revert for the naming.

>>
>>> If not, will you accept a patch to change the function name to more
>>> clearly indicate what it does?  (One possible name would be
>>> of_model_or_1st_compatible().)
>>
>>
>> I took it as there's already the FDT equivalent function.
>
>
> Yes it was mainly for non of_flat_* replacement for
> of_flat_dt_get_machine_name

I would suggest just of_get_machine_name().

You might also add a fallback to return "unknown", and drop some of
the custom strings. I don't think anyone should care about the actual
string. However, it's an error to have a DT with no model or top level
compatible, so maybe a WARN.

Rob
