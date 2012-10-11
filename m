From: "Philip, Avinash" <avinashphilip@ti.com>
Subject: RE: [PATCH v3] pwm_backlight: Add device tree support for Low
 Threshold Brightness
Date: Thu, 11 Oct 2012 08:32:21 +0000
Message-ID: <518397C60809E147AF5323E0420B992E3E9CB92A@DBDE01.ent.ti.com>
References: <1348670827-5720-1-git-send-email-avinashphilip@ti.com>
 <20120927143309.02614908.akpm@linux-foundation.org>
 <20120928054548.GB10237@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20120928054548.GB10237@avionic-0098.mockup.avionic-design.de>
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Thierry Reding <thierry.reding@avionic-design.de>
Cc: "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "rob@landley.net" <rob@landley.net>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Nori, Sekhar" <nsekhar@ti.com>, "Hebbar, Gururaja" <gururaja.hebbar@ti.com>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 28, 2012 at 11:15:48, Thierry Reding wrote:
> On Thu, Sep 27, 2012 at 02:33:09PM -0700, Andrew Morton wrote:
> > On Wed, 26 Sep 2012 20:17:07 +0530
> > "Philip, Avinash" <avinashphilip@ti.com> wrote:
> > 
> > > Some back lights perform poorly when driven by a PWM with a short
> > > duty-cycle. For such devices, the low threshold can be used to specify a
> > > lower bound for the duty-cycle and should be chosen to exclude the
> > > problematic range.
> > > 
> > > Add device tree probing support for lth_brightness putting
> > > low-threshold-brightness as optional property.
> > > 
> > > ...
> > >
> > > --- a/Documentation/devicetree/bindings/video/backlight/pwm-backlight.txt
> > > +++ b/Documentation/devicetree/bindings/video/backlight/pwm-backlight.txt
> > > @@ -14,6 +14,15 @@ Required properties:
> > >  Optional properties:
> > >    - pwm-names: a list of names for the PWM devices specified in the
> > >                 "pwms" property (see PWM binding[0])
> > > +  - low-threshold-brightness: brightness threshold low level. Low threshold
> > > +    brightness set to value so that backlight present on low end of
> > > +    brightness.
> > > +    Some panels, backlight would absent if duty percentage of PWM wave is less
> > > +    than certain level (say 20%). By setting low-threshold-brightness to a
> > > +    value above (percentage of brightness-levels max) 50 (20% of 255, if 255
> > > +    is max). On setting low-threshold-brightness, range of brightness-levels
> > > +    is calculated in a region of low-threshold-brightness to brightness-levels
> > > +    max.
> > 
> > hoo boy, that's hard to follow.  How does this look?
> > 
> > --- a/Documentation/devicetree/bindings/video/backlight/pwm-backlight.txt~pwm_backlight-add-device-tree-support-for-low-threshold-brightness-fix
> > +++ a/Documentation/devicetree/bindings/video/backlight/pwm-backlight.txt
> > @@ -14,15 +14,15 @@ Required properties:
> >  Optional properties:
> >    - pwm-names: a list of names for the PWM devices specified in the
> >                 "pwms" property (see PWM binding[0])
> > -  - low-threshold-brightness: brightness threshold low level. Low threshold
> > -    brightness set to value so that backlight present on low end of
> > -    brightness.
> > -    Some panels, backlight would absent if duty percentage of PWM wave is less
> > -    than certain level (say 20%). By setting low-threshold-brightness to a
> > -    value above (percentage of brightness-levels max) 50 (20% of 255, if 255
> > -    is max). On setting low-threshold-brightness, range of brightness-levels
> > -    is calculated in a region of low-threshold-brightness to brightness-levels
> > -    max.
> > +  - low-threshold-brightness: brightness threshold low level. Sets the lowest
> > +    brightness value.
> > +    On some panels the backlight misbehaves if the duty cycle percentage of the
> > +    PWM wave is less than a certain level (say 20%).  In this example the user
> > +    can set low-threshold-brightness to a value above 50 (ie, 20% of 255), thus
> > +    preventing the PWM duty cycle from going too low.
> > +    On setting low-threshold-brightness the range of brightness levels is
> > +    calculated in the range low-threshold-brightness to the maximum value in
> > +    brightness-levels, described above.
> >  
> >  [0]: Documentation/devicetree/bindings/pwm/pwm.txt
> >  
> > 
> > 
> > Also, I'm wondering if we really needed a new property - couldn't one
> > do this simply by setting brightness-levels to 50..255?
> 
> Yes. This was discussed in the thread that followed the posting of this
> patch's v2. We've decided to drop it and go with brightness-levels only
> for device tree data. Eventually all existing users should convert to
> that as well so we can remove some of the cruft from the platform data
> up.

Andrew/Thierry,

It was decided that patch as dropped and still see it in linux-next.
http://git.kernel.org/?p=linux/kernel/git/next/linux-next.git;a=commit;h=1801ff7f87131190b0a469c26bd7c829601e198c

Thanks
Avinash

> 
> Thierry
> 

