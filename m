From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v12 3/6] fpga: add simple-fpga-bus
Date: Wed, 28 Oct 2015 06:41:04 -0600
Message-ID: <alpine.DEB.2.10.1510280621470.2865@atull-730U3E-740U3E>
References: <1445983755-24007-1-git-send-email-atull@opensource.altera.com> <1445983755-24007-4-git-send-email-atull@opensource.altera.com> <20151028100714.GB7779@jcartwri.amer.corp.natinst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20151028100714.GB7779@jcartwri.amer.corp.natinst.com>
Sender: linux-doc-owner@vger.kernel.org
To: Josh Cartwright <joshc@ni.com>
Cc: gregkh@linuxfoundation.org, Moritz Fischer <moritz.fischer@ettus.com>, monstr@monstr.eu, michal.simek@xilinx.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, pantelis.antoniou@konsulko.com, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com
List-Id: devicetree@vger.kernel.org

On Wed, 28 Oct 2015, Josh Cartwright wrote:

> On Tue, Oct 27, 2015 at 05:09:12PM -0500, atull@opensource.altera.com wrote:
> > From: Alan Tull <atull@opensource.altera.com>
> > 
> > The Simple FPGA bus uses the FPGA Manager Framework and the
> > FPGA Bridge Framework to provide a manufactorer-agnostic
> > interface for reprogramming FPGAs that is Device Tree
> > Overlays-based.
> 
> Do you intend the "simple-fpga-bus" to be used on Zynq as well?

Yes

>  The
> whole concept of the socfpga's "FPGA Bridge" doesn't map to the Zynq at
> all, from what I can tell.

I want to make this useful for all of us.  I'll make some minor changes so
the simple fpga bus will not exit when it encounters an overlay that doesn't
specify any bridges.

Zynq doesn't have bridges to disable during reconfiguration?  I guess
that's handled automatically in hardware somehow?

> 
> Therefore, I would have expected the FPGA Bridge drivers to sit under
> the fpga-socfpga driver, and not be a first class feature of the
> kernels' FPGA manager subsystem.

I need some way for simple FPGA bus to be able to configure bridges during
the reconfiguration cycle.  That will have to hook into the simple fpga bus,
even if not everybody uses it.  I'll submit minor changes that make it
convenient to either have bridges if you need them or leave them out if
you don't.

Alan

> 
>   Josh
> 


