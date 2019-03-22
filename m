Return-Path: <SRS0=Bd7/=RZ=cumulusnetworks.com=pradeeps@kernel.org>
MIME-Version: 1.0
References: <20190306231521.29367-1-peda@axentia.se> <20190306231521.29367-6-peda@axentia.se>
 <0105c583-6b33-066a-fefd-00c2a3090178@axentia.se>
In-Reply-To: <0105c583-6b33-066a-fefd-00c2a3090178@axentia.se>
From: Pradeep Srinivasan <pradeeps@cumulusnetworks.com>
Date: Fri, 22 Mar 2019 12:38:54 -0700
Message-ID: <CAPwEZY38PhUddxhbe_0qce_Ogj9wZXsC+0oB7_+gnkwuhO8Xnw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] i2c: mux: pca9541: add support for PCA9641
Content-Type: multipart/alternative; boundary="000000000000006b990584b40264"
To: Peter Rosin <peda@axentia.se>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Guenter Roeck <linux@roeck-us.net>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ken Chen <chen.kenyy@inventec.com>
List-ID: <devicetree@vger.kernel.org>

--000000000000006b990584b40264
Content-Type: text/plain; charset="UTF-8"

I have verified the changes on PCA 9541. May I know how you want the test
results to be shared ? (newbie here; please bear with me)

root@cumulus:/home/cumulus# dmesg| grep "pca9541" | grep -v "pmbus"
[    2.922288] pca9541 1-0070: registered master selector for I2C pca9541

root@cumulus:/home/cumulus# cat /sys/class/i2c-dev/i2c-1/device/1-0070/name
pca9541

I need to do the same on PCA 9641. If the above is sufficient, I will grab
a switch with PCA 9641 and check if the driver works .


Thanks
Pradeep

On Thu, Mar 7, 2019 at 1:16 PM Peter Rosin <peda@axentia.se> wrote:

