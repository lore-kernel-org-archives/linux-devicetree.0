Return-Path: <SRS0=8793=I5=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pl0-f68.google.com ([209.85.160.68]:40027 "EHLO
        mail-pl0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933584AbeFKRCT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 11 Jun 2018 13:02:19 -0400
Received: by mail-pl0-f68.google.com with SMTP id t12-v6so12661213plo.7
        for <devicetree@vger.kernel.org>; Mon, 11 Jun 2018 10:02:18 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Stephen Boyd <swboyd@chromium.org>
In-Reply-To: <CAE_wzQ-vWSZ3u6px5k5_RvTs2Wq8ArY1+oB967sXy=drssY74A@mail.gmail.com>
References: <20180531204250.209216-1-swboyd@chromium.org>
 <CAE_wzQ-vWSZ3u6px5k5_RvTs2Wq8ArY1+oB967sXy=drssY74A@mail.gmail.com>
Message-ID: <152873653693.35891.14371664796094418994@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] HID: i2c-hid: Add vddl regulator control
Date: Mon, 11 Jun 2018 10:02:16 -0700
Sender: devicetree-owner@vger.kernel.org
To: Dmitry Torokhov <dtor@chromium.org>
Cc: Jiri Kosina <jikos@kernel.org>, "open list:HID CORE LAYER" <linux-input@vger.kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Doug Anderson <dianders@chromium.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Quoting Dmitry Torokhov (2018-05-31 15:03:36)
> On Thu, May 31, 2018 at 1:42 PM, Stephen Boyd <swboyd@chromium.org> wrote:
> > Some wacom w9013 devices have a vddl supply for "low voltage"
> > requirements. Add support in this driver to turn on this low voltage
> > supply.
> >
> > Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > Cc: Hans de Goede <hdegoede@redhat.com>
> > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Cc: Dmitry Torokhov <dtor@chromium.org>
> > Cc: Doug Anderson <dianders@chromium.org>
> > Cc: <devicetree@vger.kernel.org>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >  .../bindings/input/hid-over-i2c.txt           |  3 ++-
> >  drivers/hid/i2c-hid/i2c-hid.c                 | 19 +++++++++++++++++++
> >  include/linux/platform_data/i2c-hid.h         |  2 ++
> >  3 files changed, 23 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/input/hid-over-i2c.txt b=
/Documentation/devicetree/bindings/input/hid-over-i2c.txt
> > index 4d3da9d91de4..89e6ab89ba38 100644
> > --- a/Documentation/devicetree/bindings/input/hid-over-i2c.txt
> > +++ b/Documentation/devicetree/bindings/input/hid-over-i2c.txt
> > @@ -26,7 +26,8 @@ device-specific compatible properties, which should b=
e used in addition to the
> >
> >  - compatible:
> >    * "wacom,w9013" (Wacom W9013 digitizer). Supports:
> > -    - vdd-supply
> > +    - vdd-supply (3.3V)
> > +    - vddl-supply (1.8V)
> >      - post-power-on-delay-ms
> >
> >  - vdd-supply: phandle of the regulator that provides the supply voltag=
e.
> > diff --git a/drivers/hid/i2c-hid/i2c-hid.c b/drivers/hid/i2c-hid/i2c-hi=
d.c
> > index 6e803f361249..b6f02f98fec6 100644
> > --- a/drivers/hid/i2c-hid/i2c-hid.c
> > +++ b/drivers/hid/i2c-hid/i2c-hid.c
> > @@ -1032,12 +1032,29 @@ static int i2c_hid_probe(struct i2c_client *cli=
ent,
> >                 goto err;
> >         }
> >
> > +       ihid->pdata.supply_l =3D devm_regulator_get(&client->dev, "vddl=
");
> > +       if (IS_ERR(ihid->pdata.supply_l)) {
> > +               ret =3D PTR_ERR(ihid->pdata.supply_l);
> > +               if (ret !=3D -EPROBE_DEFER)
> > +                       dev_err(&client->dev, "Failed to get regulator:=
 %d\n",
> > +                               ret);
> > +               goto err;
> > +       }
> > +
> >         ret =3D regulator_enable(ihid->pdata.supply);
> >         if (ret < 0) {
> >                 dev_err(&client->dev, "Failed to enable regulator: %d\n=
",
> >                         ret);
> >                 goto err;
> >         }
> > +
> > +       ret =3D regulator_enable(ihid->pdata.supply_l);
> > +       if (ret < 0) {
> > +               dev_err(&client->dev, "Failed to enable low regulator: =
%d\n",
> > +                       ret);
> > +               goto err_regulator_l;
> > +       }
> > +
> =

> Since there don't seem to be any timing constraints between powering
> various supplies, maybe use bulk regulator API?
> =


Sure. I left it as is because this driver uses a platform data structure
and converting that to a bulk regulator looked more invasive. I'll
attempt to change it to bulk APIs.

