From: Domenico Andreoli <cavokz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch 1/2] Add dt_compat field to struct gpio_chip
Date: Thu, 7 Apr 2011 22:41:28 +0200
Message-ID: <BANLkTi=WE_vOUAi8T60ESAH2kua4uB-_HA@mail.gmail.com>
References: <20110407163322.465935232@gmail.com>
	<20110407163930.GB17498@dandreoli.com>
	<20110407171704.GC2455@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110407171704.GC2455-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 7, 2011 at 7:17 PM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wr=
ote:
>
> On Thu, Apr 07, 2011 at 06:39:30PM +0200, Domenico Andreoli wrote:
> > From: Domenico Andreoli <cavokz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >
> > This new field allows easy creation of GPIO chips in base of struct arr=
ays.
> >
> > Signed-off-by: Domenico Andreoli <cavokz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >
> > ---
> > =A0drivers/of/gpio.c =A0 =A0 =A0 =A0 =A0| =A0 =A03 +++
> > =A0include/asm-generic/gpio.h | =A0 =A01 +
> > =A02 files changed, 4 insertions(+)
> >
> > Index: b/drivers/of/gpio.c
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > --- a/drivers/of/gpio.c =A0 =A0 =A0 2011-04-07 18:19:20.000000000 +0200
> > +++ b/drivers/of/gpio.c =A0 =A0 =A0 2011-04-07 18:20:31.000000000 +0200
> > @@ -212,6 +212,9 @@
> >
> > =A0void of_gpiochip_add(struct gpio_chip *chip)
> > =A0{
> > + =A0 =A0 if ((!chip->of_node) && (chip->dt_compat))
> > + =A0 =A0 =A0 =A0 =A0 =A0 chip->of_node =3D of_find_compatible_node(NUL=
L, NULL, chip->dt_compat);
> > +
>
> Hi Domenico,

Hi Grant,

> From what I can tell, this patch attempts to adapt to the way that
> arch/arm/plat-samsung/gpio.c registers gpios with the kernel. =A0Each
> platform seems to have its own static table of gpio banks which are
> registered without any regard to the Linux device model. =A0It works,
> but it isn't really the way things should be done.

About the independent models of the ARM platforms, I can't say
anything. I only wanted to explore the DT concepts and import them on
the s3c24xx. While this could look only as the latest individual
attempt, the DT interface is not and cannot be of any harm if ARM
deploys it a little more.

> The design of gpiolib right now is such that the of_node pointer
> should be known *before* of_gpiochip_add() gets called. =A0This is very
> important because the code that registers the gpio is the only place
> that can truly know which node is actually associated with the gpio.

This explains why a so simple patch has never been proposed before.

> To solve your problem, the best solution would be to rework
> arch/arm/plat-samsung-gpio.c to properly use the driver model and
> register platform_devices which can be attached to dt nodes. =A0This
> change should probably be done anyway, even ignoring the dt needs, but
> I'm not going to force you to make this change to get dt support added
> for samsung gpios.

Indeed my plan is to not rework it, not in the next future, not before
I switched all its users to DT ;)

I'd like to follow the path towards a pure dts platform definition so
the next step would be to DT-fy something like the s3c
sdi/sdhci/whatever, which already uses some GPIO. Then something else
like audio or network and so on. I would be very glad to arrive sooner
or later to a s3c24xx FDT.

> Alternately, what you should do is make sure that the chip->of_node
> pointer is correctly populated before calling gpiochip_add(), possibly
> in s3c_gpiolib_add().

I already restored it to the previous state, with .dt_compat in struct
s3c_gpio_chip and the the call of of_find_compatible_node() in
s3c_gpiolib_add(), this way it stays out of gpiolib.

> Also, be careful about the way that 'compatible' is being used.
> Remember that compatible describes the /interface/ to a device, but
> not the /instance/. =A0Many systems have multiple instances of the same
> device, and compatible doesn't provide any help for differentiating
> between them.

I needed some clarification here, I already suspected that my way to
encode banks in the compatible property was somehow fishy. And I
needed a working patch to get some attention before digging further..
;)

> Typically, when trying to find a specific instance of a
> device, it should be resolved with a property in the /aliases node, or
> it should be matched up against the resolved base address of the
> device.

This is what I'll try next. This alone seems to imply the rework you
said above, let's see.

> Cheers,
> g.

Thank you.

cheers,
Domenico

-----[ Domenico Andreoli, aka cavok
=A0--[ http://www.dandreoli.com/gpgkey.asc
=A0=A0 ---[ 3A0F 2F80 F79C 678A 8936=A0 4FEE 0677 9033 A20E BC50
