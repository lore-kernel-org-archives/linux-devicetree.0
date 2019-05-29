Return-Path: <SRS0=1Sjq=T5=cumulusnetworks.com=pradeeps@kernel.org>
MIME-Version: 1.0
References: <20190306231521.29367-1-peda@axentia.se> <20190306231521.29367-6-peda@axentia.se>
 <0105c583-6b33-066a-fefd-00c2a3090178@axentia.se> <CAPwEZY38PhUddxhbe_0qce_Ogj9wZXsC+0oB7_+gnkwuhO8Xnw@mail.gmail.com>
 <63e64b6a-5103-9cc2-b3d9-f7d00a333f86@axentia.se> <20190325164925.GC28275@roeck-us.net>
In-Reply-To: <20190325164925.GC28275@roeck-us.net>
From: Pradeep Srinivasan <pradeeps@cumulusnetworks.com>
Date: Wed, 29 May 2019 12:52:54 -0700
Message-ID: <CAPwEZY1rHS+VuoOuH=9axwUWwR9nygGq=pgA6JBYyVGFO8DYBw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] i2c: mux: pca9541: add support for PCA9641
Content-Type: multipart/mixed; boundary="0000000000004a8003058a0c2128"
To: Guenter Roeck <linux@roeck-us.net>
Cc: Peter Rosin <peda@axentia.se>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ken Chen <chen.kenyy@inventec.com>
List-ID: <devicetree@vger.kernel.org>

--0000000000004a8003058a0c2128
Content-Type: multipart/alternative; boundary="0000000000004a7fff058a0c2126"

--0000000000004a7fff058a0c2126
Content-Type: text/plain; charset="UTF-8"

Finally, I got some cycles to test the patches on a Celestica seastone
switch which has the PCA 9541 mux. I have attached a rough sketch of the
I2C mux tree. I tested by accessing the all the devices behind PCA9548 mux.
There are 3 PCA 9548 mux devices behind PCA 9541. The test data is attached
to this email. I was able to read all Fan EEPROM data, lm74 sensor data
through smonctl as well as sensors command.

Thanks
Pradeep

On Mon, Mar 25, 2019 at 9:49 AM Guenter Roeck <linux@roeck-us.net> wrote:

