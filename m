From: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
Subject: RE: [PATCH v6 1/2] Devicetree: Add pl353 smc controller devicetree
 binding information
Date: Fri, 24 Apr 2015 00:46:21 +0000
Message-ID: <d4e01acf-28c1-466f-a796-12f7ea339507@BN1AFFO11FD028.protection.gbl>
References: <1428941512-26411-1-git-send-email-punnaia@xilinx.com>
 <e3a73fa0-9159-4fbe-b042-4737dc9b041f@BN1BFFO11FD010.protection.gbl>
 <20150423195043.GS27115@jcartwri.amer.corp.natinst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150423195043.GS27115@jcartwri.amer.corp.natinst.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Josh Cartwright <joshc@ni.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "rob@landley.net" <rob@landley.net>, Michal Simek <michals@xilinx.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>, "arnd@arndb.de" <arnd@arndb.de>, "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>, "jussi.kivilinna@iki.fi" <jussi.kivilinna@iki.fi>, "acourbot@nvidia.com" <acourbot@nvidia.com>, ivan.khoronzhuk@ti.
List-Id: devicetree@vger.kernel.org

Hi Josh,

> -----Original Message-----
> From: Josh Cartwright [mailto:joshc@ni.com]
> Sent: Friday, April 24, 2015 1:21 AM
> To: Punnaiah Choudary Kalluri
> Cc: robh+dt@kernel.org; pawel.moll@arm.com; mark.rutland@arm.com;
> ijc+devicetree@hellion.org.uk; galak@codeaurora.org; rob@landley.net;
> Michal Simek; grant.likely@linaro.org; gregkh@linuxfoundation.org;
> jason@lakedaemon.net; ezequiel.garcia@free-electrons.com;
> arnd@arndb.de; dwmw2@infradead.org; computersforpeace@gmail.com;
> artem.bityutskiy@linux.intel.com; jussi.kivilinna@iki.fi;
> acourbot@nvidia.com; ivan.khoronzhuk@ti.com; joern@logfs.org;
> devicetree@vger.kernel.org; linux-doc@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-mtd@lists.infradead.org; kpc528@gmail.com;
> kalluripunnaiahchoudary@gmail.com; Punnaiah Choudary Kalluri
> Subject: Re: [PATCH v6 1/2] Devicetree: Add pl353 smc controller devicetree
> binding information
> 
> Hey Punnaiah-
> 
> A few nitpicks here, in case you'll be spinning up a new version of your
> patchset.
> 
> On Mon, Apr 13, 2015 at 09:41:51PM +0530, Punnaiah Choudary Kalluri wrote:
> > Add pl353 static memory controller devicetree binding information.
> >
> > Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
> [..]
> > @@ -0,0 +1,37 @@
> > +Device tree bindings for ARM PL353 static memory controller
> > +
> > +PL353 static memory controller supports two kinds of memory
> > +interfaces. i.e NAND and SRAM/NOR interfaces.
> > +The actual devices are instantiated from the child nodes of pl353 smc
> node.
> > +
> > +Required properties:
> > +- compatible		: Should be "arm,pl353-smc-r2p1"
> > +- reg			: Controller registers map and length.
> > +- clock-names		: List of input clock names - "memclk", "aclk"
> > +			  (See clock bindings for details).
> > +- clocks		: Clock phandles (see clock bindings for details).
> 
> Technically not clock phandles, but clock specifiers.
> 
> > +- address-cells	: Address cells, must be 1.
> > +- size-cells		: Size cells. Must be 1.
> 
> These should have the leading '#' as in '#address-cells' and
> '#size-cells'.

Thanks for the review. I will take care of them new version

Regards,
Punnaiah
> 
>   Josh
