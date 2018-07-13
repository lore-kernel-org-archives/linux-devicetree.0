From: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH 1/2] dt-bindings: pfuze100: add optional pfuze-disable-sw
 binding
Date: Fri, 13 Jul 2018 09:58:32 +0200
Message-ID: <20180713075832.5ncb2yvqn4z6mvqy@pengutronix.de>
References: <20180712110240.3006-1-m.felsch@pengutronix.de>
 <20180712110240.3006-2-m.felsch@pengutronix.de>
 <CAOMZO5Cx-ooNJ8hseTYBvBvWx6mMX0jOsFTmRxC1yogXk0ZZuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOMZO5Cx-ooNJ8hseTYBvBvWx6mMX0jOsFTmRxC1yogXk0ZZuA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Fabio Estevam <fabio.estevam@nxp.com>, Yongcai Huang <Anson.Huang@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Fabio,

On 18-07-12 12:19, Fabio Estevam wrote:
> On Thu, Jul 12, 2018 at 8:02 AM, Marco Felsch <m.felsch@pengutronix.de> wrote:
> 
> > +Optional properties:
> > +- pfuze-disable-sw: Disable all unused switch regulators to save power
> > +  consumption. Attention, some platforms are using the switch regulators as DDR
> > +  ref or supply voltage. Mark these regulators as "regulator-always-on" to skip
> > +  disabling these regulators. If not specified, the driver simualtes the
> 
> s/simualtes/simulates/
> 
> Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>

Thanks for the feedback, I'll fix it in v2.

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
