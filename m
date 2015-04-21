From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] thermal: allow creating hwmon for thermal zones on OF systems
Date: Tue, 21 Apr 2015 18:13:12 -0500
Message-ID: <CAL_Jsq+bvwnZMHfgxUVvCL05kBQP4VMQ_0NVQcD2XxZ86th46w@mail.gmail.com>
References: <20150420222131.GA6077@dtor-ws> <CAL_Jsq+k4w_=eypwO_wot8BNboeG23CGe4SakNFjnecu+6NcRQ@mail.gmail.com>
 <20150421210101.GA23820@dtor-glaptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150421210101.GA23820@dtor-glaptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Zhang Rui <rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 21, 2015 at 4:01 PM, Dmitry Torokhov
<dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, Apr 21, 2015 at 03:17:03PM -0500, Rob Herring wrote:
>> On Mon, Apr 20, 2015 at 5:21 PM, Dmitry Torokhov
>> <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> > Current implementation forcibly suppresses creation of hwmon instances
>> > for thermal zones defined in device tree data. Let's add a new property,
>> > "linux,hwmon" to allow marking certain thermal zones as needing generic
>> > hwmon interface.
>>
>> What is the decision process for deciding to add this property or not?
>
> A platform may have dedicated hwmon device/driver already covering the thermal
> sensor responsible for this thermal zone, in which case another hwmon instance
> is not needed. If there isn't such driver then we may want to create standard
> hwmon instance so that userspace tools can use standard interface to access the
> readings.

This sounds similar to the general problem we have of how to have 2
drivers where one is preferred over another. Say a h/w block has 2
compatible strings (one being a generic string perhaps) and different
drivers for each compatible string.

The DT can't really know what drivers the kernel may or may not have,
so I don't think the DT is the right place for this. You could have a
compatible match list for hardware that doesn't have a driver and you
want to use the standard/generic driver. That doesn't really solve the
above problem, but does allow you to statically decide. Would
something like that work for you?

> Board code has hooks to support both options, but in case of DT we don't (hence
> this patch).

Yes, but that doesn't mean it gets moved to DT necessarily.

Rob

>
>>
>>
>> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> > ---
>> >  Documentation/devicetree/bindings/thermal/thermal.txt | 4 ++++
>> >  drivers/thermal/of-thermal.c                          | 7 +++++--
>> >  2 files changed, 9 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/Documentation/devicetree/bindings/thermal/thermal.txt b/Documentation/devicetree/bindings/thermal/thermal.txt
>> > index 8a49362..0106f8f 100644
>> > --- a/Documentation/devicetree/bindings/thermal/thermal.txt
>> > +++ b/Documentation/devicetree/bindings/thermal/thermal.txt
>> > @@ -174,6 +174,10 @@ Optional property:
>> >                         2000mW, while on a 10'' tablet is around
>> >                         4500mW.
>> >
>> > +- linux,hwmon:         A boolean property that instructs Linux thermal core
>> > +                       to create an instance of hwmon device representing
>> > +                       this thermal zone.
>> > +
>> >  Note: The delay properties are bound to the maximum dT/dt (temperature
>> >  derivative over time) in two situations for a thermal zone:
>> >  (i)  - when passive cooling is activated (polling-delay-passive); and
>> > diff --git a/drivers/thermal/of-thermal.c b/drivers/thermal/of-thermal.c
>> > index 9e8c614..7b7a70c 100644
>> > --- a/drivers/thermal/of-thermal.c
>> > +++ b/drivers/thermal/of-thermal.c
>> > @@ -891,8 +891,11 @@ int __init of_parse_thermal_zones(void)
>> >                         goto exit_free;
>> >                 }
>> >
>> > -               /* No hwmon because there might be hwmon drivers registering */
>> > -               tzp->no_hwmon = true;
>> > +               /*
>> > +                * Do not attach hwmon device unless explicitly requested,
>> > +                * since there might be dedicated hwmon drivers registering.
>> > +                */
>> > +               tzp->no_hwmon = !of_property_read_bool(child, "linux,hwmon");
>> >
>> >                 if (!of_property_read_u32(child, "sustainable-power", &prop))
>> >                         tzp->sustainable_power = prop;
>> > --
>> > 2.2.0.rc0.207.ga3a616c
>> >
>> >
>> > --
>> > Dmitry
>
> --
> Dmitry
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
