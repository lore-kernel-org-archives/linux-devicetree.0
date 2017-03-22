From: Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: rockchip: increase SD clock frequency on Radxa Rock
Date: Wed, 22 Mar 2017 20:04:26 +0300
Message-ID: <FCE5C7E0-7BED-4600-952A-E1EBC900F814@gmail.com>
References: <1490110822-3310-1-git-send-email-al.kochet@gmail.com> <1978752.xjtBqdMt97@phil>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1978752.xjtBqdMt97@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


> 22 =D0=BC=D0=B0=D1=80=D1=82=D0=B0 2017 =D0=B3., =D0=B2 19:47, Heiko =
Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB(=D0=B0=
):
>=20
> sorry, but I will not apply this patch at this time.

> When testing on my radxarock with the card I always use upon entering =
the=20
> rootfs everything explodes with -110 errors, while without that patch =
the card=20
> runs stable as far as I can tell.

> I also don't have the time to investigate further right now though.

Ok. Let leave as is for now.

My radxa worked stable for a year with this settings.
And my custom rk3188 based board also has this setting. Kernel 4.8.
And I saw -110 errors only then I disconnect SD-card from board.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
