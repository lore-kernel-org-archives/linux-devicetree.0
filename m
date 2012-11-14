From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH V2 2/5] arm: mvebu: Added initial support for power
 managmement service unit
Date: Wed, 14 Nov 2012 00:07:36 +0000
Message-ID: <20121114000736.GE3290@n2100.arm.linux.org.uk>
References: <1351545108-18954-1-git-send-email-gregory.clement@free-electrons.com>
 <1351545108-18954-3-git-send-email-gregory.clement@free-electrons.com>
 <20121105140558.GP3351@mudshark.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20121105140558.GP3351@mudshark.cambridge.arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Will Deacon <will.deacon@arm.com>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Ike Pan <ike.pan@canonical.com>, Nadav Haklai <nadavh@marvell.com>, Ian Molton <ian.molton@codethink.co.uk>, David Marlin <dmarlin@redhat.com>, Yehuda Yitschak <yehuday@marvell.com>, Jani Monoses <jani.monoses@canonical.com>, Mike Turquette <mturquette@linaro.org>, Tawfik Bayouk <tawfik@marvell.com>, Dan Frazier <dann.frazier@canonical.com>, Eran Ben-Avi <benavi@marvell.com>, Leif Lindholm <Leif.Lindholm@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, "jcm@redhat.com" <jcm@redhat.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Ben Dooks <ben-linux@fluff.org>, Gregory CLEMENT <gregory.clement@free-electrons.com>, linux-arm-kernel@list
List-Id: devicetree@vger.kernel.org

On Mon, Nov 05, 2012 at 02:05:58PM +0000, Will Deacon wrote:
> On Mon, Oct 29, 2012 at 09:11:45PM +0000, Gregory CLEMENT wrote:
> > +#ifdef CONFIG_SMP
> > +int armada_xp_boot_cpu(unsigned int cpu_id, void __iomem *boot_addr)
> > +{
> > +	int reg, hw_cpu;
> > +
> > +	if (!pmsu_mp_base || !pmsu_reset_base) {
> > +		pr_warn("Can't boot CPU. PMSU is uninitialized\n");
> > +		return 1;
> > +	}
> > +
> > +	hw_cpu = cpu_logical_map(cpu_id);
> > +
> > +	writel(virt_to_phys(boot_addr), pmsu_mp_base +
> > +			PMSU_BOOT_ADDR_REDIRECT_OFFSET(hw_cpu));
> 
> virt_to_phys on an __iomem * doesn't feel right to me...

It isn't correct - I suspect the __iomem there is just wrong - and it
needs the callsite also checking.

> > +	/* Make sure value hits memory before reset */
> > +	dsb();
> 
> writel has barrier semantics -- you shouldn't need this dsb.

writel has a barrier before the write (to ensure that DMA agents see data
that was written to memory when they are enabled by the write).  There
isn't a barrier after the write.
