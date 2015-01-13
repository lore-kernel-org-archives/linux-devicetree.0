From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v8 2/4] fpga manager: add sysfs interface document
Date: Tue, 13 Jan 2015 15:37:14 -0600
Message-ID: <alpine.DEB.2.02.1501131455130.30192@linuxheads99>
References: <1420575219-27061-1-git-send-email-atull@opensource.altera.com> <1420575219-27061-3-git-send-email-atull@opensource.altera.com> <20150107084819.GA1887@amd> <alpine.DEB.2.02.1501091302370.30067@linuxheads99> <20150109205643.GA5761@amd>
 <20150112210134.687176ed@lxorguk.ukuu.org.uk> <20150112214314.GA18610@obsidianresearch.com> <20150113162847.2778b5a5@lxorguk.ukuu.org.uk> <20150113200032.GA16205@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20150113200032.GA16205@obsidianresearch.com>
Sender: linux-doc-owner@vger.kernel.org
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Pavel Machek <pavel@denx.de>, gregkh@linuxfoundation.org, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devel@driver
List-Id: devicetree@vger.kernel.org

On Tue, 13 Jan 2015, Jason Gunthorpe wrote:

> On Tue, Jan 13, 2015 at 04:28:47PM +0000, One Thousand Gnomes wrote:
> 
> > There is a lot of code overlap in things like loading the bitstreams,
> > there is also some overlap because you want to be able to assign FPGA
> > resources. For example if you have four FPGAs and you want to use one for
> > OS stuff (say video) you want the other three to be open/close
> > accessible, but if you've not got a video driver loaded and are running
> > the same board headless you'd like all four to be handed out as normal
> > resources.
> >
> > So IMHO it's no different to say kmalloc. We don't pre-empt kernel memory
> > and give it to users but we don't reserve memory for kernel and not use
> > it.
> 
> I do agree with this, and I think this is where this patch set goes so
> wrong.
> 
> Just exposing all sorts of controls to userspace and having a way for
> the kernel to load/unload a bitstream compleletely misses the point that
> the two main ways to use FPGAs *require* some kind of kernel side
> driver suppport on the FPGA.

Hi Jason,

I may be misunderstanding.  I thought you wanted lots of user control
a couple years ago.

https://lkml.org/lkml/2013/9/18/490

Your feedback carried a lot of weight as I've been developing this patchset
although I didn't do absolutely everything you asked for.  Back then you
were asking for lots of user control including being able to reset the FPGA
and being able to know from userspace what configuration steps failed (if any).

I'm glad you like DT support for FPGA images + drivers loading since I've
been pushing that since April and have submitted several earlier versions
of this patchset which included it.   I think your arguements against the
current patchset are a bit over the top here.  These patches aren't going to
keep DT support from happening.

> 
> Even if it is just a maths FPGA kernel side has to be involved in some
> way to restrict DMAs, MMIO, by the user process. Obviously a FPGA that
> uses kernel drivers needs kernel side help to bind those drivers.
> 
> Plonking /sys/class/fpga_manager/<fpga>/reset for either case is more
> likely than not to completely crash the system.
> 
> I would look at this problem from a completely different angle - the
> 90% case is a single FPGA that is loaded to provide HW that Linux
> drivers bind to, these days the majority use DT.
> 
> So..
> 
> soc
> {
>     zynq_cfg: ps7-dev-cfg@f8007000 { compatible = "xlnx,zynq-devcfg-1.0"; }
>     
>     fpga@pl {
>        compatible = "..";
>        fpga,api = "gpio-api1";
>        fpga,controller = &zynq_cfg;
> 
>        gp0_axi: axi@40000000 {
>          gpio3: klina_gpio@80010 {
>                  #gpio-cells = <2>;
>                  compatible = "linux,basic-mmio-gpio";
>                  gpio-controller;
>                  reg-names = "dat", "set", "dirin";
>                  reg = <0x80010 4>,
>                        <0x80014 4>,
>                        <0x80018 4>;
>          };
>        }
>     }  
> }
> 
> Make it so linux can boot, automatically fetch the gpio-api1 bit file
> and load it into the chip and then bind the GPIO driver to the FPGA
> resource. All without userspace involvment, all potentially done
> before calling INIT.

Where would the fpga image be fetch from?  What is the mechanism for
doing that?  Do we need to reqire everybody to do that or can
firmware be one of the available mechanisms?

> 
> Make it so via sysfs we can reverse this process and reboot the FPGA.

Better to use the device tree's configfs interface if you are going
to add/delete a DT overlay.  Adding an overlay could load the fpga,
enable bridges, and load driver(s).  Some fpga images may have several
hardware blocks so several drivers to load.

> 
> Make it so userspace can't do something to the FPGA without first
> unloading the drivers.

If we do this using DT overlays, deleting the overlay would result
in the driver getting unloaded first.

> 
> Then worry about how to change the FPGA, or providing more user space
> control over the process (DT overlays are a natural answer).
> 
> Providing a roll-your-own approach via a bunch of sysfs controls
> satisfies the 'make the HW work' need without actually providing the
> overall architecture someone needs to *make use* of this mechanism.
> 
> And no, this isn't just a 'theory', I have 4 shipping products today
> that work pretty much exactly like this, including a Zynq
> design. Binding kernel drivers to a FPGA once it is loaded is a big
> functionality gap, and an annoying problem. Programming the actual
> FPGA? That is the *EASIEST* part of this whole thing!
> 

That's why I'm trying to get programming the fpga out of the way here.

> Honestly, I'd much rather see the above use case solved properly
> without sysfs support and then go from there to build a replacable
> FPGA scheme on the same concepts.
> 
> Providing a 'build your own' solution with sysfs controls just seems
> to completely miss the mark to me.
> 
> > So IMHO it's no different to say kmalloc. We don't pre-empt kernel memory
> > and give it to users but we don't reserve memory for kernel and not use
> > it.
> 
> I think we see a kernel side with more structure, that knows when the
> FPGA is in use or not, there is a pretty clear path to later add a
> /dev/ scheme for user space use that can properly interlock.
> 
> A /dev/ scheme doesn't make much sense to bind kernel drivers...
> 
> Jason
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> 
