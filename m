From: Arend van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] Documentation: dt-binding: net: wireless: add
 bcm43430-fmac
Date: Fri, 1 Sep 2017 23:30:59 +0200
Message-ID: <8af0e096-f4b1-213f-d543-fa711e1961ad@broadcom.com>
References: <20170829214309.34466-1-antony@phenome.org>
 <CAGb2v66=JvS9wHkUNBwd+vHwx4NAQsaWyhx1OyEokSZizo+7-g@mail.gmail.com>
 <20170830120218.ms3xuhp4qsibistv@AntonyAntony.local>
 <20170901164911.aiu5ej5u546z5kow@rob-hp-laptop>
 <bb53a79e-8045-3c9b-8c98-8d4815c3b57a@broadcom.com>
 <20170901204030.2zpsoa4i53tdegs3@AntonyAntony.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170901204030.2zpsoa4i53tdegs3-sIi4olfLYEDaK4aX9S0K76zUEOm+Xw19@public.gmane.org>
Content-Language: en-US
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Antony Antony <antony-AVhj06Q78b5AfugRpC6u6w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01-09-17 22:40, Antony Antony wrote:
> On Fri, Sep 01, 2017 at 09:10:41PM +0200, Arend van Spriel wrote:
>> On 01-09-17 18:49, Rob Herring wrote:
>>> On Wed, Aug 30, 2017 at 02:02:18PM +0200, Antony Antony wrote:
>>>> hi,
>>>>
>>>> On Wed, Aug 30, 2017 at 10:28:20AM +0800, Chen-Yu Tsai wrote:
>>>>> On Wed, Aug 30, 2017 at 5:43 AM, Antony Antony <antony-AVhj06Q78b5AfugRpC6u6w@public.gmane.org> wrote:
>>>>
>>>>>> a/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt
>>>>>> +++ b/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt
>>>>>> @@ -6,7 +6,9 @@ connects the device to the system.
>>>>>>
>>>>>>    Required properties:
>>>>>>
>>>>>> - - compatible : Should be "brcm,bcm4329-fmac".
>>>>>> + - compatible : should be one of the following:
>>>>>> +       * "brcm,bcm4329-fmac"
>>>>>> +       * "brcm,bcm43430-fmac"
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
>>>> yes it seems SDIO driveer code is smarter, once it initialize
>>>> brcm,bcm4329-fmac it ignore the DT info and read the chip details to locate
>>>> firmware file.
>>>>
>>>> I also noticed other boards using bcm4329-fmac in similar situations.
>>>> https://patchwork.kernel.org/patch/9739181/
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts?h=v4.13-rc7
>>>>
>>>> I will resend "NanoPi NEO Plus2" dts with "brcm,bcm4329-fmac" and see where
>>>> it goes.
>>>
>>> Adding the compatible or instead of? The former would be better. You
>>> should still have the actual chip in case you do have some difference to
>>> handle.
>>
>> Hi Rob,
>>
>> Actually the Broadcom wifi chips themselves are discoverable. So once the
>> driver has access to the register space of the device it can determine the
>> actual chip, its revision, and exactly what cores (and their revision) are
>> present in the chip. Hence there is a single compatible string as there is
>> no need to convey the same information through device tree data.
> 
> In my expereince this how it seems to work.
> 
> I jsut discovered s/brcm,bcm4329-fmac/brcm/ can load the broadcom driver.
> 
> brcmf: wifi@1 {
> 	reg = <1>;
> 	compatible = "brcm";
> };
> 
> This looks better to me. Maxime, Would this work?

I have no idea what you are saying here. To what exactly do you apply 
that substitute. In brcmfmac I have:

         if (!np || bus_type != BRCMF_BUSTYPE_SDIO ||
             !of_device_is_compatible(np, "brcm,bcm4329-fmac"))
                 return;

In my perception using "brcm" goes against DT compatible naming convention.

Regards,
Arend
