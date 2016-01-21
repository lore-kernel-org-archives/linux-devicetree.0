From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v15 0/6] altera fpga area and fpga bus
Date: Thu, 21 Jan 2016 10:42:39 -0600
Message-ID: <alpine.DEB.2.02.1601211036480.8804@linuxheads99>
References: <1453317867-10422-1-git-send-email-atull@opensource.altera.com> <CAAtXAHfars7GUJhFCj2r6JpYzrX4pyaicaWbihAorVWOSxORTw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CAAtXAHfars7GUJhFCj2r6JpYzrX4pyaicaWbihAorVWOSxORTw@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: Rob Herring <robh+dt@kernel.org>, Josh Cartwright <joshc@ni.com>, Greg KH <gregkh@linuxfoundation.org>, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Devicetree List <devicetree@vger.kernel.org>, linux-doc@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Alan Tull <delicious.quinoa@gmail.com>, "dinguyen@opensource.altera.com" <dinguyen@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

On Thu, 21 Jan 2016, Moritz Fischer wrote:

> Hi Alan,
> 
> On Wed, Jan 20, 2016 at 8:24 PM,  <atull@opensource.altera.com> wrote:
> > From: Alan Tull <atull@opensource.altera.com>
> >
> > For v15, I'm not using the FPGA Manager as the bus.  I'm adding a FPGA Bus;
> > the FPGA Manager and bridges go below it.
> >
> > I've gotten enough feedback that my proposals are Altera specific that I am
> > going with that and changing the bindings to include an 'altr,' prefix.
> 
> I hope this wasn't a misunderstanding of one of my earlier remarks. I
> think the fpga-area & fpga bus
> parts do apply to to Xilinx FPGAs, too. I think for fpga-area and
> fpga-bus we could drop the 'altr' prefix.

Yes, I would very much like to drop the altr prefix if we have general
acceptance that this isn't all Altera specific.  I'll need to rename
altera-fpga-bus-fpga-area.txt to drop the 'altera-' prefix and clean
up a little there.

If you want to send me a Xilinx example of usage for me to include in that
document, that would be useful also.  I think you might have sent me
something a while ago, but I can't find it now.

> 
> >
> > I've combined the bindings document and the other Documentation/fpga/ document
> > and done a rewrite there.
> 
> Looks great!
> 
> I'll test it on hardware and look at the patches individually,

Thank you!

> 
> Cheers,
> 
> Moritz
> 
