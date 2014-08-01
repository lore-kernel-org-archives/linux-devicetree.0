From: "Priebe, Sebastian" <Sebastian.Priebe-hnW+OuB6jW6zQB+pC5nmwQ@public.gmane.org>
Subject: AW: driver using another driver
Date: Fri, 1 Aug 2014 07:15:41 +0000
Message-ID: <E70AF999396FDF4EAE40E195B84709611F847086@SPMDEGHN001.CADCON.INTERN>
References: <E70AF999396FDF4EAE40E195B84709611F84671F@SPMDEGHN001.CADCON.INTERN>
 <20140801063105.GV23235@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140801063105.GV23235-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Content-Language: de-DE
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Sascha,

thanks for your answer.
We are using an imx35 cpu and our CPLD is in fact connected via weim (C=
S1).
Though I created the following device node in our dts:
&weim {
        pinctrl-names =3D "default";
        status =3D "okay";

        pld@1,0 {
                compatible =3D "roche,hbm-pld";
                reg =3D <1 0x00000000 0x0001000>;
                fsl,weim-cs-timing =3D <0x0 0x0 0x0>; /* don't know wha=
t to put here */
        };
};

And I turned the CPLD driver into a platform driver. But I don't get th=
e resource in probe:
res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0) returns NULL.

In our platform code we had:
static struct resource hbm_pld_resource_data =3D {
        .start =3D 0xA8000000,
        .end =3D 0xA8000000 + 0x1000 - 1,
        .flags =3D IORESOURCE_MEM,
};

And for the setting of CS1:
__raw_writel((0x22 << 8), MX35_IO_ADDRESS(MX3x_WEIM_BASE_ADDR) + 0x10);
__raw_writel(((0x0a << 28) | (0x06 << 12) | (0x03 << 8) | (0x04 << 4) |=
 (0x01 << 0)), MX35_IO_ADDRESS(MX3x_WEIM_BASE_ADDR) + 0x14);

Where do I put this in the device tree?

Gru=DF
Sebastian Priebe
Telefon: +49 (0)621 685996-26




=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
CADCON
Ingenieurgesellschaft mbH & Co. KG
Geschaeftsfuehrer: Robert Bauer, Andreas Gundel
Sitz der Gesellschaft: D-86368 Gersthofen
Registergericht: Amtsgericht Augsburg HRA 14521
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

-----Urspr=FCngliche Nachricht-----
Von: Sascha Hauer [mailto:s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org]
Gesendet: Freitag, 1. August 2014 08:31
An: Priebe, Sebastian
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Betreff: Re: driver using another driver

Hi Sebastian,

On Wed, Jul 30, 2014 at 02:45:51PM +0000, Priebe, Sebastian wrote:
> Hello,
>
> I am working on a project with an ARMv6 cpu and I am currently trying
> to port our board file to a device tree.  Our custom hardware has a
> CPLD with is used by multiple driver.  In the past we shared the CPLD
> driver resource (struct resource...) among the drivers platform data
> to be able to access the CPLD registers from all the drivers.  The
> CPLD driver allocated the resource, returned it to our platform code
> and our platform code passed it to the other drivers.
> In other words the CPLD driver is used by the other driver.
> How can I achieve the same with a device tree?

You can use a toplevel device node for your CPLD on which your toplevel=
 driver matches. Call of_platform_populate() with this toplevel node to=
 create the child devices. drivers/bus/ contains some examples, like dr=
ivers/bus/imx-weim.c.

Sascha

--
Pengutronix e.K.                           |                           =
  |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
