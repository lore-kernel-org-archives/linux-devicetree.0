From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] of: overlay: Stop leaking resources on overlay removal
Date: Tue, 24 Apr 2018 13:58:27 -0700
Message-ID: <b813ac8f-a1e3-3e27-2e44-0a576e05d01c@gmail.com>
References: <097f1b01-6cb4-8dcb-0498-7b4c59a7ea53@siemens.com>
 <7aca82c1-a02c-2f84-bc32-6e8a118ba601@gmail.com>
 <90e7da9d-d40a-17f1-e627-873f58a3dce5@siemens.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <90e7da9d-d40a-17f1-e627-873f58a3dce5@siemens.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jan Kiszka <jan.kiszka@siemens.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alan Tull <atull@kernel.org>
List-Id: devicetree@vger.kernel.org

On 04/24/18 10:50, Jan Kiszka wrote:
> On 2018-04-24 19:44, Frank Rowand wrote:
>> On 04/24/18 09:19, Jan Kiszka wrote:
>>> Only the overlay notifier callbacks have a chance to potentially get
>>> hold of references to those two resources, but they do not store them.
>>> So it is safe to stop the intentional leaking.
>>>
>>> See also https://lkml.org/lkml/2018/4/23/1063 and following.
>>>
>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>> ---
>>>
>>> Ideally, we sort out any remaining worries during the 4.17-rc cycle.
>>>
>>>  drivers/of/overlay.c | 13 ++-----------
>>>  1 file changed, 2 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
>>> index b35fe88f1851..3553f1f57a62 100644
>>> --- a/drivers/of/overlay.c
>>> +++ b/drivers/of/overlay.c
>>> @@ -671,17 +671,8 @@ static void free_overlay_changeset(struct overlay_changeset *ovcs)
>>>  		of_node_put(ovcs->fragments[i].overlay);
>>>  	}
>>>  	kfree(ovcs->fragments);
>>> -
>>> -	/*
>>> -	 * TODO
>>> -	 *
>>> -	 * would like to: kfree(ovcs->overlay_tree);
>>> -	 * but can not since drivers may have pointers into this data
>>> -	 *
>>> -	 * would like to: kfree(ovcs->fdt);
>>> -	 * but can not since drivers may have pointers into this data
>>> -	 */
>>> -
>>> +	kfree(ovcs->overlay_tree);
>>> +	kfree(ovcs->fdt);
>>>  	kfree(ovcs);
>>>  }
>>>  
>>>
>>
>> Nack.  It is premature to submit this while the conversation is
>> continuing in the other thread.
>>
>> I'll continue the conversation in the other thread.
>>
> 
> Well, at least the strongest argument has been resolved now, the
> notifier topic. Curious to learn what remains. As I noted, we should
> work hard to sort out the API regression prior to the release.

Nope, the notifier discussion continues in the other thread.
