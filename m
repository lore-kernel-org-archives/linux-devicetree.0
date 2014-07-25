From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v2 00/11] ARM: dts: zynq: Prepare Parallella
Date: Fri, 25 Jul 2014 12:04:59 +0200
Message-ID: <53D22BCB.9060500@suse.de>
References: <1406242820-20140-1-git-send-email-afaerber@suse.de> <dc23839c-7a69-4674-9d92-80a1d68e9b23@BY2FFO11FD003.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <dc23839c-7a69-4674-9d92-80a1d68e9b23-neA4ZlFjCT2e0EZtPNcJe2YJ4DzVTqeXkX/xN29GLwg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Michal Simek <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Andreas Olofsson <andreas-hhg9azYwhpdWk0Htik3J/w@public.gmane.org>, Matteo Vit <matteo.vit-WGsyu9ztxDWovDFt+AQlJdBPR1lH4CV8@public.gmane.org>, Sean Rickerd <srickerd-IBi9RG/b67k@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Punnaiah,

Am 25.07.2014 05:49, schrieb Punnaiah Choudary Kalluri:
>> Punnaiah Choudary Kalluri had recently proposed to extend the Chipid=
ea
>> USB driver for Zynq; it kept complaining about the PHY though, and I
>> haven't spotted a revised version based on the generic driver yet.
>> https://patchwork.kernel.org/patch/4434681/
>=20
> The plan is, go with generic chip idea driver which is currently unde=
r review.=20
> http://www.spinics.net/lists/linux-usb/msg109576.html
>=20
> So, please wait some more time for extending the Chip idea driver sup=
port
>  to zynq.

Thanks, I did understand that from the Patchwork link. I was however
wondering whether you already have some work branch based on Antoine
T=C3=A9nart's series that you could share?

When we get HDMI working, a USB keyboard will come very handy. ;)

Otherwise, could you please take a look at my branch and let me know
whether I'm doing something fundamentally wrong in wiring your old
driver up in my DT? I did not see any .dts example doing so.

Cheers,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
