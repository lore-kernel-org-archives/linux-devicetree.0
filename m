From: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v2 1/3] dt-bindings: pfuze100: add optional disable
 switch-regulators binding
Date: Mon, 16 Jul 2018 09:25:16 +0200
Message-ID: <20180716072516.bvsp54yoeqp3ih6s@pengutronix.de>
References: <20180713125002.24331-1-m.felsch@pengutronix.de>
 <20180713125002.24331-2-m.felsch@pengutronix.de>
 <20180713150314.GD16228@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180713150314.GD16228@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, fabio.estevam@nxp.com, Anson.Huang@nxp.com, kernel@pengutronix.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Mark,

thanks for the review.

On 18-07-13 16:03, Mark Brown wrote:
> On Fri, Jul 13, 2018 at 02:50:01PM +0200, Marco Felsch wrote:
> 
> > +Optional properties:
> > +- fsl,pfuze-support-disable: Boolean, if present disable all unused switch
> > +  regulators to save power consumption. Attention, till 4.18 these regulators
> 
> The property name sounds like it affects all the regulators but really
> it's just the sw ones - how about adding -sw at the end?  Bit of a
> bikeshed but it does end up in an ABI.

You're right, it sounds better. So the new binding will be
fsl,pfuze-support-disable-sw. Are there any other comments about the
implementation?

Regards,
Marco
