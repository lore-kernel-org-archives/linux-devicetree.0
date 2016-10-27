From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [RFC PATCH 02/13] of: Remove excessive printks to reduce clutter
Date: Thu, 27 Oct 2016 09:09:48 -0700
Message-ID: <581226CC.1050400@gmail.com>
References: <1477429146-27039-1-git-send-email-frowand.list@gmail.com>
 <1477429146-27039-3-git-send-email-frowand.list@gmail.com>
 <CAL_Jsq+TWZw+VcbYZp_xmFR-yitY8bn+gqe1Q2N42UFZAYsZKg@mail.gmail.com>
 <022037BA-60BC-4A85-B51A-04F96E854952@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <022037BA-60BC-4A85-B51A-04F96E854952@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh+dt@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 10/27/16 06:51, Pantelis Antoniou wrote:
> Hi Rob, Frank,
> 
>> On Oct 27, 2016, at 15:21 , Rob Herring <robh+dt@kernel.org> wrote:
>>
>> On Tue, Oct 25, 2016 at 3:58 PM,  <frowand.list@gmail.com> wrote:
>>> From: Frank Rowand <frank.rowand@am.sony.com>
>>
>> Maybe some should be debug?
>>
> 
> Yes, please do not get rid of them completely.
> Leave them at least as debug level so that if there’s a problem
> there’s a way to figure out why something happened.

After patch "Add back an error message, restructured" is applied,
a lot of the messages return, but hopefully keeping readability.
Note that the one message added back covers a number of error
locations.

Are there any additional key messages that you think I missed in
the add back an error message patch?

Keep in mind that many of the debug messages address malformed
dtb, which would be a bug in dtc.  It made sense for these to
exist while dtc was being modified, but now that you have
created and tested the dtc changes, I think most of those
debug messages no longer make sense for mainline code.


>>> Signed-off-by: Frank Rowand <frank.rowand@am.sony.com>
>>> ---
>>> drivers/of/resolver.c | 28 ----------------------------
>>> 1 file changed, 28 deletions(-)
>>>
>>> diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
>>> index 4ff0220d7aa2..93a7ca0bf98c 100644
>>> --- a/drivers/of/resolver.c
>>> +++ b/drivers/of/resolver.c
>>> @@ -116,8 +116,6 @@ static int __of_adjust_phandle_ref(struct device_node *node,
>>>
>>>        propval = kmalloc(rprop->length, GFP_KERNEL);
>>>        if (!propval) {
>>> -               pr_err("%s: Could not copy value of '%s'\n",
>>> -                               __func__, rprop->name);
>>>                return -ENOMEM;
>>>        }
>>
>> I would remove the brackets in this patch rather than separately.
>>
>>>        memcpy(propval, rprop->value, rprop->length);
> 
> 
> Regards
> 
> — Pantelis
> 
> 
