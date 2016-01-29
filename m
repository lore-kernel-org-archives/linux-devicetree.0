From: Ryan <ryanphilips19-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Status variable
Date: Fri, 29 Jan 2016 14:53:02 +0530
Message-ID: <CANMsd01ty4H3mP0-6kyc0ZxMBAd7p2Y6o7dHy4sFSGhog22R2w@mail.gmail.com>
References: <CANMsd02jhaouPBuySWXQ2edE+gyMZ3dncobipKa-dg1vLJCE2Q@mail.gmail.com>
	<3706345.JqhHqFGYfF@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3706345.JqhHqFGYfF@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Bergman,

Sorry to bother you again: I was going through this:

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/drivers/of/base.c#n524

Status should be absent or okay and "ok". Otherwise the entry is
treated as disabled.

Is this understanding correct?


On Fri, Jan 29, 2016 at 2:19 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Friday 29 January 2016 14:13:20 Ryan wrote:
>> Hello,
>>
>> I am confused about the "status" variables on a device tree. What is
>> the meaning of
>> status="okay", status="enabled", status="disabled".
>>
>> the function: __of_device_is_available returns 1 if the entry itself
>> is not there.
>>
>> Why is this?
>>
>> Thanks for your time.
>
> On status="disabled" is defined to have an effect and will prevent
> the device from being used. Any other value or an absent status
> property is interpreted as a working device.
>
> The common way this is used is that a soc-specific .dtsi file lists
> all devices that are present within the soc, but marks the ones as
> disabled that are not always usable because they depend on a external
> connection (e.g. a uart only makes sense if it talks to something,
> while a timer device is always usable). A board specific file then
> does not need to define the entire device but just override the
> status as "okay".
>
>         Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
