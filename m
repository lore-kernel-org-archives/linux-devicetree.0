From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [RFC PATCH 02/13] of: Remove excessive printks to reduce clutter
Date: Thu, 27 Oct 2016 09:04:08 -0700
Message-ID: <58122578.4070208@gmail.com>
References: <1477429146-27039-1-git-send-email-frowand.list@gmail.com>
 <1477429146-27039-3-git-send-email-frowand.list@gmail.com>
 <CAL_Jsq+TWZw+VcbYZp_xmFR-yitY8bn+gqe1Q2N42UFZAYsZKg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+TWZw+VcbYZp_xmFR-yitY8bn+gqe1Q2N42UFZAYsZKg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 10/27/16 05:21, Rob Herring wrote:
> On Tue, Oct 25, 2016 at 3:58 PM,  <frowand.list@gmail.com> wrote:
>> From: Frank Rowand <frank.rowand@am.sony.com>
> 
> Maybe some should be debug?
> 
>> Signed-off-by: Frank Rowand <frank.rowand@am.sony.com>
>> ---
>>  drivers/of/resolver.c | 28 ----------------------------
>>  1 file changed, 28 deletions(-)
>>
>> diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
>> index 4ff0220d7aa2..93a7ca0bf98c 100644
>> --- a/drivers/of/resolver.c
>> +++ b/drivers/of/resolver.c
>> @@ -116,8 +116,6 @@ static int __of_adjust_phandle_ref(struct device_node *node,
>>
>>         propval = kmalloc(rprop->length, GFP_KERNEL);
>>         if (!propval) {
>> -               pr_err("%s: Could not copy value of '%s'\n",
>> -                               __func__, rprop->name);
>>                 return -ENOMEM;
>>         }
> 
> I would remove the brackets in this patch rather than separately.
> 
>>         memcpy(propval, rprop->value, rprop->length);
> .
> 

OK, I will collapse the "remove braces" patch into this patch.
