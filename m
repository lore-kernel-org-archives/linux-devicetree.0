From: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH v8 2/4] fpga manager: add sysfs interface document
Date: Tue, 13 Jan 2015 16:28:47 +0000
Message-ID: <20150113162847.2778b5a5@lxorguk.ukuu.org.uk>
References: <1420575219-27061-1-git-send-email-atull@opensource.altera.com>
 <1420575219-27061-3-git-send-email-atull@opensource.altera.com>
 <20150107084819.GA1887@amd>
 <alpine.DEB.2.02.1501091302370.30067@linuxheads99>
 <20150109205643.GA5761@amd>
 <20150112210134.687176ed@lxorguk.ukuu.org.uk>
 <20150112214314.GA18610@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20150112214314.GA18610@obsidianresearch.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: mark.rutland@arm.com, linux-doc@vger.kernel.org, rubini@gnudd.com, pantelis.antoniou@konsulko.com, hpa@zytor.com, s.trumtrar@pengutronix.de, devel@driverdev.osuosl.org, sameo@linux.intel.com, nico@linaro.org, ijc+devicetree@hellion.org.uk, michal.simek@xilinx.com, kyle.teske@ni.com, grant.likely@linaro.org, davidb@codeaurora.org, linus.walleij@linaro.org, cesarb@cesarb.net, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, iws@ovro.caltech.edu, atull <atull@opensource.altera.com>, galak@codeaurora.org, broonie@kernel.org, philip@balister.org, dinguyen@opensource.altera.com, monstr@monstr.eu, gregkh@linuxfoundation.org, yvanderv@opensource.altera.com, linux-kernel@vger.kernel.org, balbi@ti.com, delicious.quinoa@gmail.com, robh+dt@kernel.org, rob@landley.net, Pavel Machek <pavel@denx.de>, akpm@linux-foundation.org, davem@davemloft.net, m.chehab@samsung.c
List-Id: devicetree@vger.kernel.org

On Mon, 12 Jan 2015 14:43:14 -0700
Jason Gunthorpe <jgunthorpe@obsidianresearch.com> wrote:

> On Mon, Jan 12, 2015 at 09:01:34PM +0000, One Thousand Gnomes wrote:
> > There are plenty of people today who treat the FPGA as an entirely
> > dynamic resource. It's not like flashing a controller, its near
> > immediate.
> 
> But this is a completely different use case. Remember, there are
> *megabytes* of internal state in a FPGA, and it isn't really feasible
> to dump/restore that state.

People already do it with cases where it makes sense

> It is one thing to context switch a maths algorithm that is built to
> be stateless, it is quite another to context switch between, say an
> ethernet core with an operating Linux Net driver doing DMA and a maths
> algorithm.

And people already do it with thins like maths algorithms.
 
> A DT overlay approach where the overlay has to be unloaded to 'free'
> the FPGA makes alot of sense to me for the stateful kernel driver
> environment, and open/close/etc makes alot of sense for the stateless
> switchable userspace environment - other than sharing configuration
> code, is there any overlap between these use cases????

There is a lot of code overlap in things like loading the bitstreams,
there is also some overlap because you want to be able to assign FPGA
resources. For example if you have four FPGAs and you want to use one for
OS stuff (say video) you want the other three to be open/close
accessible, but if you've not got a video driver loaded and are running
the same board headless you'd like all four to be handed out as normal
resources.

So IMHO it's no different to say kmalloc. We don't pre-empt kernel memory
and give it to users but we don't reserve memory for kernel and not use
it.

> > Its completely dynamic and it will get more so as we switch from the
> > painful world of VHDL and friends to high level parallel aware language
> > compilers for FPGAs and everyone will be knocking up quick FPGA hacks.
> 
> Only for some users. In my world FPGAs are filled with bus interface
> logic, ethernet controllers, memory controllers, packet processing
> engines, etc. This is all incredibly stateful - both in the FPGA
> itself, and in the Linux side w/ drviers. It certainly will not ever
> work in the model you are talking about.

For those cases I mostly agree (the state in the FPGA isn't always a
problem as you can program an FPGA to DMA its state out).

> Even if the digital state could somehow be frozen, dumped and
> restored, all the FPGA external interface logic has *ANALOG* state
> that cannot ever be dump/restored. It just isn't feasible for that
> class of application.

Yes, however as we are starting to get things like OpenCL for FPGA they
become extremely attractive for a wide range of purposes that don't
involve glueing them to electronica in quite the same way. All the 'GPU
as CPU' type uses and more begin to apply.

Alan
