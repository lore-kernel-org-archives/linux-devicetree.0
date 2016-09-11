From: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: [BISECTED REGRESSION] v4.8-rc: gpio-leds broken on OCTEON
Date: Mon, 12 Sep 2016 01:13:46 +0300
Message-ID: <20160911221346.GA1658@raspberrypi.musicnaut.iki.fi>
References: <20160823203605.GA12169@raspberrypi.musicnaut.iki.fi>
 <57BDCE58.20200@cavium.com>
 <20160825182453.GF12169@raspberrypi.musicnaut.iki.fi>
 <dc278c85-5ebd-7b91-2524-8c3549d1ee0c@leemhuis.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-mips-bounce@linux-mips.org>
Content-Disposition: inline
In-Reply-To: <dc278c85-5ebd-7b91-2524-8c3549d1ee0c@leemhuis.info>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: "Steven J. Hill" <Steven.Hill@cavium.com>, David Daney <ddaney@caviumnetworks.com>, Jon Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Sun, Sep 11, 2016 at 02:41:39PM +0200, Thorsten Leemhuis wrote:
> Hi! On 25.08.2016 20:24, Aaro Koskinen wrote:
> > On Wed, Aug 24, 2016 at 11:42:00AM -0500, Steven J. Hill wrote:
> >> It is actually two patches that cause the breakage. The other is:
> >>    commit e55aeb6ba4e8cc3549bff1e75ea1d029324bce21
> >>    of/irq: Mark interrupt controllers as populated before initialisation
> >> I needed to revert both of these in order to get MMC working on our 71xx and
> >> 78xx boards. For our MMC, I got error messages from the MMC core of "Invalid
> >> POWER GPIO" until I applied the second patch. I will have a fix worthy of
> >> upstreaming today which will be posted today.
> > 
> > The below change works for me...
> > 
> > diff --git a/arch/mips/cavium-octeon/octeon-irq.c b/arch/mips/cavium-octeon/octeon-irq.c
> > index 5a9b87b..5fd57c2 100644
> > --- a/arch/mips/cavium-octeon/octeon-irq.c
> > +++ b/arch/mips/cavium-octeon/octeon-irq.c
> > @@ -1618,6 +1618,7 @@ static int __init octeon_irq_init_gpio(
> >  		pr_warn("Cannot allocate memory for GPIO irq_domain.\n");
> >  		return -ENOMEM;
> >  	}
> > +	of_node_clear_flag(gpio_node, OF_POPULATED);
> >  
> >  	return 0;
> >  }
> 
> This afaics wasn't merged and the discussion looks stalled. Was this
> issue discussed elsewhere or even fixed in between? Just asking, because
> this issue is on the list of regressions for 4.8.

There's a patch waiting to be merged in Linux MIPS patchwork:

	https://patchwork.linux-mips.org/patch/14091/

A.
