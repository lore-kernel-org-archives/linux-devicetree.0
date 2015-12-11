From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v2 3/4] ARM: dts: rockchip: add core rk3228 dtsi
Date: Sat, 12 Dec 2015 00:42:05 +0100
Message-ID: <12513641.smzfGNJzGr@diego>
References: <1449797452-19389-1-git-send-email-jeffy.chen@rock-chips.com> <1449797452-19389-4-git-send-email-jeffy.chen@rock-chips.com> <1537775.lkITlqtJgh@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1537775.lkITlqtJgh@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Freitag, 11. Dezember 2015, 12:25:32 schrieb Heiko St=FCbner:
> Hi Jeffy,
>=20
> Am Freitag, 11. Dezember 2015, 09:30:51 schrieb Jeffy Chen:
> > Initial release for rk3228 shared dtsi.
> >=20
> > Signed-off-by: Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>=20
> Booth dts look good now, just need to wait on Linus Walleij picking u=
p the
> pinctrl patch first.

as the pinctrl change got picked up, I've now also applied the two dts=20
patches. I've added the missing entry for=20
Documentation/devicetree/bindings/arm/rockchip.txt myself now, please k=
eep=20
that in mind for future boards :-) .


Thanks
Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
