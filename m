From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: i2c child devices: binding to uio device driver
Date: Fri, 27 May 2011 01:17:38 -0600
Message-ID: <20110527071738.GC31953@ponder.secretlab.ca>
References: <BANLkTimSBReyncTANTyy4jhah=-QvPigwQ@mail.gmail.com>
	<20110519155808.GC3085@ponder.secretlab.ca>
	<BANLkTim08mWohWkqF0veHbz0+ydikHTAFA@mail.gmail.com>
	<BANLkTimKP0Bo3C5rqzJg5AAc1p9evmfxaA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <BANLkTimKP0Bo3C5rqzJg5AAc1p9evmfxaA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thomas De Schampheleire <patrickdepinguin+devicetree-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, May 25, 2011 at 08:39:26AM +0200, Thomas De Schampheleire wrote:
> Hi,
> =

> On Mon, May 23, 2011 at 10:13 AM, Thomas De Schampheleire
> <patrickdepinguin+devicetree-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > Hi Grant,
> >
> > On Thu, May 19, 2011 at 5:58 PM, Grant Likely <grant.likely@secretlab.c=
a> wrote:
> >> On Thu, May 19, 2011 at 05:32:32PM +0200, Thomas De Schampheleire wrot=
e:
> >>> Hi,
> >>>
> >>> I am using the uio framework (userspace i/o) to handle devices in
> >>> userspace. This includes memory access and interrupt handling.
> >>> For i2c devices, I'm using the i2c-dev interface, to talk to these
> >>> devices from userspace. This already works fine.
> >>>
> >>> One of my i2c devices also has an interrupt line connected to the
> >>> processor. To be able to handle this interrupt with uio, I need to
> >>> have a kernel driver matched against the i2c device. However, the i2c
> >>> device described in the device tree does not bind with the driver. Is
> >>> this behavior supported, and if so, what am I doing wrong? Do I have
> >>> to create a dummy bus (non-i2c) and add a shadow node for the
> >>> interrupt?
> >>
> >> You're wandering into new territory here. =A0It is definitely the right
> >> thing to do to describe your i2c device in the device tree with the
> >> interrupt fully specified.
> >>
> >> What you probably need to do is create a uio helper driver for your
> >> device that takes care of finding the device node, mapping the
> >> interrupt, and proving the interrupt handling UIO hook to userspace.
> >> The easiest way to work this out would be to make your uio helper
> >> actually bind to the i2c device created by the device node (this is
> >> probably the best way too), but you don't have to. =A0As long as you
> >> arrange for you uio helper to get called at some point, you can get it
> >> to find the appropriate node in the DT, map the interrupt, and export
> >> it to userspace.
> >
> > Binding the helper driver with the i2c device in the device tree is
> > indeed what I am trying to achieve. Unfortunately, the binding does
> > not happen, the probe function of my driver never gets called.
> >
> > For the other UIO devices in this system (non-I2C), the mechanism is as=
 follows:
