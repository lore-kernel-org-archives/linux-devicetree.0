From: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [PATCH] powerpc: make of_device_ids const
Date: Fri, 12 Sep 2014 18:34:24 +1000
Message-ID: <1410510864.17540.11.camel@concordia>
References: <1410378998-8823-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410378998-8823-1-git-send-email-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2014-09-10 at 21:56 +0200, Uwe Kleine-K=C3=B6nig wrote:
> of_device_ids (i.e. compatible strings and the respective data) are n=
ot
> supposed to change at runtime. All functions working with of_device_i=
ds
> provided by <linux/of.h> work with const of_device_ids. This allows t=
o
> mark all struct of_device_id const, too.
>=20
> While touching these line also put the __init annotation at the right
> position where necessary.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
> Hello,
>=20
> I don't know how arch/powerpc is maintained. So please tell me if I
> should split this patch further.
>=20
> I manually checked that all const annotations are OK, and the 0day bu=
ild
> bot didn't find a regression.

Thanks.

We'll take it as-is, it seems to merge cleanly.

We track patches via patchwork, this one is at:
  http://patchwork.ozlabs.org/patch/387959/

cheers


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
