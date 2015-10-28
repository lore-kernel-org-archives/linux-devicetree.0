From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v12 3/6] fpga: add simple-fpga-bus
Date: Wed, 28 Oct 2015 12:41:33 -0500
Message-ID: <alpine.DEB.2.02.1510281237470.9125@linuxheads99>
References: <1445983755-24007-1-git-send-email-atull@opensource.altera.com> <1445983755-24007-4-git-send-email-atull@opensource.altera.com> <20151028100714.GB7779@jcartwri.amer.corp.natinst.com> <CAAtXAHcaSZaKhYtVFbUEuO+boMh_PgUaOGVtjO_5MDkpcLcmWA@mail.gmail.com>
 <20151028161859.GJ8245@jcartwri.amer.corp.natinst.com> <CAAtXAHdry3_A9ow-w5KQg80ECyaAuSGVit9ygcM7Ffc9yiysMA@mail.gmail.com> <alpine.DEB.2.02.1510281151480.28209@linuxheads99>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.02.1510281151480.28209@linuxheads99>
Sender: linux-doc-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: Josh Cartwright <joshc@ni.com>, Greg KH <gregkh@linuxfoundation.org>, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Alan Tull <delicious.quinoa@gmail.com>, "dinguyen@opensource.altera.com" <dinguyen@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

On Wed, 28 Oct 2015, atull wrote:

> On Wed, 28 Oct 2015, Moritz Fischer wrote:
> 
> > On Wed, Oct 28, 2015 at 9:18 AM, Josh Cartwright <joshc@ni.com> wrote:
> > > On Wed, Oct 28, 2015 at 08:37:51AM -0700, Moritz Fischer wrote:
> > >> On Wed, Oct 28, 2015 at 3:07 AM, Josh Cartwright <joshc@ni.com> wrote:
> > >> > On Tue, Oct 27, 2015 at 05:09:12PM -0500, atull@opensource.altera.com wrote:
> > >> >> From: Alan Tull <atull@opensource.altera.com>
> > >> >>
> > >> >> The Simple FPGA bus uses the FPGA Manager Framework and the
> > >> >> FPGA Bridge Framework to provide a manufactorer-agnostic
> > >> >> interface for reprogramming FPGAs that is Device Tree
> > >> >> Overlays-based.
> > >> >
> > >> > Do you intend the "simple-fpga-bus" to be used on Zynq as well?  The
> > >> > whole concept of the socfpga's "FPGA Bridge" doesn't map to the Zynq at
> > >> > all, from what I can tell.
> > >>
> > >> For Zynq the zynq-fpga driver takes care of the level shifters on full
> > >> reconfiguration,
> > >> and doesn't for partial reconfiguration. Now depending on which parts
> > >> of the fabric
> > >> are partial reconfigured (say AXI masters), one might run into issues
> > >> with a setup like that.
> > >>
> > >> My first plan was to counter that by using zynq-reset to hold the
> > >> reset high during
> > >> reconfiguration of that part of the FPGA.
> > >>
> > >> I'm happy to rethink that part and maybe redo the level shifters and
> > >> resets together in a bridge
> > >> driver under devicetree control gives finer grained control.
> > >
> > > There is already a framework which is used to describe and manipulate
> > > level shifting/other IO properties, and that is pinctrl, and if we
> > > wanted to use an appropriate abstraction, I think pinctrl would be the
> > > best bet.
> > 
> > Alright, I'll investigate that. Again, for the non-partial reconfig
> > case I'm happy
> > with the behavior as implemented, for the partial reconfig I just
> > haven't run into
> > issues with not dealing with the level shifters.
> 
> Are you suggesting pinctrl instead of introducing a FPGA Bridge Framework?
> If it fits, that's great.  Steffen is urging us to include reconfiguring
> width of the bridge so I'm trying to figure how and if that all fits in
> here.
> 

Hi Josh,

I don't think pinctrl is a good match here or even could be made to do
what we need here.  Simple FPGA Bus needs, at minimum, an API to call
to enable/disable data through a bridge to protect the processor bus
from spurious data while the FPGA is being programmed.

Alan
