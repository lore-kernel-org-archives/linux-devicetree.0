From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH 1/2] GPIO: Add support for dual channel in gpio-xilinx.c
Date: Fri, 31 May 2013 07:43:24 +0200
Message-ID: <51A8387C.4030704@monstr.eu>
References: <4b90b06fce0475b579cfba4d968b4778359154f6.1369826814.git.michal.simek@xilinx.com>
 <CACRpkdY4xaCOe28nu-NrYQ7pafjhj8-xqFcJRF9iJUy3SrCVrA@mail.gmail.com>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8867399122853397231=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACRpkdY4xaCOe28nu-NrYQ7pafjhj8-xqFcJRF9iJUy3SrCVrA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============8867399122853397231==
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="----enig2QBBIAJAQBKLWEOPDPDBJ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2QBBIAJAQBKLWEOPDPDBJ
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On 05/30/2013 09:46 PM, Linus Walleij wrote:
> On Wed, May 29, 2013 at 1:27 PM, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>=
 wrote:
>=20
>> Supporting the second channel in the driver.
>> Offset is 0x8 and both channnels share the same
>> IRQ.
>>
>> Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>=20
> (...)
>> +/* Read/Write access to the GPIO registers */
>> +#define xgpio_readreg(offset)          __raw_readl(offset)
>> +#define xgpio_writereg(offset, val)    __raw_writel(val, offset)
>=20
> So you're swithing in_be32/out_be32 to the CPU-dependent
> __raw_readl/__raw_writel functions? Why?

The reason is that this driver can be used on ARM where in_be32/out_be32
is not implemented.

> Can you explain exactly why you are using __raw_* accessors
> rather than e.g. atleast readl_relaxed()/writel_relaxed()
> or even plain readl/writel so you know the writes will hit
> the hardware as immediately as possible?

Using __raw* function ensure that it is working on all
cpus. Microblaze big/little endian, PPC big endian and ARM little endian.=


The correct way how to implement this is based on my previous
discussion to detect endians directly on IP.

But for this gpio case without interrupt connected(it means without
interrupt logic) there are just 2 registers data and tristate
(http://www.xilinx.com/support/documentation/ip_documentation/axi_gpio/v1=
_01_b/ds744_axi_gpio.pdf)
and auto detection can't be done.

> I'd prefer this step to be a separate patch.

ok. Will do based on my discussion around xilinxfb.

>>  struct xgpio_instance {
>>         struct of_mm_gpio_chip mmchip;
>>         u32 gpio_state;         /* GPIO state shadow register */
>>         u32 gpio_dir;           /* GPIO direction shadow register */
>> +       u32 offset;
>>         spinlock_t gpio_lock;   /* Lock used for synchronization */
>>  };
>=20
> Why not take this opportunity to move the comments out to
> kerneldoc above this struct, plus document what "offset"
> means.

Good point. Will fix.

>=20
>> -       return (in_be32(mm_gc->regs + XGPIO_DATA_OFFSET) >> gpio) & 1;=

>> +       return (xgpio_readreg(regs + XGPIO_DATA_OFFSET) >> gpio) & 1;
>=20
>=20
> Another way would be:
>=20
> #include <linux/bitops.h>
>=20
> return !!(xgpio_readreg(regs + XGPIO_DATA_OFFSET & BIT(gpio));
>=20
>> +
>> +       pr_info("XGpio: %s: registered, base is %d\n", np->full_name,
>> +                                                       chip->mmchip.g=
c.base);
>> +
>> +       tree_info =3D of_get_property(np, "xlnx,is-dual", NULL);
>=20
> This looks like you want to use of_property_read_bool().

Ah yeah.

> Have you documented these new bindings? It doesn't seem so.
> Documentation/devicetree/bindings/gpio/*...
>=20
> If it's undocumented so far, this is a good oppotunity to add it.

Isn't it enough what it is in 2/2?
Or do you want to describe current binding in the first patch
and then extend it in this patch when dual channel is added?


>> +       if (tree_info && be32_to_cpup(tree_info)) {
>> +               chip =3D kzalloc(sizeof(*chip), GFP_KERNEL);
>> +               if (!chip)
>> +                       return -ENOMEM;
>> +
>> +               /* Add dual channel offset */
>> +               chip->offset =3D XGPIO_CHANNEL_OFFSET;
>> +
>> +               /* Update GPIO state shadow register with default valu=
e */
>> +               tree_info =3D of_get_property(np, "xlnx,dout-default-2=
", NULL);
>> +               if (tree_info)
>> +                       chip->gpio_state =3D be32_to_cpup(tree_info);
>=20
> This is basically a jam table (hardware set-up) in the device tree.

Not sure what you mean by that. Xilinx GPIO is soft IP which can be confi=
gured
to different configurations before bitstream is generated.
At the end you will get different setting/addresses setup for every pin
which is described by these xlnx,X descriptions.

> I don't exactly like this. Is this necessary?

If you mean names or values in there that all of them are autogenerated
from design tools and they are reflect IP hardware description and all
configuration options which you can have there.
It means that all these values give you exact hardware description.

Do I answer your question?


>=20
>> +               /* Update GPIO direction shadow register with default =
value */
>> +               /* By default, all pins are inputs */
>> +               chip->gpio_dir =3D 0xFFFFFFFF;
>> +               tree_info =3D of_get_property(np, "xlnx,tri-default-2"=
, NULL);
>> +               if (tree_info)
>> +                       chip->gpio_dir =3D be32_to_cpup(tree_info);
>=20
> Dito.
>=20
>> +               /* Check device node and parent device node for device=
 width */
>> +               /* By default assume full GPIO controller */
>> +               chip->mmchip.gc.ngpio =3D 32;
>> +               tree_info =3D of_get_property(np, "xlnx,gpio2-width", =
NULL);
>> +               if (tree_info)
>> +                       chip->mmchip.gc.ngpio =3D be32_to_cpup(tree_in=
fo);
>=20
> Seems fine, but document it in the binding.

I will look at new fdt function to shorten this code to look better.

Thanks for your review,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



------enig2QBBIAJAQBKLWEOPDPDBJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlGoOHwACgkQykllyylKDCFWpgCfZAYIDF1xkc4BIPpOCq5DGhYh
p7UAn3tg97NcefE1IlOdlkqL7bMEGapV
=X5bw
-----END PGP SIGNATURE-----

------enig2QBBIAJAQBKLWEOPDPDBJ--

--===============8867399122853397231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============8867399122853397231==--
