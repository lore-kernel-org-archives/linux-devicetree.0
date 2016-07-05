From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: imx6sx-sabreauto: Fix misspelled property
Date: Tue, 5 Jul 2016 09:54:36 +0100
Message-ID: <577B75CC.9040304@arm.com>
References: <1467691450-22975-1-git-send-email-afaerber@suse.de>
 <1467691450-22975-2-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467691450-22975-2-git-send-email-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Ettore Chimenti <ettore.chimenti-GcR40IO4/Fc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 05/07/16 05:04, Andreas F=C3=A4rber wrote:
> In commit 99fc5ba0bfb6 ("ARM: dts: imx6sx: add i.mx6sx sabreauto boar=
d
> support") it should've been enable-sdio-wakeup (not -wakup). But that=
 is
> now considered a legacy name for wakeup-source, so directly use the n=
ew
> name instead, as done in commit 26cefdd15db1 for the other occurrence=
=2E
>
> Fixes: 26cefdd15db1 ("ARM: dts: imx: replace legacy wakeup property w=
ith 'wakeup-source'")
> Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>

Ah, I failed to find this occurrence with grep. Thanks for fixing it.

Acked-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>

--=20
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
