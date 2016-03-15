From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v17 2/6] ARM: socfpga: add bindings document for fpga
 bridge drivers
Date: Tue, 15 Mar 2016 17:04:53 -0500
Message-ID: <alpine.DEB.2.02.1603151657110.24255@linuxheads99>
References: <1456442711-29138-1-git-send-email-atull@opensource.altera.com> <1456442711-29138-3-git-send-email-atull@opensource.altera.com> <20160305043455.GA19011@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160305043455.GA19011@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: pantelis.antoniou@konsulko.com, Moritz Fischer <moritz.fischer@ettus.com>, gregkh@linuxfoundation.org, monstr@monstr.eu, michal.simek@xilinx.com, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, Matthew Gerlach <mgerlach@altera.com>
List-Id: devicetree@vger.kernel.org

On Sat, 5 Mar 2016, Rob Herring wrote:

> > +Example:
> > +	hps_fpgabridge0: fpgabridge@ff400000 {
> 
> No underscores.
> 
> fpga-bridge@...

Hi Rob,

The dtc is not letting me compile if I use a hyphen in the label.
I think we have to use hyphens in the node names and underscores
in the labels.  So it will end up being:

+	fpga_bridge0: fpga-bridge@ff400000 {

Alan
