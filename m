From: Stephen Boyd <stephen.boyd@linaro.org>
Subject: Re: [PATCH 2/3] usb: chipidea: Hook into mux framework to toggle usb switch
Date: Thu, 13 Jul 2017 15:29:43 -0700
Message-ID: <149998498328.4532.10720468535933872401@sboyd-linaro>
References: <20170712010255.26855-1-stephen.boyd@linaro.org>
 <20170712010255.26855-3-stephen.boyd@linaro.org>
 <2db7bc39-9274-6007-d971-59e2a577d437@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2db7bc39-9274-6007-d971-59e2a577d437@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Chen <Peter.Chen@nxp.com>, Peter Rosin <peda@axentia.se>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>, Andy Gross <andy.gross@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

Quoting Peter Rosin (2017-07-11 23:45:24)
> On 2017-07-12 03:02, Stephen Boyd wrote:
> > @@ -102,4 +107,7 @@ Example:
> >               rx-burst-size-dword =3D <0x10>;
> >               extcon =3D <0>, <&usb_id>;
> >               phy-clkgate-delay-us =3D <400>;
> > +             mux-controls =3D <&usb_switch>;
> > +             mux-control-names =3D "usb_switch";
> > +             usb-switch-states =3D <0>, <1>;
> =

> I don't see the need for usb-switch-states? Just assume states 0/1 and
> if someone later needs some other states, make them add a property that
> overrides the defaults. Just document that 0 is host and 1 is device.
> =


Fine by me. Rob H do you agree?

> > diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
> > index 18cb8e46262d..9fd23ecc2da3 100644
> > --- a/drivers/usb/chipidea/host.c
> > +++ b/drivers/usb/chipidea/host.c
> > @@ -25,6 +25,7 @@
> >  #include <linux/usb/hcd.h>
> >  #include <linux/usb/chipidea.h>
> >  #include <linux/regulator/consumer.h>
> > +#include <linux/mux/consumer.h>
> >  =

> >  #include "../host/ehci.h"
> >  =

> > @@ -123,6 +124,13 @@ static int host_start(struct ci_hdrc *ci)
> >       if (usb_disabled())
> >               return -ENODEV;
> >  =

> > +     if (!IS_ERR(ci->platdata->usb_switch.mux)) {
> > +             ret =3D mux_control_select(ci->platdata->usb_switch.mux,
> > +                                      ci->platdata->usb_switch.host);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> =

> You *must* call mux_control_deselect to clean up if there is a failure
> later in host_start. Is that handled in some non-obvious way?

Good catch. Thanks. I'll add in the unwinding on the error path.
