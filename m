From: Arend van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] Documentation: dt-binding: net: wireless: add
 bcm43430-fmac
Date: Sat, 2 Sep 2017 00:01:43 +0200
Message-ID: <73188868-3809-b94e-d08b-56b83b981558@broadcom.com>
References: <20170829214309.34466-1-antony@phenome.org>
 <CAGb2v66=JvS9wHkUNBwd+vHwx4NAQsaWyhx1OyEokSZizo+7-g@mail.gmail.com>
 <20170830120218.ms3xuhp4qsibistv@AntonyAntony.local>
 <20170901164911.aiu5ej5u546z5kow@rob-hp-laptop>
 <bb53a79e-8045-3c9b-8c98-8d4815c3b57a@broadcom.com>
 <CAL_JsqLsnXYfyix3KLkEYguWAe-Wqcb9Nd22jM8HM2dnw4Frog@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLsnXYfyix3KLkEYguWAe-Wqcb9Nd22jM8HM2dnw4Frog-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Antony Antony <antony-AVhj06Q78b5AfugRpC6u6w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 01-09-17 23:38, Rob Herring wrote:
> On Fri, Sep 1, 2017 at 2:10 PM, Arend van Spriel
> <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
>> On 01-09-17 18:49, Rob Herring wrote:
>>>
>>> On Wed, Aug 30, 2017 at 02:02:18PM +0200, Antony Antony wrote:
>>>>
>>>> hi,
>>>>
>>>> On Wed, Aug 30, 2017 at 10:28:20AM +0800, Chen-Yu Tsai wrote:
>>>>>
>>>>> On Wed, Aug 30, 2017 at 5:43 AM, Antony Antony <antony-AVhj06Q78b5AfugRpC6u6w@public.gmane.org>
>>>>> wrote:
>>>>
>>>>
>>>>>> a/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt
>>>>>> +++
>>>>>> b/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt
>>>>>> @@ -6,7 +6,9 @@ connects the device to the system.
>>>>>>
>>>>>>    Required properties:
>>>>>>
>>>>>> - - compatible : Should be "brcm,bcm4329-fmac".
>>>>>> + - compatible : should be one of the following:
>>>>>> +       * "brcm,bcm4329-fmac"
>>>>>> +       * "brcm,bcm43430-fmac"
>>>>>
>>>>>
>>>>> You updated the bindings, but not the driver. So it's not actually
>>>>> going to work. More specifically, OOB interrupts won't work.
>>>>>
>>>>
>>>> understood, ignore this patch for now. Thanks Chen-Yu.
>>>>
>>>>> IIRC, The compatible string for this particular case, as it was
>>>>> originally proposed, only serves as a placeholder for the driver
>>>>> to check against. None of the instances in sunxi device trees
>>>>> match the actual chip model. Actual model matching is done
>>>>> through SDIO, as you've already seen.
>>>>
>>>>
>>>> yes it seems SDIO driveer code is smarter, once it initialize
>>>> brcm,bcm4329-fmac it ignore the DT info and read the chip details to
>>>> locate
>>>> firmware file.
>>>>
>>>> I also noticed other boards using bcm4329-fmac in similar situations.
>>>> https://patchwork.kernel.org/patch/9739181/
>>>>
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts?h=v4.13-rc7
>>>>
>>>> I will resend "NanoPi NEO Plus2" dts with "brcm,bcm4329-fmac" and see
>>>> where
>>>> it goes.
>>>
>>>
>>> Adding the compatible or instead of? The former would be better. You
>>> should still have the actual chip in case you do have some difference to
>>> handle.
>>
>>
>> Hi Rob,
>>
>> Actually the Broadcom wifi chips themselves are discoverable. So once the
>> driver has access to the register space of the device it can determine the
>> actual chip, its revision, and exactly what cores (and their revision) are
>> present in the chip. Hence there is a single compatible string as there is
>> no need to convey the same information through device tree data.
> 
> So if a chip has different power on/off sequencing you can discover that?
> 
> I realize that most often you don't need it, but a more specific
> compatible is there in case you do and so it doesn't require a DTB
> update to handle some difference. But you can keep using one
> compatible because I can't really enforce any of that.

For SDIO chips the power sequencing is defined by power-seq-* in 
bindings/mmc and handled by the MMC stack itself. So the wifi driver is 
not dealing with that.

Regards,
Arend
