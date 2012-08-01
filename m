From: "Philip, Avinash" <avinashphilip@ti.com>
Subject: RE: [PATCH] pwm_backlight: Add device tree support for Low
 Threshold Brightness
Date: Wed, 1 Aug 2012 06:51:21 +0000
Message-ID: <518397C60809E147AF5323E0420B992E3E97C4C9@DBDE01.ent.ti.com>
References: <1343219042-4371-1-git-send-email-avinashphilip@ti.com>
 <20120730065805.GB15245@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120730065805.GB15245@avionic-0098.mockup.avionic-design.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "rob@landley.net" <rob@landley.net>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Nori, Sekhar" <nsekhar@ti.com>, "Hebbar, Gururaja" <gururaja.hebbar@ti.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 30, 2012 at 12:28:05, Thierry Reding wrote:
> On Wed, Jul 25, 2012 at 05:54:02PM +0530, Philip, Avinash wrote:
> > Low Threshold Brightness should be configured to have a linear relation
> > in brightness scale. This patch adds device tree support for low
> > threshold brightness as optional one for pwm_backlight.
> 
> I think this should be more explicit as to why this is required, perhaps
> something like this:
> 
> 	Some backlights perform poorly when driven by a PWM with a short
> 	duty-cycle. For such devices, the low threshold can be used to
> 	specify a lower bound for the duty-cycle and should be chosen to
> 	exclude the problematic range.
> 
> 	This patch adds support for an optional low-threshold-brightness
> 	property.

Ok I will correct it.

> 
> Perhaps a similar explanation should be given somewhere else instead of
> just the changelog. It took me some time to understand what exactly this
> low threshold means and I think it'd make sense to write this kind of
> information down somewhere. I'll see if I can make time to add a bit of
> documentation somewhere below Documentation/backlight perhaps.
> 
> > Signed-off-by: Philip, Avinash <avinashphilip@ti.com>
> > ---
> > :100644 100644 1e4fc72... 5c54380... M	Documentation/devicetree/bindings/video/backlight/pwm-backlight.txt
> > :100644 100644 995f016... 4965408... M	drivers/video/backlight/pwm_bl.c
> >  .../bindings/video/backlight/pwm-backlight.txt     |   21 ++++++++++++++++++++
> >  drivers/video/backlight/pwm_bl.c                   |    5 ++++
> >  2 files changed, 26 insertions(+), 0 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/video/backlight/pwm-backlight.txt b/Documentation/devicetree/bindings/video/backlight/pwm-backlight.txt
> > index 1e4fc72..5c54380 100644
> > --- a/Documentation/devicetree/bindings/video/backlight/pwm-backlight.txt
> > +++ b/Documentation/devicetree/bindings/video/backlight/pwm-backlight.txt
> > @@ -14,6 +14,8 @@ Required properties:
> >  Optional properties:
> >    - pwm-names: a list of names for the PWM devices specified in the
> >                 "pwms" property (see PWM binding[0])
> > +  - low_threshold_brightness: brightness threshold low level. (get linear
> > +		 scales in brightness in low end of brightness levels)
> 
> The convention is to use dashes, not underscores, in device tree
> property names, so this should be "low-threshold-brightness". I'd also
> omit the comment in parentheses because the DT binding document
> shouldn't specify any particular use-case. However I think it'd make
> sense to add some information about the number space of the low
> threshold value.

Ok, I will correct it.

> 
> Maybe we should also rethink how the low threshold is handled in cases
> where the brightness levels are used. I'm not sure it makes sense to
> specify the low threshold as a value relative to the range given by the
> levels. Perhaps it is more meaningful to specify it as relative to the
> period/duty-cycle.
> 
> >  
> >  [0]: Documentation/devicetree/bindings/pwm/pwm.txt
> >  
> > @@ -26,3 +28,22 @@ Example:
> >  		brightness-levels = <0 4 8 16 32 64 128 255>;
> >  		default-brightness-level = <6>;
> >  	};
> > +
> > +Example for brightness_threshold_level:
> > +
> > +	backlight {
> > +		compatible	= "pwm-backlight";
> > +		pwms = <&pwm 0 50000>;
> > +
> > +		brightness-levels = <0 4 8 16 32 64 128 255>;
> > +		default-brightness-level = <6>;
> > +		low_threshold_brightness = <50>;
> > +	};
> > +};
> 
> I think you can just merge the low-threshold-brightness with the
> previous example.

Ok I will check and correct it.

> 
> > +Note:
> > +Low threshold support is required to have linear brightness scale from
> > +0 to max. For some panels, backlight absent on low end of brightness
> > +scale. So support for Low Threshold been required. So that the scale of
> > +brightness changed from Low Threshold to Max in scales defined in
> > +brightness-levels. In this example 20% maximum brightness scale should
> > +be required to turn on panel backlight.
> 
> I think this kind of documentation doesn't belong in the device tree
> binding. I'll work something like that into the proper documentation.
> 
> > diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
> > index 995f016..4965408 100644
> > --- a/drivers/video/backlight/pwm_bl.c
> > +++ b/drivers/video/backlight/pwm_bl.c
> > @@ -143,6 +143,11 @@ static int pwm_backlight_parse_dt(struct device *dev,
> >  
> >  		data->dft_brightness = value;
> >  		data->max_brightness--;
> > +
> > +		ret = of_property_read_u32(node, "low_threshold_brightness",
> > +					   &value);
> > +		if (!ret)
> > +			data->lth_brightness = value;
> >  	}
> 
> This obviously should also be low-threshold-brightness.

I will change to

ret = of_property_read_u32(node, " low-threshold-brightness ",

Thanks
Avinash

> 
> Thierry
> 
