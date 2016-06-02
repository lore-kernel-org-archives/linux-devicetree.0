From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] of: use pr_fmt prefix for all console printing
Date: Thu, 2 Jun 2016 14:44:16 -0700
Message-ID: <5750A8B0.9010702@gmail.com>
References: <1464880499-29864-1-git-send-email-robh@kernel.org>
 <57506DDC.3060804@gmail.com>
 <CAL_JsqLrC27EOkWfRtzUOZox5wkRU=qEb+b3z2JQG++e5uSGSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLrC27EOkWfRtzUOZox5wkRU=qEb+b3z2JQG++e5uSGSg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>
List-Id: devicetree@vger.kernel.org

On 06/02/16 12:56, Rob Herring wrote:
> On Thu, Jun 2, 2016 at 12:33 PM, Frank Rowand <frowand.list@gmail.com> wrote:
>> On 06/02/16 08:14, Rob Herring wrote:
>>> Clean-up all the DT printk functions to use common pr_fmt prefix.
>>>
>>> Some print statements such as kmalloc errors were redundant, so just
>>> drop those.
>>>
>>> Cc: Frank Rowand <frowand.list@gmail.com>
>>> Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
>>> Signed-off-by: Rob Herring <robh@kernel.org>
>>> ---
>>>  drivers/of/address.c         | 49 ++++++++++++++++++++++----------------------
>>>  drivers/of/base.c            | 11 ++++++----
>>>  drivers/of/dynamic.c         | 47 +++++++++++++++++++++---------------------
>>>  drivers/of/fdt.c             | 12 +++++------
>>>  drivers/of/fdt_address.c     | 35 ++++++++++++++++---------------
>>>  drivers/of/irq.c             |  2 ++
>>>  drivers/of/of_numa.c         | 22 ++++++--------------
>>>  drivers/of/of_pci.c          |  6 ++++--
>>>  drivers/of/of_reserved_mem.c | 22 ++++++++++----------
>>>  drivers/of/overlay.c         | 43 +++++++++++++++-----------------------
>>>  drivers/of/platform.c        | 16 +++++++--------
>>>  drivers/of/resolver.c        |  2 ++
>>>  12 files changed, 130 insertions(+), 137 deletions(-)
>>>
>>
>> Nice cleanup.  A couple of comments below.
>>
>> Reviewed-by: Frank Rowand <frank.rowand@am.sony.com>
>>
>> < snip >

< snip >

>>> @@ -355,8 +355,6 @@ int of_overlay_create(struct device_node *tree)
>>>
>>>       id = idr_alloc(&ov_idr, ov, 0, 0, GFP_KERNEL);
>>>       if (id < 0) {
>>> -             pr_err("%s: idr_alloc() failed for tree@%s\n",
>>> -                             __func__, tree->full_name);
>>
>> Every other error in of_overlay_create() results in a pr_err().
>> (The other cases of removing pr_err() in this file are fine, because
>> the errors are already reported in the functions called from this
>> function.)
>>
>> I would recommend leaving in the pr_err() for idr_alloc() failure.
> 
> I was thinking idr_alloc is going to call kmalloc which will print
> errors on failure, but there may be some case it doesn't.
> 
> Rob

I did not read idr_alloc() carefully enough.  Given the arguments it
is called with, none of the non-kmalloc error returns are possible.
So you were correct to remove this pr_err().

-Frank
