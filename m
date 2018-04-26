From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: [PATCH] of: overlay: Stop leaking resources on overlay removal
Date: Thu, 26 Apr 2018 09:31:54 +0200
Message-ID: <46dbbff8-79ee-d397-7f8e-791fb1bc594c@siemens.com>
References: <097f1b01-6cb4-8dcb-0498-7b4c59a7ea53@siemens.com>
 <7aca82c1-a02c-2f84-bc32-6e8a118ba601@gmail.com>
 <90e7da9d-d40a-17f1-e627-873f58a3dce5@siemens.com>
 <b813ac8f-a1e3-3e27-2e44-0a576e05d01c@gmail.com>
 <17561711-94f7-b3d4-8f06-9cfa69daaf23@gmail.com>
 <033fba6b-d93c-249c-d552-1f5336b34387@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <033fba6b-d93c-249c-d552-1f5336b34387@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alan Tull <atull@kernel.org>
List-Id: devicetree@vger.kernel.org

On 2018-04-26 02:44, Frank Rowand wrote:
> On 04/25/18 17:32, Frank Rowand wrote:
>> Hi Jan,
>>
>> On 04/24/18 13:58, Frank Rowand wrote:
>>> On 04/24/18 10:50, Jan Kiszka wrote:
>>>> On 2018-04-24 19:44, Frank Rowand wrote:
>>>>> On 04/24/18 09:19, Jan Kiszka wrote:
>>>>>> Only the overlay notifier callbacks have a chance to potentially get
>>>>>> hold of references to those two resources, but they do not store them.
>>>>>> So it is safe to stop the intentional leaking.
>>>>>>
>>>>>> See also https://lkml.org/lkml/2018/4/23/1063 and following.
>>>>>>
>>>>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>>>>> ---
>>>>>>
>>>>>> Ideally, we sort out any remaining worries during the 4.17-rc cycle.
>>>>>>
>>>>>>  drivers/of/overlay.c | 13 ++-----------
>>>>>>  1 file changed, 2 insertions(+), 11 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
>>>>>> index b35fe88f1851..3553f1f57a62 100644
>>>>>> --- a/drivers/of/overlay.c
>>>>>> +++ b/drivers/of/overlay.c
>>>>>> @@ -671,17 +671,8 @@ static void free_overlay_changeset(struct overlay_changeset *ovcs)
>>>>>>  		of_node_put(ovcs->fragments[i].overlay);
>>>>>>  	}
>>>>>>  	kfree(ovcs->fragments);
>>>>>> -
>>>>>> -	/*
>>>>>> -	 * TODO
>>>>>> -	 *
>>>>>> -	 * would like to: kfree(ovcs->overlay_tree);
>>>>>> -	 * but can not since drivers may have pointers into this data
>>>>>> -	 *
>>>>>> -	 * would like to: kfree(ovcs->fdt);
>>>>>> -	 * but can not since drivers may have pointers into this data
>>>>>> -	 */
>>>>>> -
>>>>>> +	kfree(ovcs->overlay_tree);
>>>>>> +	kfree(ovcs->fdt);
>>>>>>  	kfree(ovcs);
>>>>>>  }
>>>>>>  
>>>>>>
>>>>>
>>>>> Nack.  It is premature to submit this while the conversation is
>>>>> continuing in the other thread.
>>>>>
>>>>> I'll continue the conversation in the other thread.
>>>>>
>>>>
>>>> Well, at least the strongest argument has been resolved now, the
>>>> notifier topic. Curious to learn what remains. As I noted, we should
>>>> work hard to sort out the API regression prior to the release.
>>>
>>> Nope, the notifier discussion continues in the other thread.
>>
>> Thanks for your patience in the other thread.
>>
>> As I noted there, I am now willing to accept this patch with some
>> small changes.  Please add a minimal section to
>> Documentation/devicetree/overlay-notes.txt about overlay notifiers.
>> The most important thing to note there is that the overlay notifiers
>> are not allowed to retain any pointers into the overlay devicetree.
> 
> Please also add a function header comment to of_overlay_notifier_register()
> in drivers/of/overlay.c that notes the restriction on the overlay notifier.
> 
> 
>> Also, instead of removing the "TODO" comment in free_overlay_changeset(),
>> change it to say something to the effect of "there should be no live pointers
>> into ovcs->overlay_tree and ovcs->fdt due to the policy that overlay
>> notifiers are not allowed to retain pointers into the overlay devicetree".
>>
>> I will also add myself to the OPEN FIRMWARE AND DEVICE TREE OVERLAYS
>> entry of MAINTAINERS and add a keyword line to catch overlay notifiers.
>>
>> I am not happy about freeing the overlay devicetree and overlay fdt
>> while overlay notifiers are able to retain pointers into the overlay
>> devicetree and overlay fdt, but am willing to accept documentation and
>> review as a partial protection until the devicetree access APIs can be
>> modified to prevent the notifiers from accessing the pointers.  The
>> volume of overlay notifier patches should be small enough to not be
>> a review burden.
>>
>> -Frank
>>
>>
> 

Thanks for reconsidering! I'll look into your change requests soon and
come up with v2.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux
