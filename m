From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v5 01/10] clk: mediatek: Removed unused dpi_ck clock from
 MT8173
Date: Thu, 30 Jul 2015 20:04:57 +0200
Message-ID: <1450634.BBmUdb8ZLk@diego>
References: <1438152754-11970-1-git-send-email-jamesjj.liao@mediatek.com>
 <1438154233.17770.39.camel@mtksdaap41> <20150730173643.GH3159@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20150730173643.GH3159-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ricky Liang <jcliang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 30. Juli 2015, 10:36:43 schrieb Stephen Boyd:
> On 07/29, James Liao wrote:
> > Hi Stephen,
> > =

> > Could you help to apply this patch into 4.2?
> > =

> > =

> > Best regards,
> > =

> > James
> > =

> > On Wed, 2015-07-29 at 09:05 +0200, Heiko St=FCbner wrote:
> > > Am Mittwoch, 29. Juli 2015, 14:52:25 schrieb James Liao:
> > > > The dpi_ck clock can be removed because it not actually used
> > > > in topckgen and subsystems.
> > > > =

> > > > Signed-off-by: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > > =

> > > From our past discussions this change looks about right, and should
> > > still
> > > become _part of 4.2_, to not have the CLK_TOP_DPI become part of the
> > > devicetree CLK_TOP_DPI.
> =

> Did you mean ABI?

yep, sorry

> =

> > > Reviewed-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> =

> Is it being used in DT right now and causing regressions on
> v4.2-rcX? Sorry, I'm trying to understand why this patch matters
> for the 4.2 release.

it's not been used in an actual devicetree file, but as far as I understand=
 it, =

the dt-binding headers themself are also part of the ABI.

And it is new in 4.2, so has not been part of an official release yet.

The reason for the removal from what I understand is that the removed clock=
 is =

not documented at all (it's source, what it does), which got it the "clk_nu=
ll" =

parent in the first place.


Heiko
