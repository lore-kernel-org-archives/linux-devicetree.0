From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 2/4] soc: Mediatek: Add SCPSYS power domain driver
Date: Mon, 13 Apr 2015 12:55:57 +0200
Message-ID: <20150413105557.GR9742@pengutronix.de>
References: <1426002063-25713-1-git-send-email-s.hauer@pengutronix.de>
 <1426002063-25713-3-git-send-email-s.hauer@pengutronix.de>
 <7hbnj9b08m.fsf@deeprootsystems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <7hbnj9b08m.fsf-1D3HCaltpLuhEniVeURVKkEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 31, 2015 at 09:27:53AM -0700, Kevin Hilman wrote:
> Hi Sascha,
> 
> Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:
> 
> > This adds a power domain driver for the Mediatek SCPSYS unit.
> >
> > The System Control Processor System (SCPSYS) has several power
> > management related tasks in the system. The tasks include thermal
> > measurement, dynamic voltage frequency scaling (DVFS), interrupt
> > filter and lowlevel sleep control. The System Power Manager (SPM)
> > inside the SCPSYS is for the MTCMOS power domain control.
> >
> > For now this driver only adds power domain support, the more
> > advanced features are not yet supported. The driver implements
> > the generic PM domain device tree bindings, the first user will
> > most likely be the Mediatek AFE audio driver.
> >
> > Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> 
> Sorry for the lag, was travelling last week at ELC and not keeping up
> with reviews.
> 
> This version looks pretty good to me, but had one minor
> comment/question...
> 
> [...]
> 
> > +#define NUM_DOMAINS	ARRAY_SIZE(scp_domain_data)
> > +
> > +struct scp;
> > +
> > +struct scp_domain {
> > +	struct generic_pm_domain pmd;
> > +	struct scp_domain_data *data;
> > +	struct scp *scp;
> > +};
> > +
> > +struct scp {
> > +	struct scp_domain domains[NUM_DOMAINS];
> > +	struct generic_pm_domain *pmd[NUM_DOMAINS];
> 
> Why is this genpd pointer needed?  It's just a pointer to the
> .domains.pmd[i] anyways, and IMO makes the code a bit hard to follow.

The driver itself does not need the genpd pointer, but
of_genpd_add_provider_onecell() expects an array of pointers to struct
generic_pm_domain.

I can allocate the array of pointers separately and remove the pmd field
from struct scp to make this a bit more clearer.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
