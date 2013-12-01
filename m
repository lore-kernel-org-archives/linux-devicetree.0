From: Richard Weinberger <richard.weinberger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] rtc: add hym8563 rtc-driver
Date: Sun, 1 Dec 2013 15:38:40 +0100
Message-ID: <CAFLxGvz6ZYHaDJqc6LPwtPsLUaLuEwSEQaJLZ-hV1m8PxruOow@mail.gmail.com>
References: <201312011437.47432.heiko@sntech.de>
	<201312011439.45417.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201312011439.45417.heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Dec 1, 2013 at 2:39 PM, Heiko St=FCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wrote=
:
> The Haoyu Microelectronics HYM8563 provides rtc- and alarm functions
> as well as a clock output of up to 32kHz.
>
> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> ---
>  drivers/rtc/Kconfig       |   11 +
>  drivers/rtc/Makefile      |    1 +
>  drivers/rtc/rtc-hym8563.c |  626 +++++++++++++++++++++++++++++++++++=
++++++++++
>  3 files changed, 638 insertions(+)
>  create mode 100644 drivers/rtc/rtc-hym8563.c
>
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 9654aa3..bf2c572 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -202,6 +202,17 @@ config RTC_DRV_DS3232
>           This driver can also be built as a module.  If so, the modu=
le
>           will be called rtc-ds3232.
>
> +config RTC_DRV_HYM8563
> +       tristate "Haoyu Microelectronics HYM8563"
> +       depends on I2C && OF && GPIOLIB
> +       help
> +         Say Y to enable support for the HYM8563 I2C RTC chip. Apart
> +         from the usual rtc functions it provides a clock output of
> +         up to 32kHz.
> +
> +         This driver can also be built as a module. If so, the modul=
e
> +         will be called rtc-hym8563.
> +
>  config RTC_DRV_LP8788
>         tristate "TI LP8788 RTC driver"
>         depends on MFD_LP8788
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index 2dff3d2..92f9d2c 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -54,6 +54,7 @@ obj-$(CONFIG_RTC_DRV_EP93XX)  +=3D rtc-ep93xx.o
>  obj-$(CONFIG_RTC_DRV_FM3130)   +=3D rtc-fm3130.o
>  obj-$(CONFIG_RTC_DRV_GENERIC)  +=3D rtc-generic.o
>  obj-$(CONFIG_RTC_DRV_HID_SENSOR_TIME) +=3D rtc-hid-sensor-time.o
> +obj-$(CONFIG_RTC_DRV_HYM8563)  +=3D rtc-hym8563.o
>  obj-$(CONFIG_RTC_DRV_IMXDI)    +=3D rtc-imxdi.o
>  obj-$(CONFIG_RTC_DRV_ISL1208)  +=3D rtc-isl1208.o
>  obj-$(CONFIG_RTC_DRV_ISL12022) +=3D rtc-isl12022.o
> diff --git a/drivers/rtc/rtc-hym8563.c b/drivers/rtc/rtc-hym8563.c
> new file mode 100644
> index 0000000..2dc4154
> --- /dev/null
> +++ b/drivers/rtc/rtc-hym8563.c
> @@ -0,0 +1,626 @@
> +/*
> + * Haoyu HYM8563 RTC driver
> + *
> + * Copyright (C) 2013 MundoReader S.L.
> + * Author: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> + *
> + * based on rtc-HYM8563
> + * Copyright (C) 2010 ROCKCHIP, Inc.
> + *
> + * This software is licensed under the terms of the GNU General Publ=
ic
> + * License version 2, as published by the Free Software Foundation, =
and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/clk-provider.h>
> +#include <linux/i2c.h>
> +#include <linux/bcd.h>
> +#include <linux/rtc.h>
> +#include <linux/delay.h>
> +#include <linux/slab.h>
> +#include <linux/gpio.h>
> +#include <linux/of_gpio.h>
> +
> +#define HYM8563_CTL1           0x00
> +#define HYM8563_CTL1_TEST      BIT(7)
> +#define HYM8563_CTL1_STOP      BIT(5)
> +#define HYM8563_CTL1_TESTC     BIT(3)
> +
> +#define HYM8563_CTL2           0x01
> +#define HYM8563_CTL2_TI_TP     BIT(4)
> +#define HYM8563_CTL2_AF                BIT(3)
> +#define HYM8563_CTL2_TF                BIT(2)
> +#define HYM8563_CTL2_AIE       BIT(1)
> +#define HYM8563_CTL2_TIE       BIT(0)
> +
> +#define HYM8563_SEC            0x02
> +#define HYM8563_SEC_VL         BIT(7)
> +#define HYM8563_SEC_MASK       0x7f
> +
> +#define HYM8563_MIN            0x03
> +#define HYM8563_MIN_MASK       0x7f
> +
> +#define HYM8563_HOUR           0x04
> +#define HYM8563_HOUR_MASK      0x3f
> +
> +#define HYM8563_DAY            0x05
> +#define HYM8563_DAY_MASK       0x3f
> +
> +#define HYM8563_WEEKDAY                0x06
> +#define HYM8563_WEEKDAY_MASK   0x07
> +
> +#define HYM8563_MONTH          0x07
> +#define HYM8563_MONTH_CENTURY  BIT(7)
> +#define HYM8563_MONTH_MASK     0x1f
> +
> +#define HYM8563_YEAR           0x08
> +
> +#define HYM8563_ALM_MIN                0x09
> +#define HYM8563_ALM_HOUR       0x0a
> +#define HYM8563_ALM_DAY                0x0b
> +#define HYM8563_ALM_WEEK       0x0c
> +
> +/* Each alarm check can be disabled by setting this bit in the regis=
ter */
> +#define HYM8563_ALM_BIT_DISABLE        BIT(7)
> +
> +#define HYM8563_CLKOUT         0x0d
> +#define HYM8563_CLKOUT_DISABLE BIT(7)
> +#define HYM8563_CLKOUT_32768   0
> +#define HYM8563_CLKOUT_1024    1
> +#define HYM8563_CLKOUT_32      2
> +#define HYM8563_CLKOUT_1       3
> +#define HYM8563_CLKOUT_MASK    3
> +
> +#define HYM8563_TMR_CTL                0x0e
> +#define HYM8563_TMR_CTL_ENABLE BIT(7)
> +#define HYM8563_TMR_CTL_4096   0
> +#define HYM8563_TMR_CTL_64     1
> +#define HYM8563_TMR_CTL_1      2
> +#define HYM8563_TMR_CTL_1_60   3
> +#define HYM8563_TMR_CTL_MASK   3
> +
> +#define HYM8563_TMR_CNT                0x0f
> +
> +struct hym8563 {
> +       struct i2c_client       *client;
> +       struct rtc_device       *rtc;
> +       bool                    valid;
> +       struct clk_hw           clkout_hw;
> +};
> +
> +/*
> + * RTC handling
> + */
> +
> +static int hym8563_rtc_read_time(struct device *dev, struct rtc_time=
 *tm)
