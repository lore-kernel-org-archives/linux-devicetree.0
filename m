From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v3 1/2] drm/bridge: dw-hdmi: support optional supply
 regulators
Date: Wed, 25 Mar 2015 17:51:57 +0100
Message-ID: <1427302317.3441.65.camel@pengutronix.de>
References: <4184159.j0iXe39dFB@phil> <2619686.csNBBFyt8W@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2619686.csNBBFyt8W@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Montag, den 23.03.2015, 19:17 +0100 schrieb Heiko Stuebner:
> Hi Philipp,
>=20
> Am Donnerstag, 12. M=C3=A4rz 2015, 21:45:19 schrieb Heiko Stuebner:
> > At least the Rockchip variant of the dw_hdmi can have controllable =
power
> > supplies providing 1.0 and 1.8V. Therefore add the possibility for =
the
> > generic bridge driver to enable supplies provided by the hw-specifi=
c
> > drivers.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
>=20
> does this look ok now?

Yes, thank you.
Acked-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

> And as we talked about in Chemnitz, who will be taking such bridge-re=
lated=20
> changes, as you mentioned some last bridge-patches going through Thie=
rry.

Indeed, recent drm/bridge fixes were merged through the drm/panel tree.
Thierry, will you continue to do that or should I collect the dw_hdmi
patches?

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
