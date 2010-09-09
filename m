From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: questions regarding interrupt routing
Date: Thu, 9 Sep 2010 10:50:30 -0600
Message-ID: <20100909165030.GC6273@angua.secretlab.ca>
References: <AANLkTinsAf=yn+8marhTV_5tO1fbDQWoW8GLcKdKY1Dn@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTinsAf=yn+8marhTV_5tO1fbDQWoW8GLcKdKY1Dn-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shaju Abraham <shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 09, 2010 at 03:48:11PM +0530, Shaju Abraham wrote:
> Hi
> 
> I am trying to port device tree on to the SMDKV210 (ARM cortex A8
> controller) board. In this SoC we have 4 VICs as interrupt controller
> (daisy chained) where all the 32 interrupt sources on each controller
> is fully populated.

Cool!

> There are interrupts which are multiplexed to the same interrupt pin
> (example : external interrupt 16-31 muxed to irq 16 of VIC0).Is there
> a standard way to pass the demux information from the device tree? Can
> I use a inetrrupt specifier like interrupts = <interrupt numer
> subinterrupt number>?

Yes, the device tree already has a mechanism for describing cascaded
interrupt controllers.  You need to have a separate node for each irq
controller and use the interrupt-parent property to indicate which
controller each device is attached to.  So, for an example with 3
interrupt controllers, the tree might look like this (just showing irq
properties):

/ {
	interrupt-parent = <&intc0>; /* 'default' irq controller */

	intc0: interrupt-controller@f0001000 {
		#interrupt-cells = <1>;
		interrupt-controller;
	};
	intc1: interrupt-controller@f0002000 {
		#interrupt-cells = <1>;
		interrupt-controller;

		/* IRQ output cascaded to irq16 on intc0 */
		interrupt-parent = <&intc0>;
		interrupts = <16>;
	};
	intc2: interrupt-controller@f0003000 {
		#interrupt-cells = <1>;
		interrupt-controller;

		/* IRQ output cascaded to irq17 on intc0 */
		interrupt-parent = <&intc0>;
		interrupts = <17>;
	};

	uart1: serial@f0004000 {
		interrupts = <1>;  /* irq 1 on default controller */
	};
	uart2: serial@f0005000 {
		interrupts = <2>;  /* irq 2 on default controller */
	};
	uart3: serial@f0006000 {
		interrupt-parent = <&intc1>;
		interrupts = <1>;  /* irq 1 on intc1 */
	};
	uart4: serial@f0007000 {
		interrupt-parent = <&intc2>;
		interrupts = <1>;  /* irq 1 on intc2 */
	};
	uart5: serial@f0008000 {
		interrupt-parent = <&intc2>;
		interrupts = <2>;  /* irq 2 on intc2 */
	};
};

Something to note: Each node in the device tree specifics an irq
number *local to the interrupt controller*.  That means that
interrupts 0-31 can be specified on intc0, intc1 and intc2.  The
device tree does not map all the interrupt controllers into a flat irq
number space like Linux does.

On PowerPC we have a mechanism (virqs) to dynamically map interrupt
controllers onto the flat Linux irq number space starting at irq
number 1.  I want to do the same thing on ARM, but I haven't gotten
the infrastructure in place to do so yet.

g.
