From: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/4] pinctrl: cygnus: add initial pinctrl support
Date: Fri, 9 Jan 2015 10:38:22 -0800
Message-ID: <54B0201E.3000307@broadcom.com>
References: <rjui@broadcom.com>	<1417131990-17954-1-git-send-email-rjui@broadcom.com>	<1417131990-17954-3-git-send-email-rjui@broadcom.com> <CACRpkdbZx1hcvd-q9AL3FPQRqU+wJjeSV8AdSno5PVr+fqhpRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdbZx1hcvd-q9AL3FPQRqU+wJjeSV8AdSno5PVr+fqhpRQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sherman Yin <syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>, Chris Boot <bootc-1Slo4GeK4H1eoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fengguang Wu <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 1/9/2015 3:03 AM, Linus Walleij wrote:
> On Fri, Nov 28, 2014 at 12:46 AM, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
>=20
>> This adds the initial driver support for the Broadcom Cygnus pinctrl
>> controller. The Cygnus pinctrl controller supports group based
>> alternate function configuration
>>
>> Signed-off-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Reviewed-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Signed-off-by: Fengguang Wu <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/pinctrl/Kconfig              |    7 +
>>  drivers/pinctrl/Makefile             |    1 +
>>  drivers/pinctrl/pinctrl-bcm-cygnus.c |  753 +++++++++++++++++++++++=
+++++++++++
>=20
> With the proliferation of Broadcom drivers, please first send a
> patch moving pinctrl-bcm281xx.c and pinctrl-bcm2835.c to
> drivers/pinctrl/broadcom or something, so we can collect them
> there.
>=20
Okay. This change will be included as the first patch in the next patch=
 set.

> I don't know if the hardware has any similarity though, so invite
> the authors of the previous drivers to review this code.
>=20
They are completely different. The only similarity between Cygnus and
bcm281xx pinctrl is that they use the same concept of alternation
functions (1, 2, 3, 4) for mux configuration.

