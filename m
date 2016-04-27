From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] of: Add stub for of_get_next_parent()
Date: Wed, 27 Apr 2016 13:13:33 +0200
Message-ID: <5345757.9RfGSJE06M@wuerfel>
References: <1461755500-889-1-git-send-email-heikki.krogerus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461755500-889-1-git-send-email-heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 27 April 2016 14:11:40 Heikki Krogerus wrote:
> Fixes a compiler error:
>=20
> drivers/phy/phy-core.c: In function =E2=80=98__of_phy_provider_regist=
er=E2=80=99:
> drivers/phy/phy-core.c:848:13: error: implicit declaration of functio=
n
> =E2=80=98of_get_next_parent=E2=80=99 [-Werror=3Dimplicit-function-dec=
laration]
>     parent =3D of_get_next_parent(parent);
>                  ^
>=20
> Fixes: 2f7600bc981c ("phy: core: Allow children node to be overridden=
")
> Signed-off-by: Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>

Yes, this works. I have submitted an alternative patch to fix the
build error, changing the PHY core to not use any of the OF interfaces
if CONFIG_OF is disabled.

We can also have both.

Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
