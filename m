From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
Subject: Re: [PATCH v4 6/9] dt-bindings: display: hdmi-connector: Add DDC
 power supply
Date: Fri, 26 Apr 2019 21:20:31 +0200
Message-ID: <20190426192031.wtoaxctjo2qxxquq@core.my.home>
References: <20190413165418.27880-1-megous@megous.com>
 <20190413165418.27880-7-megous@megous.com>
 <20190426182337.GA22245@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190426182337.GA22245@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-sunxi@googlegroups.com, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Apr 26, 2019 at 01:23:37PM -0500, Rob Herring wrote:
> On Sat, Apr 13, 2019 at 06:54:15PM +0200, megous@megous.com wrote:
> > From: Ondrej Jirman <megous@megous.com>
> > 
> > Some Allwinner SoC using boards (Orange Pi 3 for example) need to enable
> > on-board voltage shifting logic for the DDC bus to be usable. Use
> > ddc-supply on the hdmi-connector to model this.
> > 
> > Add binding documentation for optional ddc-supply property.
> > 
> > Signed-off-by: Ondrej Jirman <megous@megous.com>
> > ---
> >  .../devicetree/bindings/display/connector/hdmi-connector.txt     | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/connector/hdmi-connector.txt b/Documentation/devicetree/bindings/display/connector/hdmi-connector.txt
> > index 508aee461e0d..33085aeb0bb9 100644
> > --- a/Documentation/devicetree/bindings/display/connector/hdmi-connector.txt
> > +++ b/Documentation/devicetree/bindings/display/connector/hdmi-connector.txt
> > @@ -9,6 +9,7 @@ Optional properties:
> >  - label: a symbolic name for the connector
> >  - hpd-gpios: HPD GPIO number
> >  - ddc-i2c-bus: phandle link to the I2C controller used for DDC EDID probing
> > +- ddc-supply: the power supply for the DDC bus
> 
> It's not just for DDC. It powers the chips in bridge dongles for 
> example. Pretty much every diagram I find just calls it 5V or +5V.
> 
> So how about '5V-supply' or 'v5V-supply'?

Just to be sure, the schematic that inspired this change looks like this:

https://megous.com/dl/tmp/33b2971de6943e9d.png

HDMI-5V is always on, and what is really being enabled here are mosfets
connected to DDC_CEC_EN and not the HDMI-5V power supply. So in this case it
really is just for DDC. It is conceivable that some boards may need both to
enable 5V for HDMI circuitry and some separate power shifting logic for
DDC bus.

So if I renamed this, the DTS would not describe the real HW very well
on Orange Pi 3.

thank you and regards,
	Ondrej

> Rob
