From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM64: dts: amlogic: Add basic support for Amlogic S905X
Date: Tue, 13 Sep 2016 08:14:36 +0200
Message-ID: <CAOQ7t2ZjDjZbUfCKwUf4PHywOZx-UiQmy37TEQhWDNYRg0BOag@mail.gmail.com>
References: <20160903082227.30559-1-narmstrong@baylibre.com>
 <20160903082227.30559-3-narmstrong@baylibre.com> <7e27e8c0-bb18-40d8-10d6-3928e66815c7@suse.de>
 <CAOQ7t2bWLq2XP2rKx3msf=1tUfXkQuBWagun46TaKk73qXr=FQ@mail.gmail.com>
 <7ha8fcq26c.fsf@baylibre.com> <28d9160a-ce40-cbbb-b4e9-3ec34be52368@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <28d9160a-ce40-cbbb-b4e9-3ec34be52368-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-amlogic <linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 12, 2016 at 11:43 PM, Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org> wr=
ote:

[cut]
> I'm not arguing over the file name, where it perfectly makes sense to
> have a meson-gxl- prefix (already discussed), just about the compatible
> string where we don't have "amlogic,meson-gxl-s905x-p231" either because
> it is completely unnecessary and does _not_ add any value.
>
> Not that we're checking this string anywhere anyway... If you want to
> check for the GXL family you have to use "amlogic,meson-gxl"; if you
> want to check for the specific SoC you use "amlogic,s905x". Simple. We
> never match partial strings, so there is no sense in a hardcoded prefix
> that is duplicating information already available.

Ok, then. Fine with me.

Neil, do you want to resend my patch or you can take care of the fixes
for the whole patchset?

Thanks,

--=20
Carlo Caione
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
