From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v5 01/10] clk: mediatek: Removed unused dpi_ck clock from
 MT8173
Date: Thu, 30 Jul 2015 10:36:43 -0700
Message-ID: <20150730173643.GH3159@codeaurora.org>
References: <1438152754-11970-1-git-send-email-jamesjj.liao@mediatek.com>
 <1438152754-11970-2-git-send-email-jamesjj.liao@mediatek.com>
 <6282882.pftQBj38E3@diego>
 <1438154233.17770.39.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1438154233.17770.39.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Ricky Liang <jcliang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/29, James Liao wrote:
> Hi Stephen,
>=20
> Could you help to apply this patch into 4.2?
>=20
>=20
> Best regards,
>=20
> James
>=20
> On Wed, 2015-07-29 at 09:05 +0200, Heiko St=FCbner wrote:
> > Am Mittwoch, 29. Juli 2015, 14:52:25 schrieb James Liao:
> > > The dpi_ck clock can be removed because it not actually used
> > > in topckgen and subsystems.
> > >=20
> > > Signed-off-by: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> >=20
> > From our past discussions this change looks about right, and should=
 still=20
> > become _part of 4.2_, to not have the CLK_TOP_DPI become part of th=
e=20
> > devicetree CLK_TOP_DPI.

Did you mean ABI?

> >=20
> > Reviewed-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> >=20

Is it being used in DT right now and causing regressions on
v4.2-rcX? Sorry, I'm trying to understand why this patch matters
for the 4.2 release.

--=20
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
