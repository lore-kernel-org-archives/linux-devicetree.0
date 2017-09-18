From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] scripts/dtc: update dtx_diff cpp and dts include paths to
 match build
Date: Mon, 18 Sep 2017 10:01:35 -0500
Message-ID: <CAL_JsqLW+rJJc9bKTURWixzYQO=eSOhv=pnhZiDmvLsHZJZEjQ@mail.gmail.com>
References: <1505513779-11315-1-git-send-email-frowand.list@gmail.com>
 <CAL_JsqJDvhH7+4mHfvUhOnc9tsHw49P=+FjVtWCErNnKrH9-zA@mail.gmail.com> <59BD64E2.9000605@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <59BD64E2.9000605@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat, Sep 16, 2017 at 12:52 PM, Frank Rowand <frowand.list@gmail.com> wrote:
> On 09/15/17 15:42, Rob Herring wrote:
>> On Fri, Sep 15, 2017 at 5:16 PM,  <frowand.list@gmail.com> wrote:
>>> From: Frank Rowand <frank.rowand@sony.com>
>>
>> I feel like we just had the same subject. Can you make it more specific.
>
> Yes, the previous one was pretty much the same words, but the one line
> description is not an exact match.  I will come up with a more unique
> subject.
>
>
>>> Update dtx_diff include paths in the same manner as:
>>> commit b12869a8d519 ("of: remove drivers/of/testcase-data from
>>> include search path for CPP"), commit 5ffa2aed389c ("of: remove
>>> arch/$(SRCARCH)/boot/dts from include search path for CPP"), and
>>> commit 50f9ddaf64e1 ("of: search scripts/dtc/include-prefixes path
>>> for both CPP and DTC").
>>
>> We need a better way for this to stop happening besides me remembering
>> in reviews...
>
> Yep, me remembering in reviews.  Which I have.  :-)
>
>
>> Perhaps a separate file of include paths that all tools can use?
>
> I considered that with the very first version of dtx_diff.  At the time,
> I expected changes to the include path to be very rare.  I still have
> that expectation looking forward.

Let's hope so...

> I considered having dtx_diff scrape the include paths out of Makefile.lib,
> but that seemed fragile and kludgey.  I could create a shell script that
> outputs the include paths,  Then Makefile.lib and dtx_diff could use
> that script to get the include paths.
>
>
>>> Remove proposed include path kernel/dts/, which was never implemented
>>> for the dtb build.
>>>
>>> For the diff case, each source file is compiled separately.  For
>>> each of those compiles, provide the location of the source file
>>> as an include path, not the location of both source files.
>>>
>>> ---
>>>
>>> The referenced commits b12869a8d519, 5ffa2aed389c, 50f9ddaf64e1
>>> are in v4.14-rc1.  No stable kernels need this patch.
>>>
>>>  scripts/dtc/dtx_diff |   22 +++++++++-------------
>>>  1 file changed, 9 insertions(+), 13 deletions(-)
>>>
>>> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
>>
>> This is going to get dropped.
>>
>> Rob
>
> I am assuming the drop is because of the request to have a common
> file for all tools to source for the include paths.  I'll re-spin
> to implement that.

No, I just mean your S-o-B is going to get dropped by git-am since it
is below the first '---'. Just improve the subject otherwise.

Rob
