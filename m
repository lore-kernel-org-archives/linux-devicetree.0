From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 2/5] dt-bindings: soc: add document for rockchip
 reboot notifier driver
Date: Thu, 19 Nov 2015 16:30:59 +0100
Message-ID: <20151119153057.GA12486@ulmo.nvidia.com>
References: <1447840044-19689-1-git-send-email-andy.yan@rock-chips.com>
 <1447840410-19794-1-git-send-email-andy.yan@rock-chips.com>
 <20151118225904.GA5429@rob-hp-laptop>
 <564D2331.8070503@rock-chips.com>
 <20151119125643.GE21862@ulmo.nvidia.com>
 <CANbgqASc1fyoV6FJ1g15P27_h0iA_F9h8aP304X8tRovrKrq5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CANbgqASc1fyoV6FJ1g15P27_h0iA_F9h8aP304X8tRovrKrq5A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Yan <andyshrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, benchan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2015 at 09:39:02PM +0800, Andy Yan wrote:
> Hi Thierry:
>=20
> 2015-11-19 20:56 GMT+08:00 Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>:
>=20
> > On Thu, Nov 19, 2015 at 09:17:37AM +0800, Andy Yan wrote:
> > > Hi Rob:
> > >
> > > On 2015=E5=B9=B411=E6=9C=8819=E6=97=A5 06:59, Rob Herring wrote:
> > > >On Wed, Nov 18, 2015 at 05:53:30PM +0800, Andy Yan wrote:
> > > >>Add devicetree binding document for rockchip reboot nofifier driver
> > > >Just reading the subject this is way too specific to the Linux driver
> > > >needs rather than a h/w description. Please don't create fake DT nod=
es
> > > >just to bind to drivers. Whatever &pmu is is probably what should ha=
ve
> > > >the DT node. Let the driver for it create child devices if you need
> > > >that.
> > >
> > >     This is note a fake DT nodes, we really need it to tell the driver
> > >      which register to use to store the reboot mode. Because rockchip
> > >      use different register file to store the reboot mode on different
> > >      platform, on rk3066,rk3188, rk3288,it use  one of the PMU regist=
er,
> > on
> > >      the incoming RK3036, it use one of the GRF register, and it use
> > one  of
> > >      the PMUGRF register for arm64 platform rk3368. On the other hand,
> > the
> > >      PMU/GRF/PMUGRF register file are mapped as "syscon", then refere=
nced
> > >      by other DT nodes by phandle. So maybe let it as a separate DT n=
ode
> > > here
> > >      is better.
> >
> > In that case you should probably implement a reboot notifier in each of
> > the drivers you list and depending on the generation of the SoC. You can
> > easily parameterize this by matching on the compatible string.
> >
> > Thierry
> >
>=20
>  There is no rockchip specific driver for PMU/GRF/PMUGRF register file I
> list above=EF=BC=8C they
>  use the generic driver =E2=80=9Csyscon=E2=80=9D

Well, just go and write specific drivers, then.

Thierry

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWTesvAAoJEN0jrNd/PrOhHj4P/jgDFfnxGQJI2CsF8EZJH6NF
pUjx/bezYfSUjx+pov2f1Di1Xhdikh4e6dmEyTHVNgh8dBBvpYRxRbOrdlQemJVt
NKfzDgh3U1tnzospyjKq/X6Izbkti+MHdvSz/iAJsEmqo1NHOfN5oLViTiZW00RT
ST+C/ANTDxQkX5GIoCZlcOdGDGMitXSKosXaj5cxygWGbdl2VOvDENgDU6AwF9KB
IbU2AekQMcC7cvezGkgxjST/9gQAGlozZyO8Cj9Nh0lzXxj9MuKPe3xV9xl9H4Xi
QPy7LPaPZTaaN6XKbcnU5o5TtrxCp2LANyH7zXdjOW/6MRGu9kdDHzGd0f0yrjqV
gM34ayQJGoyLmNwuc/yb+317xkNL5sDH6ijKWnU2stKonmS9jYGhpQ0/Rujv4d/1
IWvVbviZtnob6lzGB6u4aQ7d9LVvYLfqCo/9BTTgzVHji1bEC60ULI8cSX7ybxmP
EKC01Naj/lqZFGNIL7xyjm7L9GkvaKvgWHXEWsLYkqWyRKIDfXwGn10nl0B7gNWO
1J+3LwYX6/anXkpIwjsmkfyRS7hSWZIvQ/ZRQjlqtBN686SbtEodkWtlH22rcUtw
g3pm+C4yMhbkqPvqCnwsGHX7khIe8ruLFLvf/zfFbxO4Zc1WgPLpeDcSJf7aoWf3
Osex/mp6Tn6FZpKLZmiz
=Q2JU
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
