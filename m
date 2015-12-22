From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [linux-sunxi] Re: [PATCH 4/5] ARM: dts: sun5i: Add dts file for
 the Empire Electronix D709 tablet
Date: Tue, 22 Dec 2015 12:29:24 +0800
Message-ID: <CAGb2v67+XpYwUFAVSGEGAfJ0bzubQ87Ebaf5W5Ze619mEE6uUA@mail.gmail.com>
References: <1450611782-9494-1-git-send-email-hdegoede@redhat.com>
 <1450611782-9494-4-git-send-email-hdegoede@redhat.com> <CAGb2v65daCCOWf7EXDkNWnxv1idXHXesOp6Et_0h-o+9drdeMA@mail.gmail.com>
 <5677D87A.90805@redhat.com> <20151221161132.GA30359@lukather> <567854D5.7030601@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <567854D5.7030601-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 22, 2015 at 3:36 AM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> Hi,
>
> On 21-12-15 17:11, Maxime Ripard wrote:
>>
>> Hi,x
>>
>> On Mon, Dec 21, 2015 at 11:46:18AM +0100, Hans de Goede wrote:
>>>>
>>>> On the side, any thoughts on how to handle the differences between
>>>> various "Q8"
>>>> tablets, like different I2C-based sensors and WiFi chips?
>>>
>>>
>>> For i2c based sensors the plan is to use devicetree overlays + an in
>>> kernel
>>> overlay manager which probes the i2c bus (checking known touchscreen /
>>> accelerometer
>>> addresses) and then picks the right touchscreen + accelerometer overlays.
>>>
>>> Wifi is somewhat more tricky I must admit, esp. since there seem to be q8
>>> a23 based
>>> tablet variants with usb wifi and others with sdio wifi. Since both
>>> busses are
>>> discoverable I'm tempted to just enable both in devicetree, and let the
>>> kernel probe
>>> and see what is actually there. This assume that the way the wifichip is
>>> powered
>>> is the same on all boards, or at least that it is safe to enable the
>>> necessary
>>> regulators on all boards ...
>>>
>>>> I'm asking because with Maxime's couple-regulator we should be able to
>>>> get the
>>>> RTL8723BS on the Q8 A23/33 v1.5 working.
>>>
>>>
>>> So this means enabled the sdio controller (should be safe on all boards?)
>>> and
>>> enabling 2 regulators to power the wifi-chip. I think it will be safe to
>>> do this
>>> even on boards where those regulators are not used, what do you think ?
>>
>>
>> Wouldn't that introduce some useless power drain on those boards?
>
>
> If nothing is attached to those regulators (which I expect to be the case
> when
> they are not used to power wifi) then I would expect the drain to be
> minimal,
> my biggest worry is some board having tied these to ground, but I don't
> think
> that is very likely.

AFAIK the AXP datasheets mention that unused DCDC outputs should be left
floating. Not sure if this applies to LDO outputs as well. But any used
outputs would have a bypass capacitor.

>From the board designs I've seen, this seems to be the common case.
I'm not an electrical engineer, but I think we're covered here.

Another thing we need to deal with is the different power sequencing
requirements for the different SDIO chips.

Regards
ChenYu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
