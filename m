From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 1/2] of: base: add support to get machine model name
Date: Wed, 23 Nov 2016 10:25:57 +0000
Message-ID: <195d492b-c674-e096-4f84-d37ca5448db2@arm.com>
References: <1479396775-32033-1-git-send-email-sudeep.holla@arm.com>
 <20161118144651.275xz4gu6jaefhp7@rob-hp-laptop> <582F5DC0.4080804@gmail.com>
 <5834921F.2020809@gmail.com>
 <CAL_JsqLsw6BNSDY8pGJ8x3XF21WdciLC7WC+z796pYtDk_kvxA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLsw6BNSDY8pGJ8x3XF21WdciLC7WC+z796pYtDk_kvxA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Sudeep Holla <sudeep.holla@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 22/11/16 21:35, Rob Herring wrote:
> On Tue, Nov 22, 2016 at 12:44 PM, Frank Rowand <frowand.list@gmail.com> wrote:

[...]

>>
>> This patch adds a function that leads to conflating the "model" property
>> and the "compatible" property. This leads to opaque, confusing and unclear
>> code where ever it is used.   I think it is not good for the device tree
>> framework to contribute to writing unclear code.
>>
>> Further, only two of the proposed users of this new function appear to
>> be proper usage.  I do not think that the small amount of reduced lines
>> of code is a good trade off for the reduced code clarity and for the
>> potential for future mis-use of this function.
>>
>> Can I convince you to revert this patch?
>
> Yes, I will revert.
>
>> If not, will you accept a patch to change the function name to more
>> clearly indicate what it does?  (One possible name would be
>> of_model_or_1st_compatible().)
>
> I took it as there's already the FDT equivalent function.

Yes it was mainly for non of_flat_* replacement for
of_flat_dt_get_machine_name

-- 
Regards,
Sudeep
