From: Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH] backlight: lp855x: use private data for regulator control
Date: Thu, 9 Jul 2015 09:53:25 -0400
Message-ID: <CAOw6vbLxNmdyTkzjJLV456Hie0omkanAfZYMu9=JF-4SXNQBgA@mail.gmail.com>
References: <1435644981-5568-1-git-send-email-milo.kim@ti.com>
 <000701d0b720$fb7a09e0$f26e1da0$@com> <20150706065435.GA3182@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150706065435.GA3182@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>, Milo Kim <milo.kim@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 6, 2015 at 2:54 AM, Lee Jones <lee.jones@linaro.org> wrote:
> On Sun, 05 Jul 2015, Jingoo Han wrote:
>
>> On Tuesday, June 30, 2015 3:16 PM, Milo Kim wrote:
>> >
>> > LP855x backlight device can be enabled by external VDD input.
>> > The 'supply' data is used for this purpose.
>> > It's kind of private data which runs internally, so there is no re=
ason to
>> > expose to the platform data.
>> >
>> > And LP855x DT property, 'power-supply' is unnecessary.
>> > If a regulator is registered correctly, then lp855x driver can get
>> > regulator resource by using devm_regulator_get().
>> > So devm_regulator_get() is moved from _parse_dt() to _probe().
>> > Ex) The following device tree works without 'power-supply' propert=
y.
>
> Even if it's not 'required', I think it would be good to have it in
> DT, as it describes the hardware, right?
>

Yeah. I think it's common practice to specify regulator input in DT.

I'd rather this patch was not merged.

Sean


