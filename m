From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [PATCH] [media] tvp5150: remove signal generator as input from
 the DT binding
Date: Tue, 23 Feb 2016 15:23:48 -0300
Message-ID: <56CCA3B4.7060700@osg.samsung.com>
References: <1456243798-12453-1-git-send-email-javier@osg.samsung.com>
 <3469550.VVKtG3tqH6@avalon> <56CC8887.803@osg.samsung.com>
 <63317542.65NzPYJCcU@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <63317542.65NzPYJCcU@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Laurent,

On 02/23/2016 03:02 PM, Laurent Pinchart wrote:
> Hi Javier,
>
> On Tuesday 23 February 2016 13:27:51 Javier Martinez Canillas wrote:
>> On 02/23/2016 01:16 PM, Laurent Pinchart wrote:
>>> On Tuesday 23 February 2016 13:09:58 Javier Martinez Canillas wrote:
>>>> The chip internal signal generator was modelled as an input connector
>>>> and represented as a media entity but isn't really a connector so the
>>>> driver was changed to use the V4L2_CID_TEST_PATTERN control instead.
>>>>
>>>> Remove the signal generator input from the list of connectors in the
>>>> tvp5150 DT binding document as well since isn't a connector anymore.
>>>>
>>>> Signed-off-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
>>>>
>>>> ---
>>>> Hello,
>>>>
>>>> I think is OK to change this DT binding because is only in the media tree
>>>> for now and not in mainline yet and also is expected to change more since
>>>> there are still discussions about how input connectors will be supported
>>>> by the Media Controller framework in the media subsystem.
>>>
>>> I think that's fine, yes
>>>
>>> Acked-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
>>
>> Thanks.
>>
>>> I haven't noticed the patch that introduced this early enough I'm afraid,
>>> and I think we still have issues with those bindings.
>>
>> Yes, I posted those patches and got merged before we had the discussion
>> about input connectors over IRC so I didn't know what was the correct way
>> to do it.
>>
>>> The tvp5150 node should *not* contain connector subnodes, the connectors
>>> nodes should use the bindings defined in
>>> Documentation/devicetree/bindings/display/connector/ and be linked to the
>>> tvp5150 node using the OF graph bindings (ports and endpoints).
>>
>> Agreed.
>>
>>> Do you think you could fix that ?
>>
>> Yes I will, I'm waiting for the input connectors discussions to settle so I
>> can post a final version of the DT bindings following what is agreed by all.
>>
>
> Shouldn't we revert the patch that introduced connectors support in the DT
> bindings in the meantime then, to avoid known to be broken bindings from
> hitting mainline in case we can't fix them in time for v4.6 ?
>

Yes, that would be a good idea. I've seen recently though a DT binding doc that
was marked as unstable / work in progress and I wonder if that's a new accepted
convention for DT binding docs or is just something that slipped through review.

The commit I'm talking about is f07b4e49d27e ("Documentation: bindings: berlin:
consider our dt bindings as unstable") but I don't see anything documented in
Documentation/devicetree/bindings/ABI.txt.

In any case, I'm fine with either marking the DT binding doc as unstable or to
revert the patch that added the connectors portion to the tvp5150 DT binding.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
