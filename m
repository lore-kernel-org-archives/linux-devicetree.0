From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v3 1/2] drm/bridge: dw-hdmi: support optional supply regulators
Date: Sat, 06 Jun 2015 01:03:25 +0200
Message-ID: <1590039.lzO65vr8K7@diego>
References: <4184159.j0iXe39dFB@phil> <23123577.mOoqGCAPdL@diego> <20150605122311.GA759@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150605122311.GA759-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Thierry

Am Freitag, 5. Juni 2015, 14:23:14 schrieb Thierry Reding:
> On Fri, Jun 05, 2015 at 02:16:40PM +0200, Heiko St=FCbner wrote:
> > > If this is specific to the Rockchip implementation, shouldn't thi=
s go
> > > into Documentation/devicetree/bindings/video/dw_hdmi-rockchip.txt=
? It
> > > could then simply go into the Rockchip DRM tree.
> >=20
> > actually, we determined that the supply names are universal to the =
IP
> > (both in imx and rockchip and probably more if there are more users=
 out
> > there). Just Russell requested that we don't pollute the generic co=
de
> > until necessary, as it looks like the supply of those is somehow ha=
ndled
> > internally on the imx.
> If it's universal then there should be no need to mention the Rockchi=
p
> compatible specifically. Also, it might be better to submit this as t=
wo
> separate patches, one for the binding and another for the driver.
>=20
> I could extract the DT binding piece myself and apply only that, then
> somebody else can apply the Rockchip change to that driver separately=
=2E

so I've sent a v4 where the dt-binding is split off (and without the Ro=
ckchip=20
specific text), so if you want to take patch1, Mark could take patch2 a=
nd I=20
would take the dts changes in patch3.


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
