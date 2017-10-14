From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] of: dynamic: fix memory leak related to properties of
 __of_node_dup
Date: Fri, 13 Oct 2017 17:59:11 -0700
Message-ID: <59E1615F.50901@gmail.com>
References: <1507858967-40416-1-git-send-email-alan.1.wang@nokia-sbell.com>
 <CAL_JsqK0pc6sL+YR2U-J44fvwKivmxiULD5uc7bzTMEOZ_LKXg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqK0pc6sL+YR2U-J44fvwKivmxiULD5uc7bzTMEOZ_LKXg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, alawang <alan.1.wang@nokia-sbell.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 10/13/17 13:47, Rob Herring wrote:
> On Thu, Oct 12, 2017 at 8:42 PM, alawang <alan.1.wang@nokia-sbell.com> wrote:
>> It is possible a node was dynamically allocated but without any
>> property. The properies will be got from devices and added to the
>> node when devices got connected.
>> When release this node, all properties of which had been moved to
>> deadprops.
>> In this case, the properties in the deadprops list are never
>> deallocated.
> 
> This is not new, right? Do you actually hit this case? If so, how?
> 
>>
>> Signed-off-by: alawang <alan.1.wang@nokia-sbell.com>
>> ---
>>  drivers/of/dynamic.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
>> index 301b6db..465d43b 100644
>> --- a/drivers/of/dynamic.c
>> +++ b/drivers/of/dynamic.c
>> @@ -335,6 +335,10 @@ void of_node_release(struct kobject *kobj)
>>         if (!of_node_check_flag(node, OF_DYNAMIC))
>>                 return;
>>
>> +       if (!prop) {
>> +               prop = node->deadprops;
>> +               node->deadprops = NULL;
>> +       }
>>         while (prop) {
>>                 struct property *next = prop->next;
>>                 kfree(prop->name);
>> --
>> 2.6.2
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

The code looks right to me.  The patch description is confusing to me.

If a node with no properties is dynamically added, then a property is
dynamically added to the node, then the property is dynamically removed,
the result will be node->properties == NULL and node->deadprops != NULL.

Reviewed-by: Frank Rowand <frowand.list@gmail.com>
