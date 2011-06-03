From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: i2c child devices: binding to uio device driver
Date: Fri, 3 Jun 2011 11:19:35 -0600
Message-ID: <20110603171935.GB15616@ponder.secretlab.ca>
References: <BANLkTimSBReyncTANTyy4jhah=-QvPigwQ@mail.gmail.com>
	<20110519155808.GC3085@ponder.secretlab.ca>
	<BANLkTim08mWohWkqF0veHbz0+ydikHTAFA@mail.gmail.com>
	<BANLkTimKP0Bo3C5rqzJg5AAc1p9evmfxaA@mail.gmail.com>
	<20110527071738.GC31953@ponder.secretlab.ca>
	<BANLkTimYs5+cr_E_kW-s3oQdnhf0582Lbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <BANLkTimYs5+cr_E_kW-s3oQdnhf0582Lbw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

On Fri, May 27, 2011 at 12:33:18PM +0200, Thomas De Schampheleire wrote:
> On Fri, May 27, 2011 at 9:17 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>=
 wrote:
> > On Wed, May 25, 2011 at 08:39:26AM +0200, Thomas De Schampheleire wrote:
> >> Hi,
> >>
> >> On Mon, May 23, 2011 at 10:13 AM, Thomas De Schampheleire
> >> <patrickdepinguin+devicetree-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >> > Hi Grant,
> >> >
> >> > On Thu, May 19, 2011 at 5:58 PM, Grant Likely <grant.likely@secretla=
b.ca> wrote:
> >> >> On Thu, May 19, 2011 at 05:32:32PM +0200, Thomas De Schampheleire w=
rote:
> >> >>> Hi,
> >> >>>
> >> >>> I am using the uio framework (userspace i/o) to handle devices in
> >> >>> userspace. This includes memory access and interrupt handling.
> >> >>> For i2c devices, I'm using the i2c-dev interface, to talk to these
> >> >>> devices from userspace. This already works fine.
> >> >>>
> >> >>> One of my i2c devices also has an interrupt line connected to the
> >> >>> processor. To be able to handle this interrupt with uio, I need to
> >> >>> have a kernel driver matched against the i2c device. However, the =
i2c
> >> >>> device described in the device tree does not bind with the driver.=
 Is
> >> >>> this behavior supported, and if so, what am I doing wrong? Do I ha=
ve
> >> >>> to create a dummy bus (non-i2c) and add a shadow node for the
> >> >>> interrupt?
> >> >>
> >> >> You're wandering into new territory here. =A0It is definitely the r=
ight
> >> >> thing to do to describe your i2c device in the device tree with the
> >> >> interrupt fully specified.
> >> >>
> >> >> What you probably need to do is create a uio helper driver for your
> >> >> device that takes care of finding the device node, mapping the
> >> >> interrupt, and proving the interrupt handling UIO hook to userspace.
> >> >> The easiest way to work this out would be to make your uio helper
> >> >> actually bind to the i2c device created by the device node (this is
> >> >> probably the best way too), but you don't have to. =A0As long as you
> >> >> arrange for you uio helper to get called at some point, you can get=
 it
> >> >> to find the appropriate node in the DT, map the interrupt, and expo=
rt
> >> >> it to userspace.
> >> >
> >> > Binding the helper driver with the i2c device in the device tree is
> >> > indeed what I am trying to achieve. Unfortunately, the binding does
> >> > not happen, the probe function of my driver never gets called.
> >> >
> >> > For the other UIO devices in this system (non-I2C), the mechanism is=
 as follows:
> >> > 1. the devices are described in the device tree, as children under
> >> > their respective bus node (e.g. localbus)
> >> > 2. the platform code (arch/powerpc/platforms/85xx/corenet_ds.c)
> >> > iterates over all buses it understands, among which 'simple-bus'.
> >> > 3. for each child device on the bus, a bind operation with a driver =
is
> >> > attempted, based on the device 'compatible' string
> >> >
> >> > This works perfectly.
> >> > However, the i2c bus does not have any of the matched bus types, like
> >> > simple-bus, and as such it is handled differently. The i2c bus driver
> >> > (drivers/i2c/busses/i2c-mpc.c) calls of_register_i2c_devices (in
> >> > drivers/of/of_i2c.c), which handles the i2c-specific part of the
> >> > device, but does not (as far as I understand and observe) treat the
> >> > device as a regular device with a match table.
> >> >
> >> > Maybe I misunderstand something. Is this where I need to play with
> >> > modaliases? How does this work in the context of device trees?
> >> >
> >> >>
> >> >> g.
> >> >>
> >> >>>
> >> >>> My device tree nodes look like this:
> >> >>>
> >> >>> =A0 =A0 =A0 =A0 soc@fe000000 {
> >> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c@118100 {
> >> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D=
 <1>;
> >> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0=
>;
> >> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cell-index =3D <1>;
> >> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fs=
l-i2c";
> >> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x118100 =
0x100>;
> >> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <38=
 2 0 0>;
> >> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dfsrr;
> >> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mydevice@68 {
> >> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 co=
mpatible =3D "mymanufacturer,mydevice";
> >> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 re=
g =3D <0x68>;
> >> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 in=
terrupts =3D <7 1 0 0>; /* External
> >> >>> IRQ7, active-low level */
> >> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> >> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> >> >>
> >> >> This looks to be correct.
> >> >>
> >> >>>
> >> >>> The device driver then has:
> >> >>>
> >> >>> static const struct of_device_id mydevice_ids[] =3D {
> >> >>> =A0 =A0 =A0 =A0 {
> >> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .compatible =3D "mymanufacturer,my=
device"
> >> >>> =A0 =A0 =A0 =A0 },
> >> >>> =A0 =A0 =A0 =A0 {},
> >> >>> };
> >> >>> static struct of_platform_driver mydevice_driver =3D {
> >> >>
> >> >> You don't want to do this. =A0This is an i2c device, not a platform
> >> >> device. =A0If anything, this should be an i2c_driver and you should=
 use
> >> >> the normal creation of i2c devices from the DT.
> >> >
> >> > Ok, so this may be the reason why my driver does not get registered
> >> > against the device...
> >>
> >>
> >> I have it working now. The bottom line was indeed, as you hinted, to
> >> transform the platform driver into an i2c driver, and make sure that
> >> it gets bound to the device. Here indeed, I need to specify the right
> >> modalias in the compatible string.
> >
> > Glad to hear. =A0Thanks for reporting back. =A0Comments below.
> =

> Seems that I spoke too soon.
> Although the binding of the device and the driver works correctly, I
> now have problems with using the i2c device from userspace. After
> having transformed my platform driver into an i2c driver, setting the
> same slave address from userspace fails. This is not what I wanted.
> =

> How do I get around this? To get proper binding I need an I2C device,
> but to be able to use i2c-dev I shouldn't have an I2C device.

You're venturing into new territory here.  You'll either need to adapt
i2c-dev to coexist peacefully with a real i2c_client device, or you'll
need to modify i2c-dev to parse the device tree and decode the irq for
you.

> It seems that Arnd's suggestion to make i2c-dev interrupt aware, comes
> into play here. However, how will i2c-dev know which interrupts belong
> to which device? To use i2c-dev without interrupts, all you need in
> the device tree is the i2c controller nodes.

You'll need i2c-dev to find the associated node in the device tree,
possibly with an ioctl call.  I don't know the best way to proceed
here, sorry.  Jean might have better suggestions, but in general I
don't think i2c-dev is intended to provide any irq infrastructure.

g.
