From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] thermal: allow creating hwmon for thermal zones on OF
 systems
Date: Tue, 21 Apr 2015 14:01:01 -0700
Message-ID: <20150421210101.GA23820@dtor-glaptop>
References: <20150420222131.GA6077@dtor-ws>
 <CAL_Jsq+k4w_=eypwO_wot8BNboeG23CGe4SakNFjnecu+6NcRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+k4w_=eypwO_wot8BNboeG23CGe4SakNFjnecu+6NcRQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 21, 2015 at 03:17:03PM -0500, Rob Herring wrote:
> On Mon, Apr 20, 2015 at 5:21 PM, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> > Current implementation forcibly suppresses creation of hwmon instances
> > for thermal zones defined in device tree data. Let's add a new property,
> > "linux,hwmon" to allow marking certain thermal zones as needing generic
> > hwmon interface.
> 
> What is the decision process for deciding to add this property or not?

A platform may have dedicated hwmon device/driver already covering the thermal
sensor responsible for this thermal zone, in which case another hwmon instance
is not needed. If there isn't such driver then we may want to create standard
hwmon instance so that userspace tools can use standard interface to access the
readings.

Board code has hooks to support both options, but in case of DT we don't (hence
this patch).

> 
> 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/thermal/thermal.txt | 4 ++++
> >  drivers/thermal/of-thermal.c                          | 7 +++++--
> >  2 files changed, 9 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/thermal/thermal.txt b/Documentation/devicetree/bindings/thermal/thermal.txt
> > index 8a49362..0106f8f 100644
> > --- a/Documentation/devicetree/bindings/thermal/thermal.txt
> > +++ b/Documentation/devicetree/bindings/thermal/thermal.txt
> > @@ -174,6 +174,10 @@ Optional property:
> >                         2000mW, while on a 10'' tablet is around
> >                         4500mW.
> >
> > +- linux,hwmon:         A boolean property that instructs Linux thermal core
> > +                       to create an instance of hwmon device representing
> > +                       this thermal zone.
> > +
> >  Note: The delay properties are bound to the maximum dT/dt (temperature
> >  derivative over time) in two situations for a thermal zone:
> >  (i)  - when passive cooling is activated (polling-delay-passive); and
> > diff --git a/drivers/thermal/of-thermal.c b/drivers/thermal/of-thermal.c
> > index 9e8c614..7b7a70c 100644
> > --- a/drivers/thermal/of-thermal.c
> > +++ b/drivers/thermal/of-thermal.c
> > @@ -891,8 +891,11 @@ int __init of_parse_thermal_zones(void)
> >                         goto exit_free;
> >                 }
> >
> > -               /* No hwmon because there might be hwmon drivers registering */
> > -               tzp->no_hwmon = true;
> > +               /*
> > +                * Do not attach hwmon device unless explicitly requested,
> > +                * since there might be dedicated hwmon drivers registering.
> > +                */
> > +               tzp->no_hwmon = !of_property_read_bool(child, "linux,hwmon");
> >
> >                 if (!of_property_read_u32(child, "sustainable-power", &prop))
> >                         tzp->sustainable_power = prop;
> > --
> > 2.2.0.rc0.207.ga3a616c
> >
> >
> > --
> > Dmitry

-- 
Dmitry
