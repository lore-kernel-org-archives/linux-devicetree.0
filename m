From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v12 2/6] fpga: add bindings document for simple fpga
 bus
Date: Wed, 28 Oct 2015 10:34:46 -0500
Message-ID: <alpine.DEB.2.02.1510281032490.30289@linuxheads99>
References: <1445983755-24007-1-git-send-email-atull@opensource.altera.com> <1445983755-24007-3-git-send-email-atull@opensource.altera.com> <20151028090014.GG1166@pengutronix.de> <alpine.DEB.2.02.1510280948530.30289@linuxheads99>
 <CAAtXAHfRSTXauX2N40aWFDU+sXU0oHmJmUhnm6B8DZ8tb5-1Pw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CAAtXAHfRSTXauX2N40aWFDU+sXU0oHmJmUhnm6B8DZ8tb5-1Pw@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, Greg KH <gregkh@linuxfoundation.org>, Josh Cartwright <joshc@ni.com>, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Alan Tull <delicious.quinoa@gmail.com>, "dinguyen@opensource.altera.com" <dinguyen@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

On Wed, 28 Oct 2015, Moritz Fischer wrote:

> On Wed, Oct 28, 2015 at 7:53 AM, atull <atull@opensource.altera.com> wrote:
> 
> >> > +A Simple FPGA Bus is a bus that handles configuring an FPGA and its bridges
> >> > +before populating the devices below its node.  All this happens when a device
> >> > +tree overlay is added to the live tree.  This document describes that device
> >> > +tree overlay.
> >> > +
> >>
> >> This is not really true, is it?
> >> The driver should work without applying the overlay, e.g. the bootloader
> >> might have already done it.
> >>
> >
> > Yes it's true.  I'm not clear what you are saying.  If the bootloader has
> > programmed the FPGA, the overlay can leave out the optional properties
> > and the FPGA won't get reprogrammed; the child devices will still get
> > added and probed.  So this handles both the case where you want to reprogram
> > the FPGA under Linux and where the FPGA was programmed by a bootloader.
> 
> I think what he means is that the document explicitly calls out the overlay,
> when in theory it also works without an overlay. While being the most 'natural'
> use-case, it is not the only one ;-)
> 
> Moritz
> 

Yes, I can just take out the two sentences that refer to overlays and just 
leave:

A Simple FPGA Bus is a bus that handles configuring an FPGA and its bridges
before populating the devices below its node.

Alan