> > 1. the devices are described in the device tree, as children under
> > their respective bus node (e.g. localbus)
> > 2. the platform code (arch/powerpc/platforms/85xx/corenet_ds.c)
> > iterates over all buses it understands, among which 'simple-bus'.
> > 3. for each child device on the bus, a bind operation with a driver is
> > attempted, based on the device 'compatible' string
> >
> > This works perfectly.
> > However, the i2c bus does not have any of the matched bus types, like
> > simple-bus, and as such it is handled differently. The i2c bus driver
> > (drivers/i2c/busses/i2c-mpc.c) calls of_register_i2c_devices (in
> > drivers/of/of_i2c.c), which handles the i2c-specific part of the
> > device, but does not (as far as I understand and observe) treat the
> > device as a regular device with a match table.
> >
> > Maybe I misunderstand something. Is this where I need to play with
> > modaliases? How does this work in the context of device trees?
> >
> >>
> >> g.
> >>
> >>>
> >>> My device tree nodes look like this:
> >>>
> >>> =A0 =A0 =A0 =A0 soc@fe000000 {
> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c@118100 {
> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1=
>;
> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0>;
> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cell-index =3D <1>;
> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fsl-i=
2c";
> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x118100 0x1=
00>;
> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <38 2 =
0 0>;
> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dfsrr;
> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mydevice@68 {
> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compa=
tible =3D "mymanufacturer,mydevice";
> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =
=3D <0x68>;
> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 inter=
rupts =3D <7 1 0 0>; /* External
> >>> IRQ7, active-low level */
> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> >>
> >> This looks to be correct.
> >>
> >>>
> >>> The device driver then has:
> >>>
> >>> static const struct of_device_id mydevice_ids[] =3D {
> >>> =A0 =A0 =A0 =A0 {
> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .compatible =3D "mymanufacturer,mydev=
ice"
> >>> =A0 =A0 =A0 =A0 },
> >>> =A0 =A0 =A0 =A0 {},
> >>> };
> >>> static struct of_platform_driver mydevice_driver =3D {
> >>
> >> You don't want to do this. =A0This is an i2c device, not a platform
> >> device. =A0If anything, this should be an i2c_driver and you should use
> >> the normal creation of i2c devices from the DT.
> >
> > Ok, so this may be the reason why my driver does not get registered
> > against the device...
> =

> =

> I have it working now. The bottom line was indeed, as you hinted, to
> transform the platform driver into an i2c driver, and make sure that
> it gets bound to the device. Here indeed, I need to specify the right
> modalias in the compatible string.

Glad to hear.  Thanks for reporting back.  Comments below.

> =

> For the record, here is what needed to be done:
> * In the device tree, add a child node to the i2c controller node. The
> model part of the first compatible string, should correspond to the
> 'type' string you will specify in the driver. In this node, you can
> also specify any interrupt assignments.
> =

> * The driver should be a regular i2c driver, but the 'type' field in
> struct i2c_device_id should match what you specified in the device
> tree. For example, if the device tree has 'mymanufacturer,mydevice' as
> compatible string, then:
> =

> static struct i2c_device_id mydevice_ids[] =3D {
>         { "mydevice", 0 },
>         { }
> };
> =

> static struct i2c_driver mydevice_driver =3D {
>         .driver =3D {
>                 .name =3D "mydevice",
>         },
> =

>         .id_table       =3D mydevice_ids,
>         .probe          =3D mydevice_probe,
>         .remove         =3D __devexit_p(mydevice_remove),
> };

This is a heuristic for getting device tree nodes to work with
existing i2c drivers.  However, it is very important that you *do not*
lie about what the device is in the compatible property to get it to
bind to the device.  So, if the value that best describes the device
is not in the i2c_device_id list, then you should add a proper
i2c_driver->driver->of_match_table that does a correct match to a
device tree compatible property.

I may very well remove the heuristic at some point in the future and
require all device tree binding to use the of_match_table method.

> =

> * In the probe function, to get the interrupt information out of the
> device tree, you first have to find the correct node, for example
> based on compatible string:
> =

>         np =3D of_find_compatible_node(NULL, NULL, "mymanufacturer,mydevi=
ce");
>         if (NULL =3D=3D np) {
>                 dev_err(&client->dev, "couldn't find corresponding
> node in device tree\n");
>                 goto err_find_node;
>         }

You don't need to jump through this hoop.  The node pointer is already
populated in client->dev->of_node.

> =

>         {
>                 int irq =3D of_irq_to_resource(np, 0, NULL);
>                 if (unlikely(irq =3D=3D NO_IRQ)) {
>                         dev_warn(&client->dev, "couldn't obtain
> interrupt information from device tree\n");
>                 } else {
>                         ... (handle the UIO part)
>                 }
>         }

Similarly, the irq should already be populated in client->irq.

Otherwise, looks correct.

g.
