From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [PATCH v7,3/3] MIPS: dts: jz4780/ci20: Add NEMC, BCH and NAND
 device tree nodes
Date: Fri, 16 Oct 2015 11:48:48 +0100
Message-ID: <20151016104848.GA1408@NP-P-BURTON>
References: <1444148837-10770-1-git-send-email-harvey.hunt@imgtec.com>
 <1444148837-10770-4-git-send-email-harvey.hunt@imgtec.com>
 <20151015084727.GG14475@jhogan-linux.le.imgtec.org>
 <CAOFt0_D5mO-7_cnpvm_MwvsZNv1yCFynbeA3dSw=H5hVyQbgTA@mail.gmail.com>
 <20151016103112.GB29285@jhogan-linux.le.imgtec.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151016103112.GB29285@jhogan-linux.le.imgtec.org>
Sender: linux-kernel-owner@vger.kernel.org
To: James Hogan <james.hogan@imgtec.com>
Cc: Alex Smith <alex@alex-smith.me.uk>, Harvey Hunt <harvey.hunt@imgtec.com>, linux-mtd@lists.infradead.org, Alex Smith <alex.smith@imgtec.com>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips <linux-mips@linux-mips.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 16, 2015 at 11:31:12AM +0100, James Hogan wrote:
> > >> +
> > >> +&nemc {
> > >> +     status = "okay";
> > >> +
> > >> +     nand: nand@1 {
> > >> +             compatible = "ingenic,jz4780-nand";
> > >
> > > Isn't the NAND a micron part? This doesn't seem right. Is the device
> > > driver and binding already accepted upstream with that compatible
> > > string?
> > 
> > This is the compatible string for the JZ4780 NAND driver, this patch
> > is part of the series adding that. Detection of the NAND part is
> > handled by the MTD subsystem.
> 
> Right (didn't spot that it was part of a series).
> 
> The node appears to describe the NAND interface itself, i.e. a part of
> the SoC, so should be in the SoC dtsi file, with overrides in the board
> file if necessary for it to work with a particular NAND part
> (potentially utilising status="disabled"). Would you agree?

Hi James,

The "nemc" node there is for the Nand & External Memory Controller which
is a hardware block inside the SoC. It has 6 banks (ie. 6 chip select
pins, each associated with a different address range, that connect to
different devices). NAND flash is one such possible device, but a board
could connect it to any of the 6 chip selects, or banks. To represent
that in the SoC dtsi you'd want to have 6 NAND nodes, each disabled by
default, which doesn't make a whole lot of sense to me. Other, non-NAND
devices can connect to the NEMC too - for example the ethernet
controller on the CI20 is connected to one bank.

The NAND device nodes are sort of a mix of describing the NAND flash
(ie. Micron part as you point out) and its connections & properties, the
way the NEMC should be used to interact with it alongside the BCH block,
and the configuration for the NEMC such as timing parameters.

I imagine the most semantically correct means of describing it would
probably be for the compatible string to reflect the Micron NAND part,
and the NEMC driver to pick up on the relevant properties of its child
nodes for configuring timings, whether the device is NAND etc. However
the handling of registering NAND devices with MTD would probably then
have to be part of the NEMC driver, which feels a bit off too.

Thanks,
    Paul
