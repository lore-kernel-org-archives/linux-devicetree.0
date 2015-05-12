From: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: [PATCH v4 1/2] pinctrl: Add driver for Alphascale asm9260 pinctrl
Date: Tue, 12 May 2015 18:25:55 +0200
Message-ID: <55522993.6090104@rempel-privat.de>
References: <1428306169.634.51.camel@x220>	<1428311043-12012-1-git-send-email-linux@rempel-privat.de>	<1428311043-12012-2-git-send-email-linux@rempel-privat.de> <CACRpkdakXbHL6ydeZrs4XZ9Z1odHL5bWRxiHtT_Jbg-ygTudgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="icbLFTnAxkST5JM0uRhEt81wgp7GwhWu3"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdakXbHL6ydeZrs4XZ9Z1odHL5bWRxiHtT_Jbg-ygTudgw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--icbLFTnAxkST5JM0uRhEt81wgp7GwhWu3
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 05.05.2015 um 17:12 schrieb Linus Walleij:
> On Mon, Apr 6, 2015 at 11:04 AM, Oleksij Rempel <linux@rempel-privat.de=
> wrote:
>=20
>> This patch adds driver for Alphascale asm9260 pinctrl support.
>> Alphascale asm9260t is SoC based on ARM926EJ (240MHz) in LQFP176 packa=
ge.
>> On silicon are:
>> - 32MB SDRAM
>> - USB2.0 HS/OTG
>> - 2x CAN
>> - SD/MMC
>> - 5x Times/PWM
>> - 10x USART
>> - 24-channel DMA
>> - 2x i2c
>> - 2x SPI
>> - Quad SPI
>> - 10/100 Ethernet MAC
>> - Camera IF
>> - WD
>> - RTC
>> - i2s
>> - GPIO
>> - 12-bit A/D
>> - LCD IF
>> - 8-channel 12-bit ADC
>> - NAND
>>
>> Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>
>=20
> Nice.
>=20
>> +#define MUX_TABLE_SIZE         ARRAY_SIZE(asm9260_mux_table)
>> +struct asm9260_pmx_priv {
>> +       struct device           *dev;
>> +       struct pinctrl_dev      *pctl;
>> +       void __iomem            *iobase;
>> +
>> +       struct clk              *clk;
>> +       spinlock_t              lock;
>> +
>> +       struct pinctrl_pin_desc pin_desc[MUX_TABLE_SIZE];
>> +};
>> +
>> +static void __init asm9260_init_mux_pins(struct asm9260_pmx_priv *pri=
v)
>> +{
>> +       unsigned int i;
>> +
>> +       for (i =3D 0; i < MUX_TABLE_SIZE; i++) {
>> +               priv->pin_desc[i].name =3D asm9260_mux_table[i].name;
>> +               priv->pin_desc[i].number =3D asm9260_mux_table[i].numb=
er;
>> +       }
>> +}
>=20
> What is the point of copying this data from one array to the other?
>=20
> Just reference the statically defined array by a pointer instead,
> this just takes up a lot o memory for no reason.

This two arrays have different types this is why i convert it.
priv->pin_desc[i].name - here i copy pointer any ways, and
priv->pin_desc[i].number can be smaller then pointer.

>> +/* each GPIO pin has it's own pseudo pingroup containing only itself =
*/
>> +static int asm9260_pinctrl_get_groups_count(struct pinctrl_dev *pctld=
ev)
>> +{
>> +       return MUX_TABLE_SIZE;
>> +}
>=20
> Use return ARRAY_SIZE(foo) to return the size of a static table.

see #define MUX_TABLE_SIZE          ARRAY_SIZE(asm9260_mux_table

