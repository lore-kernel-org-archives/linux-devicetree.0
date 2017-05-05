From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V4] ARM64: dts: hi6220-hikey: Add clock binding for the
 pmic mfd
Date: Fri, 5 May 2017 10:32:28 +0200
Message-ID: <20170505083228.GC5252@mai>
References: <1493066439-6889-1-git-send-email-daniel.lezcano@linaro.org>
 <20170504220721.GB5252@mai>
 <20170505074821.fgnkq6lggde6gdv2@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170505074821.fgnkq6lggde6gdv2@dell>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM/HISILICON SOC..." <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 05, 2017 at 08:48:21AM +0100, Lee Jones wrote:
> On Fri, 05 May 2017, Daniel Lezcano wrote:
> 
> > On Mon, Apr 24, 2017 at 10:40:22PM +0200, Daniel Lezcano wrote:
> > > The hi655x PMIC provides the regulators but also a clock. The latter is missing
> > > in the definition and in the DT, thus it is no possible to enable the WiFi which
> > > depends on this clock.
> > > 
> > > The hi655x's clock has been added and the hi655x multifunction driver has
> > > updated with a clock-cell.
> > > 
> > > This patch adds the clock-cells for the PMIC in the DT and updates the
> > > documentation.
> > > 
> > > Signed-off-by: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > > Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > > Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > > Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> > > Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> > > Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> > > ---
> > >  Changelog:
> > > 	v4:
> > > 	   - Added Acked-by's
> > > 	   - Updated the commit message with a better description
> > > ---
> > 
> > Hi Xu Wei,
> > 
> > a gentle reminder for this patch. Is it ok for you?
> 
> a) Pings aren't usually received well.  If you wish to remind
> maintainers of a patch's existence a [RESEND] is usually the most
> accepted method.
> b) There is usually little point (at least it's significantly reduced)
> in sending pings/resends whilst the merge-window is open.  Maintainers
> usually take this time to take a little breather (rest) from their
> duties.

This patch is the last one of a series which was already merged. As the
series has been resend and split with a different submission path, I just
wanted to make sure there were no confusion.

The sentence "a gentle reminder" is clumsy.

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
