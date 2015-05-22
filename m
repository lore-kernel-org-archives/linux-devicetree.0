From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 4/5] clk: mediatek: Add subsystem clocks of MT8173
Date: Fri, 22 May 2015 14:03:10 +0800
Message-ID: <1432274590.14396.40.camel@mtksdaap41>
References: <1432192376-6712-1-git-send-email-jamesjj.liao@mediatek.com>
	 <1432192376-6712-5-git-send-email-jamesjj.liao@mediatek.com>
	 <CAGS+omBgbj=Hx57GhxsQiuTR8Cx=hu0j4ptUh3GkScA81r42=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGS+omBgbj=Hx57GhxsQiuTR8Cx=hu0j4ptUh3GkScA81r42=A@mail.gmail.com>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Ricky Liang <jcliang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Daniel,

On Fri, 2015-05-22 at 12:22 +0800, Daniel Kurtz wrote:
> On Thu, May 21, 2015 at 3:12 PM, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> > Most multimedia subsystem clocks will be accessed by multiple
> > drivers, so it's a better way to manage these clocks in CCF.
> > This patch adds clock support for MM, IMG, VDEC, VENC and VENC_LT
> > subsystems.
> 
> Is there a reason why this patch (or patch set) does not also include
> definitions for the SCP_SYS, AUDIO and MFG_SYS clocks?

Clocks of SCP_SYS is a workaround in our previous internal
implementation. It should be replaced with new mtk-scpsys driver which
implemented in pm_domain framework because they are used to power on/off
subsystem domains.

I had discussed with Sascha, and he said it not worth the overhead of
CCF for clocks that are not shared by different units. As I know AUDIO
and MFG clocks are only used by their own drivers. So I don't include
them in this patch.


Best regards,

James


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
