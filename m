From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: meson: Adding hwrev syscon node
Date: Fri, 26 Feb 2016 18:40:11 +0100
Message-ID: <CAOQ7t2b4N+uxkR7_aiiVWzr=DEFjz5BeAEfXiK+YgQZxzF31nQ@mail.gmail.com>
References: <1455730114-2547-1-git-send-email-romain.perier@gmail.com>
	<2692251.6GoexVJEYt@wuerfel>
	<CAOQ7t2Y2B8hfGim9UegUZsurQM0+Df0K0_DjsQ0r8+qMjUSBEw@mail.gmail.com>
	<2709755.YfRKeiaS4S@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2709755.YfRKeiaS4S@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Daniel Drake <drake-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>, Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>, Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 26, 2016 at 6:00 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Friday 26 February 2016 17:43:54 Carlo Caione wrote:

[cut]

>> AFAICT (I'm not the driver author) there is no a really strict reason
>> to have one single driver accessing registers on both buses. Of course
>> the driver has to be changed a bit.
>> Are you suggesting to have two different drivers with two different compatibles?
>
> Just an idea, but yes: if the register layout is different, then they
> would also need different compatible strings.

The meson pin controller driver basically defines the register layout
in the DTS: http://lxr.free-electrons.com/source/arch/arm/boot/dts/meson8.dtsi
#L102 and #L111, so yes, we have a different layouts.

> This is mostly a question of how the hardware design really looks:
> are these two separate pin controllers that each are responsible for
> a clear subset of the pins?

Exactly. All the GPIOAO_XX pins are managed by the pin controller on the AO bus.
At this point I guess it is needed to rework a bit the pinctrl driver
to address this problem switching to two drivers with different
compatibles for the two buses.

Thanks,

-- 
Carlo Caione
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
