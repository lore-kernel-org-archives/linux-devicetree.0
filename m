From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [STLinux Kernel] [PATCH 02/12] clocksource: sti: Provide support
 for the ST LPC Clocksource IP
Date: Thu, 7 May 2015 20:13:24 +0100
Message-ID: <20150507191324.GB16220@x1>
References: <1431005924-21777-1-git-send-email-lee.jones@linaro.org>
 <1431005924-21777-3-git-send-email-lee.jones@linaro.org>
 <20150507150440.GA13336@griffinp-ThinkPad-X1-Carbon-2nd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150507150440.GA13336@griffinp-ThinkPad-X1-Carbon-2nd>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

> > This IP is shared with Watchdog and RTC functionality.  Only one of
> > these IPs can be used at the same time.  We use the device-driver
> > model combined with a DT 'mode' property to enforce this.
>=20
> Which means my previous assertion in V1 that the IP didn't exist on s=
tih415/6
> SoC is most likely wrong, as the watchdog driver has bindings already=
 for those
> platforms.
>=20
> I did try this before and couldn't get it working (driver failed on c=
lk_get_rate)
> on stih416-b2020.
>=20
> Did you try and see if you can get this also working for stih415/6 So=
Cs? It would
> mean we can move away from arm_global_timer for all upstreamed STI pl=
atforms.

This patch-set only supports STiH4{07,10}, which is the only platform
it's been tested on until this point.  I can investigate porting it to
Orly/Orly2 as a subsequent piece of work if it's going to be useful
for ST.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdo=
g" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
