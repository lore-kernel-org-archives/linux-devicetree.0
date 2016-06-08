From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: sun4i: The blue led on the Mele A1000 is a
 power led
Date: Wed, 8 Jun 2016 15:23:31 +0200
Message-ID: <0acb666e-3fa7-fb10-4c0d-1d7990f9eaa6@redhat.com>
References: <1465129393-22379-1-git-send-email-hdegoede@redhat.com>
 <20160607212419.GE14179@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160607212419.GE14179@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 07-06-16 23:24, Maxime Ripard wrote:
> On Sun, Jun 05, 2016 at 02:23:11PM +0200, Hans de Goede wrote:
>> The blue led on the Mele A1000 is wired to light up as soon as the board
>> has powered (it will be on while the gpio is still in input / floating
>> mode), also its location on the top-set box clearly signals "power led".
>>
>> Until now we've been treating this as a generic usr function led, which
>> means that when you plug power into the top-set box, the power-led lights
>> and then turns off as soon as the kernel loads, which looks wrong.
>
> I'm not sure I understand the relationship between usr vs pwr led and
> the fact that it's disabled.

There is no relation, other then that pwr leds typically have
default-state = "on"; set whereas usr leds do not.

>> This renames the led from a1000:blue:usr to a1000:blue:pwr and marks
>> it as default on, fixing this.
>
> however, the default on might. Is it just a confusing commit log, or
> am I overlooking something?

Just a slightly confusing commit log.

Regards,

Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
