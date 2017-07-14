From: Stephen Boyd <stephen.boyd@linaro.org>
Subject: Re: [PATCH 0/3] USB Mux support for Chipidea
Date: Fri, 14 Jul 2017 14:27:09 -0700
Message-ID: <150006762899.13439.5431012472808314482@sboyd-linaro>
References: <20170712010255.26855-1-stephen.boyd@linaro.org>
 <fc1f2836-cd9b-0905-21fc-d2d3029d1f52@axentia.se>
 <149998530228.4532.1798948469358915658@sboyd-linaro>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <149998530228.4532.1798948469358915658@sboyd-linaro>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Peter Chen <Peter.Chen@nxp.com>, Peter Rosin <peda@axentia.se>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

Quoting Stephen Boyd (2017-07-13 15:35:02)
> Quoting Peter Rosin (2017-07-11 22:04:46)
> > =

> > Maybe no need for a compatible update either, if it works to do somethi=
ng
> > like this in the DT?
> > =

> >         usb_switch: usb-switch {
> >                 compatible =3D "gpio-mux";
> >                 mux-gpios =3D <&pm8916_gpios 4 GPIO_ACTIVE_HIGH>,
> >                             <&pm8916_gpios XXX GPIO_ACTIVE_XXX>;
> >                 idle-state =3D <2>;
> >                 #mux-control-cells =3D <0>;
> >                 pinctrl-names =3D "default";
> >                 pinctrl-0 =3D <&usb_sw_sel_pm>;
> >         };
> > =

> > But I obviously know little about how things are wired and really works,
> > so that might be totally off...
> > =

> > Otherwise, maybe a generic mux-pinctrl driver would do the trick?
> > (compare with drivers/i2c/muxes/i2c-mux-pinctrl.c)
> > =

> =

> Agreed.

Testing looks good when I use the gpio-mux binding. The only thing I
noticed is that gpio-mux driver is requesting the gpio with
GPIOD_OUT_LOW. Is that intentional? I worry that may randomly mux the
D+/D- lines during probe if the gpio is asserted at probe time. It isn't
a problem for me right now, because the mux is power on defaulted to
have the gpio deasserted, but it may be a problem if the default
changes.
