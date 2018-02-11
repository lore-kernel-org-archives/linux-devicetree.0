From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 5/7] watchdog: mtk: allow setting timeout in
 devicetree
Date: Sun, 11 Feb 2018 15:46:24 +0800
Message-ID: <1518335184.9025.43.camel@mtkswgap22>
References: <20180210091911.3644-1-marcus.folkesson@gmail.com>
         <20180210091911.3644-5-marcus.folkesson@gmail.com>
         <1518261002.9025.36.camel@mtkswgap22> <20180210124328.GB744@gmail.com>
         <20180210201207.GC744@gmail.com>
         <5449674d-2812-c9b5-9c06-af2fbfa72737@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5449674d-2812-c9b5-9c06-af2fbfa72737-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Marcus Folkesson <marcus.folkesson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Barry Song <baohua-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>, Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWPdpHbCvnp+Ag@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, 2018-02-10 at 17:52 -0800, Guenter Roeck wrote:
> On 02/10/2018 12:12 PM, Marcus Folkesson wrote:
> > Hello Sean,
> > 
> > On Sat, Feb 10, 2018 at 01:43:28PM +0100, Marcus Folkesson wrote:
> >> Hello Sean,
> >>
> >> On Sat, Feb 10, 2018 at 07:10:02PM +0800, Sean Wang wrote:
> >>>
> >>> Hi, Marcus
> >>>
> >>> The changes you made for dt-bindings and driver should be put into
> >>> separate patches.
> >>
> >> I actually thought about it but chose to have it in the same patch because I
> >> did not see any direct advantage to separating them.
> >>
> >> But I can do that.
> >> I will come up with a v3 with this change if no one thinks differently.
> >>
> > 
> > When looking at the git log, I'm not that convinced it should be
> > separate patches.
> > 
> > For example, I found a4f741e3e157c3a5c8aea5f2ea62b692fbf17338 that is
> > doing the exact same thing as this patch.
> > 
> > There is plenty of patches that mixes the code change and dt bindings
> > updates.
> > Could it not be useful to overview both the implementation and
> > dt-mapping change in one view?
> > 
> > If you or anyone else still think it should be separated, please let me know and I will
> > come up with a v3.
> > 
> 
> If we were talking about something new, specifically new and unapproved DT bindings,
> it should be separate patches. However, that is not the case here. The DT bindings
> are well established. Sure, we could be pedantic and request a split into two
> patches. However, the only benefit of that would be more work for the maintainers,
> ie Wim and myself (including me having to send this e-mail). I don't really see
> the point of that.
> 
> I have already sent my Reviewed-by:, and I don't intend to withdraw it.
> 
Hi, both

Sorry for that if I caused any inconvenience to you. I didn't really
insist on if the patch is needed to split into two, which totally
depends on whether dt maintainers like it.

The change for dt-binding is usually added as a split patch with
dt-bindings as a prefix. This way I thought dt maintainers is not
easy to miss those patches and also can give some useful feedback
for them.

	Sean

> Thanks,
> Guenter
> 


--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