> On Mon, Mar 25, 2019 at 03:01:21PM +0000, Peter Rosin wrote:
> > On 2019-03-22 20:38, Pradeep Srinivasan wrote:
> > > I have verified the changes on PCA 9541. May I know how you want the
> test results to be shared ? (newbie here; please bear with me)
> > >
> > > root@cumulus:/home/cumulus# dmesg| grep "pca9541" | grep -v "pmbus"
> > > [    2.922288] pca9541 1-0070: registered master selector for I2C
> pca9541
> > >
> > > root@cumulus:/home/cumulus# cat
> /sys/class/i2c-dev/i2c-1/device/1-0070/name
> > > pca9541
> >
> > This only verifies that the probe works and that the chip is detected
> properly.
> > It says nothing about if it works to communicate with whatever is beyond
> the
> > PCA9541, and nothing on how the interaction with the "alien" other master
> > connected to the PCA9541 is working. I don't know how I want this to be
> tested,
> > but if you have a setup with a PCA9541 / PCA9641 I would assume that you
> > have some kind of need for those chips and that you at least could report
> > if basic xfers through them are working? I don't need to see actual
> commands
> > that you have executed, I'm much more interested in some summary of what
> > you did and what worked (or not).
> >
> > E.g. if you have an eeprom beyond the master selector, you could read
> from
> > it in a loop while doing something else from the alien master and check
> if
> > it all works as expected? Perhaps try to verify timing if there are
> stalls
> > and/or timeouts etc. Go wild! But if you don't know how or don't have the
>
> Something like that is what I did to test the original implementation:
> Access
> all chips behind the mux from both ends continuously. Let that run for an
> hour
> or so and declare it a success if there is no error. Usually, while the
> code
> was still buggy, errors would show up within minutes, if not seconds.
>
> Guenter
>
> > time, I'd be happy with a report on basic functionality (but a little bit
> > more than probe-ok would be nice though), because the code affecting the
> > PCA9541 is probably not broken subtly, it either works as it did before
> or
> > it doesn't work at all. And any problem with the PCA9641 side of things
> > will not be a regression and therefore not a big problem...
> >
> > Cheers,
> > Peter
> >
> > > I need to do the same on PCA 9641. If the above is sufficient, I will
> grab a switch with PCA 9641 and check if the driver works .
> > >
> > >
> > > Thanks
> > > Pradeep
> > >
> > > On Thu, Mar 7, 2019 at 1:16 PM Peter Rosin <peda@axentia.se <mailto:
> peda@axentia.se>> wrote:
> > >
> > >     Hi!
> > >
> > >     I should have read Kens code more carefully, before signing off on
> it...
> > >
> > >     Review comments inline...
> > >
> > >     On 2019-03-07 00:15, Peter Rosin wrote:
> > >     > Heavily based on code from Ken Chen <chen.kenyy@inventec.com
> <mailto:chen.kenyy@inventec.com>>.
> > >     >
> > >     > Signed-off-by: Peter Rosin <peda@axentia.se <mailto:
> peda@axentia.se>>
> > >     > ---
> > >     >  drivers/i2c/muxes/Kconfig           |   6 +-
> > >     >  drivers/i2c/muxes/i2c-mux-pca9541.c | 137
> ++++++++++++++++++++++++++++++++++--
> > >     >  2 files changed, 136 insertions(+), 7 deletions(-)
> > >     >
> > >     > diff --git a/drivers/i2c/muxes/Kconfig
> b/drivers/i2c/muxes/Kconfig
> > >     > index 52a4a922e7e6..8532841de5db 100644
> > >     > --- a/drivers/i2c/muxes/Kconfig
> > >     > +++ b/drivers/i2c/muxes/Kconfig
> > >     > @@ -55,10 +55,10 @@ config I2C_MUX_LTC4306
> > >     >         will be called i2c-mux-ltc4306.
> > >     >
> > >     >  config I2C_MUX_PCA9541
> > >     > -     tristate "NXP PCA9541 I2C Master Selector"
> > >     > +     tristate "NXP PCA9541/PCA9641 I2C Master Selectors"
> > >     >       help
> > >     > -       If you say yes here you get support for the NXP PCA9541
> > >     > -       I2C Master Selector.
> > >     > +       If you say yes here you get support for the NXP
> PCA9541/PCA9641
> > >     > +       I2C Master Selectors.
> > >     >
> > >     >         This driver can also be built as a module.  If so, the
> module
> > >     >         will be called i2c-mux-pca9541.
> > >     > diff --git a/drivers/i2c/muxes/i2c-mux-pca9541.c
> b/drivers/i2c/muxes/i2c-mux-pca9541.c
> > >     > index 5eb36e3223d5..5d4e0c92e978 100644
> > >     > --- a/drivers/i2c/muxes/i2c-mux-pca9541.c
> > >     > +++ b/drivers/i2c/muxes/i2c-mux-pca9541.c
> > >     > @@ -1,5 +1,5 @@
> > >     >  /*
> > >     > - * I2C multiplexer driver for PCA9541 bus master selector
> > >     > + * I2C multiplexer driver for PCA9541/PCA9641 bus master
> selectors
> > >     >   *
> > >     >   * Copyright (c) 2010 Ericsson AB.
> > >     >   *
> > >     > @@ -28,8 +28,8 @@
> > >     >  #include <linux/slab.h>
> > >     >
> > >     >  /*
> > >     > - * The PCA9541 is a bus master selector. It supports two I2C
> masters connected
> > >     > - * to a single slave bus.
> > >     > + * The PCA9541 and PCA9641 are bus master selector. They
> support two I2C masters
> > >     > + * connected to a single slave bus.
> > >     >   *
> > >     >   * Before each bus transaction, a master has to acquire bus
> ownership. After the
> > >     >   * transaction is complete, bus ownership has to be released.
> This fits well
> > >     > @@ -63,6 +63,33 @@
> > >     >  #define PCA9541_BUSON        (PCA9541_CTL_BUSON |
> PCA9541_CTL_NBUSON)
> > >     >  #define PCA9541_MYBUS        (PCA9541_CTL_MYBUS |
> PCA9541_CTL_NMYBUS)
> > >     >
> > >     > +#define PCA9641_ID                   0x00
> > >     > +#define PCA9641_ID_MAGIC             0x38
> > >     > +
> > >     > +#define PCA9641_CONTROL                      0x01
> > >     > +#define PCA9641_STATUS                       0x02
> > >     > +#define PCA9641_TIME                 0x03
> > >     > +
> > >     > +#define PCA9641_CTL_LOCK_REQ         BIT(0)
> > >     > +#define PCA9641_CTL_LOCK_GRANT               BIT(1)
> > >     > +#define PCA9641_CTL_BUS_CONNECT              BIT(2)
> > >     > +#define PCA9641_CTL_BUS_INIT         BIT(3)
> > >     > +#define PCA9641_CTL_SMBUS_SWRST              BIT(4)
> > >     > +#define PCA9641_CTL_IDLE_TIMER_DIS   BIT(5)
> > >     > +#define PCA9641_CTL_SMBUS_DIS                BIT(6)
> > >     > +#define PCA9641_CTL_PRIORITY         BIT(7)
> > >     > +
> > >     > +#define PCA9641_STS_OTHER_LOCK               BIT(0)
> > >     > +#define PCA9641_STS_BUS_INIT_FAIL    BIT(1)
> > >     > +#define PCA9641_STS_BUS_HUNG         BIT(2)
> > >     > +#define PCA9641_STS_MBOX_EMPTY               BIT(3)
> > >     > +#define PCA9641_STS_MBOX_FULL                BIT(4)
> > >     > +#define PCA9641_STS_TEST_INT         BIT(5)
> > >     > +#define PCA9641_STS_SCL_IO           BIT(6)
> > >     > +#define PCA9641_STS_SDA_IO           BIT(7)
> > >     > +
> > >     > +#define PCA9641_RES_TIME             0x03
> > >
> > >     This appears to be the same thing as PCA9641_TIME above. The
> > >     register is called PCA9641_RT in my data sheet.
> > >
> > >     > +
> > >     >  /* arbitration timeouts, in jiffies */
> > >     >  #define ARB_TIMEOUT  (HZ / 8)        /* 125 ms until forcing
> bus ownership */
> > >     >  #define ARB2_TIMEOUT (HZ / 4)        /* 250 ms until
> acquisition failure */
> > >     > @@ -73,6 +100,7 @@
> > >     >
> > >     >  enum chip_name {
> > >     >       pca9541,
> > >     > +     pca9641,
> > >     >  };
> > >     >
> > >     >  struct chip_desc {
> > >     > @@ -102,6 +130,21 @@ static bool pca9541_busoff(int ctl)
> > >     >       return (ctl & PCA9541_BUSON) == PCA9541_BUSON;
> > >     >  }
> > >     >
> > >     > +static bool pca9641_lock_grant(int ctl)
> > >     > +{
> > >     > +     return !!(ctl & PCA9641_CTL_LOCK_GRANT);
> > >     > +}
> > >     > +
> > >     > +static bool pca9641_other_lock(int sts)
> > >     > +{
> > >     > +     return !!(sts & PCA9641_STS_OTHER_LOCK);
> > >     > +}
> > >     > +
> > >     > +static bool pca9641_busoff(int ctl, int sts)
> > >     > +{
> > >     > +     return !pca9641_lock_grant(ctl) &&
> !pca9641_other_lock(sts);
> > >     > +}
> > >     > +
> > >     >  /*
> > >     >   * Write to chip register. Don't use
> i2c_transfer()/i2c_smbus_xfer()
> > >     >   * as they will try to lock the adapter a second time.
> > >     > @@ -256,6 +299,86 @@ static int pca9541_arbitrate(struct
> i2c_client *client)
> > >     >       return 0;
> > >     >  }
> > >     >
> > >     > +/* Release bus. */
> > >     > +static void pca9641_release_bus(struct i2c_client *client)
> > >     > +{
> > >     > +     pca9541_reg_write(client, PCA9641_CONTROL, 0);
> > >
> > >     Should this release bus function really "clobber" the control bits
> > >     PCA9641_CTL_IDLE_TIMER_DIS, PCA9641_CTL_SMBUS_DIS,
> PCA9641_CTL_PRIORITY?
> > >     Yes yes, the driver never sets these bits so they are likely zero.
> But
> > >     the driver doesn't reset the chip either, so some bootstrap code
> might
> > >     have configured those bits...
> > >
> > >     Also related to bus release, since the driver does not touch the
> > >     reserve time register, and then clears the above bits, the only way
> > >     to release the bus is if everything continues to work and the above
> > >     pca9641_release_bus is in fact happening. But if the kernel crashes
> > >     while hogging the bus, and fails to come up, then the other master
> > >     has no way of stealing the ownership. I really feel that the driver
> > >     should make use of the timers so that the arbiter releases the bus
> > >     automatically on catastrophic failure. But maybe I plain and simple
> > >     just misunderstand the datasheet?
> > >
> > >     > +}
> > >     > +
> > >     > +/*
> > >     > + * Channel arbitration
> > >     > + *
> > >     > + * Return values:
> > >     > + *  <0: error
> > >     > + *  0 : bus not acquired
> > >     > + *  1 : bus acquired
> > >     > + */
> > >     > +static int pca9641_arbitrate(struct i2c_client *client)
> > >     > +{
> > >     > +     struct i2c_mux_core *muxc = i2c_get_clientdata(client);
> > >     > +     struct pca9541 *data = i2c_mux_priv(muxc);
> > >     > +     int reg_ctl, reg_sts;
> > >     > +
> > >     > +     reg_ctl = pca9541_reg_read(client, PCA9641_CONTROL);
> > >     > +     if (reg_ctl < 0)
> > >     > +             return reg_ctl;
> > >     > +     reg_sts = pca9541_reg_read(client, PCA9641_STATUS);
> > >     > +
> > >     > +     if (pca9641_busoff(reg_ctl, reg_sts)) {
> > >     > +             /*
> > >     > +              * Bus is off. Request ownership or turn it on
> unless
> > >     > +              * other master requested ownership.
> > >     > +              */
> > >     > +             reg_ctl |= PCA9641_CTL_LOCK_REQ;
> > >     > +             pca9541_reg_write(client, PCA9641_CONTROL,
> reg_ctl);
> > >     > +             reg_ctl = pca9541_reg_read(client,
> PCA9641_CONTROL);
> > >     > +
> > >     > +             if (pca9641_lock_grant(reg_ctl)) {
> > >     > +                     /*
> > >     > +                      * Other master did not request ownership,
> > >     > +                      * or arbitration timeout expired. Take
> the bus.
> > >     > +                      */
> > >     > +                     reg_ctl |= PCA9641_CTL_BUS_CONNECT |
> > >     > +                             PCA9641_CTL_LOCK_REQ;
> > >     > +                     pca9541_reg_write(client, PCA9641_CONTROL,
> reg_ctl);
> > >     > +                     data->select_timeout = SELECT_DELAY_SHORT;
> > >     > +
> > >     > +                     return 1;
> > >     > +             }
> > >     > +
> > >     > +             /*
> > >     > +              * Other master requested ownership.
> > >     > +              * Set extra long timeout to give it time to
> acquire it.
> > >     > +              */
> > >     > +             data->select_timeout = SELECT_DELAY_LONG * 2;
> > >     > +
> > >     > +             return 0;
> > >     > +     }
> > >     > +
> > >     > +     if (pca9641_lock_grant(reg_ctl)) {
> > >     > +             /*
> > >     > +              * Bus is on, and we own it. We are done with
> acquisition.
> > >     > +              */
> > >     > +             reg_ctl |= PCA9641_CTL_BUS_CONNECT |
> PCA9641_CTL_LOCK_REQ;
> > >     > +             pca9541_reg_write(client, PCA9641_CONTROL,
> reg_ctl);
> > >     > +
> > >     > +             return 1;
> > >     > +     }
> > >     > +
> > >     > +     if (pca9641_other_lock(reg_sts)) {
> > >     > +             /*
> > >     > +              * Other master owns the bus.
> > >     > +              * If arbitration timeout has expired, force
> ownership.
> > >     > +              * Otherwise request it.
> > >
> > >     This comment is stale. Reading the data sheet, I find no way to
> force
> > >     ownership with the PCA9641 (as indicated above in the release_bus
> > >     review comment). But I have only browsed the data sheet so I could
> > >     easily be mistaken...
> > >
> > >     [time passes]
> > >
> > >     Ahhh, wait, it could reset the chip to get a new chance to get
> ownership.
> > >     But that will reset all registers for the other master as well,
> since I
> > >     read it as if the reset is chip-global and not master-local with
> minimal
> > >     effects on the other master. So, a big hammer indeed.
> > >
> > >     Cheers,
> > >     Peter
> > >
> > >     > +              */
> > >     > +             data->select_timeout = SELECT_DELAY_LONG;
> > >     > +             reg_ctl |= PCA9641_CTL_LOCK_REQ;
> > >     > +             pca9541_reg_write(client, PCA9641_CONTROL,
> reg_ctl);
> > >     > +     }
> > >     > +
> > >     > +     return 0;
> > >     > +}
> > >     > +
> > >     >  static int pca9541_select_chan(struct i2c_mux_core *muxc, u32
> chan)
> > >     >  {
> > >     >       struct pca9541 *data = i2c_mux_priv(muxc);
> > >     > @@ -295,10 +418,15 @@ static const struct chip_desc chips[] = {
> > >     >               .arbitrate = pca9541_arbitrate,
> > >     >               .release_bus = pca9541_release_bus,
> > >     >       },
> > >     > +     [pca9641] = {
> > >     > +             .arbitrate = pca9641_arbitrate,
> > >     > +             .release_bus = pca9641_release_bus,
> > >     > +     },
> > >     >  };
> > >     >
> > >     >  static const struct i2c_device_id pca9541_id[] = {
> > >     >       { "pca9541", pca9541 },
> > >     > +     { "pca9641", pca9641 },
> > >     >       {}
> > >     >  };
> > >     >
> > >     > @@ -307,6 +435,7 @@ MODULE_DEVICE_TABLE(i2c, pca9541_id);
> > >     >  #ifdef CONFIG_OF
> > >     >  static const struct of_device_id pca9541_of_match[] = {
> > >     >       { .compatible = "nxp,pca9541", .data = &chips[pca9541] },
> > >     > +     { .compatible = "nxp,pca9641", .data = &chips[pca9641] },
> > >     >       {}
> > >     >  };
> > >     >  MODULE_DEVICE_TABLE(of, pca9541_of_match);
> > >     > @@ -392,5 +521,5 @@ static struct i2c_driver pca9541_driver = {
> > >     >  module_i2c_driver(pca9541_driver);
> > >     >
> > >     >  MODULE_AUTHOR("Guenter Roeck <linux@roeck-us.net <mailto:
> linux@roeck-us.net>>");
> > >     > -MODULE_DESCRIPTION("PCA9541 I2C master selector driver");
> > >     > +MODULE_DESCRIPTION("PCA9541/PCA9641 I2C master selector
> driver");
> > >     >  MODULE_LICENSE("GPL v2");
> > >     >
> > >
> >
>

--0000000000004a7fff058a0c2126
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Finally, I got some cycles to test the patches on a Celest=
ica seastone switch which has the PCA 9541 mux. I have attached a rough ske=
tch of the I2C mux tree. I tested by accessing the all the devices behind P=
CA9548 mux. There are 3 PCA 9548 mux devices behind PCA 9541. The test data=
 is attached to this email. I was able to read all Fan EEPROM data, lm74 se=
nsor data through smonctl as well as sensors command.=C2=A0<div><br></div><=
div>Thanks</div><div>Pradeep</div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 25, 2019 at 9:49 AM Guenter R=
oeck &lt;<a href=3D"mailto:linux@roeck-us.net">linux@roeck-us.net</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb=
(204,204,204);padding-left:1ex">On Mon, Mar 25, 2019 at 03:01:21PM +0000, P=
eter Rosin wrote:<br>
&gt; On 2019-03-22 20:38, Pradeep Srinivasan wrote:<br>
&gt; &gt; I have verified the changes on PCA 9541. May I know how you want =
the test results to be shared ? (newbie here; please bear with me)<br>
&gt; &gt; <br>
&gt; &gt; root@cumulus:/home/cumulus# dmesg| grep &quot;pca9541&quot; | gre=
p -v &quot;pmbus&quot;<br>
&gt; &gt; [ =C2=A0 =C2=A02.922288] pca9541 1-0070: registered master select=
or for I2C pca9541<br>
&gt; &gt; <br>
&gt; &gt; root@cumulus:/home/cumulus# cat /sys/class/i2c-dev/i2c-1/device/1=
-0070/name<br>
&gt; &gt; pca9541<br>
&gt; <br>
&gt; This only verifies that the probe works and that the chip is detected =
properly.<br>
&gt; It says nothing about if it works to communicate with whatever is beyo=
nd the<br>
&gt; PCA9541, and nothing on how the interaction with the &quot;alien&quot;=
 other master<br>
&gt; connected to the PCA9541 is working. I don&#39;t know how I want this =
to be tested,<br>
&gt; but if you have a setup with a PCA9541 / PCA9641 I would assume that y=
ou<br>
&gt; have some kind of need for those chips and that you at least could rep=
ort<br>
&gt; if basic xfers through them are working? I don&#39;t need to see actua=
l commands<br>
&gt; that you have executed, I&#39;m much more interested in some summary o=
f what<br>
&gt; you did and what worked (or not).<br>
&gt; <br>
&gt; E.g. if you have an eeprom beyond the master selector, you could read =
from<br>
&gt; it in a loop while doing something else from the alien master and chec=
k if<br>
&gt; it all works as expected? Perhaps try to verify timing if there are st=
alls<br>
&gt; and/or timeouts etc. Go wild! But if you don&#39;t know how or don&#39=
;t have the<br>
<br>
Something like that is what I did to test the original implementation: Acce=
ss<br>
all chips behind the mux from both ends continuously. Let that run for an h=
our<br>
or so and declare it a success if there is no error. Usually, while the cod=
e<br>
was still buggy, errors would show up within minutes, if not seconds.<br>
<br>
Guenter<br>
<br>
&gt; time, I&#39;d be happy with a report on basic functionality (but a lit=
tle bit<br>
&gt; more than probe-ok would be nice though), because the code affecting t=
he<br>
&gt; PCA9541 is probably not broken subtly, it either works as it did befor=
e or<br>
&gt; it doesn&#39;t work at all. And any problem with the PCA9641 side of t=
hings<br>
&gt; will not be a regression and therefore not a big problem...<br>
&gt; <br>
&gt; Cheers,<br>
&gt; Peter<br>
&gt; <br>
&gt; &gt; I need to do the same on PCA 9641. If the above is sufficient, I =
will grab a switch with PCA 9641 and check if the driver works .<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; Thanks<br>
&gt; &gt; Pradeep<br>
&gt; &gt; <br>
&gt; &gt; On Thu, Mar 7, 2019 at 1:16 PM Peter Rosin &lt;<a href=3D"mailto:=
peda@axentia.se" target=3D"_blank">peda@axentia.se</a> &lt;mailto:<a href=
=3D"mailto:peda@axentia.se" target=3D"_blank">peda@axentia.se</a>&gt;&gt; w=
rote:<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Hi!<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0I should have read Kens code more carefully, b=
efore signing off on it...<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Review comments inline...<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0On 2019-03-07 00:15, Peter Rosin wrote:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; Heavily based on code from Ken Chen &lt;<=
a href=3D"mailto:chen.kenyy@inventec.com" target=3D"_blank">chen.kenyy@inve=
ntec.com</a> &lt;mailto:<a href=3D"mailto:chen.kenyy@inventec.com" target=
=3D"_blank">chen.kenyy@inventec.com</a>&gt;&gt;.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: Peter Rosin &lt;<a href=3D=
"mailto:peda@axentia.se" target=3D"_blank">peda@axentia.se</a> &lt;mailto:<=
a href=3D"mailto:peda@axentia.se" target=3D"_blank">peda@axentia.se</a>&gt;=
&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 drivers/i2c/muxes/Kconfig=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 drivers/i2c/muxes/i2c-mux-pca9541.c=
 | 137 ++++++++++++++++++++++++++++++++++--<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 2 files changed, 136 insertions(+),=
 7 deletions(-)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; diff --git a/drivers/i2c/muxes/Kconfig b/=
drivers/i2c/muxes/Kconfig<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; index 52a4a922e7e6..8532841de5db 100644<b=
r>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; --- a/drivers/i2c/muxes/Kconfig<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +++ b/drivers/i2c/muxes/Kconfig<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -55,10 +55,10 @@ config I2C_MUX_LTC430=
6<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0will be =
called i2c-mux-ltc4306.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 config I2C_MUX_PCA9541<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; -=C2=A0 =C2=A0 =C2=A0tristate &quot;NXP P=
CA9541 I2C Master Selector&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0tristate &quot;NXP P=
CA9541/PCA9641 I2C Master Selectors&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0If you say ye=
s here you get support for the NXP PCA9541<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0I2C Master Se=
lector.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0If you say ye=
s here you get support for the NXP PCA9541/PCA9641<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0I2C Master Se=
lectors.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This dri=
ver can also be built as a module.=C2=A0 If so, the module<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0will be =
called i2c-mux-pca9541.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; diff --git a/drivers/i2c/muxes/i2c-mux-pc=
a9541.c b/drivers/i2c/muxes/i2c-mux-pca9541.c<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; index 5eb36e3223d5..5d4e0c92e978 100644<b=
r>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; --- a/drivers/i2c/muxes/i2c-mux-pca9541.c=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +++ b/drivers/i2c/muxes/i2c-mux-pca9541.c=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -1,5 +1,5 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 /*<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; - * I2C multiplexer driver for PCA9541 bu=
s master selector<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; + * I2C multiplexer driver for PCA9541/PC=
A9641 bus master selectors<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0*<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0* Copyright (c) 2010 Ericsson=
 AB.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0*<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -28,8 +28,8 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 #include &lt;linux/slab.h&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 /*<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; - * The PCA9541 is a bus master selector.=
 It supports two I2C masters connected<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; - * to a single slave bus.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; + * The PCA9541 and PCA9641 are bus maste=
r selector. They support two I2C masters<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; + * connected to a single slave bus.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0*<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0* Before each bus transaction=
, a master has to acquire bus ownership. After the<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0* transaction is complete, bu=
s ownership has to be released. This fits well<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -63,6 +63,33 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 #define PCA9541_BUSON=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 (PCA9541_CTL_BUSON | PCA9541_CTL_NBUSON)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 #define PCA9541_MYBUS=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 (PCA9541_CTL_MYBUS | PCA9541_CTL_NMYBUS)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define PCA9641_ID=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x00<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define PCA9641_ID_MAGIC=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x38<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define PCA9641_CONTROL=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define PCA9641_STATUS=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x02<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define PCA9641_TIME=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x03<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define PCA9641_CTL_LOCK_REQ=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0BIT(0)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define PCA9641_CTL_LOCK_GRANT=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(1)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define PCA9641_CTL_BUS_CONNECT=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(2)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define PCA9641_CTL_BUS_INIT=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0BIT(3)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define PCA9641_CTL_SMBUS_SWRST=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(4)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define PCA9641_CTL_IDLE_TIMER_DIS=C2=A0=
 =C2=A0BIT(5)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define PCA9641_CTL_SMBUS_DIS=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(6)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define PCA9641_CTL_PRIORITY=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0BIT(7)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define PCA9641_STS_OTHER_LOCK=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(0)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define PCA9641_STS_BUS_INIT_FAIL=C2=A0 =
=C2=A0 BIT(1)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define PCA9641_STS_BUS_HUNG=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0BIT(2)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define PCA9641_STS_MBOX_EMPTY=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(3)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define PCA9641_STS_MBOX_FULL=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(4)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define PCA9641_STS_TEST_INT=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0BIT(5)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define PCA9641_STS_SCL_IO=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(6)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define PCA9641_STS_SDA_IO=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(7)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define PCA9641_RES_TIME=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x03<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0This appears to be the same thing as PCA9641_T=
IME above. The<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0register is called PCA9641_RT in my data sheet=
.<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 /* arbitration timeouts, in jiffies=
 */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 #define ARB_TIMEOUT=C2=A0 (HZ / 8)=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* 125 ms until forcing bus ownership */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 #define ARB2_TIMEOUT (HZ / 4)=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 /* 250 ms until acquisition failure */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -73,6 +100,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 enum chip_name {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pca9541,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0pca9641,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 };<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 struct chip_desc {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -102,6 +130,21 @@ static bool pca9541_=
busoff(int ctl)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return (ctl &am=
p; PCA9541_BUSON) =3D=3D PCA9541_BUSON;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 }<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +static bool pca9641_lock_grant(int ctl)<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +{<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0return !!(ctl &amp; =
PCA9641_CTL_LOCK_GRANT);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +}<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +static bool pca9641_other_lock(int sts)<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +{<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0return !!(sts &amp; =
PCA9641_STS_OTHER_LOCK);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +}<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +static bool pca9641_busoff(int ctl, int =
sts)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +{<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0return !pca9641_lock=
_grant(ctl) &amp;&amp; !pca9641_other_lock(sts);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +}<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 /*<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0* Write to chip register. Don=
&#39;t use i2c_transfer()/i2c_smbus_xfer()<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0* as they will try to lock th=
e adapter a second time.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -256,6 +299,86 @@ static int pca9541_a=
rbitrate(struct i2c_client *client)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 }<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +/* Release bus. */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +static void pca9641_release_bus(struct i=
2c_client *client)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +{<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0pca9541_reg_write(cl=
ient, PCA9641_CONTROL, 0);<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Should this release bus function really &quot;=
clobber&quot; the control bits<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0PCA9641_CTL_IDLE_TIMER_DIS, PCA9641_CTL_SMBUS_=
DIS, PCA9641_CTL_PRIORITY?<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Yes yes, the driver never sets these bits so t=
hey are likely zero. But<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0the driver doesn&#39;t reset the chip either, =
so some bootstrap code might<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0have configured those bits...<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Also related to bus release, since the driver =
does not touch the<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0reserve time register, and then clears the abo=
ve bits, the only way<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0to release the bus is if everything continues =
to work and the above<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0pca9641_release_bus is in fact happening. But =
if the kernel crashes<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0while hogging the bus, and fails to come up, t=
hen the other master<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0has no way of stealing the ownership. I really=
 feel that the driver<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0should make use of the timers so that the arbi=
ter releases the bus<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0automatically on catastrophic failure. But may=
be I plain and simple<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0just misunderstand the datasheet?<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +}<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +/*<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; + * Channel arbitration<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; + *<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; + * Return values:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; + *=C2=A0 &lt;0: error<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; + *=C2=A0 0 : bus not acquired<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; + *=C2=A0 1 : bus acquired<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; + */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +static int pca9641_arbitrate(struct i2c_=
client *client)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +{<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0struct i2c_mux_core =
*muxc =3D i2c_get_clientdata(client);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0struct pca9541 *data=
 =3D i2c_mux_priv(muxc);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0int reg_ctl, reg_sts=
;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0reg_ctl =3D pca9541_=
reg_read(client, PCA9641_CONTROL);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0if (reg_ctl &lt; 0)<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return reg_ctl;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0reg_sts =3D pca9541_=
reg_read(client, PCA9641_STATUS);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0if (pca9641_busoff(r=
eg_ctl, reg_sts)) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/*<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * Bus is off. Request ownership or turn it on unless<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * other master requested ownership.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0reg_ctl |=3D PCA9641_CTL_LOCK_REQ;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pca9541_reg_write(client, PCA9641_CONTROL, reg_ctl);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0reg_ctl =3D pca9541_reg_read(client, PCA9641_CONTROL);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (pca9641_lock_grant(reg_ctl)) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Other master did not request owner=
ship,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * or arbitration timeout expired. Ta=
ke the bus.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_ctl |=3D PCA9641_CTL_BUS_CONNECT =
|<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PCA9641_C=
TL_LOCK_REQ;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pca9541_reg_write(client, PCA9641_CON=
TROL, reg_ctl);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;select_timeout =3D SELECT_DE=
LAY_SHORT;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/*<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * Other master requested ownership.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * Set extra long timeout to give it time to acquire it.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0data-&gt;select_timeout =3D SELECT_DELAY_LONG * 2;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return 0;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0if (pca9641_lock_gra=
nt(reg_ctl)) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/*<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * Bus is on, and we own it. We are done with acquisition.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0reg_ctl |=3D PCA9641_CTL_BUS_CONNECT | PCA9641_CTL_LOCK_REQ;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pca9541_reg_write(client, PCA9641_CONTROL, reg_ctl);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return 1;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0if (pca9641_other_lo=
ck(reg_sts)) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/*<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * Other master owns the bus.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * If arbitration timeout has expired, force ownership.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * Otherwise request it.<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0This comment is stale. Reading the data sheet,=
 I find no way to force<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0ownership with the PCA9641 (as indicated above=
 in the release_bus<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0review comment). But I have only browsed the d=
ata sheet so I could<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0easily be mistaken...<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0[time passes]<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Ahhh, wait, it could reset the chip to get a n=
ew chance to get ownership.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0But that will reset all registers for the othe=
r master as well, since I<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0read it as if the reset is chip-global and not=
 master-local with minimal<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0effects on the other master. So, a big hammer =
indeed.<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Cheers,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Peter<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0data-&gt;select_timeout =3D SELECT_DELAY_LONG;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0reg_ctl |=3D PCA9641_CTL_LOCK_REQ;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pca9541_reg_write(client, PCA9641_CONTROL, reg_ctl);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +}<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 static int pca9541_select_chan(stru=
ct i2c_mux_core *muxc, u32 chan)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pca9541 =
*data =3D i2c_mux_priv(muxc);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -295,10 +418,15 @@ static const struct=
 chip_desc chips[] =3D {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0.arbitrate =3D pca9541_arbitrate,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0.release_bus =3D pca9541_release_bus,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0[pca9641] =3D {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0.arbitrate =3D pca9641_arbitrate,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0.release_bus =3D pca9641_release_bus,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 };<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 static const struct i2c_device_id p=
ca9541_id[] =3D {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;pca9541=
&quot;, pca9541 },<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0{ &quot;pca9641&quot=
;, pca9641 },<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{}<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 };<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -307,6 +435,7 @@ MODULE_DEVICE_TABLE(i=
2c, pca9541_id);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 #ifdef CONFIG_OF<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 static const struct of_device_id pc=
a9541_of_match[] =3D {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =
=3D &quot;nxp,pca9541&quot;, .data =3D &amp;chips[pca9541] },<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0{ .compatible =3D &q=
uot;nxp,pca9641&quot;, .data =3D &amp;chips[pca9641] },<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{}<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 };<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 MODULE_DEVICE_TABLE(of, pca9541_of_=
match);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -392,5 +521,5 @@ static struct i2c_dri=
ver pca9541_driver =3D {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 module_i2c_driver(pca9541_driver);<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 MODULE_AUTHOR(&quot;Guenter Roeck &=
lt;<a href=3D"mailto:linux@roeck-us.net" target=3D"_blank">linux@roeck-us.n=
et</a> &lt;mailto:<a href=3D"mailto:linux@roeck-us.net" target=3D"_blank">l=
inux@roeck-us.net</a>&gt;&gt;&quot;);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; -MODULE_DESCRIPTION(&quot;PCA9541 I2C mas=
ter selector driver&quot;);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +MODULE_DESCRIPTION(&quot;PCA9541/PCA9641=
 I2C master selector driver&quot;);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 MODULE_LICENSE(&quot;GPL v2&quot;);=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt; <br>
&gt; <br>
</blockquote></div>

--0000000000004a7fff058a0c2126--

--0000000000004a8003058a0c2128
Content-Type: text/plain; charset="US-ASCII"; name="smonctl.txt"
Content-Disposition: attachment; filename="smonctl.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_jw9napw00>
X-Attachment-Id: f_jw9napw00

RmFuMUluKEZhbjEgSW5sZXQpOiAgT0sKZmFuOjExNTk5IFJQTSAgIChtYXggPSAyMzAwMCBSUE0s
IG1pbiA9IDUzMDAgUlBNLCBsaW1pdF92YXJpYW5jZSA9IDE1JSkKCkZhbjFPdXQoRmFuMSBPdXRs
ZXQpOiAgT0sKZmFuOjExMjM0IFJQTSAgIChtYXggPSAyMzAwMCBSUE0sIG1pbiA9IDUzMDAgUlBN
LCBsaW1pdF92YXJpYW5jZSA9IDE1JSkKCkZhbjJJbihGYW4yIElubGV0KTogIE9LCmZhbjoxMTU2
NSBSUE0gICAobWF4ID0gMjMwMDAgUlBNLCBtaW4gPSA1MzAwIFJQTSwgbGltaXRfdmFyaWFuY2Ug
PSAxNSUpCgpGYW4yT3V0KEZhbjIgT3V0bGV0KTogIE9LCmZhbjoxMTIzNCBSUE0gICAobWF4ID0g
MjMwMDAgUlBNLCBtaW4gPSA1MzAwIFJQTSwgbGltaXRfdmFyaWFuY2UgPSAxNSUpCgpGYW4zSW4o
RmFuMyBJbmxldCk6ICBPSwpmYW46MTE1NjUgUlBNICAgKG1heCA9IDIzMDAwIFJQTSwgbWluID0g
NTMwMCBSUE0sIGxpbWl0X3ZhcmlhbmNlID0gMTUlKQoKRmFuM091dChGYW4zIE91dGxldCk6ICBP
SwpmYW46MTEyMzQgUlBNICAgKG1heCA9IDIzMDAwIFJQTSwgbWluID0gNTMwMCBSUE0sIGxpbWl0
X3ZhcmlhbmNlID0gMTUlKQoKRmFuNEluKEZhbjQgSW5sZXQpOiAgT0sKZmFuOjExNTMxIFJQTSAg
IChtYXggPSAyMzAwMCBSUE0sIG1pbiA9IDUzMDAgUlBNLCBsaW1pdF92YXJpYW5jZSA9IDE1JSkK
CkZhbjRPdXQoRmFuNCBPdXRsZXQpOiAgT0sKZmFuOjExMjM0IFJQTSAgIChtYXggPSAyMzAwMCBS
UE0sIG1pbiA9IDUzMDAgUlBNLCBsaW1pdF92YXJpYW5jZSA9IDE1JSkKCkZhbjVJbihGYW41IElu
bGV0KTogIE9LCmZhbjoxMTQ5NyBSUE0gICAobWF4ID0gMjMwMDAgUlBNLCBtaW4gPSA1MzAwIFJQ
TSwgbGltaXRfdmFyaWFuY2UgPSAxNSUpCgpGYW41T3V0KEZhbjUgT3V0bGV0KTogIE9LCmZhbjox
MTIwMiBSUE0gICAobWF4ID0gMjMwMDAgUlBNLCBtaW4gPSA1MzAwIFJQTSwgbGltaXRfdmFyaWFu
Y2UgPSAxNSUpCgpQU1UxRmFuKFBTVTEgRmFuKTogIE9LCmZhbjo3NDg4IFJQTSAgIChtYXggPSAx
ODAwMCBSUE0sIG1pbiA9IDQ3MDAgUlBNLCBsaW1pdF92YXJpYW5jZSA9IDE1JSkKClBTVTE6ICBP
SwoKUFNVMkZhbihQU1UyIEZhbik6ICBBQlNFTlQKClBTVTI6ICBCQUQKClBTVTFUZW1wMShQU1Ux
IElubGV0IFRlbXAgU2Vuc29yKTogIE9LCnRlbXA6MzYuMCBDIChsY3JpdCA9IDAgQywgZmFuX21h
eCA9IDYwIEMsIGZhbl9taW4gPSAyNSBDLCBtaW4gPSA1IEMsIG1heCA9IDYwIEMsIGNyaXQgPSAx
MDAgQykKClBTVTFUZW1wMihQU1UxIEhlYXRzaW5rIFRlbXAgU2Vuc29yKTogIE9LCnRlbXA6NDYu
MCBDIChsY3JpdCA9IDAgQywgZmFuX21heCA9IDYwIEMsIGZhbl9taW4gPSAyNSBDLCBtaW4gPSA1
IEMsIG1heCA9IDYwIEMsIGNyaXQgPSAxMDAgQykKClBTVTJUZW1wMShQU1UyIElubGV0IFRlbXAg
U2Vuc29yKTogIEFCU0VOVAoKUFNVMlRlbXAyKFBTVTIgSGVhdHNpbmsgVGVtcCBTZW5zb3IpOiAg
QUJTRU5UCgpUZW1wMShJbnRlbCBDb3JlIDAgVGVtcCBTZW5zb3IpOiAgT0sKdGVtcDoxOS4wIEMg
KGxjcml0ID0gMCBDLCBmYW5fbWF4ID0gOTAgQywgZmFuX21pbiA9IDI1IEMsIG1pbiA9IDUgQywg
bWF4ID0gOTAgQywgY3JpdCA9IDk4IEMpCgpUZW1wMihJbnRlbCBDb3JlIDEgVGVtcCBTZW5zb3Ip
OiAgT0sKdGVtcDoxOS4wIEMgKGxjcml0ID0gMCBDLCBmYW5fbWF4ID0gOTAgQywgZmFuX21pbiA9
IDI1IEMsIG1pbiA9IDUgQywgbWF4ID0gOTAgQywgY3JpdCA9IDk4IEMpCgpUZW1wMyhJbnRlbCBD
b3JlIDIgVGVtcCBTZW5zb3IpOiAgT0sKdGVtcDoxOS4wIEMgKGxjcml0ID0gMCBDLCBmYW5fbWF4
ID0gOTAgQywgZmFuX21pbiA9IDI1IEMsIG1pbiA9IDUgQywgbWF4ID0gOTAgQywgY3JpdCA9IDk4
IEMpCgpUZW1wNChJbnRlbCBDb3JlIDMgVGVtcCBTZW5zb3IpOiAgT0sKdGVtcDoxOS4wIEMgKGxj
cml0ID0gMCBDLCBmYW5fbWF4ID0gOTAgQywgZmFuX21pbiA9IDI1IEMsIG1pbiA9IDUgQywgbWF4
ID0gOTAgQywgY3JpdCA9IDk4IEMpCgpUZW1wNShJbnRlbCBDUFUgZXh0ZXJuYWwgc2Vuc29yIDEp
OiAgT0sKdGVtcDozMC4wIEMgKGxjcml0ID0gMCBDLCBmYW5fbWF4ID0gNjUgQywgZmFuX21pbiA9
IDI1IEMsIG1pbiA9IDUgQywgbWF4ID0gNjUgQywgY3JpdCA9IDcwIEMpCgpUZW1wNihJbnRlbCBD
UFUgZXh0ZXJuYWwgc2Vuc29yIDIpOiAgT0sKdGVtcDozMS4wIEMgKGxjcml0ID0gMCBDLCBmYW5f
bWF4ID0gNjUgQywgZmFuX21pbiA9IDI1IEMsIG1pbiA9IDUgQywgbWF4ID0gNjUgQywgY3JpdCA9
IDcwIEMpCgpUZW1wNyhSZWFyIE91dGxldCBBaXIgc2Vuc29yKTogIE9LCnRlbXA6MzIuNSBDIChs
Y3JpdCA9IC0xNSBDLCBmYW5fbWF4ID0gNDggQywgZmFuX21pbiA9IDI1IEMsIG1pbiA9IC0xMCBD
LCBtYXggPSA0OCBDLCBjcml0ID0gNjAgQykKClRlbXA4KEZyb250IE91dGxldCBBaXIgc2Vuc29y
KTogIE9LCnRlbXA6MzAuNSBDIChsY3JpdCA9IC0xNSBDLCBmYW5fbWF4ID0gNDggQywgZmFuX21p
biA9IDI1IEMsIG1pbiA9IC0xMCBDLCBtYXggPSA0OCBDLCBjcml0ID0gNjAgQykKClRlbXA5KFRl
bXAgU2Vuc29yIGNsb3NlIHRvIE5ldHdvcmtpbmcgQVNJQyk6ICBPSwp0ZW1wOjM3LjUgQyAobGNy
aXQgPSAwIEMsIGZhbl9tYXggPSA3NSBDLCBmYW5fbWluID0gMjUgQywgbWluID0gNSBDLCBtYXgg
PSA3NSBDLCBjcml0ID0gODAgQykKClRlbXAxMChESU1NIDEgVGVtcCBTZW5zb3IpOiAgT0sKdGVt
cDozMS44IEMgKGxjcml0ID0gMCBDLCBmYW5fbWF4ID0gOTAgQywgZmFuX21pbiA9IDI1IEMsIG1p
biA9IDUgQywgbWF4ID0gOTAgQywgY3JpdCA9IDk1IEMpCgpUZW1wMTEoTmV0d29ya2luZyBBU0lD
IERpZSBUZW1wIFNlbnNvcik6ICBPSwp0ZW1wOjU0LjAgQyAobGNyaXQgPSAwIEMsIGZhbl9tYXgg
PSAxMDUgQywgZmFuX21pbiA9IDI1IEMsIG1pbiA9IDUgQywgbWF4ID0gMTA1IEMsIGNyaXQgPSAx
MTAgQykKClRlbXAxMihOZXR3b3JraW5nIEFTSUMgRGllIFRlbXAgU2Vuc29yKTogIE9LCnRlbXA6
NTQuNSBDIChsY3JpdCA9IDAgQywgZmFuX21heCA9IDEwNSBDLCBmYW5fbWluID0gMjUgQywgbWlu
ID0gNSBDLCBtYXggPSAxMDUgQywgY3JpdCA9IDExMCBDKQoKVGVtcDEzKE5ldHdvcmtpbmcgQVNJ
QyBEaWUgVGVtcCBTZW5zb3IpOiAgT0sKdGVtcDo1NC41IEMgKGxjcml0ID0gMCBDLCBmYW5fbWF4
ID0gMTA1IEMsIGZhbl9taW4gPSAyNSBDLCBtaW4gPSA1IEMsIG1heCA9IDEwNSBDLCBjcml0ID0g
MTEwIEMpCgpUZW1wMTQoTmV0d29ya2luZyBBU0lDIERpZSBUZW1wIFNlbnNvcik6ICBPSwp0ZW1w
OjU1LjkgQyAobGNyaXQgPSAwIEMsIGZhbl9tYXggPSAxMDUgQywgZmFuX21pbiA9IDI1IEMsIG1p
biA9IDUgQywgbWF4ID0gMTA1IEMsIGNyaXQgPSAxMTAgQykKClRlbXAxNShOZXR3b3JraW5nIEFT
SUMgRGllIFRlbXAgU2Vuc29yKTogIE9LCnRlbXA6NTQuMCBDIChsY3JpdCA9IDAgQywgZmFuX21h
eCA9IDEwNSBDLCBmYW5fbWluID0gMjUgQywgbWluID0gNSBDLCBtYXggPSAxMDUgQywgY3JpdCA9
IDExMCBDKQoKVGVtcDE2KE5ldHdvcmtpbmcgQVNJQyBEaWUgVGVtcCBTZW5zb3IpOiAgT0sKdGVt
cDo1Ni40IEMgKGxjcml0ID0gMCBDLCBmYW5fbWF4ID0gMTA1IEMsIGZhbl9taW4gPSAyNSBDLCBt
aW4gPSA1IEMsIG1heCA9IDEwNSBDLCBjcml0ID0gMTEwIEMpCgpUZW1wMTcoTmV0d29ya2luZyBB
U0lDIERpZSBUZW1wIFNlbnNvcik6ICBPSwp0ZW1wOjU1LjUgQyAobGNyaXQgPSAwIEMsIGZhbl9t
YXggPSAxMDUgQywgZmFuX21pbiA9IDI1IEMsIG1pbiA9IDUgQywgbWF4ID0gMTA1IEMsIGNyaXQg
PSAxMTAgQykKClRlbXAxOChOZXR3b3JraW5nIEFTSUMgRGllIFRlbXAgU2Vuc29yKTogIE9LCnRl
bXA6NTUuMCBDIChsY3JpdCA9IDAgQywgZmFuX21heCA9IDEwNSBDLCBmYW5fbWluID0gMjUgQywg
bWluID0gNSBDLCBtYXggPSAxMDUgQywgY3JpdCA9IDExMCBDKQoKTWVzc2FnZXM6ClBTVTI6ICBz
dGF0dXMgaXMgYWxsX25vdF9vaywgaW5zdGFsbGVkCgo=
--0000000000004a8003058a0c2128
Content-Type: text/plain; charset="UTF-8"; name="sensors-data.txt"
Content-Disposition: attachment; filename="sensors-data.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_jw9nawjy1>
X-Attachment-Id: f_jw9nawjy1

ZW1jMjMwNS1pMmMtMTMtNGQKQWRhcHRlcjogaTJjLTktbXV4IChjaGFuX2lkIDMpCmZhbjE6ICAg
ICAgICAxMTI2NiBSUE0gIChkaXYgPSA0KQpmYW4yOiAgICAgICAgMTEyMzQgUlBNICAoZGl2ID0g
NCkKZmFuMzogICAgICAgIDExMTcwIFJQTSAgKGRpdiA9IDQpCmZhbjQ6ICAgICAgICAxMTMzMSBS
UE0gIChkaXYgPSA0KQpmYW41OiAgICAgICAgMTEyNjYgUlBNICAoZGl2ID0gNCkKCmNvcmV0ZW1w
LWlzYS0wMDAwCkFkYXB0ZXI6IElTQSBhZGFwdGVyCkludGVsIGNvcmUgMCB0ZW1wOiAgKzE5LjDC
sEMgIChoaWdoID0gKzk4LjDCsEMsIGNyaXQgPSArOTguMMKwQykKSW50ZWwgY29yZSAxIHRlbXA6
ICArMTkuMMKwQyAgKGhpZ2ggPSArOTguMMKwQywgY3JpdCA9ICs5OC4wwrBDKQpJbnRlbCBjb3Jl
IDIgdGVtcDogICsxOS4wwrBDICAoaGlnaCA9ICs5OC4wwrBDLCBjcml0ID0gKzk4LjDCsEMpCklu
dGVsIGNvcmUgMyB0ZW1wOiAgKzE5LjDCsEMgIChoaWdoID0gKzk4LjDCsEMsIGNyaXQgPSArOTgu
MMKwQykKCmRwczQ2MC1pMmMtMTEtNWIKQWRhcHRlcjogaTJjLTktbXV4IChjaGFuX2lkIDEpCnZp
bjogICAgICAgICAgKzAuMDAgViAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFM
QVJNCnZjYXA6ICAgICAgICAgLTAuNTAgViAgCnZvdXQxOiAgICAgICAgKzAuMDAgViAgKGNyaXQg
bWluID0gKzEwLjQwIFYsIGNyaXQgbWF4ID0gKzE0LjIwIFYpCmZhbjE6ICAgICAgICAgICAwIFJQ
TQp0ZW1wMTogICAgICAgICsyOC4wwrBDICAoaGlnaCA9ICs5MC4wwrBDKQp0ZW1wMjogICAgICAg
ICsyOC4wwrBDICAoaGlnaCA9ICs5MC4wwrBDKQp0ZW1wMzogICAgICAgICsyOC4wwrBDICAoaGln
aCA9ICs5MC4wwrBDKQpwaW46ICAgICAgICAgICAwLjAwIFcgIChtYXggPSAgIDEuMTUga1cpCnBv
dXQxOiAgICAgICAgIDAuMDAgVyAgKG1heCA9IDkwMC4wMCBXLCBjcml0ID0gICAxLjEwIGtXKQpp
aW46ICAgICAgICAgICswLjAwIEEgIChtYXggPSAgKzYuMDAgQSwgY3JpdCBtYXggPSAgKzcuMDAg
QSkKaW91dDE6ICAgICAgICArMC4wMCBBICAobWF4ID0gKzc2LjAwIEEsIGNyaXQgbWF4ID0gKzgw
LjAwIEEpCgpsbTc1LWkyYy0yNC00OQpBZGFwdGVyOiBpMmMtOS1tdXggKGNoYW5faWQgNCkKdGVt
cDE6ICAgICAgICArMzIuNcKwQyAgKGhpZ2ggPSArNDguMMKwQywgaHlzdCA9ICs0OC4wwrBDKQoK
bG03NS1pMmMtMTUtNGUKQWRhcHRlcjogaTJjLTktbXV4IChjaGFuX2lkIDUpCnRlbXAxOiAgICAg
ICAgKzMwLjXCsEMgIChoaWdoID0gKzQ4LjDCsEMsIGh5c3QgPSArNDguMMKwQykKCmpjNDItaTJj
LTAtMTgKQWRhcHRlcjogU01CdXMgSTgwMSBhZGFwdGVyIGF0IGYwMDAKdGVtcDE6ICAgICAgICAr
MzEuNcKwQyAgKGxvdyAgPSAgKzAuMMKwQykKICAgICAgICAgICAgICAgICAgICAgICAoaGlnaCA9
ICs5MC4wwrBDLCBoeXN0ID0gKzkwLjDCsEMpCiAgICAgICAgICAgICAgICAgICAgICAgKGNyaXQg
PSArOTUuMMKwQywgaHlzdCA9ICs5NS4wwrBDKQoKZHBzNDYwLWkyYy0xMC01YQpBZGFwdGVyOiBp
MmMtOS1tdXggKGNoYW5faWQgMCkKdmluOiAgICAgICAgICsyMDYuNTAgViAgCnZvdXQxOiAgICAg
ICArMTIuMDcgViAgKGNyaXQgbWluID0gKzEwLjQwIFYsIGNyaXQgbWF4ID0gKzE0LjIwIFYpCmZh
bjE6ICAgICAgICA3NDg4IFJQTQp0ZW1wMTogICAgICAgICszNi4wwrBDICAoaGlnaCA9ICs5MC4w
wrBDKQp0ZW1wMjogICAgICAgICs0Ni4wwrBDICAoaGlnaCA9ICs5MC4wwrBDKQp0ZW1wMzogICAg
ICAgICs0Mi4wwrBDICAoaGlnaCA9ICs5MC4wwrBDKQpwaW46ICAgICAgICAgMTQ3Ljc1IFcgICht
YXggPSAgIDEuMTUga1cpCnBvdXQxOiAgICAgICAxMzIuNzUgVyAgKG1heCA9IDkwMC4wMCBXLCBj
cml0ID0gICAxLjEwIGtXKQogICAgICAgICAgICAgICAgICAgICAgIChjYXAgPSAtNTAwLjAwIG1X
KQppaW46ICAgICAgICAgICswLjczIEEgIChtYXggPSAgKzYuMDAgQSwgY3JpdCBtYXggPSAgKzcu
MDAgQSkKaW91dDE6ICAgICAgICsxMS4xMSBBICAobWF4ID0gKzc2LjAwIEEsIGNyaXQgbWF4ID0g
KzgwLjAwIEEpCgplbWMyMzA1LWkyYy0xMy0yZQpBZGFwdGVyOiBpMmMtOS1tdXggKGNoYW5faWQg
MykKZmFuMTogICAgICAgIDExNDY0IFJQTSAgKGRpdiA9IDQpCmZhbjI6ICAgICAgICAxMTU5OSBS
UE0gIChkaXYgPSA0KQpmYW4zOiAgICAgICAgMTE1NjUgUlBNICAoZGl2ID0gNCkKZmFuNDogICAg
ICAgIDExNDY0IFJQTSAgKGRpdiA9IDQpCmZhbjU6ICAgICAgICAxMTYzMyBSUE0gIChkaXYgPSA0
KQoKbG03NS1pMmMtMjUtNGEKQWRhcHRlcjogaTJjLTktbXV4IChjaGFuX2lkIDUpCnRlbXAxOiAg
ICAgICAgKzM3LjDCsEMgIChoaWdoID0gKzgwLjDCsEMsIGh5c3QgPSArODAuMMKwQykKCmxtNzUt
aTJjLTIzLTQ4CkFkYXB0ZXI6IGkyYy05LW11eCAoY2hhbl9pZCAzKQp0ZW1wMTogICAgICAgICsz
MC41wrBDICAoaGlnaCA9ICs3MC4wwrBDLCBoeXN0ID0gKzcwLjDCsEMpCgpsbTc1LWkyYy0xNC00
OApBZGFwdGVyOiBpMmMtOS1tdXggKGNoYW5faWQgNCkKdGVtcDE6ICAgICAgICArMjkuNcKwQyAg
KGhpZ2ggPSArNzAuMMKwQywgaHlzdCA9ICs3MC4wwrBDKQoK
--0000000000004a8003058a0c2128
Content-Type: text/plain; charset="US-ASCII"; name="seastone-pca9541-test.txt"
Content-Disposition: attachment; filename="seastone-pca9541-test.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_jw9nb4e62>
X-Attachment-Id: f_jw9nb4e62

WyAgICAzLjM3NDgwNF0gcGNhOTU0MSAxLTAwNzA6IHJlZ2lzdGVyZWQgbWFzdGVyIHNlbGVjdG9y
IGZvciBJMkMgcGNhOTU0MQpbICAgIDMuMzgwMjQyXSBwY2E5NTR4IDktMDA3MzogcmVnaXN0ZXJl
ZCA4IG11bHRpcGxleGVkIGJ1c3NlcyBmb3IgSTJDIHN3aXRjaCBwY2E5NTQ4ClsgICAgMy40ODI3
NzBdIHBjYTk1NHggOS0wMDcxOiByZWdpc3RlcmVkIDggbXVsdGlwbGV4ZWQgYnVzc2VzIGZvciBJ
MkMgc3dpdGNoIHBjYTk1NDgKWyAgICAzLjQ4ODM5NF0gcGNhOTU0eCA5LTAwNzc6IHJlZ2lzdGVy
ZWQgOCBtdWx0aXBsZXhlZCBidXNzZXMgZm9yIEkyQyBzd2l0Y2ggcGNhOTU0OAoKcm9vdEBjZWwt
c2VhLTUxOi92YXIvdG1wIyBjYXQgL3N5cy9kZXZpY2VzL3BsYXRmb3JtL2NlbF9zZWFzdG9uZV9j
cGxkLjAvY3BsZDFfdmVyc2lvbgoxLjIKcm9vdEBjZWwtc2VhLTUxOi92YXIvdG1wIyBjYXQgL3N5
cy9kZXZpY2VzL3BsYXRmb3JtL2NlbF9zZWFzdG9uZV9jcGxkLjAvY3BsZDJfdmVyc2lvbgoyLjIK
cm9vdEBjZWwtc2VhLTUxOi92YXIvdG1wIyBjYXQgL3N5cy9kZXZpY2VzL3BsYXRmb3JtL2NlbF9z
ZWFzdG9uZV9jcGxkLjAvY3BsZDNfdmVyc2lvbgozLjIKcm9vdEBjZWwtc2VhLTUxOi92YXIvdG1w
IyBjYXQgL3N5cy9kZXZpY2VzL3BsYXRmb3JtL2NlbF9zZWFzdG9uZV9jcGxkLjAvY3BsZDRfdmVy
c2lvbgo0LjIKcm9vdEBjZWwtc2VhLTUxOi92YXIvdG1wIyBjYXQgL3N5cy9kZXZpY2VzL3BsYXRm
b3JtL2NlbF9zZWFzdG9uZV9jcGxkLjAvY3BsZDVfdmVyc2lvbgo1LjIKCnJvb3RAY2VsLXNlYS01
MTovdmFyL3RtcCMgY2F0IC9zeXMvZGV2aWNlcy9wbGF0Zm9ybS9jZWxfc2Vhc3RvbmVfY3BsZC4w
L2JvYXJkX3R5cGUKU2Vhc3RvbmUKCnJvb3RAY2VsLXNlYS01MTovdmFyL3RtcCMgY2F0IC9zeXMv
ZGV2aWNlcy9wbGF0Zm9ybS9jZWxfc2Vhc3RvbmVfY3BsZC4wL2xlZF9wc3UxCmdyZWVuCnJvb3RA
Y2VsLXNlYS01MTovdmFyL3RtcCMgY2F0IC9zeXMvZGV2aWNlcy9wbGF0Zm9ybS9jZWxfc2Vhc3Rv
bmVfY3BsZC4wL2xlZF9wc3UyCm9mZgoKCgpyb290QGNlbC1zZWEtNTE6L3Zhci90bXAjIGNhdCAv
c3lzL2J1cy9pMmMvZGV2aWNlcy8wLTAwNTAvZWVwcm9tX2Rldi9lZXByb20wL2xhYmVsCnNwZDFf
ZWVwcm9tCgpyb290QGNlbC1zZWEtNTE6L3Zhci90bXAjIGhkIC9zeXMvYnVzL2kyYy9kZXZpY2Vz
LzAtMDA1MC9lZXByb21fZGV2L2VlcHJvbTAvZGV2aWNlL2VlcHJvbQowMDAwMDAwMCAgOTIgMTEg
MGIgMDggMDQgMjEgMDIgMDEgIDBiIDExIDAxIDA4IDBhIDAwIGZjIDAwICB8Li4uLi4hLi4uLi4u
Li4uLnwKMDAwMDAwMTAgIDY5IDc4IDY5IDMwIDY5IDExIDE4IDgxICAyMCAwOCAzYyAzYyAwMCBm
MCA4MyAwMSAgfGl4aTBpLi4uIC48PC4uLi58CjAwMDAwMDIwICA4MCAwMCAwMCAwMCAwMCAwMCAw
MCAwMCAgMDAgODggMDAgMDAgMDAgMDAgMDAgMDAgIHwuLi4uLi4uLi4uLi4uLi4ufAowMDAwMDAz
MCAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgIDAwIDAwIDAwIDAwIDBmIDExIDIyIDAwICB8Li4u
Li4uLi4uLi4uLi4iLnwKMDAwMDAwNDAgIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAwMCAwMCAw
MCAwMCAwMCAwMCAwMCAwMCAgfC4uLi4uLi4uLi4uLi4uLi58CioKMDAwMDAwNzAgIDAwIDAwIDAw
IDAwIDAwIDg2IGYxIDAyICAxNiAyNCAwMCAwMCAwMCAwMCA2NyA1YiAgfC4uLi4uLi4uLiQuLi4u
Z1t8CjAwMDAwMDgwICA2OSAyZCA0NCA0OSA0ZCA0ZCAyMCAyMCAgMjAgMjAgMjAgMjAgMjAgMjAg
MjAgMjAgIHxpLURJTU0gICAgICAgICAgfAowMDAwMDA5MCAgMjAgMjAgMDAgMTAgODYgZjEgNDQg
NDMgIDQxIDMxIDJkIDMxIDM2IDMwIDM2IDMwICB8ICAuLi4uRENBMS0xNjA2MHwKMDAwMDAwYTAg
IDM3IDMwIDM1IDMyIDAwIDAwIDAwIDAwICAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAgfDcwNTIu
Li4uLi4uLi4uLi58CjAwMDAwMGIwICAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAgMDAgMDAgMDAg
MDAgMDAgMDAgMDAgMDAgIHwuLi4uLi4uLi4uLi4uLi4ufAoqCjAwMDAwMTAwCgoKcm9vdEBjZWwt
c2VhLTUxOi92YXIvdG1wIyBjYXQgL3N5cy9idXMvaTJjL2RldmljZXMvMTItMDA1MC9lZXByb21f
ZGV2L2VlcHJvbTMvbGFiZWwKYm9hcmRfZWVwcm9tCgpyb290QGNlbC1zZWEtNTE6L3Zhci90bXAj
IGNhdCAvc3lzL2J1cy9pMmMvZGV2aWNlcy8zMC0wMDUwL2VlcHJvbV9kZXYvZWVwcm9tNC9sYWJl
bApmYW4yX2VlcHJvbQoKcm9vdEBjZWwtc2VhLTUxOi92YXIvdG1wIyBoZCAvc3lzL2J1cy9pMmMv
ZGV2aWNlcy8zMC0wMDUwL2VlcHJvbQowMDAwMDAwMCAgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYg
IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmICB8Li4uLi4uLi4uLi4uLi4uLnwKKgowMDAwMDEwMAoK
CnJvb3RAY2VsLXNlYS01MTovdmFyL3RtcCMgY2F0IC9zeXMvYnVzL2kyYy9kZXZpY2VzLzMxLTAw
NTAvZWVwcm9tX2Rldi9lZXByb201L2xhYmVsCmZhbjFfZWVwcm9tCgpyb290QGNlbC1zZWEtNTE6
L3Zhci90bXAjIGhkIC9zeXMvYnVzL2kyYy9kZXZpY2VzLzMxLTAwNTAvZWVwcm9tCjAwMDAwMDAw
ICBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiAgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgIHwuLi4u
Li4uLi4uLi4uLi4ufAoqCjAwMDAwMTAwCgpyb290QGNlbC1zZWEtNTE6L3Zhci90bXAjIGNhdCAv
c3lzL2J1cy9pMmMvZGV2aWNlcy8zMi0wMDUwL2VlcHJvbV9kZXYvZWVwcm9tNi9sYWJlbApmYW41
X2VlcHJvbQoKcm9vdEBjZWwtc2VhLTUxOi92YXIvdG1wIyBoZCAvc3lzL2J1cy9pMmMvZGV2aWNl
cy8zMi0wMDUwL2VlcHJvbQowMDAwMDAwMCAgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgIGZmIGZm
IGZmIGZmIGZmIGZmIGZmIGZmICB8Li4uLi4uLi4uLi4uLi4uLnwKKgowMDAwMDEwMAoKcm9vdEBj
ZWwtc2VhLTUxOi92YXIvdG1wIyBjYXQgL3N5cy9idXMvaTJjL2RldmljZXMvMzMtMDA1MC9lZXBy
b21fZGV2L2VlcHJvbTcvbGFiZWwKZmFuM19lZXByb20Kcm9vdEBjZWwtc2VhLTUxOi92YXIvdG1w
IyBoZCAvc3lzL2J1cy9pMmMvZGV2aWNlcy8zMy0wMDUwL2VlcHJvbQowMDAwMDAwMCAgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgZmYgIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmICB8Li4uLi4uLi4uLi4u
Li4uLnwKKgowMDAwMDEwMAoKcm9vdEBjZWwtc2VhLTUxOi92YXIvdG1wIyBjYXQgL3N5cy9idXMv
aTJjL2RldmljZXMvMzQtMDA1MC9lZXByb21fZGV2L2VlcHJvbTgvbGFiZWwKZmFuNF9lZXByb20K
cm9vdEBjZWwtc2VhLTUxOi92YXIvdG1wIyBoZCAvc3lzL2J1cy9pMmMvZGV2aWNlcy8zNC0wMDUw
L2VlcHJvbQowMDAwMDAwMCAgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgIGZmIGZmIGZmIGZmIGZm
IGZmIGZmIGZmICB8Li4uLi4uLi4uLi4uLi4uLnwKKgowMDAwMDEwMAoKRmFuMUluKEZhbjEgSW5s
ZXQpOiAgT0sKZmFuOjExNTk5IFJQTSAgIChtYXggPSAyMzAwMCBSUE0sIG1pbiA9IDUzMDAgUlBN
LCBsaW1pdF92YXJpYW5jZSA9IDE1JSkKCkZhbjFPdXQoRmFuMSBPdXRsZXQpOiAgT0sKZmFuOjEx
MjM0IFJQTSAgIChtYXggPSAyMzAwMCBSUE0sIG1pbiA9IDUzMDAgUlBNLCBsaW1pdF92YXJpYW5j
ZSA9IDE1JSkKCkZhbjJJbihGYW4yIElubGV0KTogIE9LCmZhbjoxMTU2NSBSUE0gICAobWF4ID0g
MjMwMDAgUlBNLCBtaW4gPSA1MzAwIFJQTSwgbGltaXRfdmFyaWFuY2UgPSAxNSUpCgpGYW4yT3V0
KEZhbjIgT3V0bGV0KTogIE9LCmZhbjoxMTIzNCBSUE0gICAobWF4ID0gMjMwMDAgUlBNLCBtaW4g
PSA1MzAwIFJQTSwgbGltaXRfdmFyaWFuY2UgPSAxNSUpCgpGYW4zSW4oRmFuMyBJbmxldCk6ICBP
SwpmYW46MTE1NjUgUlBNICAgKG1heCA9IDIzMDAwIFJQTSwgbWluID0gNTMwMCBSUE0sIGxpbWl0
X3ZhcmlhbmNlID0gMTUlKQoKRmFuM091dChGYW4zIE91dGxldCk6ICBPSwpmYW46MTEyMzQgUlBN
ICAgKG1heCA9IDIzMDAwIFJQTSwgbWluID0gNTMwMCBSUE0sIGxpbWl0X3ZhcmlhbmNlID0gMTUl
KQoKRmFuNEluKEZhbjQgSW5sZXQpOiAgT0sKZmFuOjExNTMxIFJQTSAgIChtYXggPSAyMzAwMCBS
UE0sIG1pbiA9IDUzMDAgUlBNLCBsaW1pdF92YXJpYW5jZSA9IDE1JSkKCkZhbjRPdXQoRmFuNCBP
dXRsZXQpOiAgT0sKZmFuOjExMjM0IFJQTSAgIChtYXggPSAyMzAwMCBSUE0sIG1pbiA9IDUzMDAg
UlBNLCBsaW1pdF92YXJpYW5jZSA9IDE1JSkKCkZhbjVJbihGYW41IElubGV0KTogIE9LCmZhbjox
MTQ5NyBSUE0gICAobWF4ID0gMjMwMDAgUlBNLCBtaW4gPSA1MzAwIFJQTSwgbGltaXRfdmFyaWFu
Y2UgPSAxNSUpCgpGYW41T3V0KEZhbjUgT3V0bGV0KTogIE9LCmZhbjoxMTIwMiBSUE0gICAobWF4
ID0gMjMwMDAgUlBNLCBtaW4gPSA1MzAwIFJQTSwgbGltaXRfdmFyaWFuY2UgPSAxNSUpCgpQU1Ux
RmFuKFBTVTEgRmFuKTogIE9LCmZhbjo3NDg4IFJQTSAgIChtYXggPSAxODAwMCBSUE0sIG1pbiA9
IDQ3MDAgUlBNLCBsaW1pdF92YXJpYW5jZSA9IDE1JSkKClBTVTE6ICBPSwoKUFNVMkZhbihQU1Uy
IEZhbik6ICBBQlNFTlQKClBTVTI6ICBCQUQKClBTVTFUZW1wMShQU1UxIElubGV0IFRlbXAgU2Vu
c29yKTogIE9LCnRlbXA6MzYuMCBDIChsY3JpdCA9IDAgQywgZmFuX21heCA9IDYwIEMsIGZhbl9t
aW4gPSAyNSBDLCBtaW4gPSA1IEMsIG1heCA9IDYwIEMsIGNyaXQgPSAxMDAgQykKClBTVTFUZW1w
MihQU1UxIEhlYXRzaW5rIFRlbXAgU2Vuc29yKTogIE9LCnRlbXA6NDYuMCBDIChsY3JpdCA9IDAg
QywgZmFuX21heCA9IDYwIEMsIGZhbl9taW4gPSAyNSBDLCBtaW4gPSA1IEMsIG1heCA9IDYwIEMs
IGNyaXQgPSAxMDAgQykKClBTVTJUZW1wMShQU1UyIElubGV0IFRlbXAgU2Vuc29yKTogIEFCU0VO
VAoKUFNVMlRlbXAyKFBTVTIgSGVhdHNpbmsgVGVtcCBTZW5zb3IpOiAgQUJTRU5UCgpUZW1wMShJ
bnRlbCBDb3JlIDAgVGVtcCBTZW5zb3IpOiAgT0sKdGVtcDoxOS4wIEMgKGxjcml0ID0gMCBDLCBm
YW5fbWF4ID0gOTAgQywgZmFuX21pbiA9IDI1IEMsIG1pbiA9IDUgQywgbWF4ID0gOTAgQywgY3Jp
dCA9IDk4IEMpCgpUZW1wMihJbnRlbCBDb3JlIDEgVGVtcCBTZW5zb3IpOiAgT0sKdGVtcDoxOS4w
IEMgKGxjcml0ID0gMCBDLCBmYW5fbWF4ID0gOTAgQywgZmFuX21pbiA9IDI1IEMsIG1pbiA9IDUg
QywgbWF4ID0gOTAgQywgY3JpdCA9IDk4IEMpCgpUZW1wMyhJbnRlbCBDb3JlIDIgVGVtcCBTZW5z
b3IpOiAgT0sKdGVtcDoxOS4wIEMgKGxjcml0ID0gMCBDLCBmYW5fbWF4ID0gOTAgQywgZmFuX21p
biA9IDI1IEMsIG1pbiA9IDUgQywgbWF4ID0gOTAgQywgY3JpdCA9IDk4IEMpCgpUZW1wNChJbnRl
bCBDb3JlIDMgVGVtcCBTZW5zb3IpOiAgT0sKdGVtcDoxOS4wIEMgKGxjcml0ID0gMCBDLCBmYW5f
bWF4ID0gOTAgQywgZmFuX21pbiA9IDI1IEMsIG1pbiA9IDUgQywgbWF4ID0gOTAgQywgY3JpdCA9
IDk4IEMpCgpUZW1wNShJbnRlbCBDUFUgZXh0ZXJuYWwgc2Vuc29yIDEpOiAgT0sKdGVtcDozMC4w
IEMgKGxjcml0ID0gMCBDLCBmYW5fbWF4ID0gNjUgQywgZmFuX21pbiA9IDI1IEMsIG1pbiA9IDUg
QywgbWF4ID0gNjUgQywgY3JpdCA9IDcwIEMpCgpUZW1wNihJbnRlbCBDUFUgZXh0ZXJuYWwgc2Vu
c29yIDIpOiAgT0sKdGVtcDozMS4wIEMgKGxjcml0ID0gMCBDLCBmYW5fbWF4ID0gNjUgQywgZmFu
X21pbiA9IDI1IEMsIG1pbiA9IDUgQywgbWF4ID0gNjUgQywgY3JpdCA9IDcwIEMpCgpUZW1wNyhS
ZWFyIE91dGxldCBBaXIgc2Vuc29yKTogIE9LCnRlbXA6MzIuNSBDIChsY3JpdCA9IC0xNSBDLCBm
YW5fbWF4ID0gNDggQywgZmFuX21pbiA9IDI1IEMsIG1pbiA9IC0xMCBDLCBtYXggPSA0OCBDLCBj
cml0ID0gNjAgQykKClRlbXA4KEZyb250IE91dGxldCBBaXIgc2Vuc29yKTogIE9LCnRlbXA6MzAu
NSBDIChsY3JpdCA9IC0xNSBDLCBmYW5fbWF4ID0gNDggQywgZmFuX21pbiA9IDI1IEMsIG1pbiA9
IC0xMCBDLCBtYXggPSA0OCBDLCBjcml0ID0gNjAgQykKClRlbXA5KFRlbXAgU2Vuc29yIGNsb3Nl
IHRvIE5ldHdvcmtpbmcgQVNJQyk6ICBPSwp0ZW1wOjM3LjUgQyAobGNyaXQgPSAwIEMsIGZhbl9t
YXggPSA3NSBDLCBmYW5fbWluID0gMjUgQywgbWluID0gNSBDLCBtYXggPSA3NSBDLCBjcml0ID0g
ODAgQykKClRlbXAxMChESU1NIDEgVGVtcCBTZW5zb3IpOiAgT0sKdGVtcDozMS44IEMgKGxjcml0
ID0gMCBDLCBmYW5fbWF4ID0gOTAgQywgZmFuX21pbiA9IDI1IEMsIG1pbiA9IDUgQywgbWF4ID0g
OTAgQywgY3JpdCA9IDk1IEMpCgpUZW1wMTEoTmV0d29ya2luZyBBU0lDIERpZSBUZW1wIFNlbnNv
cik6ICBPSwp0ZW1wOjU0LjAgQyAobGNyaXQgPSAwIEMsIGZhbl9tYXggPSAxMDUgQywgZmFuX21p
biA9IDI1IEMsIG1pbiA9IDUgQywgbWF4ID0gMTA1IEMsIGNyaXQgPSAxMTAgQykKClRlbXAxMihO
ZXR3b3JraW5nIEFTSUMgRGllIFRlbXAgU2Vuc29yKTogIE9LCnRlbXA6NTQuNSBDIChsY3JpdCA9
IDAgQywgZmFuX21heCA9IDEwNSBDLCBmYW5fbWluID0gMjUgQywgbWluID0gNSBDLCBtYXggPSAx
MDUgQywgY3JpdCA9IDExMCBDKQoKVGVtcDEzKE5ldHdvcmtpbmcgQVNJQyBEaWUgVGVtcCBTZW5z
b3IpOiAgT0sKdGVtcDo1NC41IEMgKGxjcml0ID0gMCBDLCBmYW5fbWF4ID0gMTA1IEMsIGZhbl9t
aW4gPSAyNSBDLCBtaW4gPSA1IEMsIG1heCA9IDEwNSBDLCBjcml0ID0gMTEwIEMpCgpUZW1wMTQo
TmV0d29ya2luZyBBU0lDIERpZSBUZW1wIFNlbnNvcik6ICBPSwp0ZW1wOjU1LjkgQyAobGNyaXQg
PSAwIEMsIGZhbl9tYXggPSAxMDUgQywgZmFuX21pbiA9IDI1IEMsIG1pbiA9IDUgQywgbWF4ID0g
MTA1IEMsIGNyaXQgPSAxMTAgQykKClRlbXAxNShOZXR3b3JraW5nIEFTSUMgRGllIFRlbXAgU2Vu
c29yKTogIE9LCnRlbXA6NTQuMCBDIChsY3JpdCA9IDAgQywgZmFuX21heCA9IDEwNSBDLCBmYW5f
bWluID0gMjUgQywgbWluID0gNSBDLCBtYXggPSAxMDUgQywgY3JpdCA9IDExMCBDKQoKVGVtcDE2
KE5ldHdvcmtpbmcgQVNJQyBEaWUgVGVtcCBTZW5zb3IpOiAgT0sKdGVtcDo1Ni40IEMgKGxjcml0
ID0gMCBDLCBmYW5fbWF4ID0gMTA1IEMsIGZhbl9taW4gPSAyNSBDLCBtaW4gPSA1IEMsIG1heCA9
IDEwNSBDLCBjcml0ID0gMTEwIEMpCgpUZW1wMTcoTmV0d29ya2luZyBBU0lDIERpZSBUZW1wIFNl
bnNvcik6ICBPSwp0ZW1wOjU1LjUgQyAobGNyaXQgPSAwIEMsIGZhbl9tYXggPSAxMDUgQywgZmFu
X21pbiA9IDI1IEMsIG1pbiA9IDUgQywgbWF4ID0gMTA1IEMsIGNyaXQgPSAxMTAgQykKClRlbXAx
OChOZXR3b3JraW5nIEFTSUMgRGllIFRlbXAgU2Vuc29yKTogIE9LCnRlbXA6NTUuMCBDIChsY3Jp
dCA9IDAgQywgZmFuX21heCA9IDEwNSBDLCBmYW5fbWluID0gMjUgQywgbWluID0gNSBDLCBtYXgg
PSAxMDUgQywgY3JpdCA9IDExMCBDKQoKTWVzc2FnZXM6ClBTVTI6ICBzdGF0dXMgaXMgYWxsX25v
dF9vaywgaW5zdGFsbGVkCgo=
--0000000000004a8003058a0c2128
Content-Type: text/plain; charset="US-ASCII"; name="seastone-i2c.txt"
Content-Disposition: attachment; filename="seastone-i2c.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_jw9nbifh3>
X-Attachment-Id: f_jw9nbifh3

UENBIDk1NDEgbXV4CnwtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS18LS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tfAp8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwKUENBIDk1NDhfMSAgICAgICAgICAgICAg
ICAgICAgUENBIDk1NDhfMiAgICAgICAgICAgICAgICAgICAgUENBIDk1NDhfMwoKRmFuICAgICAg
ICAgICAgICAgICAgICBQU1UxLCAyLCBib2FyZCBFRVBST00gICAgICAgICAgICAgIEVFUFJPTSwK
ZWVwcm9tcyAxLTUgICAgICAgICAgICBmYW4gY29udHJvbGxlciwgbG03NSAgICAgICAgICAgICAg
IGxtNzUKCgoK
--0000000000004a8003058a0c2128--
