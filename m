From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: microblaze device-tree description - pair intc/buses and timers
Date: Tue, 11 Jun 2013 14:02:36 +0100
Message-ID: <20130611130236.D2ACA3E0A90@localhost>
References: <51A35E6D.5040706@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51A35E6D.5040706-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Peter Crosthwaite <pcrost-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 27 May 2013 15:23:57 +0200, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org> wrote:
> Hi guys,
> 
> we have got a new configurations with iomodule which can be connected to the microblaze
> cpu and I would like to have proper description for this system
> + more advance configuration below.
> 
> Buses:
> Microblaze systems have in standard configuration two buses LMB and AXI(in past PLB).
> We didn't generate LMB even there is placed BRAM (block ram)
> but Linux expects that there is any writeable memory at 0x0.
> Currently because we can use iomodule which is connected to LMB and we need to generate
> this bus. I don't expect that there is any problem to have this configuration.
> 
> cpus {
> 	...
> 	cpu@0 {
> 		...
> 	}
> }
> lmb@0 {
> 	...
> 	iomodule@X {
> 		...
> 	}
> }
> axi@X {
> 	...
> 	nodes
> 	...
> }
> 
> Block ram:
> When we generate lmb make sense to also add there this small bram memory
> but I expect that is it ok just to added to bus and do not add it to the root.
> Currently we have an option to use "mmio-sram" compatibility string for it.
> 
> Interrupt controller:
> Till now Microblaze uses only one interrupt controller on main bus (AXI or PLB)
> and we just find compatible string and we said that this is primary interrupt controller.
> 
> Based on DTS in the kernel I see that "interrupt-parent" property
> reflects which interrupt controller is master and which one is in cascade.

Mostly correct; it is also possible for an interrupt controller to
cascade to two different parent controllers, and in that case there
would need to be an interrupt-map somewhere. That case is rare however.

> 
> Timer:
> System timer was also detected in this way that the first suitable timer was
> taken and used. Others were just ignored.
> 
> 
> Extend system configuration
> We have also got an option to add one more CPU and I would like to have
> an option to describe it correctly.

Are you doing SMP in this case? I assume that you are not because we're
talking about microblaze here. Separate OSes on each CPU?

The DT design currently assumes that then whole tree is from the view of
the CPU that the code is running on. CPUs that aren't part of the 'core'
system typically don't show up in the /cpus node. In your case however,
I can see the arguement for wanting a single tree that describes
everything and each CPU needs to know how to filter the tree for only
the devices that belong to it. Am I correct so far?

> 
> LMB is private cpu bus and two options I have for description is to use
> specific names for it
> cpus {
> 	...
> 	cpu@0 {
> 		...
> 	}
> 	cpu@1 {
> 		...
> 	}
> }
> lmb_cpu0@0 {
> 	...
> 	iomodule0@X {
> 		...
> 	}
> }
> lmb_cpu1@0 {
> 	...
> 	iomodule1@X {
> 		...
> 	}
> }
> axi@X {
> 	...
> 	shared nodes
> 	...
> }
> 
> 
> or use bus handles in cpu
> 
> cpus {
> 	...
> 	cpu@0 {
> 		...
> 		bus-lmb = <&lmb_cpu0> ;
> 		bus-handle = <&axi> ;
> 	}
> 	cpu@1 {
> 		...
> 		bus-lmb = <&lmb_cpu1> ;
> 		bus-handle = <&axi> ;
> 	}
> }
> lmb_cpu0@0 {
> 	...
> 	iomodule0@X {
> 		...
> 	}
> }
> lmb_cpu1@0 {
> 	...
> 	iomodule1@X {
> 		...
> 	}
> }
> axi@X {
> 	...
> 	shared nodes
> 	...
> }
> 
> 
> which is from my point of view better because it supports
> options where one cpu doesn't need to have main axi bus
> or lmb or both.

The bus handle approach makes perfect sense to me. It is local to the
CPU and it can use those properties to decide which nodes in the rest of
the tree are important.

> It has also connection to interrupt controller description
> where is not clear for system with two cpus which interrupt controller
> is primary for every cpu.
> It can be illustrated on simple example where there are two interrupt
> controllers on axi and both are primary for specific cpu
> and we can't exchange them.
> 
> It means that I would like to have proper description which interrupt
> controller is primary one for specific CPU.
> I am not sure if make sense to use interrupt-parent also from
> this primary interrupt controller which will point to cpu.
> 
> cpus {
> 	...
> 	cpu@0 {
> 		...
> 	}
> }
> axi@X {
> 	...
> 	io_intc: intc@C {
> 		interrupt-controller ;
> 		interrupt-parent = <&cpu@0> ;
> 	}
> 	...
> }

This makes a bit of sense if you think of CPUs as a very simple
interrupt controller with only one input. However, it doesn't line up
well since there really isn't much you can do with that controller, and
you don't want to have to add "interrupt-controller" and
"#interrupt-cells" to the cpu node.

> 
> or better to use interrupt-handle property directly in cpu node.
> 
> cpus {
> 	...
> 	cpu@0 {
> 		interrupt-handle = <&io_intc> ;
> 		...
> 	}
> }

This makes more sense. The CPU needs to know which intc it should look
at for its first level of interrupt handling. I assume you have a
mechanism for the OS to determine which cpu node is its 'home' node.

g.
