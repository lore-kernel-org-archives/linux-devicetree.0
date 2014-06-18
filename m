From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] ARM: stih41x: Rename stih416-b2020-revE.dts to
 stih416-b2020e.dts
Date: Wed, 18 Jun 2014 12:21:32 +0100
Message-ID: <20140618112132.GE8300@lee--X1>
References: <1403087508-6710-1-git-send-email-lee.jones@linaro.org>
 <20140618105438.GC8300@lee--X1>
 <53A1734D.7000606@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53A1734D.7000606-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 18 Jun 2014, Maxime Coquelin wrote:

> Hi Lee,
>=20
> On 06/18/2014 12:54 PM, Lee Jones wrote:
> >Two reasons for this rename.  Firstly, it removes the camel case
> >convention which isn't used by any other platform and secondly it
> >matches the naming convention for the internal kernel, which can
> >become annoying when flipping between the two.
> >
> >Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>=20
> Acked-by: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
>=20
> It will be part of the STi pull-request for 3.16 fixes.

Thanks for taking the patch. :)

Just a quick side note.  As a maintainer, if you're going to take the
patch there's no requirement to publicly Ack it.  Just let the
submitter know that you've applied it to your tree.

I use Acks for 2 things; when a patch touches code that I maintain,
but is going in via a different tree, or as a marker if there is some
reason I can't apply it to my tree right away (waiting on dependencies
etc), but equally do not wish to review the same patch twice.

> >---
> >v1 -> v2: Appropriate change to the Makefile.
> >---
> >  arch/arm/boot/dts/Makefile                                       |=
 2 +-
> >  arch/arm/boot/dts/{stih416-b2020-revE.dts =3D> stih416-b2020e.dts}=
 | 0
> >  2 files changed, 1 insertion(+), 1 deletion(-)
> >  rename arch/arm/boot/dts/{stih416-b2020-revE.dts =3D> stih416-b202=
0e.dts} (100%)
> >
> >diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> >index 5986ff6..adb5ed9 100644
> >--- a/arch/arm/boot/dts/Makefile
> >+++ b/arch/arm/boot/dts/Makefile
> >@@ -357,7 +357,7 @@ dtb-$(CONFIG_ARCH_STI)+=3D stih407-b2120.dtb \
> >         stih415-b2020.dtb \
> >         stih416-b2000.dtb \
> >         stih416-b2020.dtb \
> >-       stih416-b2020-revE.dtb
> >+       stih416-b2020e.dtb
> >  dtb-$(CONFIG_MACH_SUN4I) +=3D \
> >         sun4i-a10-a1000.dtb \
> >         sun4i-a10-cubieboard.dtb \
> >diff --git a/arch/arm/boot/dts/stih416-b2020-revE.dts b/arch/arm/boo=
t/dts/stih416-b2020e.dts
> >similarity index 100%
> >rename from arch/arm/boot/dts/stih416-b2020-revE.dts
> >rename to arch/arm/boot/dts/stih416-b2020e.dts
> >

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
