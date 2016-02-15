From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] dma: mv_xor_v2: new driver
Date: Mon, 15 Feb 2016 10:50:08 +0100
Message-ID: <20160215105008.74aa7869@free-electrons.com>
References: <1455523083-25506-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<201602151735.BaFwBMOn%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201602151735.BaFwBMOn%fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, kbuild-all-JC7UmRfGjtg@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Marc,

This doesn't seem to be an issue introduced by my patch itself, but
rather a problem with the MSI subsystem itself. Is this already a known
issue (possibly already fixed), or should I investigate?

Thanks!

Thomas

On Mon, 15 Feb 2016 17:09:27 +0800, kbuild test robot wrote:
> Hi Thomas,
> 
> [auto build test ERROR on robh/for-next]
> [also build test ERROR on v4.5-rc4 next-20160215]
> [if your patch is applied to the wrong git tree, please drop us a note to help improving the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Thomas-Petazzoni/dma-mv_xor_v2-new-driver/20160215-160120
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux for-next
> config: openrisc-allyesconfig (attached as .config)
> reproduce:
>         wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=openrisc 
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from kernel/irq/chip.c:14:0:
> >> include/linux/msi.h:174:21: fatal error: asm/msi.h: No such file or directory
>    compilation terminated.
> 
> vim +174 include/linux/msi.h
> 
> c2791b80 Yijing Wang    2014-11-11  168  	void (*teardown_irq)(struct msi_controller *chip, unsigned int irq);
> 0cbdcfcf Thierry Reding 2013-08-09  169  };
> 0cbdcfcf Thierry Reding 2013-08-09  170  
> f3cf8bb0 Jiang Liu      2014-11-12  171  #ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
> d9109698 Jiang Liu      2014-11-15  172  
> aeeb5965 Jiang Liu      2014-11-15  173  #include <linux/irqhandler.h>
> d9109698 Jiang Liu      2014-11-15 @174  #include <asm/msi.h>
> d9109698 Jiang Liu      2014-11-15  175  
> f3cf8bb0 Jiang Liu      2014-11-12  176  struct irq_domain;
> 552c494a Marc Zyngier   2015-11-23  177  struct irq_domain_ops;
> 
> :::::: The code at line 174 was first introduced by commit
> :::::: d9109698be6e7439e6082aa00d79d4556114739b genirq: Introduce msi_domain_alloc/free_irqs()
> 
> :::::: TO: Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> :::::: CC: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
