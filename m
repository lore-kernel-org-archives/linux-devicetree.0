From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v17 2/6] ARM: socfpga: add bindings document for fpga
 bridge drivers
Date: Mon, 28 Mar 2016 17:09:23 -0500
Message-ID: <20160328220923.GA12212@rob-hp-laptop>
References: <1456442711-29138-1-git-send-email-atull@opensource.altera.com>
 <1456442711-29138-3-git-send-email-atull@opensource.altera.com>
 <20160305043455.GA19011@rob-hp-laptop>
 <alpine.DEB.2.02.1603151657110.24255@linuxheads99>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1603151657110.24255@linuxheads99>
Sender: linux-doc-owner@vger.kernel.org
To: atull <atull@opensource.altera.com>
Cc: pantelis.antoniou@konsulko.com, Moritz Fischer <moritz.fischer@ettus.com>, gregkh@linuxfoundation.org, monstr@monstr.eu, michal.simek@xilinx.com, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, Matthew Gerlach <mgerlach@altera.com>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 15, 2016 at 05:04:53PM -0500, atull wrote:
> On Sat, 5 Mar 2016, Rob Herring wrote:
> 
> > > +Example:
> > > +	hps_fpgabridge0: fpgabridge@ff400000 {
> > 
> > No underscores.
> > 
> > fpga-bridge@...
> 
> Hi Rob,
> 
> The dtc is not letting me compile if I use a hyphen in the label.
> I think we have to use hyphens in the node names and underscores
> in the labels.  So it will end up being:
> 
> +	fpga_bridge0: fpga-bridge@ff400000 {

Sorry, don't know what I was looking at. In labels, underscores are 
fine. This looks fine.

Rob
