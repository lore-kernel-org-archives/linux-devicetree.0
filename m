From: Grant Likely <grant.likely@linaro.org>
Subject: Re: Creating a new platform_bus inside a spi_driver
Date: Tue, 11 Nov 2014 11:20:27 +0000
Message-ID: <20141111112027.BCC09C40D48@trevor.secretlab.ca>
References: <545BD3EC.6050503@datacom.ind.br>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <545BD3EC.6050503@datacom.ind.br>
Sender: linux-kernel-owner@vger.kernel.org
To: DATACOM - =?iso-8859-1?b?yXJpY28=?= Nunes <erico.nunes@datacom.ind.br>, robh+dt@kernel.org, devicetree@vger.kernel.org, sameo@linux.intel.com, lee.jones@linaro.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 06 Nov 2014 18:02:52 -0200
, DATACOM - =C3=89rico Nunes
 <erico.nunes@datacom.ind.br>
 wrote:
>=20
> Hello,
>=20
> In our board we have a FPGA whose programmable logic communicates wit=
h the main
> processor via SPI. Inside the programmable logic we also have a range=
 of
> registers (writable via SPI commands) which implement functionality o=
f several
> distinct "devices".
>=20
> Our approach to implement a driver framework for these devices was to=
 have a
> platform_bus embedded in a spi_device. This device tree source draft
> illustrates the proposal:
>=20
> {
>     spi-master@2000 {
>         #address-cells =3D <1>;
>         #size-cells =3D <0>;
>         compatible =3D "cpu-spi-master";
>         reg =3D <0x2000 0x2000>;
>=20
>         fpga@1 {
>             #address-cells =3D <1>;
>             #size-cells =3D <1>;
>             compatible =3D "fpga-spi";
>             reg =3D <1>;
>             spi-max-frequency =3D <25000000>;
>=20
>             fpga-device1@200 {
>                 compatible =3D "fpga-device1-driver";
>                 reg =3D <0x200 0x300>;
>             };
>=20
>             fpga-device2@500 {
>                 compatible =3D "fpga-device2-driver";
>                 reg =3D <0x500 0x100>;
>             };
>=20
>             fpga-device3@600 {
>                 compatible =3D "fpga-device3-driver";
>                 reg =3D <0x600 0x200>;
>             };
>         };
>     };
> }
>=20
> The idea is that "fpga-spi" is a spi_driver which instantiates all of=
 the
> "fpga-deviceN" as platform_devices, through the use of
> of_platform_populate(dev->of_node, NULL, NULL, dev).
>=20
> The visible problem we're facing with this approach is that, as the i=
nternal
> platform_devices have a "reg" property, of_platform_populate() eventu=
ally
> triggers an address translation which is apparently trying to transla=
te the
> addresses of the internal platform_bus to addresses of the processor =
memory
> map.
> This translation is however not part of our intention, as we intend t=
o have an
> internal bus with its own memory map.
> This fails when __of_translate_address() reaches the spi-master bound=
ary
> because (as it seems to make sense) it isn't possible to translate th=
em past
> that.
> A KERN_ERR rated message like
> "prom_parse: Bad cell count for /soc@f0000000/spi@2000/fpga@1"
> is thrown by __of_translate_address() and later it is not possible to=
 obtain
> the "reg" address with platform_get_resource().
>=20
> On this scenario, we have a few questions and, depending on the outco=
me of
> these, possibly a patch.
>=20
> 1. Is it possible to have an internal platform_bus with a different m=
emory map
> as we intended? Or are platform_busses and platform_devices supposed =
to always
> be mapped on the processor memory map?
>=20
> 2. If platform_bus and platform_device were actually designed to alwa=
ys be
> mappable to the processor memory map, what would be a different appro=
ach to
> this problem?  One alternative considered was to define a new "fpga_b=
us" and
> "fpga_device" but that seemed as an overkill approach to the problem.
>=20
> 3. By searching for the ocurrences of of_platform_populate(), some us=
es which
> look similar to our approach were found, in the following drivers:
> drivers/mfd/smsc-ece1099.c
> drivers/mfd/palmas.c
> These have an i2c_driver which calls of_platform_populate() just like=
 we
> attempted.  Won't they run into a similar problem, if any of the chil=
dren
> platform_devices provide a "reg" property?
>=20
> 4. By applying the patch attached at the end of this mail, things sta=
rt to work
> as we intended. Basically instead of returning an error if we reach a=
n
> untranslatable boundary, we return the resulting address so far. This=
 is
> assuming that, for this case, we want an internal memory map for this=
 device.
> Is this patch/assumption breaking any design decisions regarding the =
platform
> subsystem? It is of course not a widely tested patch, but could we be=
 facing a
> bug which needs a fix like the one presented?
>=20
> Thanks in advance!
>=20
> Erico
>=20
>=20
>=20
> [PATCH] of/address: return partial translation when crossing
>  untranslatable boundary
>=20
> Signed-off-by: erico.nunes <erico.nunes@datacom.ind.br>
> ---
>  drivers/of/address.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index afdb782..ab56d31 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -572,8 +572,9 @@ static u64 __of_translate_address(struct device_n=
ode *dev,
>          pbus =3D of_match_bus(parent);
>          pbus->count_cells(dev, &pna, &pns);
>          if (!OF_CHECK_COUNTS(pna, pns)) {
> -            printk(KERN_ERR "prom_parse: Bad cell count for %s\n",
> +            pr_debug("OF: prom_parse: Bad cell count for %s\n",
>                     of_node_full_name(dev));
> +            result =3D of_read_number(addr, na);

This will cause breakage elsewhere. The __of_translate_address()
function is intended to fail when translation is impossible. You would
need a different variant of the function, or different mode of calling
it which allows partial translation. Actually, what would be better is
to pass in an end-point for translation. You want the caller to be
explicit about where it expects the translation to stop, and still fail
if translation doesn't occur at that point. That gives some assurance
that the driver won't end up with bogus translations.

g.
