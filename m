From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 2/5] dt-bindings: soc: add document for rockchip
 reboot notifier driver
Date: Thu, 19 Nov 2015 13:56:45 +0100
Message-ID: <20151119125643.GE21862@ulmo.nvidia.com>
References: <1447840044-19689-1-git-send-email-andy.yan@rock-chips.com>
 <1447840410-19794-1-git-send-email-andy.yan@rock-chips.com>
 <20151118225904.GA5429@rob-hp-laptop>
 <564D2331.8070503@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IpbVkmxF4tDyP/Kb"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <564D2331.8070503-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, benchan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--IpbVkmxF4tDyP/Kb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2015 at 09:17:37AM +0800, Andy Yan wrote:
> Hi Rob:
>=20
> On 2015=E5=B9=B411=E6=9C=8819=E6=97=A5 06:59, Rob Herring wrote:
> >On Wed, Nov 18, 2015 at 05:53:30PM +0800, Andy Yan wrote:
> >>Add devicetree binding document for rockchip reboot nofifier driver
> >Just reading the subject this is way too specific to the Linux driver
> >needs rather than a h/w description. Please don't create fake DT nodes
> >just to bind to drivers. Whatever &pmu is is probably what should have
> >the DT node. Let the driver for it create child devices if you need
> >that.
>=20
>     This is note a fake DT nodes, we really need it to tell the driver
>      which register to use to store the reboot mode. Because rockchip
>      use different register file to store the reboot mode on different
>      platform, on rk3066,rk3188, rk3288,it use  one of the PMU register, =
on
>      the incoming RK3036, it use one of the GRF register, and it use one =
 of
>      the PMUGRF register for arm64 platform rk3368. On the other hand, the
>      PMU/GRF/PMUGRF register file are mapped as "syscon", then referenced
>      by other DT nodes by phandle. So maybe let it as a separate DT node
> here
>      is better.

In that case you should probably implement a reboot notifier in each of
the drivers you list and depending on the generation of the SoC. You can
easily parameterize this by matching on the compatible string.

Thierry

--IpbVkmxF4tDyP/Kb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWTccIAAoJEN0jrNd/PrOhv7sP/01q7ftp0EuePxtj+ZwZOJ1/
JPBX7XkC6JYzMDsKxqnPD0CQCVf4o0nIR3aYDrQZKWo6pJH7szd9zb8O+2v5eXtT
jRiCVVQ1DBnStvGYblRMTCN2AiXUD4x5+k0/ZeYtzOIm9SFaAqP42Rne865By9Gf
+j/gvIa1czALngEMBJc6Oi46yByQuqjCgodnN2odS1hqWa74wvO1CI179OQbwQBR
bbjv1zG6vFhKqH0gGcocGUhUz0GFJtkTivbggyXwX9am5I/BWfVLyWHEtncTb+Aa
vo/lLOGv8LFHkTf+ASqYEqL9uboUSuhftVew7ZHIfsZuEK+lUBth+xpFvCY6jxtG
6AN4GYP2fquxtrw8PTWIr5cFlWX91CJQqyXv+mr0yNg7BBqc0ytpuN6NAi5T0kkQ
SGPxZUwHMR9f/JHq29oNSm5g5qHClWKs773JH+Q9bK+hOgqcZ4GKfII2iomOkv7R
vau2lPuRrMb8jEQfKZZY3MWMx9qRqR8JOy95O7zyt+Bdldoe6T2yHmNvY/fkievs
mJ/UManuWTCvzFwIzieJOMWgBl2aHYW5CKSHKmeGp+tmrMRXVNgzX6ZrcHpY2oxP
BAHMBs3D81JCXR8mnNMtGWUohFFE6Q8wfruwPkX/H6YSEA1xP4i9kHEPYTG3lhnp
Q6oX9Vt82X+AzkekhqFY
=p7Wa
-----END PGP SIGNATURE-----

--IpbVkmxF4tDyP/Kb--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
