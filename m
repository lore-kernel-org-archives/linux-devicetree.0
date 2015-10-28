From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v12 3/6] fpga: add simple-fpga-bus
Date: Wed, 28 Oct 2015 13:22:33 -0500
Message-ID: <alpine.DEB.2.02.1510281313340.32338@linuxheads99>
References: <1445983755-24007-1-git-send-email-atull@opensource.altera.com> <1445983755-24007-4-git-send-email-atull@opensource.altera.com> <20151028100714.GB7779@jcartwri.amer.corp.natinst.com> <CAAtXAHcaSZaKhYtVFbUEuO+boMh_PgUaOGVtjO_5MDkpcLcmWA@mail.gmail.com>
 <20151028161859.GJ8245@jcartwri.amer.corp.natinst.com> <CAAtXAHdry3_A9ow-w5KQg80ECyaAuSGVit9ygcM7Ffc9yiysMA@mail.gmail.com> <alpine.DEB.2.02.1510281151480.28209@linuxheads99> <20151028175916.GK8245@jcartwri.amer.corp.natinst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151028175916.GK8245@jcartwri.amer.corp.natinst.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Josh Cartwright <joshc@ni.com>
Cc: Moritz Fischer <moritz.fischer@ettus.com>, Greg KH <gregkh@linuxfoundation.org>, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Alan Tull <delicious.quinoa@gmail.com>, "dinguyen@opensource.altera.com" <dinguyen@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

On Wed, 28 Oct 2015, Josh Cartwright wrote:

> On Wed, Oct 28, 2015 at 12:03:41PM -0500, atull wrote:
> > On Wed, 28 Oct 2015, Moritz Fischer wrote:
> > 
> > > On Wed, Oct 28, 2015 at 9:18 AM, Josh Cartwright <joshc@ni.com> wrote:
> > > > On Wed, Oct 28, 2015 at 08:37:51AM -0700, Moritz Fischer wrote:
> > > >> On Wed, Oct 28, 2015 at 3:07 AM, Josh Cartwright <joshc@ni.com> wrote:
> > > >> > On Tue, Oct 27, 2015 at 05:09:12PM -0500, atull@opensource.altera.com wrote:
> > > >> >> From: Alan Tull <atull@opensource.altera.com>
> > > >> >>
> > > >> >> The Simple FPGA bus uses the FPGA Manager Framework and the
> > > >> >> FPGA Bridge Framework to provide a manufactorer-agnostic
> > > >> >> interface for reprogramming FPGAs that is Device Tree
> > > >> >> Overlays-based.
> > > >> >
> > > >> > Do you intend the "simple-fpga-bus" to be used on Zynq as well?  The
> > > >> > whole concept of the socfpga's "FPGA Bridge" doesn't map to the Zynq at
> > > >> > all, from what I can tell.
> > > >>
> > > >> For Zynq the zynq-fpga driver takes care of the level shifters on full
> > > >> reconfiguration,
> > > >> and doesn't for partial reconfiguration. Now depending on which parts
> > > >> of the fabric
> > > >> are partial reconfigured (say AXI masters), one might run into issues
> > > >> with a setup like that.
> > > >>
> > > >> My first plan was to counter that by using zynq-reset to hold the
> > > >> reset high during
> > > >> reconfiguration of that part of the FPGA.
> > > >>
> > > >> I'm happy to rethink that part and maybe redo the level shifters and
> > > >> resets together in a bridge
> > > >> driver under devicetree control gives finer grained control.
> > > >
> > > > There is already a framework which is used to describe and manipulate
> > > > level shifting/other IO properties, and that is pinctrl, and if we
> > > > wanted to use an appropriate abstraction, I think pinctrl would be the
> > > > best bet.
> > > 
> > > Alright, I'll investigate that. Again, for the non-partial reconfig
> > > case I'm happy
> > > with the behavior as implemented, for the partial reconfig I just
> > > haven't run into
> > > issues with not dealing with the level shifters.
> > 
> > Are you suggesting pinctrl instead of introducing a FPGA Bridge Framework?
> 
> I'm suggesting that for the set of operations/configuration states that
> need to be managed _for the Zynq[1]_ during reprogramming, I think
> pinctrl might be a good fit.

Hi Josh,

OK, thanks for the clarification.  Communication is hard :)

> 
> But the pinctrl state activation would happen in the context of the zynq
> fpga_mgr_ops write
> 
> I do not think it's a good fit for the socfpga, or for the lower level
> fpga drivers _in general_.  Nor do I think that the FPGA Bridge
> framework, as written, is a good fit for fpgas in general.

OK so about that last sentence...

For full reconfiguration, we could control the hardware bridges from the
FPGA Manager and that would be fine, because the area affected by the bridge
is the whole area, which is what the FPGA Manager will reprogram.

For partial reconfiguration, we can have one FPGA Manager programming
several PR areas.  Each PR area will need its own bridge within the
FPGA.  It no longer makes sense to control bridges from the manager.
So Xilinx may need this yet, for PR.

And again, if you don't need it, you won't have to deal with it.  I'll make
it so that the simple fpga bus works fine with the fpga bridges compiled out
even.

Alan

> 
>   Josh
> 
> [1]: Speaking only of the Zynq 7000-series, I don't know anything about
>      the fancy new Zynq MPSoC :)
> 