> Hi!
>
> I should have read Kens code more carefully, before signing off on it...
>
> Review comments inline...
>
> On 2019-03-07 00:15, Peter Rosin wrote:
> > Heavily based on code from Ken Chen <chen.kenyy@inventec.com>.
> >
> > Signed-off-by: Peter Rosin <peda@axentia.se>
> > ---
> >  drivers/i2c/muxes/Kconfig           |   6 +-
> >  drivers/i2c/muxes/i2c-mux-pca9541.c | 137
> ++++++++++++++++++++++++++++++++++--
> >  2 files changed, 136 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
> > index 52a4a922e7e6..8532841de5db 100644
> > --- a/drivers/i2c/muxes/Kconfig
> > +++ b/drivers/i2c/muxes/Kconfig
> > @@ -55,10 +55,10 @@ config I2C_MUX_LTC4306
> >         will be called i2c-mux-ltc4306.
> >
> >  config I2C_MUX_PCA9541
> > -     tristate "NXP PCA9541 I2C Master Selector"
> > +     tristate "NXP PCA9541/PCA9641 I2C Master Selectors"
> >       help
> > -       If you say yes here you get support for the NXP PCA9541
> > -       I2C Master Selector.
> > +       If you say yes here you get support for the NXP PCA9541/PCA9641
> > +       I2C Master Selectors.
> >
> >         This driver can also be built as a module.  If so, the module
> >         will be called i2c-mux-pca9541.
> > diff --git a/drivers/i2c/muxes/i2c-mux-pca9541.c
> b/drivers/i2c/muxes/i2c-mux-pca9541.c
> > index 5eb36e3223d5..5d4e0c92e978 100644
> > --- a/drivers/i2c/muxes/i2c-mux-pca9541.c
> > +++ b/drivers/i2c/muxes/i2c-mux-pca9541.c
> > @@ -1,5 +1,5 @@
> >  /*
> > - * I2C multiplexer driver for PCA9541 bus master selector
> > + * I2C multiplexer driver for PCA9541/PCA9641 bus master selectors
> >   *
> >   * Copyright (c) 2010 Ericsson AB.
> >   *
> > @@ -28,8 +28,8 @@
> >  #include <linux/slab.h>
> >
> >  /*
> > - * The PCA9541 is a bus master selector. It supports two I2C masters
> connected
> > - * to a single slave bus.
> > + * The PCA9541 and PCA9641 are bus master selector. They support two
> I2C masters
> > + * connected to a single slave bus.
> >   *
> >   * Before each bus transaction, a master has to acquire bus ownership.
> After the
> >   * transaction is complete, bus ownership has to be released. This fits
> well
> > @@ -63,6 +63,33 @@
> >  #define PCA9541_BUSON        (PCA9541_CTL_BUSON | PCA9541_CTL_NBUSON)
> >  #define PCA9541_MYBUS        (PCA9541_CTL_MYBUS | PCA9541_CTL_NMYBUS)
> >
> > +#define PCA9641_ID                   0x00
> > +#define PCA9641_ID_MAGIC             0x38
> > +
> > +#define PCA9641_CONTROL                      0x01
> > +#define PCA9641_STATUS                       0x02
> > +#define PCA9641_TIME                 0x03
> > +
> > +#define PCA9641_CTL_LOCK_REQ         BIT(0)
> > +#define PCA9641_CTL_LOCK_GRANT               BIT(1)
> > +#define PCA9641_CTL_BUS_CONNECT              BIT(2)
> > +#define PCA9641_CTL_BUS_INIT         BIT(3)
> > +#define PCA9641_CTL_SMBUS_SWRST              BIT(4)
> > +#define PCA9641_CTL_IDLE_TIMER_DIS   BIT(5)
> > +#define PCA9641_CTL_SMBUS_DIS                BIT(6)
> > +#define PCA9641_CTL_PRIORITY         BIT(7)
> > +
> > +#define PCA9641_STS_OTHER_LOCK               BIT(0)
> > +#define PCA9641_STS_BUS_INIT_FAIL    BIT(1)
> > +#define PCA9641_STS_BUS_HUNG         BIT(2)
> > +#define PCA9641_STS_MBOX_EMPTY               BIT(3)
> > +#define PCA9641_STS_MBOX_FULL                BIT(4)
> > +#define PCA9641_STS_TEST_INT         BIT(5)
> > +#define PCA9641_STS_SCL_IO           BIT(6)
> > +#define PCA9641_STS_SDA_IO           BIT(7)
> > +
> > +#define PCA9641_RES_TIME             0x03
>
> This appears to be the same thing as PCA9641_TIME above. The
> register is called PCA9641_RT in my data sheet.
>
> > +
> >  /* arbitration timeouts, in jiffies */
> >  #define ARB_TIMEOUT  (HZ / 8)        /* 125 ms until forcing bus
> ownership */
> >  #define ARB2_TIMEOUT (HZ / 4)        /* 250 ms until acquisition
> failure */
> > @@ -73,6 +100,7 @@
> >
> >  enum chip_name {
> >       pca9541,
> > +     pca9641,
> >  };
> >
> >  struct chip_desc {
> > @@ -102,6 +130,21 @@ static bool pca9541_busoff(int ctl)
> >       return (ctl & PCA9541_BUSON) == PCA9541_BUSON;
> >  }
> >
> > +static bool pca9641_lock_grant(int ctl)
> > +{
> > +     return !!(ctl & PCA9641_CTL_LOCK_GRANT);
> > +}
> > +
> > +static bool pca9641_other_lock(int sts)
> > +{
> > +     return !!(sts & PCA9641_STS_OTHER_LOCK);
> > +}
> > +
> > +static bool pca9641_busoff(int ctl, int sts)
> > +{
> > +     return !pca9641_lock_grant(ctl) && !pca9641_other_lock(sts);
> > +}
> > +
> >  /*
> >   * Write to chip register. Don't use i2c_transfer()/i2c_smbus_xfer()
> >   * as they will try to lock the adapter a second time.
> > @@ -256,6 +299,86 @@ static int pca9541_arbitrate(struct i2c_client
> *client)
> >       return 0;
> >  }
> >
> > +/* Release bus. */
> > +static void pca9641_release_bus(struct i2c_client *client)
> > +{
> > +     pca9541_reg_write(client, PCA9641_CONTROL, 0);
>
> Should this release bus function really "clobber" the control bits
> PCA9641_CTL_IDLE_TIMER_DIS, PCA9641_CTL_SMBUS_DIS, PCA9641_CTL_PRIORITY?
> Yes yes, the driver never sets these bits so they are likely zero. But
> the driver doesn't reset the chip either, so some bootstrap code might
> have configured those bits...
>
> Also related to bus release, since the driver does not touch the
> reserve time register, and then clears the above bits, the only way
> to release the bus is if everything continues to work and the above
> pca9641_release_bus is in fact happening. But if the kernel crashes
> while hogging the bus, and fails to come up, then the other master
> has no way of stealing the ownership. I really feel that the driver
> should make use of the timers so that the arbiter releases the bus
> automatically on catastrophic failure. But maybe I plain and simple
> just misunderstand the datasheet?
>
> > +}
> > +
> > +/*
> > + * Channel arbitration
> > + *
> > + * Return values:
> > + *  <0: error
> > + *  0 : bus not acquired
> > + *  1 : bus acquired
> > + */
> > +static int pca9641_arbitrate(struct i2c_client *client)
> > +{
> > +     struct i2c_mux_core *muxc = i2c_get_clientdata(client);
> > +     struct pca9541 *data = i2c_mux_priv(muxc);
> > +     int reg_ctl, reg_sts;
> > +
> > +     reg_ctl = pca9541_reg_read(client, PCA9641_CONTROL);
> > +     if (reg_ctl < 0)
> > +             return reg_ctl;
> > +     reg_sts = pca9541_reg_read(client, PCA9641_STATUS);
> > +
> > +     if (pca9641_busoff(reg_ctl, reg_sts)) {
> > +             /*
> > +              * Bus is off. Request ownership or turn it on unless
> > +              * other master requested ownership.
> > +              */
> > +             reg_ctl |= PCA9641_CTL_LOCK_REQ;
> > +             pca9541_reg_write(client, PCA9641_CONTROL, reg_ctl);
> > +             reg_ctl = pca9541_reg_read(client, PCA9641_CONTROL);
> > +
> > +             if (pca9641_lock_grant(reg_ctl)) {
> > +                     /*
> > +                      * Other master did not request ownership,
> > +                      * or arbitration timeout expired. Take the bus.
> > +                      */
> > +                     reg_ctl |= PCA9641_CTL_BUS_CONNECT |
> > +                             PCA9641_CTL_LOCK_REQ;
> > +                     pca9541_reg_write(client, PCA9641_CONTROL,
> reg_ctl);
> > +                     data->select_timeout = SELECT_DELAY_SHORT;
> > +
> > +                     return 1;
> > +             }
> > +
> > +             /*
> > +              * Other master requested ownership.
> > +              * Set extra long timeout to give it time to acquire it.
> > +              */
> > +             data->select_timeout = SELECT_DELAY_LONG * 2;
> > +
> > +             return 0;
> > +     }
> > +
> > +     if (pca9641_lock_grant(reg_ctl)) {
> > +             /*
> > +              * Bus is on, and we own it. We are done with acquisition.
> > +              */
> > +             reg_ctl |= PCA9641_CTL_BUS_CONNECT | PCA9641_CTL_LOCK_REQ;
> > +             pca9541_reg_write(client, PCA9641_CONTROL, reg_ctl);
> > +
> > +             return 1;
> > +     }
> > +
> > +     if (pca9641_other_lock(reg_sts)) {
> > +             /*
> > +              * Other master owns the bus.
> > +              * If arbitration timeout has expired, force ownership.
> > +              * Otherwise request it.
>
> This comment is stale. Reading the data sheet, I find no way to force
> ownership with the PCA9641 (as indicated above in the release_bus
> review comment). But I have only browsed the data sheet so I could
> easily be mistaken...
>
> [time passes]
>
> Ahhh, wait, it could reset the chip to get a new chance to get ownership.
> But that will reset all registers for the other master as well, since I
> read it as if the reset is chip-global and not master-local with minimal
> effects on the other master. So, a big hammer indeed.
>
> Cheers,
> Peter
>
> > +              */
> > +             data->select_timeout = SELECT_DELAY_LONG;
> > +             reg_ctl |= PCA9641_CTL_LOCK_REQ;
> > +             pca9541_reg_write(client, PCA9641_CONTROL, reg_ctl);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> >  static int pca9541_select_chan(struct i2c_mux_core *muxc, u32 chan)
> >  {
> >       struct pca9541 *data = i2c_mux_priv(muxc);
> > @@ -295,10 +418,15 @@ static const struct chip_desc chips[] = {
> >               .arbitrate = pca9541_arbitrate,
> >               .release_bus = pca9541_release_bus,
> >       },
> > +     [pca9641] = {
> > +             .arbitrate = pca9641_arbitrate,
> > +             .release_bus = pca9641_release_bus,
> > +     },
> >  };
> >
> >  static const struct i2c_device_id pca9541_id[] = {
> >       { "pca9541", pca9541 },
> > +     { "pca9641", pca9641 },
> >       {}
> >  };
> >
> > @@ -307,6 +435,7 @@ MODULE_DEVICE_TABLE(i2c, pca9541_id);
> >  #ifdef CONFIG_OF
> >  static const struct of_device_id pca9541_of_match[] = {
> >       { .compatible = "nxp,pca9541", .data = &chips[pca9541] },
> > +     { .compatible = "nxp,pca9641", .data = &chips[pca9641] },
> >       {}
> >  };
> >  MODULE_DEVICE_TABLE(of, pca9541_of_match);
> > @@ -392,5 +521,5 @@ static struct i2c_driver pca9541_driver = {
> >  module_i2c_driver(pca9541_driver);
> >
> >  MODULE_AUTHOR("Guenter Roeck <linux@roeck-us.net>");
> > -MODULE_DESCRIPTION("PCA9541 I2C master selector driver");
> > +MODULE_DESCRIPTION("PCA9541/PCA9641 I2C master selector driver");
> >  MODULE_LICENSE("GPL v2");
> >
>
>

--000000000000006b990584b40264
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">I have verified the chan=
ges on PCA 9541. May I know how you want the test results to be shared ? (n=
ewbie here; please bear with me)<div><br></div><div><div>root@cumulus:/home=
/cumulus# dmesg| grep &quot;pca9541&quot; | grep -v &quot;pmbus&quot;</div>=
<div>[ =C2=A0 =C2=A02.922288] pca9541 1-0070: registered master selector fo=
r I2C pca9541</div></div><div><br></div><div><div>root@cumulus:/home/cumulu=
s# cat /sys/class/i2c-dev/i2c-1/device/1-0070/name</div><div>pca9541</div><=
/div><div><br></div><div>I need to do the same on PCA 9641. If the above is=
 sufficient, I will grab a switch with PCA 9641 and check if the driver wor=
ks .</div><div><br></div><div><br></div><div>Thanks</div><div>Pradeep</div>=
</div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Thu, Mar 7, 2019 at 1:16 PM Peter Rosin &lt;<a href=3D"mailt=
o:peda@axentia.se" target=3D"_blank">peda@axentia.se</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204)=
;padding-left:1ex">Hi!<br>
<br>
I should have read Kens code more carefully, before signing off on it...<br=
>
<br>
Review comments inline...<br>
<br>
On 2019-03-07 00:15, Peter Rosin wrote:<br>
&gt; Heavily based on code from Ken Chen &lt;<a href=3D"mailto:chen.kenyy@i=
nventec.com" target=3D"_blank">chen.kenyy@inventec.com</a>&gt;.<br>
&gt; <br>
&gt; Signed-off-by: Peter Rosin &lt;<a href=3D"mailto:peda@axentia.se" targ=
et=3D"_blank">peda@axentia.se</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/i2c/muxes/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 drivers/i2c/muxes/i2c-mux-pca9541.c | 137 ++++++++++++++++++++++=
++++++++++++--<br>
&gt;=C2=A0 2 files changed, 136 insertions(+), 7 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig<br>
&gt; index 52a4a922e7e6..8532841de5db 100644<br>
&gt; --- a/drivers/i2c/muxes/Kconfig<br>
&gt; +++ b/drivers/i2c/muxes/Kconfig<br>
&gt; @@ -55,10 +55,10 @@ config I2C_MUX_LTC4306<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0will be called i2c-mux-ltc4306.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 config I2C_MUX_PCA9541<br>
&gt; -=C2=A0 =C2=A0 =C2=A0tristate &quot;NXP PCA9541 I2C Master Selector&qu=
ot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tristate &quot;NXP PCA9541/PCA9641 I2C Master Sel=
ectors&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0If you say yes here you get support for th=
e NXP PCA9541<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0I2C Master Selector.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0If you say yes here you get support for th=
e NXP PCA9541/PCA9641<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0I2C Master Selectors.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This driver can also be built as a mo=
dule.=C2=A0 If so, the module<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0will be called i2c-mux-pca9541.<br>
&gt; diff --git a/drivers/i2c/muxes/i2c-mux-pca9541.c b/drivers/i2c/muxes/i=
2c-mux-pca9541.c<br>
&gt; index 5eb36e3223d5..5d4e0c92e978 100644<br>
&gt; --- a/drivers/i2c/muxes/i2c-mux-pca9541.c<br>
&gt; +++ b/drivers/i2c/muxes/i2c-mux-pca9541.c<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt;=C2=A0 /*<br>
&gt; - * I2C multiplexer driver for PCA9541 bus master selector<br>
&gt; + * I2C multiplexer driver for PCA9541/PCA9641 bus master selectors<br=
>
&gt;=C2=A0 =C2=A0*<br>
&gt;=C2=A0 =C2=A0* Copyright (c) 2010 Ericsson AB.<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; @@ -28,8 +28,8 @@<br>
&gt;=C2=A0 #include &lt;linux/slab.h&gt;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /*<br>
&gt; - * The PCA9541 is a bus master selector. It supports two I2C masters =
connected<br>
&gt; - * to a single slave bus.<br>
&gt; + * The PCA9541 and PCA9641 are bus master selector. They support two =
I2C masters<br>
&gt; + * connected to a single slave bus.<br>
&gt;=C2=A0 =C2=A0*<br>
&gt;=C2=A0 =C2=A0* Before each bus transaction, a master has to acquire bus=
 ownership. After the<br>
&gt;=C2=A0 =C2=A0* transaction is complete, bus ownership has to be release=
d. This fits well<br>
&gt; @@ -63,6 +63,33 @@<br>
&gt;=C2=A0 #define PCA9541_BUSON=C2=A0 =C2=A0 =C2=A0 =C2=A0 (PCA9541_CTL_BU=
SON | PCA9541_CTL_NBUSON)<br>
&gt;=C2=A0 #define PCA9541_MYBUS=C2=A0 =C2=A0 =C2=A0 =C2=A0 (PCA9541_CTL_MY=
BUS | PCA9541_CTL_NMYBUS)<br>
&gt;=C2=A0 <br>
&gt; +#define PCA9641_ID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00x00<br>
&gt; +#define PCA9641_ID_MAGIC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00x38<br>
&gt; +<br>
&gt; +#define PCA9641_CONTROL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01<br>
&gt; +#define PCA9641_STATUS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x02<br>
&gt; +#define PCA9641_TIME=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00x03<br>
&gt; +<br>
&gt; +#define PCA9641_CTL_LOCK_REQ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(0)<=
br>
&gt; +#define PCA9641_CTL_LOCK_GRANT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0BIT(1)<br>
&gt; +#define PCA9641_CTL_BUS_CONNECT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 BIT(2)<br>
&gt; +#define PCA9641_CTL_BUS_INIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(3)<=
br>
&gt; +#define PCA9641_CTL_SMBUS_SWRST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 BIT(4)<br>
&gt; +#define PCA9641_CTL_IDLE_TIMER_DIS=C2=A0 =C2=A0BIT(5)<br>
&gt; +#define PCA9641_CTL_SMBUS_DIS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 BIT(6)<br>
&gt; +#define PCA9641_CTL_PRIORITY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(7)<=
br>
&gt; +<br>
&gt; +#define PCA9641_STS_OTHER_LOCK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0BIT(0)<br>
&gt; +#define PCA9641_STS_BUS_INIT_FAIL=C2=A0 =C2=A0 BIT(1)<br>
&gt; +#define PCA9641_STS_BUS_HUNG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(2)<=
br>
&gt; +#define PCA9641_STS_MBOX_EMPTY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0BIT(3)<br>
&gt; +#define PCA9641_STS_MBOX_FULL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 BIT(4)<br>
&gt; +#define PCA9641_STS_TEST_INT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(5)<=
br>
&gt; +#define PCA9641_STS_SCL_IO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BI=
T(6)<br>
&gt; +#define PCA9641_STS_SDA_IO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BI=
T(7)<br>
&gt; +<br>
&gt; +#define PCA9641_RES_TIME=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00x03<br>
<br>
This appears to be the same thing as PCA9641_TIME above. The<br>
register is called PCA9641_RT in my data sheet.<br>
<br>
&gt; +<br>
&gt;=C2=A0 /* arbitration timeouts, in jiffies */<br>
&gt;=C2=A0 #define ARB_TIMEOUT=C2=A0 (HZ / 8)=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*=
 125 ms until forcing bus ownership */<br>
&gt;=C2=A0 #define ARB2_TIMEOUT (HZ / 4)=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* 250 =
ms until acquisition failure */<br>
&gt; @@ -73,6 +100,7 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 enum chip_name {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pca9541,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pca9641,<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 struct chip_desc {<br>
&gt; @@ -102,6 +130,21 @@ static bool pca9541_busoff(int ctl)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return (ctl &amp; PCA9541_BUSON) =3D=3D PCA9=
541_BUSON;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +static bool pca9641_lock_grant(int ctl)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return !!(ctl &amp; PCA9641_CTL_LOCK_GRANT);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static bool pca9641_other_lock(int sts)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return !!(sts &amp; PCA9641_STS_OTHER_LOCK);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static bool pca9641_busoff(int ctl, int sts)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return !pca9641_lock_grant(ctl) &amp;&amp; !pca96=
41_other_lock(sts);<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 /*<br>
&gt;=C2=A0 =C2=A0* Write to chip register. Don&#39;t use i2c_transfer()/i2c=
_smbus_xfer()<br>
&gt;=C2=A0 =C2=A0* as they will try to lock the adapter a second time.<br>
&gt; @@ -256,6 +299,86 @@ static int pca9541_arbitrate(struct i2c_client *c=
lient)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +/* Release bus. */<br>
&gt; +static void pca9641_release_bus(struct i2c_client *client)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pca9541_reg_write(client, PCA9641_CONTROL, 0);<br=
>
<br>
Should this release bus function really &quot;clobber&quot; the control bit=
s<br>
PCA9641_CTL_IDLE_TIMER_DIS, PCA9641_CTL_SMBUS_DIS, PCA9641_CTL_PRIORITY?<br=
>
Yes yes, the driver never sets these bits so they are likely zero. But<br>
the driver doesn&#39;t reset the chip either, so some bootstrap code might<=
br>
have configured those bits...<br>
<br>
Also related to bus release, since the driver does not touch the<br>
reserve time register, and then clears the above bits, the only way<br>
to release the bus is if everything continues to work and the above<br>
pca9641_release_bus is in fact happening. But if the kernel crashes<br>
while hogging the bus, and fails to come up, then the other master<br>
has no way of stealing the ownership. I really feel that the driver<br>
should make use of the timers so that the arbiter releases the bus<br>
automatically on catastrophic failure. But maybe I plain and simple<br>
just misunderstand the datasheet?<br>
<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Channel arbitration<br>
&gt; + *<br>
&gt; + * Return values:<br>
&gt; + *=C2=A0 &lt;0: error<br>
&gt; + *=C2=A0 0 : bus not acquired<br>
&gt; + *=C2=A0 1 : bus acquired<br>
&gt; + */<br>
&gt; +static int pca9641_arbitrate(struct i2c_client *client)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct i2c_mux_core *muxc =3D i2c_get_clientdata(=
client);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct pca9541 *data =3D i2c_mux_priv(muxc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int reg_ctl, reg_sts;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg_ctl =3D pca9541_reg_read(client, PCA9641_CONT=
ROL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (reg_ctl &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return reg_ctl;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg_sts =3D pca9541_reg_read(client, PCA9641_STAT=
US);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (pca9641_busoff(reg_ctl, reg_sts)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Bus is off. Reques=
t ownership or turn it on unless<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * other master reque=
sted ownership.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_ctl |=3D PCA9641_=
CTL_LOCK_REQ;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pca9541_reg_write(cli=
ent, PCA9641_CONTROL, reg_ctl);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_ctl =3D pca9541_r=
eg_read(client, PCA9641_CONTROL);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pca9641_lock_gran=
t(reg_ctl)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 * Other master did not request ownership,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 * or arbitration timeout expired. Take the bus.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0reg_ctl |=3D PCA9641_CTL_BUS_CONNECT |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PCA9641_CTL_LOCK_REQ;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pca9541_reg_write(client, PCA9641_CONTROL, reg_ctl);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0data-&gt;select_timeout =3D SELECT_DELAY_SHORT;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Other master reque=
sted ownership.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Set extra long tim=
eout to give it time to acquire it.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;select_timeo=
ut =3D SELECT_DELAY_LONG * 2;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (pca9641_lock_grant(reg_ctl)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Bus is on, and we =
own it. We are done with acquisition.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_ctl |=3D PCA9641_=
CTL_BUS_CONNECT | PCA9641_CTL_LOCK_REQ;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pca9541_reg_write(cli=
ent, PCA9641_CONTROL, reg_ctl);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (pca9641_other_lock(reg_sts)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Other master owns =
the bus.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * If arbitration tim=
eout has expired, force ownership.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Otherwise request =
it.<br>
<br>
This comment is stale. Reading the data sheet, I find no way to force<br>
ownership with the PCA9641 (as indicated above in the release_bus<br>
review comment). But I have only browsed the data sheet so I could<br>
easily be mistaken...<br>
<br>
[time passes]<br>
<br>
Ahhh, wait, it could reset the chip to get a new chance to get ownership.<b=
r>
But that will reset all registers for the other master as well, since I<br>
read it as if the reset is chip-global and not master-local with minimal<br=
>
effects on the other master. So, a big hammer indeed.<br>
<br>
Cheers,<br>
Peter<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;select_timeo=
ut =3D SELECT_DELAY_LONG;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_ctl |=3D PCA9641_=
CTL_LOCK_REQ;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pca9541_reg_write(cli=
ent, PCA9641_CONTROL, reg_ctl);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 static int pca9541_select_chan(struct i2c_mux_core *muxc, u32 ch=
an)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pca9541 *data =3D i2c_mux_priv(muxc);=
<br>
&gt; @@ -295,10 +418,15 @@ static const struct chip_desc chips[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.arbitrate =3D p=
ca9541_arbitrate,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.release_bus =3D=
 pca9541_release_bus,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[pca9641] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.arbitrate =3D pca964=
1_arbitrate,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.release_bus =3D pca9=
641_release_bus,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static const struct i2c_device_id pca9541_id[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;pca9541&quot;, pca9541 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ &quot;pca9641&quot;, pca9641 },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{}<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; @@ -307,6 +435,7 @@ MODULE_DEVICE_TABLE(i2c, pca9541_id);<br>
&gt;=C2=A0 #ifdef CONFIG_OF<br>
&gt;=C2=A0 static const struct of_device_id pca9541_of_match[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;nxp,pca9541&quot;, .=
data =3D &amp;chips[pca9541] },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;nxp,pca9641&quot;, .data =
=3D &amp;chips[pca9641] },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{}<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 MODULE_DEVICE_TABLE(of, pca9541_of_match);<br>
&gt; @@ -392,5 +521,5 @@ static struct i2c_driver pca9541_driver =3D {<br>
&gt;=C2=A0 module_i2c_driver(pca9541_driver);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 MODULE_AUTHOR(&quot;Guenter Roeck &lt;<a href=3D"mailto:linux@ro=
eck-us.net" target=3D"_blank">linux@roeck-us.net</a>&gt;&quot;);<br>
&gt; -MODULE_DESCRIPTION(&quot;PCA9541 I2C master selector driver&quot;);<b=
r>
&gt; +MODULE_DESCRIPTION(&quot;PCA9541/PCA9641 I2C master selector driver&q=
uot;);<br>
&gt;=C2=A0 MODULE_LICENSE(&quot;GPL v2&quot;);<br>
&gt; <br>
<br>
</blockquote></div>

--000000000000006b990584b40264--
