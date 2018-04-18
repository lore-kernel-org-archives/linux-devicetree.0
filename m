From: Hoan Tran <hotran@apm.com>
Subject: Re: [PATCH v3] gpio: dwapb: Add support for 1 interrupt per port A GPIO
Date: Wed, 18 Apr 2018 00:02:31 -0700
Message-ID: <CAFHUOYzPO+99HMLV7i1=ZoQG3vKRp2v5GzJdpW9yoWovx8D91Q@mail.gmail.com>
References: <1523609472-4481-1-git-send-email-phil.edworthy@renesas.com>
 <CAFHUOYziPaZC-Zcb7rXqC9p24H+CU4wK4NQShQkYLgH7c5mVwA@mail.gmail.com> <TY1PR01MB1769DB39F986BEADEF61F8C9F5B30@TY1PR01MB1769.jpnprd01.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <TY1PR01MB1769DB39F986BEADEF61F8C9F5B30@TY1PR01MB1769.jpnprd01.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee.jones@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Michel Pollet <michel.pollet@bp.renesas.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Devicetree List <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Phil,

On Fri, Apr 13, 2018 at 9:47 AM, Phil Edworthy
<phil.edworthy@renesas.com> wrote:
> Hi Hoan,
>
> On 13 April 2018 17:37 Hoan Tran wrote:
>> On Fri, Apr 13, 2018 at 1:51 AM, Phil Edworthy wrote:
>> > The DesignWare GPIO IP can be configured for either 1 interrupt or 1
>> > per GPIO in port A, but the driver currently only supports 1 interrupt=
.
>> > See the DesignWare DW_apb_gpio Databook description of the
>> > 'GPIO_INTR_IO' parameter.
>> >
>> > This change allows the driver to work with up to 32 interrupts, it
>> > will get as many interrupts as specified in the DT 'interrupts' proper=
ty.
>> > It doesn't do anything clever with the different interrupts, it just
>> > calls the same handler used for single interrupt hardware.
>> >
>> > Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
>> > ---
>> > One point to mention is that I have made it possible for users to have
>> > unconncted interrupts by specifying holes in the list of interrupts.
>> > This is done by supporting the interrupts-extended DT prop.
>> > However, I have no use for this and had to hack some test case for thi=
s.
>> > Perhaps the driver should support 1 interrupt or all GPIOa as interrup=
ts?
>> >
>> > v3:
>> >  - Rolled mfd: intel_quark_i2c_gpio fix into this patch to avoid
>> > bisect problems
>> > v2:
>> >  - Replaced interrupt-mask DT prop with support for the interrupts-
>> extended
>> >    prop. This means replacing the call to irq_of_parse_and_map() with =
calls
>> >    to of_irq_parse_one() and irq_create_of_mapping().
>> >
>> > Note: There are a few *code* lines over 80 chars, but this is just gui=
dance,
>> >    right? Especially as there are already some lines over 80 chars.
>> > ---
> [snip]
>
>> > -               if (has_acpi_companion(dev) && pp->idx =3D=3D 0)
>> > -                       pp->irq =3D platform_get_irq(to_platform_devic=
e(dev), 0);
>> > +               if (has_acpi_companion(dev) && pp->idx =3D=3D 0) {
>> > +                       pp->irq[0] =3D platform_get_irq(to_platform_de=
vice(dev), 0);
>> > +                       if (pp->irq[0])
>> > +                               pp->has_irq =3D true;
>> > +               }
>>
>> It doesn't work for ACPI. Could you do the same logic for ACPI?
> I don=E2=80=99t have access to any device that was baked (i.e. fabbed) wi=
th multiple
> output interrupts from the Synopsys GPIO blocks and use ACPI. I don't
> know if any such device exists.

Below code is tested on X-Gene system which supports 1 interrupt per
GPIO on Port A. You can update it into your patch.

-               if (has_acpi_companion(dev) && pp->idx =3D=3D 0)
-                       pp->irq =3D platform_get_irq(to_platform_device(dev=
), 0);
+               if (has_acpi_companion(dev) && pp->idx =3D=3D 0) {
+                       unsigned int j;
+                       for (j =3D 0; j < pp->ngpio; j++) {
+                               pp->irq[j] =3D
platform_get_irq(to_platform_device(dev), j);
+                               if (pp->irq[j])
+                                       pp->has_irq =3D true;
+                       }
+               }

Thanks
Hoan

>
> I would prefer not writing code that can be tested easily. I cannot even
> test the current, albeit small, changes to the Intel Quark MFD.
>
> Regards
> Phil
>
>> Thanks
>> Hoan
>>
>> >
>> >                 pp->irq_shared  =3D false;
>> >                 pp->gpio_base   =3D -1;
>> > diff --git a/drivers/mfd/intel_quark_i2c_gpio.c
>> > b/drivers/mfd/intel_quark_i2c_gpio.c
>> > index 90e35de..5bddb84 100644
>> > --- a/drivers/mfd/intel_quark_i2c_gpio.c
>> > +++ b/drivers/mfd/intel_quark_i2c_gpio.c
>> > @@ -233,7 +233,8 @@ static int intel_quark_gpio_setup(struct pci_dev
>> *pdev, struct mfd_cell *cell)
>> >         pdata->properties->idx          =3D 0;
>> >         pdata->properties->ngpio        =3D INTEL_QUARK_MFD_NGPIO;
>> >         pdata->properties->gpio_base    =3D INTEL_QUARK_MFD_GPIO_BASE;
>> > -       pdata->properties->irq          =3D pdev->irq;
>> > +       pdata->properties->irq[0]       =3D pdev->irq;
>> > +       pdata->properties->has_irq      =3D true;
>> >         pdata->properties->irq_shared   =3D true;
>> >
>> >         cell->platform_data =3D pdata;
>> > diff --git a/include/linux/platform_data/gpio-dwapb.h
>> > b/include/linux/platform_data/gpio-dwapb.h
>> > index 2dc7f4a..5a52d69 100644
>> > --- a/include/linux/platform_data/gpio-dwapb.h
>> > +++ b/include/linux/platform_data/gpio-dwapb.h
>> > @@ -19,7 +19,8 @@ struct dwapb_port_property {
>> >         unsigned int    idx;
>> >         unsigned int    ngpio;
>> >         unsigned int    gpio_base;
>> > -       unsigned int    irq;
>> > +       unsigned int    irq[32];
>> > +       bool            has_irq;
>> >         bool            irq_shared;
>> >  };
>> >
>> > --
>> > 2.7.4
>> >
