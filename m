From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 2/5] MFD: RK808: Add new mfd driver for RK808
Date: Tue, 26 Aug 2014 09:36:50 +0100
Message-ID: <20140826083650.GE9574@lee--X1>
References: <1408973516-21395-1-git-send-email-zyw@rock-chips.com>
 <CAD=FV=Wz1yssGvB05ExPaYxsiizcPRYrfP9OWE+HdoSDKVc_Tw@mail.gmail.com>
 <53FBF6EB.1080002@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53FBF6EB.1080002-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lin Huang <hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Eddie Cai <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, zhangqing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, xxx <xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Sonny Rao <sonn>
List-Id: devicetree@vger.kernel.org

On Tue, 26 Aug 2014, Chris Zhong wrote:
> On 08/26/2014 04:44 AM, Doug Anderson wrote:
> >On Mon, Aug 25, 2014 at 6:31 AM, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wr=
ote:

[...]

> >You need a Signed-off-by: Zhang Qing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>=20
> Done

[...]

> >I think Lee's "Grim" comment here was that prefixing globals with "g=
_"
> >is not consistent with the Linux coding style.  Just remove the "g_"=
=2E
>=20
> Done

[...]

> >{ RK808_BUCK3_CONFIG_REG, BUCK_ILMIN_MASK,  BUCK_ILMIN_150MA },
> >
> >instead of:
> >
> >{RK808_BUCK3_CONFIG_REG, BUCK_ILMIN_MASK,  BUCK_ILMIN_150MA},
>=20
> Done

[...]

> >nit: add spacing so that VB_LO_SEL_3500MV lines up under VB_LO_ACT
>=20
> Done

[...]

> >I think Lee wanted the above to be:
> >
> >        { "rk808", },
>=20
> Done

[...]

> >I think Lee wanted you to remove ".owner =3D THIS_MODULE"
>=20
> Done

[...]

You've just spammed 10(00)'s of people with an email that contains
zero useful content.

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
