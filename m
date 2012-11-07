From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [RFC PATCH 1/4] ARM: kernel: add device tree init map function
Date: Wed, 7 Nov 2012 17:43:15 +0000
Message-ID: <20121107174315.GF17831@e102568-lin.cambridge.arm.com>
References: <1350393709-23546-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1350393709-23546-2-git-send-email-lorenzo.pieralisi@arm.com>
 <20121106215044.GB21764@mudshark.cambridge.arm.com>
 <20121107102349.GC17831@e102568-lin.cambridge.arm.com>
 <20121107110542.GH23305@mudshark.cambridge.arm.com>
 <20121107120052.GD17831@e102568-lin.cambridge.arm.com>
 <20121107153529.GT23305@mudshark.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20121107153529.GT23305@mudshark.cambridge.arm.com>
Content-Disposition: inline
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
Cc: Mark Rutland <Mark.Rutland@arm.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Dave Martin <dave.martin@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <Pawel.Moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Tony Lindgren <tony@atomide.com>, Catalin Marinas <Catalin.Marinas@arm.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Amit Kucheria <amit.kucheria@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, David Brown <davidb@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 07, 2012 at 03:35:30PM +0000, Will Deacon wrote:
> On Wed, Nov 07, 2012 at 12:00:52PM +0000, Lorenzo Pieralisi wrote:
> > On Wed, Nov 07, 2012 at 11:05:42AM +0000, Will Deacon wrote:
> > > No, I was thinking about what happens if the devicetree doesn't contain an
> > > mpidr property that matches the boot cpu. In this case, we will fail to
> > > assign logical ID 0, right? If this happens, we should complain about an
> > > invalid devicetree and try to fall back on the logical_map that was
> > > generated earlier on.
> > 
> > Good point. What I could do, I can assign the MPIDR of the boot CPU to
> > the logical index 0 before even starting to parse the DT (that's what it
> > is done in smp_setup_processor_id(), with a couple of twists). Then, if I
> > find a node that matches the boot CPU mpidr I just skip over it. This
> > way the boot CPU MPIDR will always be correct the only difference with
> > the current approach will be that instead of generating the secondaries
> > MPIDRs we will read them from DT.
> 
> That should work, although I'm not sure why you can't just give up
> altogether and use the initial mapping from smp_setup_processor_id?

Since I need to either stash the values to avoid reparsing the tree or
at first I just parse to check for correctness, second pass I update the map.

I will stash the reg values, and if the boot CPU MPIDR is correct I will
copy the stashed map to the cpu_logical_map. If that's unacceptable we
will change it.

> > The problem with this approach is that if we need a pointer (phandle) to the
> > boot CPU DT node through the MPIDR and the boot CPU node is botched or missing
> > we still behave as if the DT CPU nodes were ok.
> 
> Does any code do this? Wouldn't it be much better to lookup logical CPU 0 if
> you want to find anything out about the boot CPU?

Formulated my point in a horrible way sorry.

In order to retrieve the logical id of a CPU (eg IRQ affinity list) we need
its MPIDR for the reverse look-up and for that to work the reg property in the
/cpu nodes must be correct. Let's gloss over this for now.

> > I think I'd better stick a warning condition in there if the boot CPU
> > node is not present or botched (from a MPIDR perspective at least).

Done, IMHO I wrote some code that is too convoluted, I will post it anyway for
review to get further feeback.

Thanks !!
Lorenzo
