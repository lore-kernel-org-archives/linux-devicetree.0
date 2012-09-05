From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 3/3] cpufreq: Add a generic cpufreq-cpu0 driver
Date: Wed, 5 Sep 2012 09:12:21 +0800
Message-ID: <20120905011219.GN2362@S2101-09.ap.freescale.net>
References: <1344577046-14847-1-git-send-email-shawn.guo@linaro.org>
 <1344577046-14847-4-git-send-email-shawn.guo@linaro.org>
 <201209050118.39045.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201209050118.39045.rjw-KKrjLPT3xs0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>
Cc: Kevin Hilman <khilman-l0cyMroinI0@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, cpufreq-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shilimkar Santosh <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 05, 2012 at 01:18:38AM +0200, Rafael J. Wysocki wrote:
> On Friday, August 10, 2012, Shawn Guo wrote:
> > It adds a generic cpufreq driver for CPU0 frequency management based on
> > clk, regulator, OPP and device tree support.  It can support both
> > uniprocessor (UP) and those symmetric multiprocessor (SMP) systems which
> > share clock and voltage across all CPUs.
> > 
> > Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> I seem to recall that this has been discussed with several people and
> undergone some changes as a result of comments.  Would it be possible
> to get some ACKs from the people involved?
> 

Mark, Santosh,

Reviewed-by, please?

AnilKumar,

Tested-by, please?

<snip>

> > --- /dev/null
> > +++ b/drivers/cpufreq/cpufreq-cpu0.c
> > @@ -0,0 +1,271 @@
> > +/*
> > + * Copyright (C) 2012 Freescale Semiconductor, Inc.
> > + *
> > + * Reuse some codes from drivers/cpufreq/omap-cpufreq.c
> 
> What do you mean by "reuse" here?
> 
cpu0_set_target() function is almost a copy of omap_target() from
drivers/cpufreq/omap-cpufreq.c.  I should probably just say so?

> > + *
> > + * The code contained herein is licensed under the GNU General Public
> > + * License. You may obtain a copy of the GNU General Public License
> > + * Version 2 or later at the following locations:
> 
> The kernel is just GPLv2 (not later) and it will stay this way.  Please
> update this comment accordingly.
> 
Okay.

> > + *
> > + * http://www.opensource.org/licenses/gpl-license.html
> > + * http://www.gnu.org/copyleft/gpl.html
> > + */

-- 
Regards,
Shawn
