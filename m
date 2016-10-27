From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [RFC PATCH 06/13] of: Remove prefix "__of_" and prefix "__" from
 local function names
Date: Thu, 27 Oct 2016 15:20:35 -0500
Message-ID: <CAL_Jsq+xdWHE2Di3neAxpB8FwM3Xi44E_q5hT_5Lhiqepj1=mw@mail.gmail.com>
References: <1477429146-27039-1-git-send-email-frowand.list@gmail.com>
 <1477429146-27039-7-git-send-email-frowand.list@gmail.com>
 <CAL_JsqL9KWw7Mkz8nwZWDot+3OPBC2AesYuvu3dEofiB7BGeGQ@mail.gmail.com>
 <58122CC0.3090700@gmail.com> <CAL_JsqJdBAeAUfODEzvpNELmLj9ib1CKwQVsEVGsFYAnBuj_Kw@mail.gmail.com>
 <5812469C.3010403@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5812469C.3010403@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 27, 2016 at 1:25 PM, Frank Rowand <frowand.list@gmail.com> wrote:
> On 10/27/16 09:58, Rob Herring wrote:
>> On Thu, Oct 27, 2016 at 11:35 AM, Frank Rowand <frowand.list@gmail.com> wrote:
>>> On 10/27/16 05:47, Rob Herring wrote:
>>>> On Tue, Oct 25, 2016 at 3:58 PM,  <frowand.list@gmail.com> wrote:
>>>>> From: Frank Rowand <frank.rowand@am.sony.com>
>>>>
>>>> I prefer to leave the prefixes and this is getting into pointless churn.
>>>>
>>>>>
>>>>> Signed-off-by: Frank Rowand <frank.rowand@am.sony.com>
>>>>> ---
>>>>>  drivers/of/resolver.c | 10 +++++-----
>>>>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>>>
>>>
>>> If I was just submitting this as a single patch, I would agree.
>>>
>>> But since I am making so many other changes, I think it makes
>>> sense to do this as part of this series.  It is broken apart
>>> as a separate patch to be easy to review and not pollute any
>>> of the other patches in the series.
>>>
>>> The prefixes add no value for a local function, but they do
>>> add noise when reading code.
>>
>> The value is when reading the calling function, you know the function
>> is a DT related function. You don't know it's a static function
>
> It is more than that.  A common convention in drivers/of/ is that
> function blah() acquires a lock, calls function __blah(), and
> releases the lock.  Any function other than blah() that wants
> to call __blah() must also hold the proper lock.  The functions
> whose name this patch changes do not fit this pattern.

Okay, fair enough.

Rob
