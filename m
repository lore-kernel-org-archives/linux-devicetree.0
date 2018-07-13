From: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH 1/2] dt-bindings: pfuze100: add optional pfuze-disable-sw
 binding
Date: Fri, 13 Jul 2018 10:30:39 +0200
Message-ID: <20180713083039.4z3ulwtg2ekx5n23@pengutronix.de>
References: <20180712110240.3006-1-m.felsch@pengutronix.de>
 <20180712110240.3006-2-m.felsch@pengutronix.de>
 <20180712153121.GF10369@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180712153121.GF10369@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, fabio.estevam@nxp.com, Anson.Huang@nxp.com, kernel@pengutronix.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Mark,

On 18-07-12 16:31, Mark Brown wrote:
> On Thu, Jul 12, 2018 at 01:02:39PM +0200, Marco Felsch wrote:
> 
> > +Optional properties:
> > +- pfuze-disable-sw: Disable all unused switch regulators to save power
> > +  consumption. Attention, some platforms are using the switch regulators as DDR
> > +  ref or supply voltage. Mark these regulators as "regulator-always-on" to skip
> > +  disabling these regulators. If not specified, the driver simualtes the
> > +  disabling. This means the state of the regulator is set to 'disabled' but the
> > +  driver don't disable the regulator.
> 
> This is a bit of a confused way of specifying things that depends on the
> Linux implementation, and the property sounds like a double negative
> too.  I'd say something like "pfuze-support-disable" and then explicitly
> say that this is a workaround for backwards compatibility.

I can't find the double negative. Anyway your binding sounds better. So
I will use yours. Should we add a vendor prefix too to be clear? I will
also add some more informations to mark it as workaround.

> I'd also recommend changing the implementation patch to just register a
> different version of the desc and ops that just doesn't have the disable
> operation so that the framework knows what's going on.  While the
> current implementation works now there's the possibility that at some
> point in the future we might start relying on the disable actually
> having taken effect somehow and will get confused.  There's some
> existing drivers that optimize their resume paths if they know power
> wasn't removed.

Okay I will change that too. I didn't know that there are drivers with
optimized resume paths.

Thanks for your feedback.

Regards,
Marco
