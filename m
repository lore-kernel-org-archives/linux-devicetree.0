From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 2/8] dt-bindings: net: Add a YAML schemas for the generic
 PHY options
Date: Fri, 24 May 2019 13:06:49 +0200
Message-ID: <20190524110649.56o7g7xkgdb5loyk@flea>
References: <74d98cc3c744d53710c841381efd41cf5f15e656.1558605170.git-series.maxime.ripard@bootlin.com>
 <aa5ec90854429c2d9e2c565604243e1b10cfd94b.1558605170.git-series.maxime.ripard@bootlin.com>
 <CAL_JsqJvgUAmON5Vew-mnwkFjNuRkx_f7quiy_7Rv_55JpzOOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJvgUAmON5Vew-mnwkFjNuRkx_f7quiy_7Rv_55JpzOOA@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, "David S . Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, netdev <netdev@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Maxime Chevallier <maxime.chevallier@bootlin.com>, Antoine =?utf-8?Q?T=C3=A9nart?= <antoine.tenart@bootlin.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Thu, May 23, 2019 at 09:44:51AM -0500, Rob Herring wrote:
> > +  reg:
> > +    maxItems: 1
> > +    minimum: 0
> > +    maximum: 31
>
> min/max need to be under 'items'. I don't think these would ever be
> valid if the type is an array.
>
> I've modified the meta-schema to catch this.

Have you pushed it already?

Using:
  reg:
    maxItems: 1
    items:
      minimum: 0
      maximum: 31

is creating this error when running dtbs_check

ethernet-phy.yaml: properties:reg: {'maxItems': 1, 'items': {'minimum': 0, 'maximum': 31}, 'description': 'The ID number for the PHY.'} is not valid under any of the given schemas

Maxime
