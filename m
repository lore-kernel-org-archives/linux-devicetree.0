From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCHv2 02/10] ARM: vic: MULTI_IRQ_HANDLER handler
Date: Wed, 2 Nov 2011 13:40:24 +0000
Message-ID: <20111102134024.GE19187@n2100.arm.linux.org.uk>
References: <1317206507-18867-1-git-send-email-jamie@jamieiles.com>
 <1317206507-18867-3-git-send-email-jamie@jamieiles.com>
 <20110928203905.GB2838@ponder.secretlab.ca>
 <CACRpkdZKns-GraGp-YMD6jzOPETkvEpt9bC8HcYUmf3JUyCV3A@mail.gmail.com>
 <20110929093009.GM17204@pulham.picochip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110929093009.GM17204-apL1N+EY0C9YtYNIL7UdTEEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Cc: viresh.kumar-qxv4g6HH51o@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, hsweeten-3FF4nKcrg1dE2c76skzGb0EOCMrvLtNR@public.gmane.org, rajeev-dlh.kumar-qxv4g6HH51o@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, STEricsson_nomadik_linux-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, rubini-9wsNiZum9E8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 29, 2011 at 10:30:09AM +0100, Jamie Iles wrote:
> +#ifdef CONFIG_MULTI_IRQ_HANDLER
> +static void vic_single_handle_irq(struct vic_device *vic, struct pt_regs *regs)
> +{
> +	u32 stat, irq;
> +
> +	stat = readl_relaxed(vic->base + VIC_IRQ_STATUS);
> +	while (stat) {
> +		irq = ffs(stat) - 1;
> +		handle_IRQ(irq_domain_to_irq(&vic->domain, irq), regs);
> +		stat &= ~(1 << irq);
> +	}
> +}
> +
> +asmlinkage void __exception_irq_entry vic_handle_irq(struct pt_regs *regs)
> +{
> +	int i;
> +
> +	for (i = 0; i < vic_id; ++i)
> +		vic_single_handle_irq(&vic_devices[i], regs);
> +}

And if we receive another interrupt after the read of the register, we'll
have to exit all the way back (possibly to userspace) before re-entering
the IRQ handling paths back to this point to process it.

Is there any particular reason folk are destroying the built-in efficiency
of the IRQ handling which is common-place in the existing assembly
approach?
