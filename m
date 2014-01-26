From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 08/18] watchdog: orion: Make RSTOUT register a
 separate resource
Date: Sun, 26 Jan 2014 09:17:53 +0100
Message-ID: <20140126091753.2910a39f@skate>
References: <1390431915-5115-1-git-send-email-ezequiel.garcia@free-electrons.com>
	<1390431915-5115-9-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390431915-5115-9-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Ezequiel Garcia,

On Wed, 22 Jan 2014 20:05:05 -0300, Ezequiel Garcia wrote:

> +/* RSTOUT mask register physical address for Orion5x, Kirkwood and Dove */
> +#define ORION_RSTOUT_MASK_OFFSET	0x20108
> +
> +/* Internal registers can be configured at any 1 MiB aligned address */
> +#define INTERNAL_REGS_MASK		~(SZ_1M - 1)

I'm not a big fan of hardcoding the internal register window size in a
driver. I would have preferred to have used the offset between the
watchdog registers and the rstout register, but since this one is
*before* the watchdog registers, it would have to be a negative offset.
Not sure how to handle this.

> +/*
> + * The original devicetree binding for this driver specified only
> + * one memory resource, so in order to keep DT backwards compatibility
> + * we try to fallback to a hardcoded register address, if the resource
> + * is missing from the devicetree.
> + */
> +static void __iomem *try_rstout_ioremap(struct platform_device *pdev,
> +					phys_addr_t internal_regs)

Why is it called "try" ? It actually does the mapping. So I would
prefer the function to be named:

	orion_wdt_ioremap_rstout()

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
