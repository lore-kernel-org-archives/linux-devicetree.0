From: Eliad Peller <eliad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 2/2] wl18xx: add basic device-tree support
Date: Mon, 9 Mar 2015 09:18:46 +0200
Message-ID: <CAB3XZEczvZH8rYOD-P7iuU4RSurArpRp6JGYX1X22O8tj7v8Qg@mail.gmail.com>
References: <1424362401-8228-1-git-send-email-eliad@wizery.com>
	<2194797.iarD5YIxEd@wuerfel>
	<CAB3XZEfc3qV_o+0paM=HNdySKWwiJDfH=kJ8u0tz1ae+3ujxVw@mail.gmail.com>
	<2658240.aoSloEbWge@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2658240.aoSloEbWge@wuerfel>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Mar 8, 2015 at 11:53 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Sunday 08 March 2015 13:13:13 Eliad Peller wrote:
>>
>> > I've looked up the what boards actually use this data and found that
>> > all of them already support booting from DT: some omap2 boards using
>> > arch/arm/mach-omap2/pdata-quirks.c to provide the data, and the
>> > davinci 850evm. Can you make sure you add the correct data to all
>> > of these dts files as part of your series and remove the
>> > wl12xx_platform_data references?
>>
>> AFAICT, these board files add wl12xx platform data, while the new DT
>> support is only for wl18xx.
>>
>
> How can you tell the difference? What I see is that omap3pandora
> (and nothing else) calls wl1251_set_platform_data(), while
> da850-evm and all omap3/omap4 boards use wl12xx_set_platform_data().
>
> The latter seems to refer to all wl12xx and wl18xx variants except
> for wl1251, based on my (very limited) understanding of that code.

right.
i got mislead because legacy_init_wl12xx() is defined there only for
CONFIG_WL12XX (and not for CONFIG_WL18XX).
it looks like only "isee,omap3-igep0020-rev-f" and
"isee,omap3-igep0020-rev-g" have pdata quirks for wl18xx (and thus
initialize the pdata clocks to 0).

sorry for the trivial question, but what's the standard way to submit
such patch? should i simply add a third patch to the patchset which
removes the pdata quirk and adds the missing dts definition? i don't
have such board, so i can only compile-test it.

thanks,
Eliad.
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