>> +config PINCTRL_BCM_CYGNUS
>> +       bool "Broadcom Cygnus pinctrl driver"
>> +       depends on (ARCH_BCM_CYGNUS || COMPILE_TEST)
>> +       select PINMUX
>> +       select PINCONF
>> +       select GENERIC_PINCONF
>=20
> Nice that you use GENERIC_PINCONF! :)
>=20
>> +/*
>> + * Cygnus pinctrl core
>> + *
>> + * @pctl: pointer to pinctrl_dev
>> + * @dev: pointer to the device
>> + * @base: I/O register base for Cygnus pinctrl configuration
>> + *
>> + */
>> +struct cygnus_pinctrl {
>> +       struct pinctrl_dev *pctl;
>> +       struct device *dev;
>> +       void __iomem *base;
>> +
>> +       const struct pinctrl_pin_desc *pins;
>> +       unsigned num_pins;
>=20
> Why is this not simply just a part of struct pinctrl_desc?
> Why does it have to be multiplied here?
>=20
Okay. Let me look into this.

>> +/*
>> + * List of groups of pins
>> + */
>> +static const unsigned gpio0_pins[] =3D { 12 };
>> +static const unsigned gpio1_pins[] =3D { 13 };
>> +static const unsigned gpio2_pins[] =3D { 14 };
>> +static const unsigned gpio3_pins[] =3D { 15 };
>> +static const unsigned gpio4_pins[] =3D { 16 };
>> +static const unsigned gpio5_pins[] =3D { 17 };
>> +static const unsigned gpio6_pins[] =3D { 18 };
>> +static const unsigned gpio7_pins[] =3D { 19 };
>> +static const unsigned gpio8_pins[] =3D { 20 };
>> +static const unsigned gpio9_pins[] =3D { 21 };
>> +static const unsigned gpio10_pins[] =3D { 22 };
>> +static const unsigned gpio11_pins[] =3D { 23 };
>> +static const unsigned gpio12_pins[] =3D { 24 };
>> +static const unsigned gpio13_pins[] =3D { 25 };
>> +static const unsigned gpio14_pins[] =3D { 26 };
>> +static const unsigned gpio15_pins[] =3D { 27 };
>> +static const unsigned gpio16_pins[] =3D { 28 };
>> +static const unsigned gpio17_pins[] =3D { 29 };
>> +static const unsigned gpio18_pins[] =3D { 30 };
>> +static const unsigned gpio19_pins[] =3D { 31 };
>> +static const unsigned gpio20_pins[] =3D { 32 };
>> +static const unsigned gpio21_pins[] =3D { 33 };
>> +static const unsigned gpio22_pins[] =3D { 34 };
>> +static const unsigned gpio23_pins[] =3D { 35 };
>=20
> Have you considered implementing .gpio_request_enable()
> and .gpio_disable_free() to get around having to have one
> group for each GPIO line?
>=20
Okay the Cygnus pin controller is really a mess. GPIO 0 ~ GPIO23 are
really 23 distinct groups, each with one pin. Then the rest of GPIOs go
under other groups. In general, when we set a group to alternate
function 4, all pins become GPIO.

>> +static const unsigned pwm0_pins[] =3D { 38 };
>> +static const unsigned pwm1_pins[] =3D { 39 };
>> +static const unsigned pwm2_pins[] =3D { 40 };
>> +static const unsigned pwm3_pins[] =3D { 41 };
>> +static const unsigned sdio0_pins[] =3D { 94, 95, 96, 97, 98, 99 };
>> +static const unsigned smart_card0_pins[] =3D { 42, 43, 44, 46, 47 }=
;
>> +static const unsigned smart_card1_pins[] =3D { 48, 49, 50, 52, 53 }=
;
>> +static const unsigned spi0_pins[] =3D { 54, 55, 56, 57 };
>> +static const unsigned spi1_pins[] =3D { 58, 59, 60, 61 };
>> +static const unsigned spi2_pins[] =3D { 62, 63, 64, 65 };
>> +static const unsigned spi3_pins[] =3D { 66, 67, 68, 69 };
>> +static const unsigned d1w_pins[] =3D { 10, 11 };
>> +static const unsigned lcd_pins[] =3D { 126, 127, 128, 129, 130, 131=
, 132,        133,
>> +       134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, =
146, 147,
>> +       148, 149, 150, 151, 152, 153, 154, 155 };
>> +static const unsigned uart0_pins[] =3D { 70, 71, 72, 73 };
>> +static const unsigned uart1_dte_pins[] =3D { 75, 76, 77, 78 };
>> +static const unsigned uart1_pins[] =3D { 74, 79, 80, 81 };
>> +static const unsigned uart3_pins[] =3D { 82, 83 };
>> +static const unsigned qspi_pins[] =3D { 104, 105, 106, 107 };
>> +static const unsigned nand_pins[] =3D { 110, 111, 112, 113, 114, 11=
5, 116, 117,
>> +       118, 119, 120, 121, 122, 123, 124, 125 };
>> +static const unsigned sdio0_cd_pins[] =3D { 103 };
>> +static const unsigned sdio0_mmc_pins[] =3D { 100, 101, 102 };
>> +static const unsigned can0_spi4_pins[] =3D { 86, 87 };
>> +static const unsigned can1_spi4_pins[] =3D { 88, 89 };
>> +static const unsigned sdio1_cd_pins[] =3D { 93 };
>> +static const unsigned sdio1_led_pins[] =3D { 84, 85 };
>> +static const unsigned sdio1_mmc_pins[] =3D { 90, 91, 92 };
>> +static const unsigned camera_led_pins[] =3D { 156, 157, 158, 159, 1=
60 };
>> +static const unsigned camera_rgmii_pins[] =3D { 169, 170, 171, 169,=
 170, 171,
>> +       172, 173 };
>> +static const unsigned camera_sram_rgmii_pins[] =3D { 161, 162, 163,=
 164, 165,
>> +       166, 167, 168 };
>> +static const unsigned qspi_gpio_pins[] =3D { 108, 109 };
>> +static const unsigned smart_card0_fcb_pins[] =3D { 45 };
>> +static const unsigned smart_card1_fcb_pins[] =3D { 51 };
>> +static const unsigned gpio0_3p3_pins[] =3D { 176 };
>> +static const unsigned gpio1_3p3_pins[] =3D { 177 };
>> +static const unsigned gpio2_3p3_pins[] =3D { 178 };
>=20
> Looks good...
>=20
Note these pins are definitions in the driver that help to describe the
pad layout. We can't really configure any individual pins in Cygnus.

>> +/*
>> + * List of groups names. Need to match the order in cygnus_pin_grou=
ps
>> + */
>> +static const char * const cygnus_pin_group_names[] =3D {
>> +       "gpio0",
>> +       "gpio1",
>> +       "gpio2",
>> +       "gpio3",
>> +       "gpio4",
>> +       "gpio5",
>> +       "gpio6",
>> +       "gpio7",
>> +       "gpio8",
>> +       "gpio9",
>> +       "gpio10",
>> +       "gpio11",
>> +       "gpio12",
>> +       "gpio13",
>> +       "gpio14",
>> +       "gpio15",
>> +       "gpio16",
>> +       "gpio17",
>> +       "gpio18",
>> +       "gpio19",
>> +       "gpio20",
>> +       "gpio21",
>> +       "gpio22",
>> +       "gpio23",
>> +       "pwm0",
>> +       "pwm1",
>> +       "pwm2",
>> +       "pwm3",
>> +       "sdio0",
>> +       "smart_card0",
>> +       "smart_card1",
>> +       "spi0",
>> +       "spi1",
>> +       "spi2",
>> +       "spi3",
>> +       "d1w",
>> +       "lcd",
>> +       "uart0",
>> +       "uart1_dte",
>> +       "uart1",
>> +       "uart3",
>> +       "qspi",
>> +       "nand",
>> +       "sdio0_cd",
>> +       "sdio0_mmc",
>> +       "can0_spi4",
>> +       "can1_spi4",
>> +       "sdio1_cd",
>> +       "sdio1_led",
>> +       "sdio1_mmc",
>> +       "camera_led",
>> +       "camera_rgmii",
>> +       "camera_sram_rgmii",
>> +       "qspi_gpio",
>> +       "smart_card0_fcb",
>> +       "smart_card1_fcb",
>> +       "gpio0_3p3",
>> +       "gpio1_3p3",
>> +       "gpio2_3p3",
>> +};
>=20
> This looks very much like function names as noted in the binding.
> I would say, suffix every group with _grp or something so it's not
> as confusing. Remember, spi0 is a function of the SoC,
> pins {1,2} is just a group of pins that it may appear on.
>=20
Yes, suffix every group with _grp helps a lot to clarify the confusion.
Will fix this.

>> +#define CYGNUS_PIN_FUNCTION(fcn_name, mux_val)                 \
>> +{                                                              \
>> +       .name =3D #fcn_name,                                      \
>> +       .group_names =3D cygnus_pin_group_names,                  \
>> +       .num_groups =3D ARRAY_SIZE(cygnus_pin_group_names),       \
>> +       .mux =3D mux_val,                                         \
>> +}
>> +
>> +/*
>> + * Cygnus has 4 alternate functions. All groups can be configured t=
o any of
>> + * the 4 alternate functions
>> + */
>> +static const struct cygnus_pin_function cygnus_pin_functions[] =3D =
{
>> +       CYGNUS_PIN_FUNCTION(alt1, 0),
>> +       CYGNUS_PIN_FUNCTION(alt2, 1),
>> +       CYGNUS_PIN_FUNCTION(alt3, 2),
>> +       CYGNUS_PIN_FUNCTION(alt4, 3),
>> +};
>=20
> These are not functions. These are per-pin mux ways.
>=20
> Re-read the documentation of what a function is: it is not something
> abstract like "alternative something" but something very direct like
> uart0 or spi0.
>=20
Yes, agree. Will fix.

>> +static int cygnus_dt_node_to_map(struct pinctrl_dev *pctrl_dev,
>> +               struct device_node *np, struct pinctrl_map **map,
>> +               unsigned *num_maps)
>> +{
>=20
> After S=C3=B6ren Brinkmanns patches youy should be able to use core
> functions for this and avoid this code altogether.
>=20

Will that help to take care our case, based on the way we will use
"function" and "group"?

>> +       num_groups =3D of_property_count_strings(np, "brcm,groups");
>=20
> As mentioned, just "groups".
>=20
I guess I will use "group"?

>> +       ret =3D of_property_read_string(np, "brcm,function", &functi=
on_name);
>=20
> As mentioned, just "function".
>=20
Yes.

>> +       ret =3D pinctrl_utils_reserve_map(pctrl_dev, map, &reserved_=
maps,
>> +                       num_maps, num_groups);
>=20
> Good use of utilities!
>=20
> Apart from this things look nice.
>=20
> The main comment to address is the definition of functions.
>=20
> Yours,
> Linus Walleij
>=20
Thanks a lot for the review!!!
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