>> +static int asm9260_pinctrl_get_group_pins(struct pinctrl_dev *pctldev=
,
>> +                                        unsigned int group,
>> +                                        const unsigned int **pins,
>> +                                        unsigned int *num_pins)
>> +{
>> +       struct asm9260_pmx_priv *priv =3D pinctrl_dev_get_drvdata(pctl=
dev);
>> +
>> +       *pins =3D &priv->pin_desc[group].number;
>> +       *num_pins =3D 1;
>=20
> So I see you are using groups with one pin each. Is this how the
> hardware works?

Yes, each pin can be configured separately.

>> +static int asm9260_pinctrl_get_func_groups(struct pinctrl_dev *pctlde=
v,
>> +                                         unsigned int function,
>> +                                         const char * const **groups,=

>> +                                         unsigned int * const num_gro=
ups)
>> +{
>=20
> (...)
>> +       for (a =3D 0; a < MUX_TABLE_SIZE; a++) {
>> +               table =3D &asm9260_mux_table[a];
>> +
>> +               for (b =3D 0; b < MAX_FUNCS_PER_PIN; b++) {
>> +                       if (table->funcs[b] =3D=3D function) {
>> +                               tmp[count] =3D a;
>> +                               count++;
>> +                       }
>> +
>> +               }
>> +
>> +       }
>=20
> Mory copying. I don't see why this is necessary at all.

I hadn't seen the point to define groups statically, especially because
they are used only  to make curious user happy. So, memory will be used
only if you request the list over sysfs. Or miss some thing?

>> +       for (a =3D 0; a < count; a++)
>> +               gr[a] =3D asm9260_mux_table[tmp[a]].name;
>=20
> And more copying.
>=20
> Try to just reference static tables.
>=20
>> +
>> +       asm9260_functions[function].groups =3D gr;
>> +       asm9260_functions[function].ngroups =3D count;
>> +done:
>> +       *groups =3D asm9260_functions[function].groups;
>> +       *num_groups =3D asm9260_functions[function].ngroups;
>=20
> Same comment.
>=20
>> +static struct pinmux_ops asm9260_pinmux_ops =3D {
>> +       .get_functions_count    =3D asm9260_pinctrl_get_funcs_count,
>> +       .get_function_name      =3D asm9260_pinctrl_get_func_name,
>> +       .get_function_groups    =3D asm9260_pinctrl_get_func_groups,
>> +       .set_mux                =3D asm9260_pinctrl_set_mux,
>> +       /* TODO: should we care about gpios here? gpio_request_enable?=
 */
>=20
> I think you should, if you also have a matching GPIO driver.

I fear it would cause unpredictable bugs. GPIO mode is just one of mux
modes. If some one will request gpio some busy or dangerous line it
would do more harm then use. So, i assume limiting this only to device
tree would be better.

>=20
>> +static int asm9260_pinconf_reg(struct pinctrl_dev *pctldev,
>> +                             unsigned int pin,
>> +                             enum pin_config_param param,
>> +                             void __iomem **reg, u32 *val)
>> +{
>> +       struct asm9260_pmx_priv *priv =3D pinctrl_dev_get_drvdata(pctl=
dev);
>> +       struct asm9260_pingroup *table;
>> +       int a;
>> +
>> +       for (a =3D 0; a < MUX_TABLE_SIZE; a++) {
>> +               table =3D &asm9260_mux_table[a];
>> +               if (table->number =3D=3D pin)
>> +                       break;
>> +       }
>
> No error check here. What if pin is not in table? We will never
> know for that case...

Ok, i agree.

> Apart from that it looks OK.
>=20
> BTW this is a review of v3, I didn't find your v4 of this patch :/

I'll wait for answers first, then provide next version. Thank you for
review :)

--=20
Regards,
Oleksij


--icbLFTnAxkST5JM0uRhEt81wgp7GwhWu3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iF4EAREIAAYFAlVSKZcACgkQHwImuRkmbWnQKwD6Aim5UZvIPiyEQjAud6pHVl6K
7pi73rtmbkU++xn6io4A/11yx/cUXBs4n/uytai1qZS45UIKz4282GV9qcirRSaG
=nQOA
-----END PGP SIGNATURE-----

--icbLFTnAxkST5JM0uRhEt81wgp7GwhWu3--
