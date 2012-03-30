From: Dong Aisheng <aisheng.dong-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v3 1/1] ARM: imx28: add basic dt support
Date: Fri, 30 Mar 2012 17:11:51 +0800
Message-ID: <20120330091150.GA21517@shlinux2.ap.freescale.net>
References: <1333089130-24832-1-git-send-email-b29396@freescale.com>
 <20120330085103.GF3254@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120330085103.GF3254-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 30, 2012 at 04:51:06PM +0800, Shawn Guo wrote:
> I tried to apply the patch, but ...
> 
> On Fri, Mar 30, 2012 at 02:32:10PM +0800, Dong Aisheng wrote:
> ...
> > +static int __init mxs_icoll_add_irq_domain(struct device_node *np,
> > +				struct device_node *interrupt_parent)
> > +{
> > +	irq_domain_add_simple(np, 0);
> 
> The irq_domain_add_simple() has been removed from mainline.  You need
> a rebase against Linus' tree.
> 
Will rebase.

> > +static struct sys_timer imx28_timer = {
> > +	.init = imx28_timer_init,
> > +};
> > +
> > +static void __init mxs_machine_init(void)
> > +{
> > +       of_platform_populate(NULL, of_default_bus_match_table,
> 
> Given by checkpatch:
> 
> WARNING: please, no spaces at the start of a line
> #565: FILE: arch/arm/mach-mxs/mach-mxs.c:51:
> +       of_platform_populate(NULL, of_default_bus_match_table,$
> 
Hmm, it seems my checkpatch is out of date.
With new checkpatch i found it.

Regards
Dong Aisheng
