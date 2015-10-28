From: Josh Cartwright <joshc@ni.com>
Subject: Re: [PATCH v12 3/6] fpga: add simple-fpga-bus
Date: Wed, 28 Oct 2015 05:07:14 -0500
Message-ID: <20151028100714.GB7779@jcartwri.amer.corp.natinst.com>
References: <1445983755-24007-1-git-send-email-atull@opensource.altera.com>
 <1445983755-24007-4-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1445983755-24007-4-git-send-email-atull@opensource.altera.com>
Content-Disposition: inline
Sender: linux-doc-owner@vger.kernel.org
To: atull@opensource.altera.com
Cc: gregkh@linuxfoundation.org, Moritz Fischer <moritz.fischer@ettus.com>, monstr@monstr.eu, michal.simek@xilinx.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, pantelis.antoniou@konsulko.com, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com
List-Id: devicetree@vger.kernel.org

On Tue, Oct 27, 2015 at 05:09:12PM -0500, atull@opensource.altera.com wrote:
> From: Alan Tull <atull@opensource.altera.com>
> 
> The Simple FPGA bus uses the FPGA Manager Framework and the
> FPGA Bridge Framework to provide a manufactorer-agnostic
> interface for reprogramming FPGAs that is Device Tree
> Overlays-based.

Do you intend the "simple-fpga-bus" to be used on Zynq as well?  The
whole concept of the socfpga's "FPGA Bridge" doesn't map to the Zynq at
all, from what I can tell.

Therefore, I would have expected the FPGA Bridge drivers to sit under
the fpga-socfpga driver, and not be a first class feature of the
kernels' FPGA manager subsystem.

  Josh
