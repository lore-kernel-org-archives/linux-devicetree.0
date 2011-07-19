From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 7/7] i2c: pxa: support to parse property
Date: Tue, 19 Jul 2011 13:47:54 -0600
Message-ID: <20110719194754.GL6848@ponder.secretlab.ca>
References: <1311042290-20253-1-git-send-email-haojian.zhuang@marvell.com>
	<1311042290-20253-2-git-send-email-haojian.zhuang@marvell.com>
	<1311042290-20253-3-git-send-email-haojian.zhuang@marvell.com>
	<1311042290-20253-4-git-send-email-haojian.zhuang@marvell.com>
	<1311042290-20253-5-git-send-email-haojian.zhuang@marvell.com>
	<1311042290-20253-6-git-send-email-haojian.zhuang@marvell.com>
	<1311042290-20253-7-git-send-email-haojian.zhuang@marvell.com>
	<1311042290-20253-8-git-send-email-haojian.zhuang@marvell.com>
	<CAMPhdO-qjR0LSjvMm7hbdqZyrFxa5S8JVa1FO8sDsxOdyUV9Ng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMPhdO-qjR0LSjvMm7hbdqZyrFxa5S8JVa1FO8sDsxOdyUV9Ng-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Haojian Zhuang <haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 19, 2011 at 06:17:21PM +0800, Eric Miao wrote:
> On Tue, Jul 19, 2011 at 10:24 AM, Haojian Zhuang
> <haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org> wrote:
> > Support to parse some optional properties. These three properties are
> > i2c-polling, i2c-frequency, i2c-class.
> >
> > After supporting these property, i2c-pxa driver can avoid to use platfo=
rm
> > data except for slave mode.
> >
> > Signed-off-by: Haojian Zhuang <haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> > ---
> > =A0.../devicetree/bindings/i2c/pxa255-i2c.txt =A0 =A0 =A0 =A0 | =A0 36 =
++++++++++++++++++++
> > =A0drivers/i2c/busses/i2c-pxa.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 22 ++++++++----
> > =A02 files changed, 51 insertions(+), 7 deletions(-)
> > =A0create mode 100644 Documentation/devicetree/bindings/i2c/pxa255-i2c.=
txt
> >
> > diff --git a/Documentation/devicetree/bindings/i2c/pxa255-i2c.txt b/Doc=
umentation/devicetree/bindings/i2c/pxa255-i2c.txt
> > new file mode 100644
> > index 0000000..bf34236
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i2c/pxa255-i2c.txt
> > @@ -0,0 +1,36 @@
> > +PXA255 I2C
> > +
> > +The I2C-Controller is first used in PXA255. It's widely used in Intel/=
Marvell
> > +silicons.
> > +
> > +Optional Property:
> > + =A0 =A0 =A0 - i2c-polling: Specifies whether I2C-Controller is used i=
n polling
> > + =A0 =A0 =A0 =A0 mode or interrupt mode. The type of property should b=
e <u32>.
> > +
> > + =A0 =A0 =A0 - i2c-frequency: Specifies the frequency that the I2C-Con=
troller
> > + =A0 =A0 =A0 =A0 is working. The type of property should be <string>.
> > +
> > + =A0 =A0 =A0 - i2c-class: Specifies the class of I2C-Controller. The t=
ype of
> > + =A0 =A0 =A0 =A0 property should be <u32>.
> > +
> > +Example:
> > + =A0 =A0 =A0 i2c0: i2c@d4011000 {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "pxa2xx-i2c";
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0>;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xd4011000 0x60>;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* I2C-Controller works in interrupt mode=
. */
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c-polling =3D <0>;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* I2C-Controller's frequency is FAST. */
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c-frequency =3D "fast";
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* interrupt of I2C-Controller */
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <7>;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-parent =3D <&mmp_intc>;
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pm860x: pmic@34 {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controller;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* interrupt of pm860x */
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <4>;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-parent =3D <&mm=
p_intc>;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> > + =A0 =A0 =A0 };
> > diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
> > index adac74a..4b9fa71 100644
> > --- a/drivers/i2c/busses/i2c-pxa.c
> > +++ b/drivers/i2c/busses/i2c-pxa.c
> > @@ -1060,7 +1060,8 @@ static int i2c_pxa_probe(struct platform_device *=
dev)
> > =A0 =A0 =A0 =A0const struct platform_device_id *id =3D platform_get_dev=
ice_id(dev);
> > =A0 =A0 =A0 =A0enum pxa_i2c_types i2c_type;
> > =A0 =A0 =A0 =A0struct resource *res;
> > - =A0 =A0 =A0 int irq, ret;
> > + =A0 =A0 =A0 int irq, ret, poll;
> > + =A0 =A0 =A0 char *p =3D NULL;
> > =A0 =A0 =A0 =A0static int idx =3D 0;
> >
> > =A0 =A0 =A0 =A0if (np) {
> > @@ -1093,11 +1094,24 @@ static int i2c_pxa_probe(struct platform_device=
 *dev)
> >
> >
> > =A0 =A0 =A0 =A0if (np) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 of_property_read_u32(np, "i2c-polling", &=
poll);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c->use_pio =3D (poll) ? 1 : 0;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 of_property_read_string(np, "i2c-frequenc=
y", &p);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (p && !strncmp(p, "fast", 4))
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c->fast_mode =3D 1;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 of_property_read_u32(np, "i2c-class", &i2=
c->adap.class);
> > +
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0i2c->adap.nr =3D idx++;
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0snprintf(i2c->adap.name, sizeof(i2c->ada=
p.name),
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"pxa2xx-i2c.%u", i2c->ad=
ap.nr);
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0i2c->clk =3D clk_get_sys(i2c->adap.name,=
 NULL);
> > =A0 =A0 =A0 =A0} else {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (plat) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c->adap.class =3D plat-=
>class;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c->use_pio =3D plat->us=
e_pio;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c->fast_mode =3D plat->=
fast_mode;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> > +
> =

> One concern of DT's impact to existing drivers is _every_ driver has to be
> modified. While I'm not sure if it's a right way to go in a long run. Or =
can
> we have a generic way to automatically map the DT properties to the
> specific platform data structure?

Not really, since there is no such thing as a generic platform_data
structure.  We can certainly have helper functions, but any
driver-specific data must by definition have driver-specific code to
decode it from the device tree.

It does help though when similar drivers use the same binding.

g.

> =

> Grant, any idea on this?
> =

> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/*
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * If "dev->id" is negative we consider =
it as zero.
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * The reason to do so is to avoid sysfs=
 names that only make
> > @@ -1142,12 +1156,6 @@ static int i2c_pxa_probe(struct platform_device =
*dev)
> >
> > =A0 =A0 =A0 =A0clk_enable(i2c->clk);
> >
> > - =A0 =A0 =A0 if (plat) {
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c->adap.class =3D plat->class;
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c->use_pio =3D plat->use_pio;
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c->fast_mode =3D plat->fast_mode;
> > - =A0 =A0 =A0 }
> > -
> > =A0 =A0 =A0 =A0if (i2c->use_pio) {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0i2c->adap.algo =3D &i2c_pxa_pio_algorith=
m;
> > =A0 =A0 =A0 =A0} else {
> > --
> > 1.5.6.5
> >
> >
