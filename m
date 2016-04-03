From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM64: dts: amlogic: Add hiu and periphs buses
Date: Sun, 3 Apr 2016 19:34:18 +0200
Message-ID: <CAOQ7t2Yh7ZOw13Mjj5NLupti7_WyGZ7LEPe_mhQXtUyTGtH3ng@mail.gmail.com>
References: <1459703681-8689-1-git-send-email-carlo@caione.org>
	<5701508B.1050403@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5701508B.1050403-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-meson <linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Apr 3, 2016 at 7:19 PM, Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org> =
wrote:
> Am 03.04.2016 um 19:14 schrieb Carlo Caione:
>
> Looks sane, but where did you get that info from? The others I had fo=
und
> in an iomap node or so but did not spot these.

=46or hiubus you can see the io_hiubus_base node in the gxbb_p201.dts D=
T file.
=46or the periphs bus is a bit more tricky. The only reasonable
information I found is oddly in
drivers/amlogic/hdmi/hdmi_tx_20/hw/reg_ops.c.

--=20
Carlo Caione
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
