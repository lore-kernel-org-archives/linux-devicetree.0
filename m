From: Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Subject: Re: [PATCH 1/2] drm/bridge: ti-tfp410: support hpd via gpio
Date: Thu, 30 Mar 2017 23:51:03 +0200
Message-ID: <09a6bf1b-f743-4f1f-9bd3-d2c137365b16@rwth-aachen.de>
References: <2e47786ab3d04078ae70d0c4064f7c4d@rwthex-s1-b.rwth-ad.de>
 <093b4e9c0ae6413499e5bf8ec309fa41@rwthex-s1-b.rwth-ad.de>
 <6dfb2b66ec2a408dabe80d703f411ce0@rwthex-s1-b.rwth-ad.de>
 <d6b2391f-3e4a-2761-b6a0-8997d2c78600@codeaurora.org>
 <f87195b3-bd89-d698-c935-4e3aa97c01e2@ti.com>
 <e63e628794b044c2a615091697622d50@rwthex-w1-b.rwth-ad.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e63e628794b044c2a615091697622d50-cBaz+nnMw18umhiu9RXYRl5UTUQ924AY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, DRI mailing list <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 03/30/2017 11:49 AM, Archit Taneja wrote:
>
>
> On 03/28/2017 07:02 PM, Jyri Sarha wrote:
>> On 03/27/17 08:58, Archit Taneja wrote:
>>> Hi,
>>>
>>> On 03/07/2017 03:21 AM, Christopher Spinrath wrote:
>>>> Hi Fabio,
>>>>
>>>> On 03/06/2017 10:46 PM, Fabio Estevam wrote:
>>>>> Hi Christopher,
>>>>>
>>>>> On Mon, Mar 6, 2017 at 6:40 PM,
>>>>> <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org> wrote:
>>>>>> From: Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
>>>>>>
>>>>>> On some boards the hpd pin of a hdmi connector is wired up to a gpio
>>>>>> pin. Since in the DRM world the tfp410 driver is responsible for
>>>>>> handling the connector, add support for hpd gpios in this very
>>>>>> driver.
>>>>>>
>>>>>> Signed-off-by: Christopher Spinrath
>>>>>> <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
>>>>>> ---
>>>>>>  drivers/gpu/drm/bridge/ti-tfp410.c | 72
>>>>>> ++++++++++++++++++++++++++++++++++++--
>>>>>
>> ...
>>>>
>>>
>>> The patch looks good to me.
>>>
>>> Jyri,
>>>
>>> Is it possible for you to verify this on Beaglebone platform?
>>>
>>
>> If I read my BeagleBone DVI-D Cape docs right, it does not have the HPD
>> pin connected. At least it does not mention any gpio that could be used
>> for the purpose. So I can not easily test this patch in real world
>> situation. For what it is worth the patch looks ok to me too.
>
> Thanks for the review. I looked at the tfp410 data sheet[1], there isn't
> a HPD pin on the chip at all. My guess is that boards using tfp410 most
> likely have the HPD pin routed to the SoC from the HDMI connector
> (with a level shifter/shield in between).

Exactly. I tried to say that in the commit message (and, actually, 
that's what I did in Patch 2/2 for the Utilite Pro).

Thanks,
Christopher

> We would eventually need to move the both ddc and hpd stuff to
> a generic hdmi connector driver later on. I've queued this to
> drm-misc-next.
>
> [1]: http://www.ti.com/lit/ds/symlink/tfp410.pdf
>
> Archit
>
>>
>> Best regards,
>> Jyri
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
