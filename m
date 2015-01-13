From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH v2] net: fec: fix MDIO bus assignement for dual fec SoC's
Date: Tue, 13 Jan 2015 19:42:55 +0800
Message-ID: <20150113114253.GC19355@dragon>
References: <1420812103-5865-1-git-send-email-stefan@agner.ch>
 <BLUPR03MB373862B10A8C60BCB113B70F5430@BLUPR03MB373.namprd03.prod.outlook.com>
 <c9a7077c1f800f5a56ef53cd721e73f6@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c9a7077c1f800f5a56ef53cd721e73f6@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: fugang.duan@freescale.com, davem@davemloft.net, u.kleine-koenig@pengutronix.de, mark.rutland@arm.com, robh+dt@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, "LW@KARO-electronics.de" <LW@karo-electronics.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 12, 2015 at 09:47:44AM +0100, Stefan Agner wrote:
> On 2015-01-12 03:45, fugang.duan@freescale.com wrote:
> > In additional, it is better to split the patch to two part with dts
> > and driver part.
> 
> Hm, this would mandate to have the device tree with the MDIO/phy-handle
> changes merged before the net changes to maintain bisect-ability.
> 
> @Dave/Shawn, what do you prefer?

I'm fine with dts change in the driver patch, if we have a good reason
for doing that.

Shawn
