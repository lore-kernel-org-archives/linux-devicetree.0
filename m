From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH v6 3/3] ARM: dts: vf610: add Miscellaneous System Control
 Module (MSCM)
Date: Wed, 11 Mar 2015 04:05:39 +0000
Message-ID: <20150311040539.GD21998@io.lakedaemon.net>
References: <1425249689-32354-1-git-send-email-stefan@agner.ch>
 <1425249689-32354-4-git-send-email-stefan@agner.ch>
 <20150311004812.GU20455@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20150311004812.GU20455@dragon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, pebolle@tiscali.nl, linux@arm.linux.org.uk, pawel.moll@arm.com, arnd@arndb.de, ijc+devicetree@hellion.org.uk, marc.zyngier@arm.com, galak@codeaurora.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>, robh+dt@kernel.org, kernel@pengutronix.de, u.kleine-koenig@pengutronix.de, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 11, 2015 at 08:48:15AM +0800, Shawn Guo wrote:
> On Sun, Mar 01, 2015 at 11:41:29PM +0100, Stefan Agner wrote:
> > Add the Miscellaneous System Control Module (MSCM) to the base
> > device tree for Vybrid SoC's. This module contains registers
> > to get information of the individual and current (accessing)
> > CPU. In a second block, there is an interrupt router, which
> > handles the routing of the interrupts between the two CPU cores
> > on VF6xx variants of the SoC. However, also on single core
> > variants the interrupt router needs to be configured in order
> > to receive interrupts on the CPU's interrupt controller. Almost
> > all peripheral interrupts are routed through the router, hence
> > the MSCM module is the default interrupt parent for this SoC.
> > 
> > In a earlier commit the interrupt nodes were moved out of the
> > peripheral nodes and specified in the CPU specific vf500.dtsi
> > device tree. This allowed to use the base device tree vfxxx.dtsi
> > also for a Cortex-M4 specific device tree, which uses different
> > interrupt nodes due to the NVIC interrupt controller. However,
> > since the interrupt parent for peripherals is the MSCM module
> > independently which CPU the device tree is used for, we can move
> > the interrupt nodes into the base device tree vfxxx.dtsi again.
> > Depending on which CPU this base device tree will be used with,
> > the correct parent interrupt controller has to be assigned to
> > the MSCM-IR node (GIC or NVIC). The driver takes care of the
> > parent interrupt controller specific needs (interrupt-cells).
> > 
> > Acked-by: Marc Zyngier <marc.zyngier@arm.com>
> > Signed-off-by: Stefan Agner <stefan@agner.ch>
> 
> Stefan,
> 
> I guess this patch has a run-time dependency on the first two in the
> series, right?  Or put it another way, if I apply this single patch on
> my branch, the dtb and kernel built from the same branch do not work
> together, right?  If so, we will need to either wait for the first two
> hit mainline or pull Jason's irqchip/vybrid branch into my tree as
> prerequisite (irqchip/vybrid needs to be stable).

No problem, I'll only add patches on top of this if needed.  no rebasing.

thx,

Jason.
