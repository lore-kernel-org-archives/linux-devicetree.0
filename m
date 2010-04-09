From: Paul Brook <paul-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org>
Subject: Re: [Qemu-devel] [RFC PATCH 0/7] QEMU patches to generate FDT from
	qdevs
Date: Fri, 9 Apr 2010 16:57:10 +0100
Message-ID: <201004091657.10684.paul@codesourcery.com>
References: <20100407040129.20274.44284.stgit@angua>
	<201004091307.22473.paul@codesourcery.com>
	<h2ofa686aa41004090747w2422cedasb6f4b51633637816@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <h2ofa686aa41004090747w2422cedasb6f4b51633637816-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

> On Fri, Apr 9, 2010 at 6:07 AM, Paul Brook <paul-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org> wrote:
> >> Hi everyone,
> >>
> >> This is an experimental set of patches for populating the flattened
> >> device tree (fdt) data from the actual set of qdevs in the platform.
> >> I'm not expecting this to get merged anytime soon, but I wanted to get
> >> it out there to solicit comments.  My target for this is testing
> >> device tree support on ARM.
> >
> > I think you need to convert some more interesting machines before it's
> > possible to tell whether this is a sane setup. When investigating FDTs
> > for creation of machine I found it's easy to invent something that can
> > handle the simple integrator/cp board, but it all starts to fall apart
> > when you encounter more complicated boards. In particular things like
> > PCI, USB, I2C, etc. and strange bus configurations when you have both
> > on-chip and external devices.
> 
> Certainly.  What would be a good (preferably ARM) platform to look at?
>  I'm fairly new to working with QEMU, so I'm not very familiar with
> the platforms that are available.

The versatile and readview boards both have PCI. The realview-eb-mpcore in 
particular has entertaining IRQ routing.  The Stellaris boards have various 
devices hanging off I2C/SSI busses and/or GPO pins (though the stellaris 
boards aren't capable of running linux). The musicpal audio device may also be 
interesting as it's connected vi both i2s and gpio based i2c.  All these 
should be fairly well qdev-ified. 

Arguably the most interesting is the PPC boards as we already know what device 
tree we need to generate.  However these haven't been converted to qdev yet, 
and it's unclear how well the 4xx boards work to start with.

Paul
