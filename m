From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [PATCH 3/3] ARM: dts: imx7: add Toradex Colibri iMX7S/iMX7D
 support
Date: Thu, 16 Jun 2016 10:44:18 +0000
Message-ID: <1466073856.3884.11.camel@toradex.com>
References: <20160608023709.32090-1-stefan@agner.ch>
 <20160608023709.32090-4-stefan@agner.ch> <20160612023100.GW20243@tiger>
 <59f88a185c67034087f3eabf88da6c8c@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <59f88a185c67034087f3eabf88da6c8c@agner.ch>
Content-Language: en-US
Content-ID: <C05D0495056C324DBE655C76E57CD784@eurprd05.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "stefan@agner.ch" <stefan@agner.ch>, "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Max Krummenacher <max.krummenacher@toradex.com>, "galak@codeaurora.org" <galak@codeaurora.org>, "fabio.estevam@nxp.com" <fabio.estevam@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Sali Stefan

On Wed, 2016-06-15 at 22:37 -0700, Stefan Agner wrote:
> On 2016-06-11 19:31, Shawn Guo wrote:
> > 
> > On Tue, Jun 07, 2016 at 07:37:09PM -0700, Stefan Agner wrote:
> > > 
> > <snip>
> > > 
> > > +/ {
> > > +	model = "Toradex Colibri iMX7D on Colibri Evaluation
> > > Board V3";
> > > +	compatible = "toradex,colibri_imx7d-eval",
> > > "toradex,colibri_imx7d", \
> > We always use hyphen than underscore in compatible string.
> We always used underscores, this goes back to the first Colibri
> specific
> device tree: tegra20-iris-512.dts.
> 
> I would rather prefer to not change this for the sake of
> consistency...
> What do you think?

I have been there before when submitting a first Apalis TK1 version:

https://lkml.org/lkml/2016/5/16/288

Upon Rob Herring's suggestion I changed it now all to dashes:

https://lkml.org/lkml/2016/5/27/399

Even in our downstream U-Boot:

http://git.toradex.com/cgit/u-boot-toradex.git/commit/?h=2015.04-torade
x-next&id=4ae2e657f3350422ad81b1632de156bdd9517206

Of course for Colibri iMX7 one could argue that we already sold a
couple hundred pieces still using underscores. However I guess we could
still change to dashes now as those were all prototype, sample and/or
beta.

Cheers

Marcel
