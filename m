From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/1] regulator: max8973: add support for junction thermal
 warning
Date: Wed, 6 Jan 2016 08:25:21 -0600
Message-ID: <20160106142521.GA11188@rob-hp-laptop>
References: <1452060922-24426-1-git-send-email-ldewangan@nvidia.com>
 <20160106121857.GW6588@sirena.org.uk>
 <568D064A.8080609@nvidia.com>
 <20160106123735.GX6588@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160106123735.GX6588@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 06, 2016 at 12:37:35PM +0000, Mark Brown wrote:
> On Wed, Jan 06, 2016 at 05:49:22PM +0530, Laxman Dewangan wrote:
> > On Wednesday 06 January 2016 05:48 PM, Mark Brown wrote:
> > >* PGP Signed by an unknown key
> 
> > >On Wed, Jan 06, 2016 at 11:45:22AM +0530, Laxman Dewangan wrote:
> 
> > >>  Enhanced transient response (ETR) will affect the configuration of CKADV.
> > >>+-maxim,junction-temp-warning: Junction temp warning on which device generates
> > >>+		warning interrupts.
> > >This needs to specify what the values are - it looks like it's raw
> > >register values but I'd have expected from this that it'd be an actual
> > >temperature.
> 
> > I tried to roundoff to the next higher threshold when supported value (120
> > or 140 degC) is not provided in driver. But it is fine to me to specify the
> > possible value setting here and DT binding doc. Will do on next patch.
> 
> I don't really mind which you use so long as the documentation is clear.

I prefer that degrees are used rather than register values.

Rob