> +{
> +       struct i2c_client *client =3D to_i2c_client(dev);
> +       struct hym8563 *hym8563 =3D i2c_get_clientdata(client);
> +       u8 buf[7];
> +       int ret;
> +
> +       if (!hym8563->valid) {
> +               dev_warn(&client->dev, "no valid clock/calendar value=
s available\n");
> +               return -EPERM;
> +       }
> +
> +       ret =3D i2c_smbus_read_i2c_block_data(client, HYM8563_SEC, 7,=
 buf);
> +
> +       tm->tm_sec =3D bcd2bin(buf[0] & HYM8563_SEC_MASK);
> +       tm->tm_min =3D bcd2bin(buf[1] & HYM8563_MIN_MASK);
> +       tm->tm_hour =3D bcd2bin(buf[2] & HYM8563_HOUR_MASK);
> +       tm->tm_mday =3D bcd2bin(buf[3] & HYM8563_DAY_MASK);
> +       tm->tm_wday =3D bcd2bin(buf[4] & HYM8563_WEEKDAY_MASK); /* 0 =
=3D Sun */
> +       tm->tm_mon =3D bcd2bin(buf[5] & HYM8563_MONTH_MASK) - 1; /* 0=
 =3D Jan */
> +       tm->tm_year =3D bcd2bin(buf[6]) + 100;
> +
> +       return 0;
> +}
> +
> +static int hym8563_rtc_set_time(struct device *dev, struct rtc_time =
*tm)
> +{
> +       struct i2c_client *client =3D to_i2c_client(dev);
> +       struct hym8563 *hym8563 =3D i2c_get_clientdata(client);
> +       u8 buf[7];
> +       int ret;
> +
> +       /* Years >=3D 2100 are to far in the future, 19XX is to early=
 */
> +       if (tm->tm_year < 100 || tm->tm_year >=3D 200)
> +               return -EINVAL;
> +
> +       buf[0] =3D bin2bcd(tm->tm_sec);
> +       buf[1] =3D bin2bcd(tm->tm_min);
> +       buf[2] =3D bin2bcd(tm->tm_hour);
> +       buf[3] =3D bin2bcd(tm->tm_mday);
> +       buf[4] =3D bin2bcd(tm->tm_wday);
> +       buf[5] =3D bin2bcd(tm->tm_mon + 1);
> +
> +       /*
> +        * While the HYM8563 has a century flag in the month register=
,
> +        * it does not seem to carry it over a subsequent write/read.
> +        * So we'll limit ourself to 100 years, starting at 2000 for =
now.
> +        */
> +       buf[6] =3D tm->tm_year - 100;
> +
> +       /*
> +        * CTL1 only contains TEST-mode bits apart from stop,
> +        * so no need to read the value first
> +        */
> +       ret =3D i2c_smbus_write_byte_data(client, HYM8563_CTL1,
> +                                               HYM8563_CTL1_STOP);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret =3D i2c_smbus_write_i2c_block_data(client, HYM8563_SEC, 7=
, buf);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret =3D i2c_smbus_write_byte_data(client, HYM8563_CTL1, 0);
> +       if (ret < 0)
> +               return ret;
> +
> +       hym8563->valid =3D true;
> +
> +       return 0;
> +}
> +
> +static int hym8563_rtc_alarm_irq_enable(struct device *dev,
> +                                       unsigned int enabled)
> +{
> +       struct i2c_client *client =3D to_i2c_client(dev);
> +       int data;
> +
> +       data =3D i2c_smbus_read_byte_data(client, HYM8563_CTL2);
> +       if (data < 0)
> +               return data;
> +
> +       if (enabled)
> +               data |=3D HYM8563_CTL2_AIE;
> +       else
> +               data &=3D ~HYM8563_CTL2_AIE;
> +
> +       return i2c_smbus_write_byte_data(client, HYM8563_CTL2, data);
> +};
> +
> +static int hym8563_rtc_read_alarm(struct device *dev, struct rtc_wka=
lrm *alm)
> +{
> +       struct i2c_client *client =3D to_i2c_client(dev);
> +       struct rtc_time *alm_tm =3D &alm->time;
> +       u8 buf[4];
> +       int ret;
> +
> +       ret =3D i2c_smbus_read_i2c_block_data(client, HYM8563_ALM_MIN=
, 4, buf);
> +       if (ret < 0)
> +               return ret;
> +
> +       /* The alarm only has a minute accuracy */
> +       alm_tm->tm_sec =3D -1;
> +
> +       alm_tm->tm_min =3D (buf[0] & HYM8563_ALM_BIT_DISABLE) ?
> +                                       -1 :
> +                                       bcd2bin(buf[0] & HYM8563_MIN_=
MASK);
> +       alm_tm->tm_hour =3D (buf[1] & HYM8563_ALM_BIT_DISABLE) ?
> +                                       -1 :
> +                                       bcd2bin(buf[1] & HYM8563_HOUR=
_MASK);
> +       alm_tm->tm_mday =3D (buf[2] & HYM8563_ALM_BIT_DISABLE) ?
> +                                       -1 :
> +                                       bcd2bin(buf[2] & HYM8563_DAY_=
MASK);
> +       alm_tm->tm_wday =3D (buf[3] & HYM8563_ALM_BIT_DISABLE) ?
> +                                       -1 :
> +                                       bcd2bin(buf[3] & HYM8563_WEEK=
DAY_MASK);
> +
> +       alm_tm->tm_mon =3D -1;
> +       alm_tm->tm_year =3D -1;
> +
> +       ret =3D i2c_smbus_read_byte_data(client, HYM8563_CTL2);
> +       if (ret < 0)
> +               return ret;
> +
> +       if (ret & HYM8563_CTL2_AIE)
> +               alm->enabled =3D 1;
> +
> +       return 0;
> +}
> +
> +static int hym8563_rtc_set_alarm(struct device *dev, struct rtc_wkal=
rm *alm)
> +{
> +       struct i2c_client *client =3D to_i2c_client(dev);
> +       struct rtc_time *alm_tm =3D &alm->time;
> +       u8 buf[4];
> +       int ret;
> +
> +       /*
> +        * The alarm has no seconds so deal with it
> +        */
> +       if (alm_tm->tm_sec) {
> +               alm_tm->tm_sec =3D 0;
> +               alm_tm->tm_min++;
> +               if (alm_tm->tm_min >=3D 60) {
> +                       alm_tm->tm_min =3D 0;
> +                       alm_tm->tm_hour++;
> +                       if (alm_tm->tm_hour >=3D 24) {
> +                               alm_tm->tm_hour =3D 0;
> +                               alm_tm->tm_mday++;
> +                               if (alm_tm->tm_mday > 31)
> +                                       alm_tm->tm_mday =3D 0;
> +                       }
> +               }
> +       }
> +
> +       ret =3D i2c_smbus_read_byte_data(client, HYM8563_CTL2);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret &=3D ~HYM8563_CTL2_AIE;
> +
> +       ret =3D i2c_smbus_write_byte_data(client, HYM8563_CTL2, ret);
> +       if (ret < 0)
> +               return ret;
> +
> +       buf[0] =3D (alm_tm->tm_min < 60 && alm_tm->tm_min >=3D 0) ?
> +                       bin2bcd(alm_tm->tm_min) : HYM8563_ALM_BIT_DIS=
ABLE;
> +
> +       buf[1] =3D (alm_tm->tm_hour < 24 && alm_tm->tm_hour >=3D 0) ?
> +                       bin2bcd(alm_tm->tm_hour) : HYM8563_ALM_BIT_DI=
SABLE;
> +
> +       buf[2] =3D (alm_tm->tm_mday <=3D 31 && alm_tm->tm_mday >=3D 1=
) ?
> +                       bin2bcd(alm_tm->tm_mday) : HYM8563_ALM_BIT_DI=
SABLE;
> +
> +       buf[3] =3D (alm_tm->tm_wday < 7 && alm_tm->tm_wday >=3D 0) ?
> +                       bin2bcd(alm_tm->tm_wday) : HYM8563_ALM_BIT_DI=
SABLE;
> +
> +       ret =3D i2c_smbus_write_i2c_block_data(client, HYM8563_ALM_MI=
N, 4, buf);
> +       if (ret < 0)
> +               return ret;
> +
> +       return hym8563_rtc_alarm_irq_enable(dev, alm->enabled);
> +}
> +
> +static const struct rtc_class_ops hym8563_rtc_ops =3D {
> +       .read_time              =3D hym8563_rtc_read_time,
> +       .set_time               =3D hym8563_rtc_set_time,
> +       .alarm_irq_enable       =3D hym8563_rtc_alarm_irq_enable,
> +       .read_alarm             =3D hym8563_rtc_read_alarm,
> +       .set_alarm              =3D hym8563_rtc_set_alarm,
> +};
> +
> +/*
> + * Handling of the clkout
> + */
> +
> +#define clkout_hw_to_hym8563(_hw) container_of(_hw, struct hym8563, =
clkout_hw)
> +
> +static int clkout_rates[] =3D {
> +       32768,
> +       1024,
> +       32,
> +       1,
> +};
> +
> +static unsigned long hym8563_clkout_recalc_rate(struct clk_hw *hw,
> +                                               unsigned long parent_=
rate)
> +{
> +       struct hym8563 *hym8563 =3D clkout_hw_to_hym8563(hw);
> +       struct i2c_client *client =3D hym8563->client;
> +       int ret =3D i2c_smbus_read_byte_data(client, HYM8563_CLKOUT);
> +
> +       if (ret < 0 || ret & HYM8563_CLKOUT_DISABLE)
> +               return 0;
> +
> +       ret &=3D HYM8563_CLKOUT_MASK;
> +       return clkout_rates[ret];
> +}
> +
> +static long hym8563_clkout_round_rate(struct clk_hw *hw, unsigned lo=
ng rate,
> +                                     unsigned long *prate)
> +{
> +       int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(clkout_rates); i++)
> +               if (clkout_rates[i] <=3D rate)
> +                       return clkout_rates[i];
> +
> +       return 0;
> +}
> +
> +static int hym8563_clkout_set_rate(struct clk_hw *hw, unsigned long =
rate,
> +                                  unsigned long parent_rate)
> +{
> +       struct hym8563 *hym8563 =3D clkout_hw_to_hym8563(hw);
> +       struct i2c_client *client =3D hym8563->client;
> +       int ret =3D i2c_smbus_read_byte_data(client, HYM8563_CLKOUT);
> +       int i;
> +
> +       if (ret < 0)
> +               return ret;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(clkout_rates); i++)
> +               if (clkout_rates[i] =3D=3D rate) {
> +                       ret &=3D ~HYM8563_CLKOUT_MASK;
> +                       ret |=3D i;
> +                       return i2c_smbus_write_byte_data(client,
> +                                                        HYM8563_CLKO=
UT, ret);
> +               }
> +
> +       return -EINVAL;
> +}
> +
> +static int hym8563_clkout_control(struct clk_hw *hw, bool enable)
> +{
> +       struct hym8563 *hym8563 =3D clkout_hw_to_hym8563(hw);
> +       struct i2c_client *client =3D hym8563->client;
> +       int ret =3D i2c_smbus_read_byte_data(client, HYM8563_CLKOUT);
> +
> +       if (ret < 0)
> +               return ret;
> +
> +       if (enable)
> +               ret &=3D ~HYM8563_CLKOUT_DISABLE;
> +       else
> +               ret |=3D HYM8563_CLKOUT_DISABLE;
> +
> +       return i2c_smbus_write_byte_data(client, HYM8563_CLKOUT, ret)=
;
> +}
> +
> +static int hym8563_clkout_prepare(struct clk_hw *hw)
> +{
> +       return hym8563_clkout_control(hw, 1);
> +}
> +
> +static void hym8563_clkout_unprepare(struct clk_hw *hw)
> +{
> +       hym8563_clkout_control(hw, 0);
> +}
> +
> +static int hym8563_clkout_is_prepared(struct clk_hw *hw)
> +{
> +       struct hym8563 *hym8563 =3D clkout_hw_to_hym8563(hw);
> +       struct i2c_client *client =3D hym8563->client;
> +       int ret =3D i2c_smbus_read_byte_data(client, HYM8563_CLKOUT);
> +
> +       if (ret < 0)
> +               return ret;
> +
> +       return !(ret & HYM8563_CLKOUT_DISABLE);
> +}
> +
> +const struct clk_ops hym8563_clkout_ops =3D {
> +       .prepare =3D hym8563_clkout_prepare,
> +       .unprepare =3D hym8563_clkout_unprepare,
> +       .is_prepared =3D hym8563_clkout_is_prepared,
> +       .recalc_rate =3D hym8563_clkout_recalc_rate,
> +       .round_rate =3D hym8563_clkout_round_rate,
> +       .set_rate =3D hym8563_clkout_set_rate,
> +};
> +
> +static struct clk *hym8563_clkout_register_clk(struct hym8563 *hym85=
63)
> +{
> +       struct i2c_client *client =3D hym8563->client;
> +       struct device_node *node =3D client->dev.of_node;
> +       struct clk *clk;
> +       struct clk_init_data init;
> +       int ret;
> +
> +       ret =3D i2c_smbus_write_byte_data(client, HYM8563_CLKOUT,
> +                                               HYM8563_CLKOUT_DISABL=
E);
> +       if (ret < 0)
> +               return ERR_PTR(ret);
> +
> +       init.name =3D "hym8563-clkout";
> +       init.ops =3D &hym8563_clkout_ops;
> +       init.flags =3D CLK_IS_ROOT;
> +       init.parent_names =3D NULL;
> +       init.num_parents =3D 0;
> +       hym8563->clkout_hw.init =3D &init;
> +
> +       /* register the clock */
> +       clk =3D clk_register(&client->dev, &hym8563->clkout_hw);
> +
> +       if (!IS_ERR(clk))
> +               of_clk_add_provider(node, of_clk_src_simple_get, clk)=
;
> +
> +       return clk;
> +}
> +
> +/*
> + * The alarm interrupt is implemented as a level-low interrupt in th=
e
> + * hym8563, while the timer interrupt uses a falling edge.
> + * We don't use the timer at all, so the interrupt is requested to
> + * use the level-low trigger.
> + */
> +static irqreturn_t hym8563_irq(int irq, void *dev_id)
> +{
> +       struct hym8563 *hym8563 =3D (struct hym8563 *)dev_id;
> +       struct i2c_client *client =3D hym8563->client;
> +       struct mutex *lock =3D &hym8563->rtc->ops_lock;
> +       int data, ret;
> +
> +       mutex_lock(lock);
> +
> +       /* Clear the alarm flag */
> +
> +       data =3D i2c_smbus_read_byte_data(client, HYM8563_CTL2);
> +       if (data < 0) {
> +               dev_err(&client->dev, "%s: error reading i2c data %d\=
n",
> +                       __func__, data);
> +               goto out;
> +       }
> +
> +       data &=3D ~HYM8563_CTL2_AF;
> +
> +       ret =3D i2c_smbus_write_byte_data(client, HYM8563_CTL2, data)=
;
> +       if (ret < 0) {
> +               dev_err(&client->dev, "%s: error writing i2c data %d\=
n",
> +                       __func__, ret);
> +       }
> +
> +out:
> +       mutex_unlock(lock);
> +       return IRQ_HANDLED;
> +}
> +
> +static int hym8563_init_device(struct i2c_client *client)
> +{
> +       int ret;
> +
> +       /* Clear stop flag if present */
> +       ret =3D i2c_smbus_write_byte_data(client, HYM8563_CTL1, 0);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret =3D i2c_smbus_read_byte_data(client, HYM8563_CTL2);
> +       if (ret < 0)
> +               return ret;
> +
> +       /* Disable alarm and timer interrupts */
> +       ret &=3D ~HYM8563_CTL2_AIE;
> +       ret &=3D ~HYM8563_CTL2_TIE;
> +
> +       /* Clear any pending alarm and timer flags */
> +       if (ret & HYM8563_CTL2_AF)
> +               ret &=3D ~HYM8563_CTL2_AF;
> +
> +       if (ret & HYM8563_CTL2_TF)
> +               ret &=3D ~HYM8563_CTL2_TF;
> +
> +       ret &=3D ~HYM8563_CTL2_TI_TP;
> +
> +       return i2c_smbus_write_byte_data(client, HYM8563_CTL2, ret);
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int hym8563_suspend(struct device *dev)
> +{
> +       struct i2c_client *client =3D to_i2c_client(dev);
> +       int ret;
> +
> +       if (device_may_wakeup(dev)) {
> +               ret =3D enable_irq_wake(client->irq);
> +               if (ret) {
> +                       dev_err(dev, "enable_irq_wake failed, %d\n", =
ret);
> +                       return ret;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +static int hym8563_resume(struct device *dev)
> +{
> +       struct i2c_client *client =3D to_i2c_client(dev);
> +
> +       if (device_may_wakeup(dev))
> +               disable_irq_wake(client->irq);
> +
> +       return 0;
> +}
> +#endif
> +
> +static SIMPLE_DEV_PM_OPS(hym8563_pm_ops, hym8563_suspend, hym8563_re=
sume);
> +
> +static int hym8563_probe(struct i2c_client *client,
> +                        const struct i2c_device_id *id)
> +{
> +       struct hym8563 *hym8563;
> +       int ret, gpio_int;
> +
> +       hym8563 =3D devm_kzalloc(&client->dev, sizeof(hym8563), GFP_K=
ERNEL);

Shouldn't this be sizeof(*hym8563)?

> +       if (!hym8563)
> +               return -ENOMEM;
> +
> +       hym8563->client =3D client;
> +       i2c_set_clientdata(client, hym8563);
> +
> +       device_set_wakeup_capable(&client->dev, true);
> +
> +       gpio_int =3D of_get_gpio(client->dev.of_node, 0);
> +       if (!gpio_is_valid(gpio_int)) {
> +               dev_err(&client->dev, "failed to get interrupt gpio\n=
");
> +               return -EINVAL;
> +       }
> +
> +       ret =3D devm_gpio_request_one(&client->dev, gpio_int,
> +                                     GPIOF_DIR_IN, "hym8563_int");
> +       if (ret) {
> +               dev_err(&client->dev, "request of gpio %d failed, %d\=
n",
> +                       gpio_int, ret);
> +               return ret;
> +       }
> +
> +       client->irq =3D gpio_to_irq(gpio_int);
> +       if (client->irq < 0) {
> +               dev_err(&client->dev, "could not get irq of gpio %d, =
%d\n",
> +                       gpio_int, client->irq);
> +               return client->irq;
> +       }
> +
> +       ret =3D hym8563_init_device(client);
> +       if (ret) {
> +               dev_err(&client->dev, "could not init device, %d\n", =
ret);
> +               return ret;
> +       }
> +
> +       ret =3D devm_request_threaded_irq(&client->dev, client->irq,
> +                                       NULL, hym8563_irq,
> +                                       IRQF_TRIGGER_LOW | IRQF_ONESH=
OT,
> +                                       client->name, hym8563);
> +       if (ret < 0) {
> +               dev_err(&client->dev, "irq %d request failed, %d\n",
> +                       client->irq, ret);
> +               return ret;
> +       }
> +
> +       /* check state of calendar information */
> +       ret =3D i2c_smbus_read_byte_data(client, HYM8563_SEC);
> +       if (ret < 0)
> +               return ret;
> +
> +       hym8563->valid =3D !(ret & HYM8563_SEC_VL);
> +       dev_dbg(&client->dev, "rtc information is %s\n",
> +               hym8563->valid ? "valid" : "invalid");
> +
> +       hym8563->rtc =3D devm_rtc_device_register(&client->dev, clien=
t->name,
> +                                               &hym8563_rtc_ops, THI=
S_MODULE);
> +       if (IS_ERR(hym8563->rtc))
> +               return PTR_ERR(hym8563->rtc);
> +
> +       if (IS_ENABLED(CONFIG_COMMON_CLK))
> +               hym8563_clkout_register_clk(hym8563);
> +
> +       return 0;
> +}
> +
> +static const struct i2c_device_id hym8563_id[] =3D {
> +       { "hym8563", 0 },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(i2c, hym8563_id);
> +
> +static struct of_device_id hym8563_dt_idtable[] =3D {
> +       { .compatible =3D "haoyu,hym8563" },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, hym8563_dt_idtable);
> +
> +static struct i2c_driver hym8563_driver =3D {
> +       .driver         =3D {
> +               .name   =3D "rtc-hym8563",
> +               .owner  =3D THIS_MODULE,
> +               .pm     =3D &hym8563_pm_ops,
> +               .of_match_table =3D of_match_ptr(hym8563_dt_idtable),
> +       },
> +       .probe          =3D hym8563_probe,
> +       .id_table       =3D hym8563_id,
> +};
> +
> +module_i2c_driver(hym8563_driver);
> +
> +MODULE_AUTHOR("Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>");
> +MODULE_DESCRIPTION("HYM8563 RTC driver");
> +MODULE_LICENSE("GPL");
> --
> 1.7.10.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/



--=20
Thanks,
//richard
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
