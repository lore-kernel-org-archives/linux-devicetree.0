From: Dinh Nguyen <dinguyen@opensource.altera.com>
Subject: Re: [PATCH v2] ARM: socfpga: dts: add fpga manager
Date: Tue, 13 Oct 2015 16:16:19 -0500
Message-ID: <alpine.DEB.2.02.1510131615350.4441@linux-builds1>
References: <1444765139-2040-1-git-send-email-atull@opensource.altera.com> <alpine.DEB.2.02.1510131450480.4441@linux-builds1> <20151013203344.GE17155@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151013203344.GE17155@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Alan Tull <atull@opensource.altera.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, delicious.quinoa@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, 13 Oct 2015, Steffen Trumtrar wrote:

> On Tue, Oct 13, 2015 at 02:51:28PM -0500, Dinh Nguyen wrote:
> > On Tue, 13 Oct 2015, atull@opensource.altera.com wrote:
> > 
> > > From: Alan Tull <atull@opensource.altera.com>
> > > 
> > > Add FPGA manager to device tree for SoCFPGA.
> > > 
> > > Signed-off-by: Alan Tull <atull@opensource.altera.com>
> > > ---
> > > v2: Remove 0x after @
> > >     No caps in hex numbers
> > >     renamed hps_0_fpgamgr to fpgamgr0
> > >     move node to be in alpha order by node name
> > > ---
> > >  arch/arm/boot/dts/socfpga.dtsi | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > > 
> > 
> > Applied!
> 
> What about the
> 
> "Also, you need to document the "altr,socfpga-fpga-mgr"."
> 
> you mentioned in v1 ???
>

It was my oversight. It has already been documented. 

BR,
Dinh
