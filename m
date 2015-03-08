From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 2/2] wl18xx: add basic device-tree support
Date: Sun, 08 Mar 2015 22:53:45 +0100
Message-ID: <2658240.aoSloEbWge@wuerfel>
References: <1424362401-8228-1-git-send-email-eliad@wizery.com> <2194797.iarD5YIxEd@wuerfel> <CAB3XZEfc3qV_o+0paM=HNdySKWwiJDfH=kJ8u0tz1ae+3ujxVw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAB3XZEfc3qV_o+0paM=HNdySKWwiJDfH=kJ8u0tz1ae+3ujxVw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eliad Peller <eliad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>
Cc: "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sunday 08 March 2015 13:13:13 Eliad Peller wrote:
> 
> > I've looked up the what boards actually use this data and found that
> > all of them already support booting from DT: some omap2 boards using
> > arch/arm/mach-omap2/pdata-quirks.c to provide the data, and the
> > davinci 850evm. Can you make sure you add the correct data to all
> > of these dts files as part of your series and remove the
> > wl12xx_platform_data references?
> 
> AFAICT, these board files add wl12xx platform data, while the new DT
> support is only for wl18xx.
> 

How can you tell the difference? What I see is that omap3pandora
(and nothing else) calls wl1251_set_platform_data(), while 
da850-evm and all omap3/omap4 boards use wl12xx_set_platform_data().

The latter seems to refer to all wl12xx and wl18xx variants except
for wl1251, based on my (very limited) understanding of that code.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
