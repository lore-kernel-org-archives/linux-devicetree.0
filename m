From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] of: base: add support to get machine model name
Date: Tue, 22 Nov 2016 15:35:19 -0600
Message-ID: <CAL_JsqLsw6BNSDY8pGJ8x3XF21WdciLC7WC+z796pYtDk_kvxA@mail.gmail.com>
References: <1479396775-32033-1-git-send-email-sudeep.holla@arm.com>
 <20161118144651.275xz4gu6jaefhp7@rob-hp-laptop> <582F5DC0.4080804@gmail.com> <5834921F.2020809@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5834921F.2020809@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 22, 2016 at 12:44 PM, Frank Rowand <frowand.list@gmail.com> wrote:
> Hi Rob,
>
> On 11/18/16 12:00, Frank Rowand wrote:
>> On 11/18/16 06:46, Rob Herring wrote:
>>> On Thu, Nov 17, 2016 at 03:32:54PM +0000, Sudeep Holla wrote:
>>>> Currently platforms/drivers needing to get the machine model name are
>>>> replicating the same snippet of code. In some case, the OF reference
>>>> counting is either missing or incorrect.
>>>>
>>>> This patch adds support to read the machine model name either using
>>>> the "model" or the "compatible" property in the device tree root node
>>>> to the core OF/DT code.
>>>>
>>>> This can be used to remove all the duplicate code snippets doing exactly
>>>> same thing later.
>>>>
>>>> Cc: Rob Herring <robh+dt@kernel.org>
>>>> Cc: Frank Rowand <frowand.list@gmail.com>
>>>> Cc: Arnd Bergmann <arnd@arndb.de>
>>>> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
>>>> ---
>>>>  drivers/of/base.c  | 32 ++++++++++++++++++++++++++++++++
>>>>  include/linux/of.h |  6 ++++++
>>>>  2 files changed, 38 insertions(+)
>>>>
>>>> Hi Rob,
>>>>
>>>> It would be good if we can target this for v4.10, so that we have no
>>>> dependencies to push PATCH 2/2 in v4.11
>>>
>>> Applied.
>>>
>>> Rob
>>>
>>
>> A little fast on the trigger Rob.
>>
>> -Frank
>
> This patch adds a function that leads to conflating the "model" property
> and the "compatible" property. This leads to opaque, confusing and unclear
> code where ever it is used.   I think it is not good for the device tree
> framework to contribute to writing unclear code.
>
> Further, only two of the proposed users of this new function appear to
> be proper usage.  I do not think that the small amount of reduced lines
> of code is a good trade off for the reduced code clarity and for the
> potential for future mis-use of this function.
>
> Can I convince you to revert this patch?

Yes, I will revert.

> If not, will you accept a patch to change the function name to more
> clearly indicate what it does?  (One possible name would be
> of_model_or_1st_compatible().)

I took it as there's already the FDT equivalent function. I don't have
an issue with the name as the purpose is to get the best name string
for the machine which is model if present and most specific compatible
if not. However, any use of it beyond informational purpose is wrong.
For matching purposes, only compatible should be used.

Rob
