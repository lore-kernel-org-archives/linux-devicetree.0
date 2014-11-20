From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Looking for good references for ARM driver development
Date: Thu, 20 Nov 2014 14:48:42 +0530
Message-ID: <CAOh2x=n9zHiyoqOJuh2PzuS1_GYCQhYWB5LPL7MW8hUPQ1yTsg@mail.gmail.com>
References: <546C920A.7060800@free.fr>
	<546CB0EB.9080005@suse.de>
	<546CBFAC.9040906@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <546CBFAC.9040906-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mason <mpeg.blue-GANU6spQydw@public.gmane.org>
Cc: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 19, 2014 at 9:35 PM, Mason <mpeg.blue-GANU6spQydw@public.gmane.org> wrote:
> Is there an exhaustive list of available buses (on the ARM platform)
> and an overview of when/where each one is appropriate?

Not sure if its mentioned that clearly anywhere. BUT bus is normally
bound by the way you need to access registers of a device.

For example, if a device's registers are accessible via SPI, then it has
to register on SPI. Similarly for I2C, USB, UART, PCI, etc..

The only special cases are Platform and AMBA. Both these are for
the devices which are directly accessible from Soc bus.

AMBA is specifically for the IPs designed by ARM. All these IPs have
their vendor/version information at a predefined offset and so the AMBA
bus core reads that value to make device/driver bindings. i.e. It doesn't
depend on matching .name string in device/driver structures.

Whereas platform is for all other devices accessible over Soc bus. Device
and drivers are matches here based on the .name string as their is no
ID to read from hardware.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