>> >     i2c0: i2c@10002000 {
>> >             (snip)
>> >
>> >             backlight@2c {
>> >                     compatible =3D "ti,lp8556";
>> >                     reg =3D <0x2c>;
>> >
>> >                     bl-name =3D "lcd-bl";
>> >                     dev-ctrl =3D /bits/ 8 <0x85>;
>> >                     init-brt =3D /bits/ 8 <0x10>;
>> >             };
>> >     };
>> >
>> >     /* 'power' regulator for LP8556 VDD */
>> >     bl_vdd: fixed-regulator@1 {
>> >             compatible =3D "regulator-fixed";
>> >             regulator-name =3D "power";
>> >             regulator-min-microvolt =3D <3300000>;
>> >             regulator-max-microvolt =3D <3300000>;
>> >
>> >             (snip)
>> >     };
>> >
>> > Cc: Sean Paul <seanpaul@chromium.org>
>> > Cc: Jingoo Han <jingoohan1@gmail.com>
>> > Cc: Lee Jones <lee.jones@linaro.org>
>> > Cc: devicetree@vger.kernel.org
>> > Cc: linux-kernel@vger.kernel.org
>> > Signed-off-by: Milo Kim <milo.kim@ti.com>
>>
>> Acked-by: Jingoo Han <jingoohan1@gmail.com>
>>
>> Best regards,
>> Jingoo Han
>>
>> > ---
>> >  .../devicetree/bindings/video/backlight/lp855x.txt   |  2 --
>> >  drivers/video/backlight/lp855x_bl.c                  | 20 +++++++=
++-----------
>> >  include/linux/platform_data/lp855x.h                 |  2 --
>> >  3 files changed, 9 insertions(+), 15 deletions(-)
>> >
>> > diff --git a/Documentation/devicetree/bindings/video/backlight/lp8=
55x.txt
>> > b/Documentation/devicetree/bindings/video/backlight/lp855x.txt
>> > index 0a3ecbc..96e83a5 100644
>> > --- a/Documentation/devicetree/bindings/video/backlight/lp855x.txt
>> > +++ b/Documentation/devicetree/bindings/video/backlight/lp855x.txt
>> > @@ -12,7 +12,6 @@ Optional properties:
>> >    - pwm-period: PWM period value. Set only PWM input mode used (u=
32)
>> >    - rom-addr: Register address of ROM area to be updated (u8)
>> >    - rom-val: Register value to be updated (u8)
>> > -  - power-supply: Regulator which controls the 3V rail
>> >
>> >  Example:
>> >
>> > @@ -57,7 +56,6 @@ Example:
>> >     backlight@2c {
>> >             compatible =3D "ti,lp8557";
>> >             reg =3D <0x2c>;
>> > -           power-supply =3D <&backlight_vdd>;
>> >
>> >             dev-ctrl =3D /bits/ 8 <0x41>;
>> >             init-brt =3D /bits/ 8 <0x0a>;
>> > diff --git a/drivers/video/backlight/lp855x_bl.c b/drivers/video/b=
acklight/lp855x_bl.c
>> > index a26d3bb..277d5ca 100644
>> > --- a/drivers/video/backlight/lp855x_bl.c
>> > +++ b/drivers/video/backlight/lp855x_bl.c
>> > @@ -73,6 +73,7 @@ struct lp855x {
>> >     struct device *dev;
>> >     struct lp855x_platform_data *pdata;
>> >     struct pwm_device *pwm;
>> > +   struct regulator *supply;       /* regulator for VDD input */
>> >  };
>> >
>> >  static int lp855x_write_byte(struct lp855x *lp, u8 reg, u8 data)
>> > @@ -384,13 +385,6 @@ static int lp855x_parse_dt(struct lp855x *lp)
>> >             pdata->rom_data =3D &rom[0];
>> >     }
>> >
>> > -   pdata->supply =3D devm_regulator_get(dev, "power");
>> > -   if (IS_ERR(pdata->supply)) {
>> > -           if (PTR_ERR(pdata->supply) =3D=3D -EPROBE_DEFER)
>> > -                   return -EPROBE_DEFER;
>> > -           pdata->supply =3D NULL;
>> > -   }
>> > -
>> >     lp->pdata =3D pdata;
>> >
>> >     return 0;
>> > @@ -431,8 +425,12 @@ static int lp855x_probe(struct i2c_client *cl=
, const struct i2c_device_id *id)
>> >     else
>> >             lp->mode =3D REGISTER_BASED;
>> >
>> > -   if (lp->pdata->supply) {
>> > -           ret =3D regulator_enable(lp->pdata->supply);
>> > +   lp->supply =3D devm_regulator_get(lp->dev, "power");
>> > +   if (IS_ERR(lp->supply))
>> > +           lp->supply =3D NULL;
>> > +
>> > +   if (lp->supply) {
>> > +           ret =3D regulator_enable(lp->supply);
>> >             if (ret < 0) {
>> >                     dev_err(&cl->dev, "failed to enable supply: %d=
\n", ret);
>> >                     return ret;
>> > @@ -470,8 +468,8 @@ static int lp855x_remove(struct i2c_client *cl=
)
>> >
>> >     lp->bl->props.brightness =3D 0;
>> >     backlight_update_status(lp->bl);
>> > -   if (lp->pdata->supply)
>> > -           regulator_disable(lp->pdata->supply);
>> > +   if (lp->supply)
>> > +           regulator_disable(lp->supply);
>> >     sysfs_remove_group(&lp->dev->kobj, &lp855x_attr_group);
>> >
>> >     return 0;
>> > diff --git a/include/linux/platform_data/lp855x.h b/include/linux/=
platform_data/lp855x.h
>> > index 9c7fd1e..1b2ba24 100644
>> > --- a/include/linux/platform_data/lp855x.h
>> > +++ b/include/linux/platform_data/lp855x.h
>> > @@ -136,7 +136,6 @@ struct lp855x_rom_data {
>> >             Only valid when mode is PWM_BASED.
>> >   * @size_program : total size of lp855x_rom_data
>> >   * @rom_data : list of new eeprom/eprom registers
>> > - * @supply : regulator that supplies 3V input
>> >   */
>> >  struct lp855x_platform_data {
>> >     const char *name;
>> > @@ -145,7 +144,6 @@ struct lp855x_platform_data {
>> >     unsigned int period_ns;
>> >     int size_program;
>> >     struct lp855x_rom_data *rom_data;
>> > -   struct regulator *supply;
>> >  };
>> >
>> >  #endif
>>
>
> --
> Lee Jones
> Linaro STMicroelectronics Landing Team Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
