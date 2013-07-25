From: Robin Gong <b38343@freescale.com>
Subject: Re: [PATCH v5] regulator: pfuze100: add pfuze100 regulator driver
Date: Thu, 25 Jul 2013 16:58:10 +0800
Message-ID: <20130725085809.GA10765@Robin-OptiPlex-780>
References: <1374723198-9716-1-git-send-email-b38343@freescale.com>
 <20130725084042.GA19368@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130725084042.GA19368@S2101-09.ap.freescale.net>
Sender: linux-doc-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: broonie@kernel.org, grant.likely@linaro.org, rob.herring@calxeda.com, rob@landley.net, lgirdwood@gmail.com, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, s.trumtrar@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Thu, Jul 25, 2013 at 04:40:44PM +0800, Shawn Guo wrote:
> On Thu, Jul 25, 2013 at 11:33:18AM +0800, Robin Gong wrote:
> > @@ -0,0 +1,113 @@
> > +PFUZE100 family of regulators
> > +
> > +Required properties:
> > +- compatible: "fsl,pfuze100"
> > +- reg: I2C slave address
> > +- regulators: This is the list of child nodes that specify the regulator
> > +  initialization data for defined regulators. Please refer to below doc
> > +  Documentation/devicetree/bindings/regulator/regulator.txt.
> 
> I had the comment on v4 patch.  The "regulators" should not be
> documented as a property but a sub-node, because it's not a property
> but sub-node.
>
Shawn, I notice there are the same descriptions in the many docs of regulator
drivers, can we consider the 'regulators' child node as one of special property
? Sorry for missing the information in the last mail.. 
> Shawn

