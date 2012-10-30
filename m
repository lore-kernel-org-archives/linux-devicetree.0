From: Afzal Mohammed <x0148406@ti.com>
Subject: Re: Representation of external memory-mapped devices in DT (gpmc)
Date: Tue, 30 Oct 2012 16:20:53 +0530
Message-ID: <508FB10D.9030906@ti.com>
References: <508E9513.7050106@gmail.com> <508E9C42.10907@gmail.com>
 <508EBB47.8070405@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <508EBB47.8070405@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Daniel Mack <zonque@gmail.com>
Cc: Afzal Mohammed <afzal@ti.com>, Tony Lindgren <tony@atomide.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, "Nori,
 Sekhar" <nsekhar@ti.com>, Paul Walmsley <paul@pwsan.com>, Grant Likely <grant.likely@secretlab.ca>, "Hunter, Jon" <jon-hunter@ti.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Daniel,

On Monday 29 October 2012 10:52 PM, Daniel Mack wrote:
> On 29.10.2012 16:09, Rob Herring wrote:

>> You may want a CS0 node with nand as a child node of that.

> Hmm, I don't see what that would buy us. The question is which way is
> feasible for storing both the memory region and the cs number in the
> device tree. The CS number should certainly go to the child node, no?
>
> IOW, would it be a good idea to have something like the following layout?
>
> 	gpmc: gpmc@50000000 {
> 		compatible = "ti,gpmc";
> 		ti,hwmods = "gpmc";
> 		reg =<0x50000000 0x2000>;
>
> 		/* cs-reg stores the setup of the controller's
> 		   memory map */
>
> 			/* offset	size */
> 		cs-reg =<0x0		0x1000000
> 			  ....		.....
> 			  ....		.....>;
>
> 		nand: child@0 {
> 			/* timings */
> 			/* peripheral specifics */
> 		};
> 	};
>
> I would actually much prefer that approach.
>
> Afzal, because because that way, we can leave the code as-is for now and
> add the "cs-reg" property once the code is switched to dynamic handling.
> What do you think?

I don't know what to say, don't have a good grasp on DT to give
right suggestion.

It seems offset field may not be necessary. memory for connected
peripherals is not fixed, only CS is fixed (as CS pin is hard-wired).
Physical memory can be anywhere between 0-512MB (with
alignment constraints depending on size, refer GPMC_CONFIG7
register), even though right now memory region for peripheral
seems to be fixed (for boards supported in mainline it will be
what bootloader configures), it is possible to have it in a different
region for those peripherals.

And this memory should be presented to child device as resource,
say for smsc911x ethernet driver.

I see some similarity with PCI - BAR's, where address space
is configured (here a difference would be that size needs to
be known while configuring). Size here would be based on
connected peripheral (but no auto detection)

Regards
Afzal
