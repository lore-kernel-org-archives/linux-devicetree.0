From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH dtc] C-based DT schema checker integrated into dtc
Date: Tue, 5 Nov 2013 09:39:20 +0100
Message-ID: <201311050939.21071.arnd@arndb.de>
References: <1382651488-9696-1-git-send-email-swarren@wwwdotorg.org>
 <1704730.RnIqE1USnv@wuerfel> <20131104212930.GB9638@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20131104212930.GB9638@obsidianresearch.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Jon Loeliger <jdl@jdl.com>, khilman@linaro.org, Stephen Warren <swarren@nvidia.com>, s.nawrocki@samsung.com, pawel.moll@arm.com, Stephen Warren <swarren@wwwdotorg.org>, Tomasz Figa <t.figa@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, rob.herring@calxeda.com, Grant Likely <grant.likely@secretlab.ca>, fparent@baylibre.com, a.hajda@samsung.com, Benoit Cousson <bcousson@baylibre.com>, galak@codeaurora.org, olof@lixom.net, Alison_Chaiken@mentor.com, linux-arm-kernel@lists.infradead.org, David Gibson <david@gibson.dropbear.id.au>
List-Id: devicetree@vger.kernel.org

On Monday 04 November 2013, Jason Gunthorpe wrote:
> On Mon, Nov 04, 2013 at 09:43:22PM +0100, Arnd Bergmann wrote:
> 
> > /*
> >  * this lists all properties we access from the driver. The list
> >  * is interpreted by devm_probe() and can be programmatically
> >  * verified to match the binding.
> >  */
> > static const struct devm_probe foo_probe_list[] = {
> > 	DEVM_ALLOC(foo_priv),
> > 	DEVM_IOMAP(foo_priv, regs, 0, 0),
> > 	DEVM_PROP_BOOL(foo_priv, oldstyle_dma, "foo,oldstyle-dma"),
> > 	DEVM_DMA_SLAVE(foo_priv, rxdma, "rx");
> > 	DEVM_DMA_SLAVE(foo_priv, txdma, "tx");
> > 	DEVM_GPIO(foo_priv, gpio, 0);
> > 	DEVM_IRQ_NAMED(foo_priv, irq, foo_irq_handler, "fifo", IRQF_SHARED),
> > 	{},
> > };
> 
> Drivers are required to gain control of, and disable the device before
> they bind and enable things like DMA or interrupts.
> 
> At the very least the action list above needs an explicit callback to
> do that step..

I was aware of this for the interrupts, my plan for this was to either
leave the interrupt disabled when requesting it and leave it up to the
probe function to call enable_irq(), or to have the irq request function
last in the list, and preceded by a custom per-driver callback. AFAIK
this is only required for some drivers anyway, while other drivers
would function just fine when the irq is enabled early, because they
never raise an IRQ without first having something touch their registers.
Another option would be to have a flag in the driver data that lets
the irq handler know it should ignore the interrupt (or disable the source)
if the probe function has not completed yet.

What is the requirement for DMA channels? I did not expect the
dma_request_slave_channel step to have any ordering requirements.

> > static int foo_probe(struct platform_device *dev)
> > {
> > 	int ret;
> > 
> > 	ret = devm_probe(dev->dev, foo_probe_list);
> 
> Some subsystems (like net) have the core system allocate the private
> data, and some subsystem (like tpm) steal the drvdata for use in the
> core, drivers can't touch it.

I think we can handle the first case by adding a per-subsystem DEV_ALLOC
variant. For the second case, I don't see a solution other than than
changing the subsystem not to steal the driver_data pointer. I need
to find out how common this case is. If a lot of subsystems do it,
we probably want a different solution.

Thanks a lot for your insights!

	Arnd
