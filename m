From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCHv2 02/10] ARM: vic: MULTI_IRQ_HANDLER handler
Date: Thu, 3 Nov 2011 12:51:36 +0000
Message-ID: <20111103125136.GL12913@n2100.arm.linux.org.uk>
References: <1317206507-18867-1-git-send-email-jamie@jamieiles.com>
 <1317206507-18867-3-git-send-email-jamie@jamieiles.com>
 <20110928203905.GB2838@ponder.secretlab.ca>
 <CACRpkdZKns-GraGp-YMD6jzOPETkvEpt9bC8HcYUmf3JUyCV3A@mail.gmail.com>
 <20110929093009.GM17204@pulham.picochip.com>
 <20111102134024.GE19187@n2100.arm.linux.org.uk>
 <20111102140811.GA22491@totoro>
 <CACRpkdY+EBkHfupO5T4SYKPxzX2L2kr8fLVMJK=JctNeYAzn2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdY+EBkHfupO5T4SYKPxzX2L2kr8fLVMJK=JctNeYAzn2g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: viresh.kumar-qxv4g6HH51o@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, hsweeten-3FF4nKcrg1dE2c76skzGb0EOCMrvLtNR@public.gmane.org, rajeev-dlh.kumar-qxv4g6HH51o@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, STEricsson_nomadik_linux-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, rubini-9wsNiZum9E8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 03, 2011 at 01:29:08PM +0100, Linus Walleij wrote:
> No, if we receive another IRQ *after* the read of the register was the
> question, right?
> 
> Just replace
> 
> stat &= ~(1 << irq);
> 
> with a second
> 
> stat = readl_relaxed(vic->base + VIC_IRQ_STATUS);
> 
> It'll work just fine, the IRQ line should be low when you read
> it the second time, else it is probably fully proper to call
> the IRQ handler again anyway.

It depends on what kind of behaviour you want.  There are two solutions:

	stat = readl_relaxed(vic->base + VIC_IRQ_STATUS);
	while (stat) {
		irq = ffs(stat) - 1;
		handle_irq(irq);
		stat = readl_relaxed(vic->base + VIC_IRQ_STATUS);
	}

This gives priority to the lowest numbered interrupts; if these get stuck
then they can exclude higher numbered interrupts.  This is what we
implement in the assembly code versions, and as far as I know, no one has
ever complained about that behaviour.

	stat = readl_relaxed(vic->base + VIC_IRQ_STATUS);
	while (stat) {
		while (stat) {
			irq = ffs(stat) - 1;
			stat &= ~(1 << irq);
			handle_irq(irq);
		}
		stat = readl_relaxed(vic->base + VIC_IRQ_STATUS);
	}

This ensures that we process all interrupts found pending before we
re-check for any new interrupts pending.  Arguably this is a much
fairer implementation (and may mean if things get irrevokably stuck,
things like sysrq via the console uart may still work.)
