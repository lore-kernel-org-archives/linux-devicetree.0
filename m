From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: meson: Adding hwrev syscon node
Date: Thu, 18 Feb 2016 22:24:24 +0100
Message-ID: <CAL9uMOGy=sP+gg8v=9N5zhrWGNA2Aq7N34JYgUON-+GH4b1d0w@mail.gmail.com>
References: <1455730114-2547-1-git-send-email-romain.perier@gmail.com>
	<4158343.mkrTsd5B4G@wuerfel>
	<CAOQ7t2byFoW657-1xnsBpeyPkB6K25R=_pPmRDmT32Sjef=kUw@mail.gmail.com>
	<4136837.fyWFbJqZfO@wuerfel>
	<CAOQ7t2aqZj3STFsdTSQZMTK5U+8Oem8oFroxHKWkt=AeP+Zczg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOQ7t2aqZj3STFsdTSQZMTK5U+8Oem8oFroxHKWkt=AeP+Zczg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 18, 2016 at 10:04 PM, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org> wrote:
> On Thu, Feb 18, 2016 at 3:22 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:

>> However, if some or all of the other devices actually are entirely
>> made up of register ranges within cbus, that would indicate that
>> cbus itself is not just a collection of random registers but something
>> that could be considered a bus of itself in hardware, and then
>> we could represent the other devices as children of this bus.
>
> I think that this is exactly the case. We are missing this cbus in the
> DTS because (for lacking of proper documentation) we are not sure
> about start / end / size.

This is not entirely correct actually.
CBUS starts at 0xc1100000 with a size of 0x00100000 according to the Amlogic SDK

-- 
Carlo Caione  |  +39.340.80.30.096  |  Endless
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
