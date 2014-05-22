From: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: Re: [RFC/PATCH] of: platform: Remove unique device name enforcement
Date: Thu, 22 May 2014 12:57:06 -0300
Message-ID: <20140522155706.GB1785@arch.cereza>
References: <1400432516-6802-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <CAL_JsqJKDFJDsGbhB-=W=ujgoRpnJGcJ9a74uhHjj4KFvRK=gg@mail.gmail.com>
 <20140520065014.493C3C412E3@trevor.secretlab.ca>
 <CAL_JsqJHhJ1ba5tOGnsNNp1DhPwnJWh8F9f2xL8b3FYj=kC1hA@mail.gmail.com>
 <20140521005357.4CAE4C418EF@trevor.secretlab.ca>
 <20140521074353.C8B79C4198A@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140521074353.C8B79C4198A-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Guido =?iso-8859-1?Q?Mart=EDnez?= <guido-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 21 May 04:43 PM, Grant Likely wrote:
[..]
> 
> Yet another approach. How about this patch? If the unit address cannot
> be translated, then append the translated name of the parent.
> 
[..]
> 
> commit 177e5ff131639c8568248e5b9b2380066ce305d6
> Author: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Date:   Wed May 21 15:40:31 2014 +0900
> 
>     of: Ensure unique names without sacrificing determinism
>     
>     The way the driver core is implemented, every device using the same bus
>     type is required to have a unique name because a symlink to each device
>     is created in the appropriate /sys/bus/*/devices directory, and two
>     identical names causes a collision.
>     
>     The current code handles the requirement by using an globally
>     incremented counter that is appended to the device name. It works, but
>     it means any change to device registration will change the assigned
>     numbers. Instead, if we build up the name by using information from the
>     parent nodes, then it can be guaranteed to be unique without adding a
>     random number to the end of it.
>     
>     Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 

This solves the issue I complained about. Now the names of the devices match
the name of nodes, so the system knows what names to expect.

Before:

$ ls /sys/devices/
44e10800.pinmux   gpio-keys.8       pmu.0             system
ARMv7 Cortex-A8   hdmi.5            rotary-encoder.9  userhelper.10
backlight.6       ocp.3             soc.1             virtual
breakpoint        panel.7           soc0
fixedregulator.4  platform          software

After:

$ ls /sys/devices/
44e10800.pinmux   gpio-keys         pmu               system
ARMv7 Cortex-A8   hdmi              rotary-encoder    userhelper
backlight         ocp               soc               virtual
breakpoint        panel             soc0
fixedregulator@0  platform          software

Tested-by: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>

It would be great if this patch could be merged.

Thanks a lot Grant,
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
