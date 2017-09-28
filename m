Return-Path: <SRS0=Dv/j=A5=leopardimaging.com=leonl@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170927214005.adcj4jrw74abt2j6@valkosipuli.retiisi.org.uk>
References: <20170924075329.9927-1-leonl@leopardimaging.com>
 <20170924075329.9927-2-leonl@leopardimaging.com> <20170927214005.adcj4jrw74abt2j6@valkosipuli.retiisi.org.uk>
From: Leon Luo <leonl@leopardimaging.com>
Date: Wed, 27 Sep 2017 23:48:21 -0700
Message-ID: <CADu3m9zgmdP+hP_Es5gEbNyais-aBS+i-_EZdaZ-B1FKEGY92Q@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] media:imx274 V4l2 driver for Sony imx274 CMOS sensor
Content-Type: multipart/alternative; boundary="f403045cf3d855b918055a3a4bcf"
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, hans.verkuil@cisco.com, sakari.ailus@linux.intel.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

--f403045cf3d855b918055a3a4bcf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

Thanks for your comments.

Regarding imx274_tp_regs[], the first value is the test pattern mode, which
will be updated according to the input value before writing the register.
So it can't be a const.

I will use __v4l2_ctrl_s_ctrl instead of v4l2_ctrl_s_ctrl to keep the
lock/unlock mutex clean. I am traveling right now, will test it and send a
new patch this weekend.

Regards,
Leon Luo
1130 Cadillac CT
Milpitas, CA 95035
Phone: (510)371-1169
Fax: (408) 217-1960
Email: leonl@leopardimaging.com
www.leopardimaging.com

On Wed, Sep 27, 2017 at 2:40 PM, Sakari Ailus <sakari.ailus@iki.fi> wrote:

> Hi Leon,
>
> Thanks for the update. A couple of more comments below; I think we're soo=
n
> done here.
>
> On Sun, Sep 24, 2017 at 12:53:29AM -0700, Leon Luo wrote:
> > The imx274 is a Sony CMOS image sensor that has 1/2.5 image size.
> > It supports up to 3840x2160 (4K) 60fps, 1080p 120fps. The interface
> > is 4-lane MIPI CSI-2 running at 1.44Gbps each.
> >
> > This driver has been tested on Xilinx ZCU102 platform with a Leopard
> > LI-IMX274MIPI-FMC camera board.
> >
> > Support for the following features:
> > -Resolutions: 3840x2160, 1920x1080, 1280x720
> > -Frame rate: 3840x2160 : 5 =E2=80=93 60fps
> >             1920x1080 : 5 =E2=80=93 120fps
> >             1280x720 : 5 =E2=80=93 120fps
> > -Exposure time: 16 =E2=80=93 (frame interval) micro-seconds
> > -Gain: 1x - 180x
> > -VFLIP: enable/disabledrivers/media/i2c/imx274.c
> > -Test pattern: 12 test patterns
> >
> > Signed-off-by: Leon Luo <leonl@leopardimaging.com>
> > Tested-by: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>
> > ---
> > v6:
> > - remove media/v4l2-image-sizes.h from include header
> > - make the header file alphabetical order
> > - remove fmt->pad check in imx274_get_fmt,
> >   the V4L2 subdev framework does it already
> > - change 'struct reg_8 *regs' to 'struct reg_8 regs[n]',
> >   where n is the exact numbers needed for this function
> > - move MODULE_DEVICE_TABLE(of, imx274_of_id_table); closer
> >   to imx274_of_id_table definition
> > - remove return check of imx274_write_table in imx274_remove,
> >   because it should remove all resources even i2c fails here
> > - move imx274_load_default before v4l2_async_register_subdev
> > v5:
> >  - no changes
> > v4:
> >  - use 32-bit data type to avoid __divdi3 compile error for i386
> >  - clean up OR together error codes
> > v3:
> >  - clean up header files
> >  - use struct directly instead of alias #define
> >  - use v4l2_ctrl_s_ctrl instead of v4l2_s_ctrl
> >  - revise debug output
> >  - move static helpers closer to their call site
> >  - don't OR toegether error codes
> >  - use closest valid gain value instead of erroring out
> >  - assigne lock to the control handler and omit explicit locking
> >  - acquire mutex lock for imx274_get_fmt
> >  - remove format->pad check in imx274_set_fmt since the pad is always 0
> >  - pass struct v4l2_ctrl pointer in gain/exposure/vlip/test pattern
> controls
> >  - remove priv->ctrls.vflip->val =3D val in imx274_set_vflip()
> >  - remove priv->ctrls.test_pattern->val =3D val in
> imx274_set_test_pattern()
> >  - remove empty open/close callbacks
> >  - remove empty core ops
> >  - add more error labels in probe
> >  - use v4l2_async_unregister_subdev instead of
> v4l2_device_unregister_subdev
> >  - use dynamic debug
> >  - split start_stream to two steps: imx274_mode_regs() and
> imx274_start_stream()
> >    frame rate & exposure can be updated
> >    between imx274_mode_regs() & imx274_start_stream()
> >
> > v2:
> >  - Fix Kconfig to not remove existing options
> > ---
> >  drivers/media/i2c/Kconfig  |    7 +
> >  drivers/media/i2c/Makefile |    1 +
> >  drivers/media/i2c/imx274.c | 1804 ++++++++++++++++++++++++++++++
> ++++++++++++++
> >  3 files changed, 1812 insertions(+)
> >  create mode 100644 drivers/media/i2c/imx274.c
> >
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index 47113774a297..9659849e33a0 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -555,6 +555,13 @@ config VIDEO_APTINA_PLL
> >  config VIDEO_SMIAPP_PLL
> >       tristate
> >
> > +config VIDEO_IMX274
> > +     tristate "Sony IMX274 sensor support"
> > +     depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
> > +     ---help---
> > +       This is a V4L2 sensor-level driver for the Sony IMX274
> > +       CMOS image sensor.
> > +
> >  config VIDEO_OV2640
> >       tristate "OmniVision OV2640 sensor support"
> >       depends on VIDEO_V4L2 && I2C
> > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > index c843c181dfb9..f8d57e453936 100644
> > --- a/drivers/media/i2c/Makefile
> > +++ b/drivers/media/i2c/Makefile
> > @@ -92,5 +92,6 @@ obj-$(CONFIG_VIDEO_IR_I2C)  +=3D ir-kbd-i2c.o
> >  obj-$(CONFIG_VIDEO_ML86V7667)        +=3D ml86v7667.o
> >  obj-$(CONFIG_VIDEO_OV2659)   +=3D ov2659.o
> >  obj-$(CONFIG_VIDEO_TC358743) +=3D tc358743.o
> > +obj-$(CONFIG_VIDEO_IMX274)   +=3D imx274.o
> >
> >  obj-$(CONFIG_SDR_MAX2175) +=3D max2175.o
> > diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
> > new file mode 100644
> > index 000000000000..924d543682b0
> > --- /dev/null
> > +++ b/drivers/media/i2c/imx274.c
> > @@ -0,0 +1,1804 @@
> > +/*
> > + * imx274.c - IMX274 CMOS Image Sensor driver
> > + *
> > + * Copyright (C) 2017, Leopard Imaging, Inc.
> > + *
> > + * Leon Luo <leonl@leopardimaging.com>
> > + * Edwin Zou <edwinz@leopardimaging.com>
> > + *
> > + * This program is free software; you can redistribute it and/or modif=
y
> it
> > + * under the terms and conditions of the GNU General Public License,
> > + * version 2, as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope it will be useful, but
> WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY =
or
> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
> License for
> > + * more details.
> > + *
> > + * You should have received a copy of the GNU General Public License
> > + * along with this program.  If not, see <http://www.gnu.org/licenses/=
>
> .
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/gpio.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/i2c.h>
> > +#include <linux/init.h>
> > +#include <linux/module.h>
> > +#include <linux/of_gpio.h>
> > +#include <linux/regmap.h>
> > +#include <linux/slab.h>
> > +#include <linux/v4l2-mediabus.h>
> > +#include <linux/videodev2.h>
> > +
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-device.h>
> > +#include <media/v4l2-subdev.h>
> > +
> > +/*
> > + * See "SHR, SVR Setting" in datasheet
> > + */
> > +#define IMX274_DEFAULT_FRAME_LENGTH          (4550)
> > +#define IMX274_MAX_FRAME_LENGTH                      (0x000fffff)
> > +
> > +/*
> > + * See "Frame Rate Adjustment" in datasheet
> > + */
> > +#define IMX274_PIXCLK_CONST1                 (72000000)
> > +#define IMX274_PIXCLK_CONST2                 (1000000)
> > +
> > +/*
> > + * The input gain is shifted by IMX274_GAIN_SHIFT to get
> > + * decimal number. The real gain is
> > + * (float)input_gain_value / (1 << IMX274_GAIN_SHIFT)
> > + */
> > +#define IMX274_GAIN_SHIFT                    (8)
> > +#define IMX274_GAIN_SHIFT_MASK                       ((1 <<
> IMX274_GAIN_SHIFT) - 1)
> > +
> > +/*
> > + * See "Analog Gain" and "Digital Gain" in datasheet
> > + * min gain is 1X
> > + * max gain is calculated based on IMX274_GAIN_REG_MAX
> > + */
> > +#define IMX274_GAIN_REG_MAX                  (1957)
> > +#define IMX274_MIN_GAIN                              (0x01 <<
> IMX274_GAIN_SHIFT)
> > +#define IMX274_MAX_ANALOG_GAIN                       ((2048 <<
> IMX274_GAIN_SHIFT)\
> > +                                     / (2048 - IMX274_GAIN_REG_MAX))
> > +#define IMX274_MAX_DIGITAL_GAIN                      (8)
> > +#define IMX274_DEF_GAIN                              (20 <<
> IMX274_GAIN_SHIFT)
> > +#define IMX274_GAIN_CONST                    (2048) /* for gain formul=
a
> */
> > +
> > +/*
> > + * 1 line time in us =3D (HMAX / 72), minimal is 4 lines
> > + */
> > +#define IMX274_MIN_EXPOSURE_TIME             (4 * 260 / 72)
> > +
> > +#define IMX274_DEFAULT_MODE                  IMX274_MODE_3840X2160
> > +#define IMX274_MAX_WIDTH                     (3840)
> > +#define IMX274_MAX_HEIGHT                    (2160)
> > +#define IMX274_MAX_FRAME_RATE                        (120)
> > +#define IMX274_MIN_FRAME_RATE                        (5)
> > +#define IMX274_DEF_FRAME_RATE                        (60)
> > +
> > +/*
> > + * register SHR is limited to (SVR value + 1) x VMAX value - 4
> > + */
> > +#define IMX274_SHR_LIMIT_CONST                       (4)
> > +
> > +/*
> > + * Constants for sensor reset delay
> > + */
> > +#define IMX274_RESET_DELAY1                  (2000)
> > +#define IMX274_RESET_DELAY2                  (2200)
> > +
> > +/*
> > + * shift and mask constants
> > + */
> > +#define IMX274_SHIFT_8_BITS                  (8)
> > +#define IMX274_SHIFT_16_BITS                 (16)
> > +#define IMX274_MASK_LSB_2_BITS                       (0x03)
> > +#define IMX274_MASK_LSB_3_BITS                       (0x07)
> > +#define IMX274_MASK_LSB_4_BITS                       (0x0f)
> > +#define IMX274_MASK_LSB_8_BITS                       (0x00ff)
> > +
> > +#define DRIVER_NAME "IMX274"
> > +
> > +/*
> > + * IMX274 register definitions
> > + */
> > +#define IMX274_FRAME_LENGTH_ADDR_1           0x30FA /* VMAX, MSB */
> > +#define IMX274_FRAME_LENGTH_ADDR_2           0x30F9 /* VMAX */
> > +#define IMX274_FRAME_LENGTH_ADDR_3           0x30F8 /* VMAX, LSB */
> > +#define IMX274_SVR_REG_MSB                   0x300F /* SVR */
> > +#define IMX274_SVR_REG_LSB                   0x300E /* SVR */
> > +#define IMX274_HMAX_REG_MSB                  0x30F7 /* HMAX */
> > +#define IMX274_HMAX_REG_LSB                  0x30F6 /* HMAX */
> > +#define IMX274_COARSE_TIME_ADDR_MSB          0x300D /* SHR */
> > +#define IMX274_COARSE_TIME_ADDR_LSB          0x300C /* SHR */
> > +#define IMX274_ANALOG_GAIN_ADDR_LSB          0x300A /* ANALOG GAIN LSB
> */
> > +#define IMX274_ANALOG_GAIN_ADDR_MSB          0x300B /* ANALOG GAIN MSB
> */
> > +#define IMX274_DIGITAL_GAIN_REG                      0x3012 /* Digital
> Gain */
> > +#define IMX274_VFLIP_REG                     0x301A /* VERTICAL FLIP *=
/
> > +#define IMX274_STANDBY_REG                   0x3000 /* STANDBY */
> > +
> > +#define IMX274_TABLE_WAIT_MS                 0
> > +#define IMX274_TABLE_END                     1
> > +
> > +/*
> > + * imx274 I2C operation related structure
> > + */
> > +struct reg_8 {
> > +     u16 addr;
> > +     u8 val;
> > +};
> > +
> > +static const struct regmap_config imx274_regmap_config =3D {
> > +     .reg_bits =3D 16,
> > +     .val_bits =3D 8,
> > +     .cache_type =3D REGCACHE_RBTREE,
> > +};
> > +
> > +enum imx274_mode {
> > +     IMX274_MODE_3840X2160,
> > +     IMX274_MODE_1920X1080,
> > +     IMX274_MODE_1280X720,
> > +
> > +     IMX274_MODE_START_STREAM_1,
> > +     IMX274_MODE_START_STREAM_2,
> > +     IMX274_MODE_START_STREAM_3,
> > +     IMX274_MODE_START_STREAM_4,
> > +     IMX274_MODE_STOP_STREAM
> > +};
> > +
> > +/*
> > + * imx274 format related structure
> > + */
> > +struct imx274_frmfmt {
> > +     u32 mbus_code;
> > +     enum v4l2_colorspace colorspace;
> > +     struct v4l2_frmsize_discrete size;
> > +     enum imx274_mode mode;
> > +};
> > +
> > +/*
> > + * imx274 test pattern related structure
> > + */
> > +enum {
> > +     TEST_PATTERN_DISABLED =3D 0,
> > +     TEST_PATTERN_ALL_000H,
> > +     TEST_PATTERN_ALL_FFFH,
> > +     TEST_PATTERN_ALL_555H,
> > +     TEST_PATTERN_ALL_AAAH,
> > +     TEST_PATTERN_VSP_5AH, /* VERTICAL STRIPE PATTERN 555H/AAAH */
> > +     TEST_PATTERN_VSP_A5H, /* VERTICAL STRIPE PATTERN AAAH/555H */
> > +     TEST_PATTERN_VSP_05H, /* VERTICAL STRIPE PATTERN 000H/555H */
> > +     TEST_PATTERN_VSP_50H, /* VERTICAL STRIPE PATTERN 555H/000H */
> > +     TEST_PATTERN_VSP_0FH, /* VERTICAL STRIPE PATTERN 000H/FFFH */
> > +     TEST_PATTERN_VSP_F0H, /* VERTICAL STRIPE PATTERN FFFH/000H */
> > +     TEST_PATTERN_H_COLOR_BARS,
> > +     TEST_PATTERN_V_COLOR_BARS,
> > +};
> > +
> > +static const char * const tp_qmenu[] =3D {
> > +     "Disabled",
> > +     "All 000h Pattern",
> > +     "All FFFh Pattern",
> > +     "All 555h Pattern",
> > +     "All AAAh Pattern",
> > +     "Vertical Stripe (555h / AAAh)",
> > +     "Vertical Stripe (AAAh / 555h)",
> > +     "Vertical Stripe (000h / 555h)",
> > +     "Vertical Stripe (555h / 000h)",
> > +     "Vertical Stripe (000h / FFFh)",
> > +     "Vertical Stripe (FFFh / 000h)",
> > +     "Horizontal Color Bars",
> > +     "Vertical Color Bars",
> > +};
> > +
> > +/*
> > + * All-pixel scan mode (10-bit)
> > + * imx274 mode1(refer to datasheet) register configuration with
> > + * 3840x2160 resolution, raw10 data and mipi four lane output
> > + */
> > +static const struct reg_8 imx274_mode1_3840x2160_raw10[] =3D {
> > +     {0x3004, 0x01},
> > +     {0x3005, 0x01},
> > +     {0x3006, 0x00},
> > +     {0x3007, 0x02},
> > +
> > +     {0x3018, 0xA2}, /* output XVS, HVS */
> > +
> > +     {0x306B, 0x05},
> > +     {0x30E2, 0x01},
> > +     {0x30F6, 0x07}, /* HMAX, 263 */
> > +     {0x30F7, 0x01}, /* HMAX */
> > +
> > +     {0x30dd, 0x01}, /* crop to 2160 */
> > +     {0x30de, 0x06},
> > +     {0x30df, 0x00},
> > +     {0x30e0, 0x12},
> > +     {0x30e1, 0x00},
> > +     {0x3037, 0x01}, /* to crop to 3840 */
> > +     {0x3038, 0x0c},
> > +     {0x3039, 0x00},
> > +     {0x303a, 0x0c},
> > +     {0x303b, 0x0f},
> > +
> > +     {0x30EE, 0x01},
> > +     {0x3130, 0x86},
> > +     {0x3131, 0x08},
> > +     {0x3132, 0x7E},
> > +     {0x3133, 0x08},
> > +     {0x3342, 0x0A},
> > +     {0x3343, 0x00},
> > +     {0x3344, 0x16},
> > +     {0x3345, 0x00},
> > +     {0x33A6, 0x01},
> > +     {0x3528, 0x0E},
> > +     {0x3554, 0x1F},
> > +     {0x3555, 0x01},
> > +     {0x3556, 0x01},
> > +     {0x3557, 0x01},
> > +     {0x3558, 0x01},
> > +     {0x3559, 0x00},
> > +     {0x355A, 0x00},
> > +     {0x35BA, 0x0E},
> > +     {0x366A, 0x1B},
> > +     {0x366B, 0x1A},
> > +     {0x366C, 0x19},
> > +     {0x366D, 0x17},
> > +     {0x3A41, 0x08},
> > +
> > +     {IMX274_TABLE_END, 0x00}
> > +};
> > +
> > +/*
> > + * Horizontal/vertical 2/2-line binning
> > + * (Horizontal and vertical weightedbinning, 10-bit)
> > + * imx274 mode3(refer to datasheet) register configuration with
> > + * 1920x1080 resolution, raw10 data and mipi four lane output
> > + */
> > +static const struct reg_8 imx274_mode3_1920x1080_raw10[] =3D {
> > +     {0x3004, 0x02},
> > +     {0x3005, 0x21},
> > +     {0x3006, 0x00},
> > +     {0x3007, 0x11},
> > +
> > +     {0x3018, 0xA2}, /* output XVS, HVS */
> > +
> > +     {0x306B, 0x05},
> > +     {0x30E2, 0x02},
> > +
> > +     {0x30F6, 0x04}, /* HMAX, 260 */
> > +     {0x30F7, 0x01}, /* HMAX */
> > +
> > +     {0x30dd, 0x01}, /* to crop to 1920x1080 */
> > +     {0x30de, 0x05},
> > +     {0x30df, 0x00},
> > +     {0x30e0, 0x04},
> > +     {0x30e1, 0x00},
> > +     {0x3037, 0x01},
> > +     {0x3038, 0x0c},
> > +     {0x3039, 0x00},
> > +     {0x303a, 0x0c},
> > +     {0x303b, 0x0f},
> > +
> > +     {0x30EE, 0x01},
> > +     {0x3130, 0x4E},
> > +     {0x3131, 0x04},
> > +     {0x3132, 0x46},
> > +     {0x3133, 0x04},
> > +     {0x3342, 0x0A},
> > +     {0x3343, 0x00},
> > +     {0x3344, 0x1A},
> > +     {0x3345, 0x00},
> > +     {0x33A6, 0x01},
> > +     {0x3528, 0x0E},
> > +     {0x3554, 0x00},
> > +     {0x3555, 0x01},
> > +     {0x3556, 0x01},
> > +     {0x3557, 0x01},
> > +     {0x3558, 0x01},
> > +     {0x3559, 0x00},
> > +     {0x355A, 0x00},
> > +     {0x35BA, 0x0E},
> > +     {0x366A, 0x1B},
> > +     {0x366B, 0x1A},
> > +     {0x366C, 0x19},
> > +     {0x366D, 0x17},
> > +     {0x3A41, 0x08},
> > +
> > +     {IMX274_TABLE_END, 0x00}
> > +};
> > +
> > +/*
> > + * Vertical 2/3 subsampling binning horizontal 3 binning
> > + * imx274 mode5(refer to datasheet) register configuration with
> > + * 1280x720 resolution, raw10 data and mipi four lane output
> > + */
> > +static const struct reg_8 imx274_mode5_1280x720_raw10[] =3D {
> > +     {0x3004, 0x03},
> > +     {0x3005, 0x31},
> > +     {0x3006, 0x00},
> > +     {0x3007, 0x09},
> > +
> > +     {0x3018, 0xA2}, /* output XVS, HVS */
> > +
> > +     {0x306B, 0x05},
> > +     {0x30E2, 0x03},
> > +
> > +     {0x30F6, 0x04}, /* HMAX, 260 */
> > +     {0x30F7, 0x01}, /* HMAX */
> > +
> > +     {0x30DD, 0x01},
> > +     {0x30DE, 0x07},
> > +     {0x30DF, 0x00},
> > +     {0x40E0, 0x04},
> > +     {0x30E1, 0x00},
> > +     {0x3030, 0xD4},
> > +     {0x3031, 0x02},
> > +     {0x3032, 0xD0},
> > +     {0x3033, 0x02},
> > +
> > +     {0x30EE, 0x01},
> > +     {0x3130, 0xE2},
> > +     {0x3131, 0x02},
> > +     {0x3132, 0xDE},
> > +     {0x3133, 0x02},
> > +     {0x3342, 0x0A},
> > +     {0x3343, 0x00},
> > +     {0x3344, 0x1B},
> > +     {0x3345, 0x00},
> > +     {0x33A6, 0x01},
> > +     {0x3528, 0x0E},
> > +     {0x3554, 0x00},
> > +     {0x3555, 0x01},
> > +     {0x3556, 0x01},
> > +     {0x3557, 0x01},
> > +     {0x3558, 0x01},
> > +     {0x3559, 0x00},
> > +     {0x355A, 0x00},
> > +     {0x35BA, 0x0E},
> > +     {0x366A, 0x1B},
> > +     {0x366B, 0x19},
> > +     {0x366C, 0x17},
> > +     {0x366D, 0x17},
> > +     {0x3A41, 0x04},
> > +
> > +     {IMX274_TABLE_END, 0x00}
> > +};
> > +
> > +/*
> > + * imx274 first step register configuration for
> > + * starting stream
> > + */
> > +static const struct reg_8 imx274_start_1[] =3D {
> > +     {IMX274_STANDBY_REG, 0x12},
> > +     {IMX274_TABLE_END, 0x00}
> > +};
> > +
> > +/*
> > + * imx274 second step register configuration for
> > + * starting stream
> > + */
> > +static const struct reg_8 imx274_start_2[] =3D {
> > +     {0x3120, 0xF0}, /* clock settings */
> > +     {0x3121, 0x00}, /* clock settings */
> > +     {0x3122, 0x02}, /* clock settings */
> > +     {0x3129, 0x9C}, /* clock settings */
> > +     {0x312A, 0x02}, /* clock settings */
> > +     {0x312D, 0x02}, /* clock settings */
> > +
> > +     {0x310B, 0x00},
> > +
> > +     /* PLSTMG */
> > +     {0x304C, 0x00}, /* PLSTMG01 */
> > +     {0x304D, 0x03},
> > +     {0x331C, 0x1A},
> > +     {0x331D, 0x00},
> > +     {0x3502, 0x02},
> > +     {0x3529, 0x0E},
> > +     {0x352A, 0x0E},
> > +     {0x352B, 0x0E},
> > +     {0x3538, 0x0E},
> > +     {0x3539, 0x0E},
> > +     {0x3553, 0x00},
> > +     {0x357D, 0x05},
> > +     {0x357F, 0x05},
> > +     {0x3581, 0x04},
> > +     {0x3583, 0x76},
> > +     {0x3587, 0x01},
> > +     {0x35BB, 0x0E},
> > +     {0x35BC, 0x0E},
> > +     {0x35BD, 0x0E},
> > +     {0x35BE, 0x0E},
> > +     {0x35BF, 0x0E},
> > +     {0x366E, 0x00},
> > +     {0x366F, 0x00},
> > +     {0x3670, 0x00},
> > +     {0x3671, 0x00},
> > +
> > +     /* PSMIPI */
> > +     {0x3304, 0x32}, /* PSMIPI1 */
> > +     {0x3305, 0x00},
> > +     {0x3306, 0x32},
> > +     {0x3307, 0x00},
> > +     {0x3590, 0x32},
> > +     {0x3591, 0x00},
> > +     {0x3686, 0x32},
> > +     {0x3687, 0x00},
> > +
> > +     {IMX274_TABLE_END, 0x00}
> > +};
> > +
> > +/*
> > + * imx274 third step register configuration for
> > + * starting stream
> > + */
> > +static const struct reg_8 imx274_start_3[] =3D {
> > +     {IMX274_STANDBY_REG, 0x00},
> > +     {0x303E, 0x02}, /* SYS_MODE =3D 2 */
> > +     {IMX274_TABLE_END, 0x00}
> > +};
> > +
> > +/*
> > + * imx274 forth step register configuration for
> > + * starting stream
> > + */
> > +static const struct reg_8 imx274_start_4[] =3D {
> > +     {0x30F4, 0x00},
> > +     {0x3018, 0xA2}, /* XHS VHS OUTUPT */
> > +     {IMX274_TABLE_END, 0x00}
> > +};
> > +
> > +/*
> > + * imx274 register configuration for stoping stream
> > + */
> > +static const struct reg_8 imx274_stop[] =3D {
> > +     {IMX274_STANDBY_REG, 0x01},
> > +     {IMX274_TABLE_END, 0x00}
> > +};
> > +
> > +/*
> > + * imx274 disable test pattern register configuration
> > + */
> > +static const struct reg_8 imx274_tp_disabled[] =3D {
> > +     {0x303C, 0x00},
> > +     {0x377F, 0x00},
> > +     {0x3781, 0x00},
> > +     {0x370B, 0x00},
> > +     {IMX274_TABLE_END, 0x00}
> > +};
> > +
> > +/*
> > + * imx274 test pattern register configuration
> > + * reg 0x303D defines the test pattern modes
> > + */
> > +static struct reg_8 imx274_tp_regs[] =3D {
>
> const?
>
> > +     {0x303D, 0x00},
> > +     {0x303C, 0x11},
> > +     {0x370E, 0x01},
> > +     {0x377F, 0x01},
> > +     {0x3781, 0x01},
> > +     {0x370B, 0x11},
> > +     {IMX274_TABLE_END, 0x00}
> > +};
> > +
> > +static const struct reg_8 *mode_table[] =3D {
> > +     [IMX274_MODE_3840X2160]         =3D imx274_mode1_3840x2160_raw10,
> > +     [IMX274_MODE_1920X1080]         =3D imx274_mode3_1920x1080_raw10,
> > +     [IMX274_MODE_1280X720]          =3D imx274_mode5_1280x720_raw10,
> > +
> > +     [IMX274_MODE_START_STREAM_1]    =3D imx274_start_1,
> > +     [IMX274_MODE_START_STREAM_2]    =3D imx274_start_2,
> > +     [IMX274_MODE_START_STREAM_3]    =3D imx274_start_3,
> > +     [IMX274_MODE_START_STREAM_4]    =3D imx274_start_4,
> > +     [IMX274_MODE_STOP_STREAM]       =3D imx274_stop,
> > +};
> > +
> > +/*
> > + * imx274 format related structure
> > + */
> > +static const struct imx274_frmfmt imx274_formats[] =3D {
> > +     {MEDIA_BUS_FMT_SRGGB10_1X10, V4L2_COLORSPACE_SRGB, {3840, 2160},
> > +             IMX274_MODE_3840X2160},
> > +     {MEDIA_BUS_FMT_SRGGB10_1X10, V4L2_COLORSPACE_SRGB, {1920, 1080},
> > +             IMX274_MODE_1920X1080},
> > +     {MEDIA_BUS_FMT_SRGGB10_1X10, V4L2_COLORSPACE_SRGB, {1280, 720},
> > +             IMX274_MODE_1280X720},
> > +};
> > +
> > +/*
> > + * minimal frame length for each mode
> > + * refer to datasheet section "Frame Rate Adjustment (CSI-2)"
> > + */
> > +static const int min_frame_len[] =3D {
> > +     4550, /* mode 1, 4K */
> > +     2310, /* mode 3, 1080p */
> > +     2310 /* mode 5, 720p */
> > +};
> > +
> > +/*
> > + * minimal numbers of SHR register
> > + * refer to datasheet table "Shutter Setting (CSI-2)"
> > + */
> > +static const int min_SHR[] =3D {
> > +     12, /* mode 1, 4K */
> > +     8, /* mode 3, 1080p */
> > +     8 /* mode 5, 720p */
> > +};
> > +
> > +static const int max_frame_rate[] =3D {
> > +     60, /* mode 1 , 4K */
> > +     120, /* mode 3, 1080p */
> > +     120 /* mode 5, 720p */
> > +};
> > +
> > +/*
> > + * Number of clocks per internal offset period
> > + * a constant based on mode
> > + * refer to section "Integration Time in Each Readout Drive Mode
> (CSI-2)"
> > + * in the datasheet
> > + * for the implemented 3 modes, it happens to be the same number
> > + */
> > +static const int nocpiop[] =3D {
> > +     112, /* mode 1 , 4K */
> > +     112, /* mode 3, 1080p */
> > +     112 /* mode 5, 720p */
> > +};
> > +
> > +/*
> > + * struct imx274_ctrls - imx274 ctrl structure
> > + * @handler: V4L2 ctrl handler structure
> > + * @exposure: Pointer to expsure ctrl structure
> > + * @gain: Pointer to gain ctrl structure
> > + * @vflip: Pointer to vflip ctrl structure
> > + * @test_pattern: Pointer to test pattern ctrl structure
> > + */
> > +struct imx274_ctrls {
> > +     struct v4l2_ctrl_handler handler;
> > +     struct v4l2_ctrl *exposure;
> > +     struct v4l2_ctrl *gain;
> > +     struct v4l2_ctrl *vflip;
> > +     struct v4l2_ctrl *test_pattern;
> > +};
> > +
> > +/*
> > + * struct stim274 - imx274 device structure
> > + * @sd: V4L2 subdevice structure
> > + * @pd: Media pad structure
> > + * @client: Pointer to I2C client
> > + * @ctrls: imx274 control structure
> > + * @format: V4L2 media bus frame format structure
> > + * @frame_rate: V4L2 frame rate structure
> > + * @regmap: Pointer to regmap structure
> > + * @reset_gpio: Pointer to reset gpio
> > + * @lock: Mutex structure
> > + * @mode_index: Resolution mode index
> > + */
> > +struct stimx274 {
> > +     struct v4l2_subdev sd;
> > +     struct media_pad pad;
> > +     struct i2c_client *client;
> > +     struct imx274_ctrls ctrls;
> > +     struct v4l2_mbus_framefmt format;
> > +     struct v4l2_fract frame_interval;
> > +     struct regmap *regmap;
> > +     struct gpio_desc *reset_gpio;
> > +     struct mutex lock; /* mutex lock for operations */
> > +     u32 mode_index;
> > +};
> > +
> > +/*
> > + * Function declaration
> > + */
> > +static int imx274_set_gain(struct stimx274 *priv, struct v4l2_ctrl
> *ctrl);
> > +static int imx274_set_exposure(struct stimx274 *priv, int val);
> > +static int imx274_set_vflip(struct stimx274 *priv, int val);
> > +static int imx274_set_test_pattern(struct stimx274 *priv, int val);
> > +static int imx274_set_frame_interval(struct stimx274 *priv,
> > +                                  struct v4l2_fract frame_interval);
> > +
> > +static inline void msleep_range(unsigned int delay_base)
> > +{
> > +     usleep_range(delay_base * 1000, delay_base * 1000 + 500);
> > +}
> > +
> > +/*
> > + * v4l2_ctrl and v4l2_subdev related operations
> > + */
> > +static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
> > +{
> > +     return &container_of(ctrl->handler,
> > +                          struct stimx274, ctrls.handler)->sd;
> > +}
> > +
> > +static inline struct stimx274 *to_imx274(struct v4l2_subdev *sd)
> > +{
> > +     return container_of(sd, struct stimx274, sd);
> > +}
> > +
> > +/*
> > + * imx274_regmap_util_write_table_8 - Function for writing register
> table
> > + * @regmap: Pointer to device reg map structure
> > + * @table: Table containing register values
> > + * @wait_ms_addr: Flag for performing delay
> > + * @end_addr: Flag for incating end of table
> > + *
> > + * This is used to write register table into sensor's reg map.
> > + *
> > + * Return: 0 on success, errors otherwise
> > + */
> > +static int imx274_regmap_util_write_table_8(struct regmap *regmap,
> > +                                         const struct reg_8 table[],
> > +                                         u16 wait_ms_addr, u16 end_add=
r)
> > +{
> > +     int err;
> > +     const struct reg_8 *next;
> > +     u8 val;
> > +
> > +     int range_start =3D -1;
> > +     int range_count =3D 0;
> > +     u8 range_vals[16];
> > +     int max_range_vals =3D ARRAY_SIZE(range_vals);
> > +
> > +     for (next =3D table;; next++) {
> > +             if ((next->addr !=3D range_start + range_count) ||
> > +                 (next->addr =3D=3D end_addr) ||
> > +                 (next->addr =3D=3D wait_ms_addr) ||
> > +                 (range_count =3D=3D max_range_vals)) {
> > +                     if (range_count =3D=3D 1)
> > +                             err =3D regmap_write(regmap,
> > +                                                range_start,
> range_vals[0]);
> > +                     else if (range_count > 1)
> > +                             err =3D regmap_bulk_write(regmap,
> range_start,
> > +                                                     &range_vals[0],
> > +                                                     range_count);
> > +
> > +                     if (err)
> > +                             return err;
> > +
> > +                     range_start =3D -1;
> > +                     range_count =3D 0;
> > +
> > +                     /* Handle special address values */
> > +                     if (next->addr =3D=3D end_addr)
> > +                             break;
> > +
> > +                     if (next->addr =3D=3D wait_ms_addr) {
> > +                             msleep_range(next->val);
> > +                             continue;
> > +                     }
> > +             }
> > +
> > +             val =3D next->val;
> > +
> > +             if (range_start =3D=3D -1)
> > +                     range_start =3D next->addr;
> > +
> > +             range_vals[range_count++] =3D val;
> > +     }
> > +     return 0;
> > +}
> > +
> > +static inline int imx274_read_reg(struct stimx274 *priv, u16 addr, u8
> *val)
> > +{
> > +     int err;
> > +
> > +     err =3D regmap_read(priv->regmap, addr, (unsigned int *)val);
> > +     if (err)
> > +             dev_err(&priv->client->dev,
> > +                     "%s : i2c read failed, addr =3D %x\n", __func__,
> addr);
> > +     else
> > +             dev_dbg(&priv->client->dev,
> > +                     "%s : addr 0x%x, val=3D0x%x\n", __func__,
> > +                     addr, *val);
> > +     return err;
> > +}
> > +
> > +static inline int imx274_write_reg(struct stimx274 *priv, u16 addr, u8
> val)
> > +{
> > +     int err;
> > +
> > +     err =3D regmap_write(priv->regmap, addr, val);
> > +     if (err)
> > +             dev_err(&priv->client->dev,
> > +                     "%s : i2c write failed, %x =3D %x\n", __func__,
> > +                     addr, val);
> > +     else
> > +             dev_dbg(&priv->client->dev,
> > +                     "%s : addr 0x%x, val=3D0x%x\n", __func__,
> > +                     addr, val);
> > +     return err;
> > +}
> > +
> > +static int imx274_write_table(struct stimx274 *priv, const struct reg_=
8
> table[])
> > +{
> > +     return imx274_regmap_util_write_table_8(priv->regmap,
> > +             table, IMX274_TABLE_WAIT_MS, IMX274_TABLE_END);
> > +}
> > +
> > +/*
> > + * imx274_mode_regs - Function for set mode registers per mode index
> > + * @priv: Pointer to device structure
> > + * @mode: Mode index value
> > + *
> > + * This is used to start steam per mode index.
> > + * mode =3D 0, start stream for sensor Mode 1: 4K/raw10
> > + * mode =3D 1, start stream for sensor Mode 3: 1080p/raw10
> > + * mode =3D 2, start stream for sensor Mode 5: 720p/raw10
> > + *
> > + * Return: 0 on success, errors otherwise
> > + */
> > +static int imx274_mode_regs(struct stimx274 *priv, int mode)
> > +{
> > +     int err =3D 0;
> > +
> > +     err =3D imx274_write_table(priv, mode_table[IMX274_MODE_START_
> STREAM_1]);
> > +     if (err)
> > +             return err;
> > +
> > +     err =3D imx274_write_table(priv, mode_table[IMX274_MODE_START_
> STREAM_2]);
> > +     if (err)
> > +             return err;
> > +
> > +     err =3D imx274_write_table(priv, mode_table[mode]);
> > +
> > +     return err;
> > +}
> > +
> > +/*
> > + * imx274_start_stream - Function for starting stream per mode index
> > + * @priv: Pointer to device structure
> > + *
> > + * Return: 0 on success, errors otherwise
> > + */
> > +static int imx274_start_stream(struct stimx274 *priv)
> > +{
> > +     int err =3D 0;
> > +
> > +     /*
> > +      * Refer to "Standby Cancel Sequence when using CSI-2" in
> > +      * imx274 datasheet, it should wait 10ms or more here.
> > +      * give it 1 extra ms for margin
> > +      */
> > +     msleep_range(11);
> > +     err =3D imx274_write_table(priv, mode_table[IMX274_MODE_START_
> STREAM_3]);
> > +     if (err)
> > +             return err;
> > +
> > +     /*
> > +      * Refer to "Standby Cancel Sequence when using CSI-2" in
> > +      * imx274 datasheet, it should wait 7ms or more here.
> > +      * give it 1 extra ms for margin
> > +      */
> > +     msleep_range(8);
> > +     err =3D imx274_write_table(priv, mode_table[IMX274_MODE_START_
> STREAM_4]);
> > +     if (err)
> > +             return err;
> > +
> > +     return 0;
> > +}
> > +
> > +/*
> > + * imx274_reset - Function called to reset the sensor
> > + * @priv: Pointer to device structure
> > + * @rst: Input value for determining the sensor's end state after rese=
t
> > + *
> > + * Set the senor in reset and then
> > + * if rst =3D 0, keep it in reset;
> > + * if rst =3D 1, bring it out of reset.
> > + *
> > + */
> > +static void imx274_reset(struct stimx274 *priv, int rst)
> > +{
> > +     gpiod_set_value_cansleep(priv->reset_gpio, 0);
> > +     usleep_range(IMX274_RESET_DELAY1, IMX274_RESET_DELAY2);
> > +     gpiod_set_value_cansleep(priv->reset_gpio, !!rst);
> > +     usleep_range(IMX274_RESET_DELAY1, IMX274_RESET_DELAY2);
> > +}
> > +
> > +/**
> > + * imx274_s_ctrl - This is used to set the imx274 V4L2 controls
> > + * @ctrl: V4L2 control to be set
> > + *
> > + * This function is used to set the V4L2 controls for the imx274 senso=
r.
> > + *
> > + * Return: 0 on success, errors otherwise
> > + */
> > +static int imx274_s_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +     struct v4l2_subdev *sd =3D ctrl_to_sd(ctrl);
> > +     struct stimx274 *imx274 =3D to_imx274(sd);
> > +     int ret =3D -EINVAL;
> > +
> > +     dev_dbg(&imx274->client->dev,
> > +             "%s : s_ctrl: %s, value: %d\n", __func__,
> > +             ctrl->name, ctrl->val);
> > +
> > +     switch (ctrl->id) {
> > +     case V4L2_CID_EXPOSURE:
> > +             dev_dbg(&imx274->client->dev,
> > +                     "%s : set V4L2_CID_EXPOSURE\n", __func__);
> > +             ret =3D imx274_set_exposure(imx274, ctrl->val);
> > +             break;
> > +
> > +     case V4L2_CID_GAIN:
> > +             dev_dbg(&imx274->client->dev,
> > +                     "%s : set V4L2_CID_GAIN\n", __func__);
> > +             ret =3D imx274_set_gain(imx274, ctrl);
> > +             break;
> > +
> > +     case V4L2_CID_VFLIP:
> > +             dev_dbg(&imx274->client->dev,
> > +                     "%s : set V4L2_CID_VFLIP\n", __func__);
> > +             ret =3D imx274_set_vflip(imx274, ctrl->val);
> > +             break;
> > +
> > +     case V4L2_CID_TEST_PATTERN:
> > +             dev_dbg(&imx274->client->dev,
> > +                     "%s : set V4L2_CID_TEST_PATTERN\n", __func__);
> > +             ret =3D imx274_set_test_pattern(imx274, ctrl->val);
> > +             break;
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> > +/**
> > + * imx274_get_fmt - Get the pad format
> > + * @sd: Pointer to V4L2 Sub device structure
> > + * @cfg: Pointer to sub device pad information structure
> > + * @fmt: Pointer to pad level media bus format
> > + *
> > + * This function is used to get the pad format information.
> > + *
> > + * Return: 0 on success
> > + */
> > +static int imx274_get_fmt(struct v4l2_subdev *sd,
> > +                       struct v4l2_subdev_pad_config *cfg,
> > +                       struct v4l2_subdev_format *fmt)
> > +{
> > +     struct stimx274 *imx274 =3D to_imx274(sd);
> > +
> > +     mutex_lock(&imx274->lock);
> > +     fmt->format =3D imx274->format;
> > +     mutex_unlock(&imx274->lock);
> > +     return 0;
> > +}
> > +
> > +/**
> > + * imx274_set_fmt - This is used to set the pad format
> > + * @sd: Pointer to V4L2 Sub device structure
> > + * @cfg: Pointer to sub device pad information structure
> > + * @format: Pointer to pad level media bus format
> > + *
> > + * This function is used to set the pad format.
> > + *
> > + * Return: 0 on success
> > + */
> > +static int imx274_set_fmt(struct v4l2_subdev *sd,
> > +                       struct v4l2_subdev_pad_config *cfg,
> > +                       struct v4l2_subdev_format *format)
> > +{
> > +     struct v4l2_mbus_framefmt *fmt =3D &format->format;
> > +     struct stimx274 *imx274 =3D to_imx274(sd);
> > +     struct i2c_client *client =3D imx274->client;
> > +     int index;
> > +
> > +     dev_dbg(&client->dev,
> > +             "%s: width =3D %d height =3D %d code =3D %d mbus_code =3D=
 %d\n",
> > +             __func__, fmt->width, fmt->height, fmt->code,
> > +             imx274_formats[imx274->mode_index].mbus_code);
> > +
> > +     mutex_lock(&imx274->lock);
> > +
> > +     for (index =3D 0; index < ARRAY_SIZE(imx274_formats); index++) {
> > +             if (imx274_formats[index].size.width =3D=3D fmt->width &&
> > +                 imx274_formats[index].size.height =3D=3D fmt->height)
> > +                     break;
> > +     }
> > +
> > +     if (index >=3D ARRAY_SIZE(imx274_formats)) {
> > +             /* default to first format */
> > +             index =3D 0;
> > +     }
> > +
> > +     imx274->mode_index =3D index;
> > +
> > +     if (fmt->width > IMX274_MAX_WIDTH)
> > +             fmt->width =3D IMX274_MAX_WIDTH;
> > +     if (fmt->height > IMX274_MAX_HEIGHT)
> > +             fmt->height =3D IMX274_MAX_HEIGHT;
> > +     fmt->width =3D fmt->width & (~IMX274_MASK_LSB_2_BITS);
> > +     fmt->height =3D fmt->height & (~IMX274_MASK_LSB_2_BITS);
> > +     fmt->field =3D V4L2_FIELD_NONE;
> > +
> > +     if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> > +             cfg->try_fmt =3D *fmt;
> > +     else
> > +             imx274->format =3D *fmt;
> > +
> > +     mutex_unlock(&imx274->lock);
> > +     return 0;
> > +}
> > +
> > +/**
> > + * imx274_g_frame_interval - Get the frame interval
> > + * @sd: Pointer to V4L2 Sub device structure
> > + * @fi: Pointer to V4l2 Sub device frame interval structure
> > + *
> > + * This function is used to get the frame interval.
> > + *
> > + * Return: 0 on success
> > + */
> > +static int imx274_g_frame_interval(struct v4l2_subdev *sd,
> > +                                struct v4l2_subdev_frame_interval *fi)
> > +{
> > +     struct stimx274 *imx274 =3D to_imx274(sd);
> > +
> > +     fi->interval =3D imx274->frame_interval;
> > +     dev_dbg(&imx274->client->dev, "%s frame rate =3D %d / %d\n",
> > +             __func__, imx274->frame_interval.numerator,
> > +             imx274->frame_interval.denominator);
> > +
> > +     return 0;
> > +}
> > +
> > +/**
> > + * imx274_s_frame_interval - Set the frame interval
> > + * @sd: Pointer to V4L2 Sub device structure
> > + * @fi: Pointer to V4l2 Sub device frame interval structure
> > + *
> > + * This function is used to set the frame intervavl.
> > + *
> > + * Return: 0 on success
> > + */
> > +static int imx274_s_frame_interval(struct v4l2_subdev *sd,
> > +                                struct v4l2_subdev_frame_interval *fi)
> > +{
> > +     struct stimx274 *imx274 =3D to_imx274(sd);
> > +     struct v4l2_ctrl *ctrl =3D imx274->ctrls.exposure;
> > +     int min, max, def;
> > +     int ret;
> > +
> > +     mutex_lock(&imx274->lock);
> > +     ret =3D imx274_set_frame_interval(imx274, fi->interval);
> > +
> > +     if (!ret) {
> > +             /*
> > +              * exposure time range is decided by frame interval
> > +              * need to update it after frame interal changes
> > +              */
> > +             min =3D IMX274_MIN_EXPOSURE_TIME;
> > +             max =3D fi->interval.numerator * 1000000
> > +                     / fi->interval.denominator;
> > +             def =3D max;
> > +             if (__v4l2_ctrl_modify_range(ctrl, min, max, 1, def)) {
> > +                     dev_err(&imx274->client->dev,
> > +                             "Exposure ctrl range update failed\n");
> > +                     goto unlock;
> > +             }
> > +
> > +             /* update exposure time accordingly */
> > +             imx274_set_exposure(imx274, imx274->ctrls.exposure->val);
> > +
> > +             dev_dbg(&imx274->client->dev, "set frame interval to
> %uus\n",
> > +                     fi->interval.numerator * 1000000
> > +                     / fi->interval.denominator);
> > +     }
> > +
> > +unlock:
> > +     mutex_unlock(&imx274->lock);
> > +
> > +     return ret;
> > +}
> > +
> > +/**
> > + * imx274_load_default - load default control values
> > + * @priv: Pointer to device structure
> > + *
> > + * Return: 0 on success, errors otherwise
> > + */
> > +static int imx274_load_default(struct stimx274 *priv)
> > +{
> > +     int ret;
> > +
> > +     /* load default control values */
> > +     priv->frame_interval.numerator =3D 1;
> > +     priv->frame_interval.denominator =3D IMX274_DEF_FRAME_RATE;
> > +     priv->ctrls.exposure->val =3D 1000000 / IMX274_DEF_FRAME_RATE;
> > +     priv->ctrls.gain->val =3D IMX274_DEF_GAIN;
> > +     priv->ctrls.vflip->val =3D 0;
> > +     priv->ctrls.test_pattern->val =3D TEST_PATTERN_DISABLED;
> > +
> > +     /* update frame rate */
> > +     ret =3D imx274_set_frame_interval(priv,
> > +                                     priv->frame_interval);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* update exposure time */
> > +     ret =3D v4l2_ctrl_s_ctrl(priv->ctrls.exposure,
> priv->ctrls.exposure->val);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* update gain */
> > +     ret =3D v4l2_ctrl_s_ctrl(priv->ctrls.gain, priv->ctrls.gain->val)=
;
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* update vflip */
> > +     ret =3D v4l2_ctrl_s_ctrl(priv->ctrls.vflip, priv->ctrls.vflip->va=
l);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return 0;
> > +}
> > +
> > +/**
> > + * imx274_s_stream - It is used to start/stop the streaming.
> > + * @sd: V4L2 Sub device
> > + * @on: Flag (True / False)
> > + *
> > + * This function controls the start or stop of streaming for the
> > + * imx274 sensor.
> > + *
> > + * Return: 0 on success, errors otherwise
> > + */
> > +static int imx274_s_stream(struct v4l2_subdev *sd, int on)
> > +{
> > +     struct stimx274 *imx274 =3D to_imx274(sd);
> > +     int ret =3D 0;
> > +
> > +     dev_dbg(&imx274->client->dev, "%s : %s, mode index =3D %d\n",
> __func__,
> > +             on ? "Stream Start" : "Stream Stop", imx274->mode_index);
> > +
> > +     mutex_lock(&imx274->lock);
> > +
> > +     if (on) {
> > +             /* load mode registers */
> > +             imx274_mode_regs(imx274, imx274->mode_index);
> > +             if (ret)
> > +                     goto fail;
> > +
> > +             /*
> > +              * update frame rate & expsoure. if the last mode is
> different,
> > +              * HMAX could be changed. As the result, frame rate &
> exposure
> > +              * are changed.
> > +              * gain is not affected.
> > +              */
> > +             ret =3D imx274_set_frame_interval(imx274,
> > +                                             imx274->frame_interval);
> > +             if (ret)
> > +                     goto fail;
> > +
> > +             mutex_unlock(&imx274->lock);
> > +
> > +             /* update exposure time */
> > +             ret =3D v4l2_ctrl_s_ctrl(imx274->ctrls.exposure,
> > +                                    imx274->ctrls.exposure->val);
> > +             if (ret)
> > +                     goto fail;
>
> Here, you'll end up unlocking a mutex which was just unlocked.
>
> As setting streaming should probably be serialised entirely, I'd suggest
> not releasing and reacquiring the mutex to begin with, and switching to
> __v4l2_ctrl_s_ctrl().
>
> > +
> > +             mutex_lock(&imx274->lock);
> > +
> > +             /* start stream */
> > +             ret =3D imx274_start_stream(imx274);
> > +             if (ret)
> > +                     goto fail;
> > +     } else {
> > +             /* stop stream */
> > +             ret =3D imx274_write_table(imx274,
> > +                                      mode_table[IMX274_MODE_STOP_
> STREAM]);
> > +             if (ret)
> > +                     goto fail;
> > +     }
> > +
> > +     mutex_unlock(&imx274->lock);
> > +     dev_dbg(&imx274->client->dev,
> > +             "%s : Done: mode =3D %d\n", __func__, imx274->mode_index)=
;
> > +     return 0;
> > +
> > +fail:
> > +     mutex_unlock(&imx274->lock);
> > +     dev_err(&imx274->client->dev, "s_stream failed\n");
> > +     return ret;
> > +}
> > +
> > +/*
> > + * imx274_get_frame_length - Function for obtaining current frame leng=
th
> > + * @priv: Pointer to device structure
> > + * @val: Pointer to obainted value
> > + *
> > + * frame_length =3D vmax x (svr + 1), in unit of hmax.
> > + *
> > + * Return: 0 on success
> > + */
> > +static int imx274_get_frame_length(struct stimx274 *priv, u32 *val)
> > +{
> > +     int err;
> > +     u16 svr;
> > +     u32 vmax;
> > +     u8 reg_val[3];
> > +
> > +     /* svr */
> > +     err =3D imx274_read_reg(priv, IMX274_SVR_REG_LSB, &reg_val[0]);
> > +     if (err)
> > +             goto fail;
> > +
> > +     err =3D imx274_read_reg(priv, IMX274_SVR_REG_MSB, &reg_val[1]);
> > +     if (err)
> > +             goto fail;
> > +
> > +     svr =3D (reg_val[1] << IMX274_SHIFT_8_BITS) + reg_val[0];
> > +
> > +     /* vmax */
> > +     err =3D imx274_read_reg(priv, IMX274_FRAME_LENGTH_ADDR_3,
> &reg_val[0]);
> > +     if (err)
> > +             goto fail;
> > +
> > +     err =3D imx274_read_reg(priv, IMX274_FRAME_LENGTH_ADDR_2,
> &reg_val[1]);
> > +     if (err)
> > +             goto fail;
> > +
> > +     err =3D imx274_read_reg(priv, IMX274_FRAME_LENGTH_ADDR_1,
> &reg_val[2]);
> > +     if (err)
> > +             goto fail;
> > +
> > +     vmax =3D ((reg_val[2] & IMX274_MASK_LSB_3_BITS) <<
> IMX274_SHIFT_16_BITS)
> > +             + (reg_val[1] << IMX274_SHIFT_8_BITS) + reg_val[0];
> > +
> > +     *val =3D vmax * (svr + 1);
> > +
> > +     return 0;
> > +
> > +fail:
> > +     dev_err(&priv->client->dev, "%s error =3D %d\n", __func__, err);
> > +     return err;
> > +}
> > +
> > +static int imx274_clamp_coarse_time(struct stimx274 *priv, u32 *val,
> > +                                 u32 *frame_length)
> > +{
> > +     int err;
> > +
> > +     err =3D imx274_get_frame_length(priv, frame_length);
> > +     if (err)
> > +             return err;
> > +
> > +     if (*frame_length < min_frame_len[priv->mode_index])
> > +             *frame_length =3D min_frame_len[priv->mode_index];
> > +
> > +     *val =3D *frame_length - *val; /* convert to raw shr */
> > +     if (*val > *frame_length - IMX274_SHR_LIMIT_CONST)
> > +             *val =3D *frame_length - IMX274_SHR_LIMIT_CONST;
> > +     else if (*val < min_SHR[priv->mode_index])
> > +             *val =3D min_SHR[priv->mode_index];
> > +
> > +     return 0;
> > +}
> > +
> > +/*
> > + * imx274_set_digital gain - Function called when setting digital gain
> > + * @priv: Pointer to device structure
> > + * @dgain: Value of digital gain.
> > + *
> > + * Digital gain has only 4 steps: 1x, 2x, 4x, and 8x
> > + *
> > + * Return: 0 on success
> > + */
> > +static int imx274_set_digital_gain(struct stimx274 *priv, u32 dgain)
> > +{
> > +     u8 reg_val;
> > +
> > +     reg_val =3D ffs(dgain);
> > +
> > +     if (reg_val)
> > +             reg_val--;
> > +
> > +     reg_val =3D clamp(reg_val, (u8)0, (u8)3);
> > +
> > +     return imx274_write_reg(priv, IMX274_DIGITAL_GAIN_REG,
> > +                             reg_val & IMX274_MASK_LSB_4_BITS);
> > +}
> > +
> > +static inline void imx274_calculate_gain_regs(struct reg_8 regs[2],
> u16 gain)
> > +{
> > +     regs->addr =3D IMX274_ANALOG_GAIN_ADDR_MSB;
> > +     regs->val =3D (gain >> IMX274_SHIFT_8_BITS) & IMX274_MASK_LSB_3_B=
ITS;
> > +
> > +     (regs + 1)->addr =3D IMX274_ANALOG_GAIN_ADDR_LSB;
> > +     (regs + 1)->val =3D (gain) & IMX274_MASK_LSB_8_BITS;
> > +}
> > +
> > +/*
> > + * imx274_set_gain - Function called when setting gain
> > + * @priv: Pointer to device structure
> > + * @val: Value of gain. the real value =3D val << IMX274_GAIN_SHIFT;
> > + * @ctrl: v4l2 control pointer
> > + *
> > + * Set the gain based on input value.
> > + * The caller should hold the mutex lock imx274->lock if necessary
> > + *
> > + * Return: 0 on success
> > + */
> > +static int imx274_set_gain(struct stimx274 *priv, struct v4l2_ctrl
> *ctrl)
> > +{
> > +     struct reg_8 reg_list[2];
> > +     int err;
> > +     u32 gain, analog_gain, digital_gain, gain_reg;
> > +     int i;
> > +
> > +     gain =3D (u32)(ctrl->val);
> > +
> > +     dev_dbg(&priv->client->dev,
> > +             "%s : input gain =3D %d.%d\n", __func__,
> > +             gain >> IMX274_GAIN_SHIFT,
> > +             ((gain & IMX274_GAIN_SHIFT_MASK) * 100) >>
> IMX274_GAIN_SHIFT);
> > +
> > +     if (gain > IMX274_MAX_DIGITAL_GAIN * IMX274_MAX_ANALOG_GAIN)
> > +             gain =3D IMX274_MAX_DIGITAL_GAIN * IMX274_MAX_ANALOG_GAIN=
;
> > +     else if (gain < IMX274_MIN_GAIN)
> > +             gain =3D IMX274_MIN_GAIN;
> > +
> > +     if (gain <=3D IMX274_MAX_ANALOG_GAIN)
> > +             digital_gain =3D 1;
> > +     else if (gain <=3D IMX274_MAX_ANALOG_GAIN * 2)
> > +             digital_gain =3D 2;
> > +     else if (gain <=3D IMX274_MAX_ANALOG_GAIN * 4)
> > +             digital_gain =3D 4;
> > +     else
> > +             digital_gain =3D IMX274_MAX_DIGITAL_GAIN;
> > +
> > +     analog_gain =3D gain / digital_gain;
> > +
> > +     dev_dbg(&priv->client->dev,
> > +             "%s : digital gain =3D %d, analog gain =3D %d.%d\n",
> > +             __func__, digital_gain, analog_gain >> IMX274_GAIN_SHIFT,
> > +             ((analog_gain & IMX274_GAIN_SHIFT_MASK) * 100)
> > +             >> IMX274_GAIN_SHIFT);
> > +
> > +     err =3D imx274_set_digital_gain(priv, digital_gain);
> > +     if (err)
> > +             goto fail;
> > +
> > +     /* convert to register value, refer to imx274 datasheet */
> > +     gain_reg =3D (u32)IMX274_GAIN_CONST -
> > +             (IMX274_GAIN_CONST << IMX274_GAIN_SHIFT) / analog_gain;
> > +     if (gain_reg > IMX274_GAIN_REG_MAX)
> > +             gain_reg =3D IMX274_GAIN_REG_MAX;
> > +
> > +     imx274_calculate_gain_regs(reg_list, (u16)gain_reg);
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(reg_list); i++) {
> > +             err =3D imx274_write_reg(priv, reg_list[i].addr,
> > +                                    reg_list[i].val);
> > +             if (err)
> > +                     goto fail;
> > +     }
> > +
> > +     /* convert register value back to gain value */
> > +     ctrl->val =3D (IMX274_GAIN_CONST << IMX274_GAIN_SHIFT)
> > +                     / (IMX274_GAIN_CONST - gain_reg) * digital_gain;
> > +
> > +     dev_dbg(&priv->client->dev,
> > +             "%s : GAIN control success, gain_reg =3D %d, new gain =3D
> %d\n",
> > +             __func__, gain_reg, ctrl->val);
> > +
> > +     return 0;
> > +
> > +fail:
> > +     dev_err(&priv->client->dev, "%s error =3D %d\n", __func__, err);
> > +     return err;
> > +}
> > +
> > +static inline void imx274_calculate_coarse_time_regs(struct reg_8
> regs[2],
> > +                                                  u32 coarse_time)
> > +{
> > +     regs->addr =3D IMX274_COARSE_TIME_ADDR_MSB;
> > +     regs->val =3D (coarse_time >> IMX274_SHIFT_8_BITS)
> > +                     & IMX274_MASK_LSB_8_BITS;
> > +     (regs + 1)->addr =3D IMX274_COARSE_TIME_ADDR_LSB;
> > +     (regs + 1)->val =3D (coarse_time) & IMX274_MASK_LSB_8_BITS;
> > +}
> > +
> > +/*
> > + * imx274_set_coarse_time - Function called when setting SHR value
> > + * @priv: Pointer to device structure
> > + * @val: Value for exposure time in number of line_length, or [HMAX]
> > + *
> > + * Set SHR value based on input value.
> > + *
> > + * Return: 0 on success
> > + */
> > +static int imx274_set_coarse_time(struct stimx274 *priv, u32 *val)
> > +{
> > +     struct reg_8 reg_list[2];
> > +     int err;
> > +     u32 coarse_time, frame_length;
> > +     int i;
> > +
> > +     coarse_time =3D *val;
> > +
> > +     /* convert exposure_time to appropriate SHR value */
> > +     err =3D imx274_clamp_coarse_time(priv, &coarse_time, &frame_lengt=
h);
> > +     if (err)
> > +             goto fail;
> > +
> > +     /* prepare SHR registers */
> > +     imx274_calculate_coarse_time_regs(reg_list, coarse_time);
> > +
> > +     /* write to SHR registers */
> > +     for (i =3D 0; i < ARRAY_SIZE(reg_list); i++) {
> > +             err =3D imx274_write_reg(priv, reg_list[i].addr,
> > +                                    reg_list[i].val);
> > +             if (err)
> > +                     goto fail;
> > +     }
> > +
> > +     *val =3D frame_length - coarse_time;
> > +     return 0;
> > +
> > +fail:
> > +     dev_err(&priv->client->dev, "%s error =3D %d\n", __func__, err);
> > +     return err;
> > +}
> > +
> > +/*
> > + * imx274_set_exposure - Function called when setting exposure time
> > + * @priv: Pointer to device structure
> > + * @val: Variable for exposure time, in the unit of micro-second
> > + *
> > + * Set exposure time based on input value.
> > + * The caller should hold the mutex lock imx274->lock if necessary
> > + *
> > + * Return: 0 on success
> > + */
> > +static int imx274_set_exposure(struct stimx274 *priv, int val)
> > +{
> > +     int err;
> > +     u16 hmax;
> > +     u8 reg_val[2];
> > +     u32 coarse_time; /* exposure time in unit of line (HMAX)*/
> > +
> > +     dev_dbg(&priv->client->dev,
> > +             "%s : EXPOSURE control input =3D %d\n", __func__, val);
> > +
> > +     /* step 1: convert input exposure_time (val) into number of
> 1[HMAX] */
> > +
> > +     /* obtain HMAX value */
> > +     err =3D imx274_read_reg(priv, IMX274_HMAX_REG_LSB, &reg_val[0]);
> > +     if (err)
> > +             goto fail;
> > +     err =3D imx274_read_reg(priv, IMX274_HMAX_REG_MSB, &reg_val[1]);
> > +     if (err)
> > +             goto fail;
> > +     hmax =3D (reg_val[1] << IMX274_SHIFT_8_BITS) + reg_val[0];
> > +     if (hmax =3D=3D 0) {
> > +             err =3D -EINVAL;
> > +             goto fail;
> > +     }
> > +
> > +     coarse_time =3D (IMX274_PIXCLK_CONST1 / IMX274_PIXCLK_CONST2 * va=
l
> > +                     - nocpiop[priv->mode_index]) / hmax;
> > +
> > +     /* step 2: convert exposure_time into SHR value */
> > +
> > +     /* set SHR */
> > +     err =3D imx274_set_coarse_time(priv, &coarse_time);
> > +     if (err)
> > +             goto fail;
> > +
> > +     priv->ctrls.exposure->val =3D
> > +                     (coarse_time * hmax + nocpiop[priv->mode_index])
> > +                     / (IMX274_PIXCLK_CONST1 / IMX274_PIXCLK_CONST2);
> > +
> > +     dev_dbg(&priv->client->dev,
> > +             "%s : EXPOSURE control success\n", __func__);
> > +     return 0;
> > +
> > +fail:
> > +     dev_err(&priv->client->dev, "%s error =3D %d\n", __func__, err);
> > +
> > +     return err;
> > +}
> > +
> > +/*
> > + * imx274_set_vflip - Function called when setting vertical flip
> > + * @priv: Pointer to device structure
> > + * @val: Value for vflip setting
> > + *
> > + * Set vertical flip based on input value.
> > + * val =3D 0: normal, no vertical flip
> > + * val =3D 1: vertical flip enabled
> > + * The caller should hold the mutex lock imx274->lock if necessary
> > + *
> > + * Return: 0 on success
> > + */
> > +static int imx274_set_vflip(struct stimx274 *priv, int val)
> > +{
> > +     int err;
> > +
> > +     err =3D imx274_write_reg(priv, IMX274_VFLIP_REG, val);
> > +     if (err) {
> > +             dev_err(&priv->client->dev, "VFILP control error\n");
> > +             return err;
> > +     }
> > +
> > +     dev_dbg(&priv->client->dev,
> > +             "%s : VFLIP control success\n", __func__);
> > +
> > +     return 0;
> > +}
> > +
> > +/*
> > + * imx274_set_test_pattern - Function called when setting test pattern
> > + * @priv: Pointer to device structure
> > + * @val: Variable for test pattern
> > + *
> > + * Set to different test patterns based on input value.
> > + *
> > + * Return: 0 on success
> > + */
> > +static int imx274_set_test_pattern(struct stimx274 *priv, int val)
> > +{
> > +     int err =3D 0;
> > +
> > +     if (val =3D=3D TEST_PATTERN_DISABLED) {
> > +             err =3D imx274_write_table(priv, imx274_tp_disabled);
> > +     } else if (val <=3D TEST_PATTERN_V_COLOR_BARS) {
> > +             imx274_tp_regs[0].val =3D val - 1;
> > +             err =3D imx274_write_table(priv, imx274_tp_regs);
> > +     } else {
> > +             err =3D -EINVAL;
> > +     }
> > +
> > +     if (!err)
> > +             dev_dbg(&priv->client->dev,
> > +                     "%s : TEST PATTERN control success\n", __func__);
> > +     else
> > +             dev_err(&priv->client->dev, "%s error =3D %d\n", __func__=
,
> err);
> > +
> > +     return err;
> > +}
> > +
> > +static inline void imx274_calculate_frame_length_regs(struct reg_8
> regs[3],
> > +                                                   u32 frame_length)
> > +{
> > +     regs->addr =3D IMX274_FRAME_LENGTH_ADDR_1;
> > +     regs->val =3D (frame_length >> IMX274_SHIFT_16_BITS)
> > +                     & IMX274_MASK_LSB_4_BITS;
> > +     (regs + 1)->addr =3D IMX274_FRAME_LENGTH_ADDR_2;
> > +     (regs + 1)->val =3D (frame_length >> IMX274_SHIFT_8_BITS)
> > +                     & IMX274_MASK_LSB_8_BITS;
> > +     (regs + 2)->addr =3D IMX274_FRAME_LENGTH_ADDR_3;
> > +     (regs + 2)->val =3D (frame_length) & IMX274_MASK_LSB_8_BITS;
> > +}
> > +
> > +/*
> > + * imx274_set_frame_length - Function called when setting frame length
> > + * @priv: Pointer to device structure
> > + * @val: Variable for frame length (=3D VMAX, i.e. vertical drive peri=
od
> length)
> > + *
> > + * Set frame length based on input value.
> > + *
> > + * Return: 0 on success
> > + */
> > +static int imx274_set_frame_length(struct stimx274 *priv, u32 val)
> > +{
> > +     struct reg_8 reg_list[3];
> > +     int err;
> > +     u32 frame_length;
> > +     int i;
> > +
> > +     dev_dbg(&priv->client->dev, "%s : input length =3D %d\n",
> > +             __func__, val);
> > +
> > +     frame_length =3D (u32)val;
> > +
> > +     imx274_calculate_frame_length_regs(reg_list, frame_length);
> > +     for (i =3D 0; i < ARRAY_SIZE(reg_list); i++) {
> > +             err =3D imx274_write_reg(priv, reg_list[i].addr,
> > +                                    reg_list[i].val);
> > +             if (err)
> > +                     goto fail;
> > +     }
> > +
> > +     return 0;
> > +
> > +fail:
> > +     dev_err(&priv->client->dev, "%s error =3D %d\n", __func__, err);
> > +     return err;
> > +}
> > +
> > +/*
> > + * imx274_set_frame_interval - Function called when setting frame
> interval
> > + * @priv: Pointer to device structure
> > + * @frame_interval: Variable for frame interval
> > + *
> > + * Change frame interval by updating VMAX value
> > + * The caller should hold the mutex lock imx274->lock if necessary
> > + *
> > + * Return: 0 on success
> > + */
> > +static int imx274_set_frame_interval(struct stimx274 *priv,
> > +                                  struct v4l2_fract frame_interval)
> > +{
> > +     int err;
> > +     u32 frame_length, req_frame_rate;
> > +     u16 svr;
> > +     u16 hmax;
> > +     u8 reg_val[2];
> > +
> > +     dev_dbg(&priv->client->dev, "%s: input frame interval =3D %d / %d=
",
> > +             __func__, frame_interval.numerator,
> > +             frame_interval.denominator);
> > +
> > +     if (frame_interval.denominator =3D=3D 0) {
> > +             err =3D -EINVAL;
> > +             goto fail;
> > +     }
> > +
> > +     req_frame_rate =3D (u32)(frame_interval.denominator
> > +                             / frame_interval.numerator);
> > +
> > +     /* boundary check */
> > +     if (req_frame_rate > max_frame_rate[priv->mode_index]) {
> > +             frame_interval.numerator =3D 1;
> > +             frame_interval.denominator =3D
> > +                                     max_frame_rate[priv->mode_index];
> > +     } else if (req_frame_rate < IMX274_MIN_FRAME_RATE) {
> > +             frame_interval.numerator =3D 1;
> > +             frame_interval.denominator =3D IMX274_MIN_FRAME_RATE;
> > +     }
> > +
> > +     /*
> > +      * VMAX =3D 1/frame_rate x 72M / (SVR+1) / HMAX
> > +      * frame_length (i.e. VMAX) =3D (frame_interval) x 72M /(SVR+1) /
> HMAX
> > +      */
> > +
> > +     /* SVR */
> > +     err =3D imx274_read_reg(priv, IMX274_SVR_REG_LSB, &reg_val[0]);
> > +     if (err)
> > +             goto fail;
> > +     err =3D imx274_read_reg(priv, IMX274_SVR_REG_MSB, &reg_val[1]);
> > +     if (err)
> > +             goto fail;
> > +     svr =3D (reg_val[1] << IMX274_SHIFT_8_BITS) + reg_val[0];
> > +     dev_dbg(&priv->client->dev,
> > +             "%s : register SVR =3D %d\n", __func__, svr);
> > +
> > +     /* HMAX */
> > +     err =3D imx274_read_reg(priv, IMX274_HMAX_REG_LSB, &reg_val[0]);
> > +     if (err)
> > +             goto fail;
> > +     err =3D imx274_read_reg(priv, IMX274_HMAX_REG_MSB, &reg_val[1]);
> > +     if (err)
> > +             goto fail;
> > +     hmax =3D (reg_val[1] << IMX274_SHIFT_8_BITS) + reg_val[0];
> > +     dev_dbg(&priv->client->dev,
> > +             "%s : register HMAX =3D %d\n", __func__, hmax);
> > +
> > +     frame_length =3D IMX274_PIXCLK_CONST1 / (svr + 1) / hmax
> > +                                     * frame_interval.numerator
> > +                                     / frame_interval.denominator;
> > +
> > +     err =3D imx274_set_frame_length(priv, frame_length);
> > +     if (err)
> > +             goto fail;
> > +
> > +     priv->frame_interval =3D frame_interval;
> > +     return 0;
> > +
> > +fail:
> > +     dev_err(&priv->client->dev, "%s error =3D %d\n", __func__, err);
> > +     return err;
> > +}
> > +
> > +static const struct v4l2_subdev_pad_ops imx274_pad_ops =3D {
> > +     .get_fmt =3D imx274_get_fmt,
> > +     .set_fmt =3D imx274_set_fmt,
> > +};
> > +
> > +static const struct v4l2_subdev_video_ops imx274_video_ops =3D {
> > +     .g_frame_interval =3D imx274_g_frame_interval,
> > +     .s_frame_interval =3D imx274_s_frame_interval,
> > +     .s_stream =3D imx274_s_stream,
> > +};
> > +
> > +static const struct v4l2_subdev_ops imx274_subdev_ops =3D {
> > +     .pad =3D &imx274_pad_ops,
> > +     .video =3D &imx274_video_ops,
> > +};
> > +
> > +static const struct v4l2_ctrl_ops imx274_ctrl_ops =3D {
> > +     .s_ctrl =3D imx274_s_ctrl,
> > +};
> > +
> > +static const struct of_device_id imx274_of_id_table[] =3D {
> > +     { .compatible =3D "sony,imx274" },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, imx274_of_id_table);
> > +
> > +static const struct i2c_device_id imx274_id[] =3D {
> > +     { "IMX274", 0 },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(i2c, imx274_id);
> > +
> > +static int imx274_probe(struct i2c_client *client,
> > +                     const struct i2c_device_id *id)
> > +{
> > +     struct v4l2_subdev *sd;
> > +     struct stimx274 *imx274;
> > +     int ret;
> > +
> > +     /* initialize imx274 */
> > +     imx274 =3D devm_kzalloc(&client->dev, sizeof(*imx274), GFP_KERNEL=
);
> > +     if (!imx274)
> > +             return -ENOMEM;
> > +
> > +     mutex_init(&imx274->lock);
> > +
> > +     /* initialize regmap */
> > +     imx274->regmap =3D devm_regmap_init_i2c(client,
> &imx274_regmap_config);
> > +     if (IS_ERR(imx274->regmap)) {
> > +             dev_err(&client->dev,
> > +                     "regmap init failed: %ld\n",
> PTR_ERR(imx274->regmap));
> > +             ret =3D -ENODEV;
> > +             goto err_regmap;
> > +     }
> > +
> > +     /* initialize subdevice */
> > +     imx274->client =3D client;
> > +     sd =3D &imx274->sd;
> > +     v4l2_i2c_subdev_init(sd, client, &imx274_subdev_ops);
> > +     strlcpy(sd->name, DRIVER_NAME, sizeof(sd->name));
> > +     sd->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE |
> V4L2_SUBDEV_FL_HAS_EVENTS;
> > +
> > +     /* initialize subdev media pad */
> > +     imx274->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> > +     sd->entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> > +     ret =3D media_entity_pads_init(&sd->entity, 1, &imx274->pad);
> > +     if (ret < 0) {
> > +             dev_err(&client->dev,
> > +                     "%s : media entity init Failed %d\n", __func__,
> ret);
> > +             goto err_regmap;
> > +     }
> > +
> > +     /* initialize sensor reset gpio */
> > +     imx274->reset_gpio =3D devm_gpiod_get_optional(&client->dev,
> "reset",
> > +                                                  GPIOD_OUT_HIGH);
> > +     if (IS_ERR(imx274->reset_gpio)) {
> > +             if (PTR_ERR(imx274->reset_gpio) !=3D -EPROBE_DEFER)
> > +                     dev_err(&client->dev, "Reset GPIO not setup in
> DT");
> > +             ret =3D PTR_ERR(imx274->reset_gpio);
> > +             goto err_me;
> > +     }
> > +
> > +     /* pull sensor out of reset */
> > +     imx274_reset(imx274, 1);
> > +
> > +     /* initialize controls */
> > +     ret =3D v4l2_ctrl_handler_init(&imx274->ctrls.handler, 2);
> > +     if (ret < 0) {
> > +             dev_err(&client->dev,
> > +                     "%s : ctrl handler init Failed\n", __func__);
> > +             goto err_me;
> > +     }
> > +
> > +     imx274->ctrls.handler.lock =3D &imx274->lock;
> > +
> > +     /* add new controls */
> > +     imx274->ctrls.test_pattern =3D v4l2_ctrl_new_std_menu_items(
> > +             &imx274->ctrls.handler, &imx274_ctrl_ops,
> > +             V4L2_CID_TEST_PATTERN,
> > +             ARRAY_SIZE(tp_qmenu) - 1, 0, 0, tp_qmenu);
> > +
> > +     imx274->ctrls.gain =3D v4l2_ctrl_new_std(
> > +             &imx274->ctrls.handler,
> > +             &imx274_ctrl_ops,
> > +             V4L2_CID_GAIN, IMX274_MIN_GAIN,
> > +             IMX274_MAX_DIGITAL_GAIN * IMX274_MAX_ANALOG_GAIN, 1,
> > +             IMX274_DEF_GAIN);
> > +
> > +     imx274->ctrls.exposure =3D v4l2_ctrl_new_std(
> > +             &imx274->ctrls.handler,
> > +             &imx274_ctrl_ops,
> > +             V4L2_CID_EXPOSURE, IMX274_MIN_EXPOSURE_TIME,
> > +             1000000 / IMX274_DEF_FRAME_RATE, 1,
> > +             IMX274_MIN_EXPOSURE_TIME);
> > +
> > +     imx274->ctrls.vflip =3D v4l2_ctrl_new_std(
> > +             &imx274->ctrls.handler,
> > +             &imx274_ctrl_ops,
> > +             V4L2_CID_VFLIP, 0, 1, 1, 0);
> > +
> > +     imx274->sd.ctrl_handler =3D &imx274->ctrls.handler;
> > +     if (imx274->ctrls.handler.error) {
> > +             ret =3D imx274->ctrls.handler.error;
> > +             goto err_ctrls;
> > +     }
> > +
> > +     /* setup default controls */
> > +     ret =3D v4l2_ctrl_handler_setup(&imx274->ctrls.handler);
> > +     if (ret) {
> > +             dev_err(&client->dev,
> > +                     "Error %d setup default controls\n", ret);
> > +             goto err_ctrls;
> > +     }
> > +
> > +     /* initialize format */
> > +     imx274->mode_index =3D IMX274_MODE_3840X2160;
> > +     imx274->format.width =3D imx274_formats[0].size.width;
> > +     imx274->format.height =3D imx274_formats[0].size.height;
> > +     imx274->format.field =3D V4L2_FIELD_NONE;
> > +     imx274->format.code =3D MEDIA_BUS_FMT_SRGGB10_1X10;
> > +     imx274->format.colorspace =3D V4L2_COLORSPACE_SRGB;
> > +     imx274->frame_interval.numerator =3D 1;
> > +     imx274->frame_interval.denominator =3D IMX274_DEF_FRAME_RATE;
> > +
> > +     /* load default control values */
> > +     ret =3D imx274_load_default(imx274);
> > +     if (ret) {
> > +             dev_err(&client->dev,
> > +                     "%s : imx274_load_default failed %d\n",
> > +                     __func__, ret);
> > +             goto err_ctrls;
> > +     }
> > +
> > +     /* register subdevice */
> > +     ret =3D v4l2_async_register_subdev(sd);
> > +     if (ret < 0) {
> > +             dev_err(&client->dev,
> > +                     "%s : v4l2_async_register_subdev failed %d\n",
> > +                     __func__, ret);
> > +             goto err_ctrls;
> > +     }
> > +
> > +     dev_info(&client->dev, "imx274 : imx274 probe success !\n");
> > +     return 0;
> > +
> > +err_ctrls:
> > +     v4l2_async_unregister_subdev(sd);
> > +     v4l2_ctrl_handler_free(sd->ctrl_handler);
> > +err_me:
> > +     media_entity_cleanup(&sd->entity);
> > +err_regmap:
> > +     mutex_destroy(&imx274->lock);
> > +     return ret;
> > +}
> > +
> > +static int imx274_remove(struct i2c_client *client)
> > +{
> > +     struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> > +     struct stimx274 *imx274 =3D to_imx274(sd);
> > +
> > +     /* stop stream */
> > +     imx274_write_table(imx274, mode_table[IMX274_MODE_STOP_STREAM]);
> > +
> > +     v4l2_async_unregister_subdev(sd);
> > +     v4l2_ctrl_handler_free(sd->ctrl_handler);
> > +     media_entity_cleanup(&sd->entity);
> > +     mutex_destroy(&imx274->lock);
> > +     return 0;
> > +}
> > +
> > +static struct i2c_driver imx274_i2c_driver =3D {
> > +     .driver =3D {
> > +             .name   =3D DRIVER_NAME,
> > +             .of_match_table =3D imx274_of_id_table,
> > +     },
> > +     .probe          =3D imx274_probe,
> > +     .remove         =3D imx274_remove,
> > +     .id_table       =3D imx274_id,
> > +};
> > +
> > +module_i2c_driver(imx274_i2c_driver);
> > +
> > +MODULE_AUTHOR("Leon Luo <leonl@leopardimaging.com>");
> > +MODULE_DESCRIPTION("IMX274 CMOS Image Sensor driver");
> > +MODULE_LICENSE("GPL v2");
> > --
> > 2.14.0.rc1
> >
>
> --
> Regards,
>
> Sakari Ailus
> e-mail: sakari.ailus@iki.fi
>

--f403045cf3d855b918055a3a4bcf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Sakari,<div><br></div><div>Thanks for your comments.</d=
iv><div><br></div><div>Regarding=C2=A0<span style=3D"color:rgb(80,0,80);fon=
t-size:12.800000190734863px">imx274_tp_regs[], the first value is the test =
pattern mode, which will be updated according to the input value before wri=
ting the register. So it can&#39;t be a const.</span></div><div><span style=
=3D"color:rgb(80,0,80);font-size:12.800000190734863px"><br></span></div><di=
v><span style=3D"color:rgb(80,0,80);font-size:12.800000190734863px">I will =
use=C2=A0</span>__v4l2_ctrl_s_ctrl instead of v4l2_ctrl_s_ctrl to keep the =
lock/unlock mutex clean. I am traveling right now, will test it and send a =
new patch this weekend.</div><div><br></div><div class=3D"gmail_extra"><div=
><div class=3D"gmail_signature">Regards,<br>Leon Luo<br>1130 Cadillac CT<br=
>Milpitas, CA 95035<br>Phone: (510)371-1169<br>Fax: (408) 217-1960<br>Email=
: <a href=3D"mailto:leonl@leopardimaging.com" target=3D"_blank">leonl@leopa=
rdimaging.com</a><br><a href=3D"http://www.leopardimaging.com" target=3D"_b=
lank">www.leopardimaging.com</a><br></div></div>
<br><div class=3D"gmail_quote">On Wed, Sep 27, 2017 at 2:40 PM, Sakari Ailu=
s <span dir=3D"ltr">&lt;<a href=3D"mailto:sakari.ailus@iki.fi" target=3D"_b=
lank">sakari.ailus@iki.fi</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-le=
ft-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">Hi Leon=
,<br>
<br>
Thanks for the update. A couple of more comments below; I think we&#39;re s=
oon<br>
done here.<br>
<div><div class=3D"gmail-h5"><br>
On Sun, Sep 24, 2017 at 12:53:29AM -0700, Leon Luo wrote:<br>
&gt; The imx274 is a Sony CMOS image sensor that has 1/2.5 image size.<br>
&gt; It supports up to 3840x2160 (4K) 60fps, 1080p 120fps. The interface<br=
>
&gt; is 4-lane MIPI CSI-2 running at 1.44Gbps each.<br>
&gt;<br>
&gt; This driver has been tested on Xilinx ZCU102 platform with a Leopard<b=
r>
&gt; LI-IMX274MIPI-FMC camera board.<br>
&gt;<br>
&gt; Support for the following features:<br>
&gt; -Resolutions: 3840x2160, 1920x1080, 1280x720<br>
&gt; -Frame rate: 3840x2160 : 5 =E2=80=93 60fps<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01920x1080 : 5 =E2=80=93=
 120fps<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01280x720 : 5 =E2=80=93 =
120fps<br>
&gt; -Exposure time: 16 =E2=80=93 (frame interval) micro-seconds<br>
&gt; -Gain: 1x - 180x<br>
&gt; -VFLIP: enable/disabledrivers/media/<wbr>i2c/imx274.c<br>
&gt; -Test pattern: 12 test patterns<br>
&gt;<br>
&gt; Signed-off-by: Leon Luo &lt;<a href=3D"mailto:leonl@leopardimaging.com=
">leonl@leopardimaging.com</a>&gt;<br>
&gt; Tested-by: S=C3=B6ren Brinkmann &lt;<a href=3D"mailto:soren.brinkmann@=
xilinx.com">soren.brinkmann@xilinx.com</a>&gt;<br>
&gt; ---<br>
&gt; v6:<br>
&gt; - remove media/v4l2-image-sizes.h from include header<br>
&gt; - make the header file alphabetical order<br>
&gt; - remove fmt-&gt;pad check in imx274_get_fmt,<br>
&gt;=C2=A0 =C2=A0the V4L2 subdev framework does it already<br>
&gt; - change &#39;struct reg_8 *regs&#39; to &#39;struct reg_8 regs[n]&#39=
;,<br>
&gt;=C2=A0 =C2=A0where n is the exact numbers needed for this function<br>
&gt; - move MODULE_DEVICE_TABLE(of, imx274_of_id_table); closer<br>
&gt;=C2=A0 =C2=A0to imx274_of_id_table definition<br>
&gt; - remove return check of imx274_write_table in imx274_remove,<br>
&gt;=C2=A0 =C2=A0because it should remove all resources even i2c fails here=
<br>
&gt; - move imx274_load_default before v4l2_async_register_subdev<br>
&gt; v5:<br>
&gt;=C2=A0 - no changes<br>
&gt; v4:<br>
&gt;=C2=A0 - use 32-bit data type to avoid __divdi3 compile error for i386<=
br>
&gt;=C2=A0 - clean up OR together error codes<br>
&gt; v3:<br>
&gt;=C2=A0 - clean up header files<br>
&gt;=C2=A0 - use struct directly instead of alias #define<br>
&gt;=C2=A0 - use v4l2_ctrl_s_ctrl instead of v4l2_s_ctrl<br>
&gt;=C2=A0 - revise debug output<br>
&gt;=C2=A0 - move static helpers closer to their call site<br>
&gt;=C2=A0 - don&#39;t OR toegether error codes<br>
&gt;=C2=A0 - use closest valid gain value instead of erroring out<br>
&gt;=C2=A0 - assigne lock to the control handler and omit explicit locking<=
br>
&gt;=C2=A0 - acquire mutex lock for imx274_get_fmt<br>
&gt;=C2=A0 - remove format-&gt;pad check in imx274_set_fmt since the pad is=
 always 0<br>
&gt;=C2=A0 - pass struct v4l2_ctrl pointer in gain/exposure/vlip/test patte=
rn controls<br>
&gt;=C2=A0 - remove priv-&gt;ctrls.vflip-&gt;val =3D val in imx274_set_vfli=
p()<br>
&gt;=C2=A0 - remove priv-&gt;ctrls.test_pattern-&gt;val =3D val in imx274_s=
et_test_pattern()<br>
&gt;=C2=A0 - remove empty open/close callbacks<br>
&gt;=C2=A0 - remove empty core ops<br>
&gt;=C2=A0 - add more error labels in probe<br>
&gt;=C2=A0 - use v4l2_async_unregister_subdev instead of v4l2_device_unregi=
ster_subdev<br>
&gt;=C2=A0 - use dynamic debug<br>
&gt;=C2=A0 - split start_stream to two steps: imx274_mode_regs() and imx274=
_start_stream()<br>
&gt;=C2=A0 =C2=A0 frame rate &amp; exposure can be updated<br>
&gt;=C2=A0 =C2=A0 between imx274_mode_regs() &amp; imx274_start_stream()<br=
>
&gt;<br>
&gt; v2:<br>
&gt;=C2=A0 - Fix Kconfig to not remove existing options<br>
&gt; ---<br>
&gt;=C2=A0 drivers/media/i2c/Kconfig=C2=A0 |=C2=A0 =C2=A0 7 +<br>
&gt;=C2=A0 drivers/media/i2c/Makefile |=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 drivers/media/i2c/imx274.c | 1804 ++++++++++++++++++++++++++++++=
<wbr>++++++++++++++<br>
&gt;=C2=A0 3 files changed, 1812 insertions(+)<br>
&gt;=C2=A0 create mode 100644 drivers/media/i2c/imx274.c<br>
&gt;<br>
&gt; diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig<br>
&gt; index 47113774a297..9659849e33a0 100644<br>
&gt; --- a/drivers/media/i2c/Kconfig<br>
&gt; +++ b/drivers/media/i2c/Kconfig<br>
&gt; @@ -555,6 +555,13 @@ config VIDEO_APTINA_PLL<br>
&gt;=C2=A0 config VIDEO_SMIAPP_PLL<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate<br>
&gt;<br>
&gt; +config VIDEO_IMX274<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tristate &quot;Sony IMX274 sensor support&quot;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on I2C &amp;&amp; VIDEO_V4L2 &amp;&amp; V=
IDEO_V4L2_SUBDEV_API<br>
&gt; +=C2=A0 =C2=A0 =C2=A0---help---<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0This is a V4L2 sensor-level driver for the=
 Sony IMX274<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0CMOS image sensor.<br>
&gt; +<br>
&gt;=C2=A0 config VIDEO_OV2640<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;OmniVision OV2640 sensor supp=
ort&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on VIDEO_V4L2 &amp;&amp; I2C<br>
&gt; diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile<b=
r>
&gt; index c843c181dfb9..f8d57e453936 100644<br>
&gt; --- a/drivers/media/i2c/Makefile<br>
&gt; +++ b/drivers/media/i2c/Makefile<br>
&gt; @@ -92,5 +92,6 @@ obj-$(CONFIG_VIDEO_IR_I2C)=C2=A0 +=3D ir-kbd-i2c.o<b=
r>
&gt;=C2=A0 obj-$(CONFIG_VIDEO_ML86V7667)=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D ml=
86v7667.o<br>
&gt;=C2=A0 obj-$(CONFIG_VIDEO_OV2659)=C2=A0 =C2=A0+=3D ov2659.o<br>
&gt;=C2=A0 obj-$(CONFIG_VIDEO_TC358743) +=3D tc358743.o<br>
&gt; +obj-$(CONFIG_VIDEO_IMX274)=C2=A0 =C2=A0+=3D imx274.o<br>
&gt;<br>
&gt;=C2=A0 obj-$(CONFIG_SDR_MAX2175) +=3D max2175.o<br>
&gt; diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c<b=
r>
&gt; new file mode 100644<br>
&gt; index 000000000000..924d543682b0<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/media/i2c/imx274.c<br>
&gt; @@ -0,0 +1,1804 @@<br>
&gt; +/*<br>
&gt; + * imx274.c - IMX274 CMOS Image Sensor driver<br>
&gt; + *<br>
&gt; + * Copyright (C) 2017, Leopard Imaging, Inc.<br>
&gt; + *<br>
&gt; + * Leon Luo &lt;<a href=3D"mailto:leonl@leopardimaging.com">leonl@leo=
pardimaging.com</a>&gt;<br>
&gt; + * Edwin Zou &lt;<a href=3D"mailto:edwinz@leopardimaging.com">edwinz@=
leopardimaging.com</a>&gt;<br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute it and/or modi=
fy it<br>
&gt; + * under the terms and conditions of the GNU General Public License,<=
br>
&gt; + * version 2, as published by the Free Software Foundation.<br>
&gt; + *<br>
&gt; + * This program is distributed in the hope it will be useful, but WIT=
HOUT<br>
&gt; + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY=
 or<br>
&gt; + * FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU General Public=
 License for<br>
&gt; + * more details.<br>
&gt; + *<br>
&gt; + * You should have received a copy of the GNU General Public License<=
br>
&gt; + * along with this program.=C2=A0 If not, see &lt;<a href=3D"http://w=
ww.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.o=
rg/licenses/</a>&gt;<wbr>.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;linux/clk.h&gt;<br>
&gt; +#include &lt;linux/delay.h&gt;<br>
&gt; +#include &lt;linux/gpio.h&gt;<br>
&gt; +#include &lt;linux/gpio/consumer.h&gt;<br>
&gt; +#include &lt;linux/i2c.h&gt;<br>
&gt; +#include &lt;linux/init.h&gt;<br>
&gt; +#include &lt;linux/module.h&gt;<br>
&gt; +#include &lt;linux/of_gpio.h&gt;<br>
&gt; +#include &lt;linux/regmap.h&gt;<br>
&gt; +#include &lt;linux/slab.h&gt;<br>
&gt; +#include &lt;linux/v4l2-mediabus.h&gt;<br>
&gt; +#include &lt;linux/videodev2.h&gt;<br>
&gt; +<br>
&gt; +#include &lt;media/v4l2-ctrls.h&gt;<br>
&gt; +#include &lt;media/v4l2-device.h&gt;<br>
&gt; +#include &lt;media/v4l2-subdev.h&gt;<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * See &quot;SHR, SVR Setting&quot; in datasheet<br>
&gt; + */<br>
&gt; +#define IMX274_DEFAULT_FRAME_LENGTH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 (4550)<br>
&gt; +#define IMX274_MAX_FRAME_LENGTH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x000fffff)<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * See &quot;Frame Rate Adjustment&quot; in datasheet<br>
&gt; + */<br>
&gt; +#define IMX274_PIXCLK_CONST1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0(72000000)<br>
&gt; +#define IMX274_PIXCLK_CONST2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0(1000000)<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * The input gain is shifted by IMX274_GAIN_SHIFT to get<br>
&gt; + * decimal number. The real gain is<br>
&gt; + * (float)input_gain_value / (1 &lt;&lt; IMX274_GAIN_SHIFT)<br>
&gt; + */<br>
&gt; +#define IMX274_GAIN_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (8)<br>
&gt; +#define IMX274_GAIN_SHIFT_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((1 &lt;&lt; IMX274_GAIN_SHIFT=
) - 1)<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * See &quot;Analog Gain&quot; and &quot;Digital Gain&quot; in datash=
eet<br>
&gt; + * min gain is 1X<br>
&gt; + * max gain is calculated based on IMX274_GAIN_REG_MAX<br>
&gt; + */<br>
&gt; +#define IMX274_GAIN_REG_MAX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 (1957)<br>
&gt; +#define IMX274_MIN_GAIN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x01 &lt;&lt; =
IMX274_GAIN_SHIFT)<br>
&gt; +#define IMX274_MAX_ANALOG_GAIN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((2048 &lt;&lt; IMX274_GAIN_SH=
IFT)\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/ (2048 - IM=
X274_GAIN_REG_MAX))<br>
&gt; +#define IMX274_MAX_DIGITAL_GAIN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (8)<br>
&gt; +#define IMX274_DEF_GAIN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (20 &lt;&lt; IM=
X274_GAIN_SHIFT)<br>
&gt; +#define IMX274_GAIN_CONST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (2048) /* for gain formula */<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * 1 line time in us =3D (HMAX / 72), minimal is 4 lines<br>
&gt; + */<br>
&gt; +#define IMX274_MIN_EXPOSURE_TIME=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0(4 * 260 / 72)<br>
&gt; +<br>
&gt; +#define IMX274_DEFAULT_MODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 IMX274_MODE_3840X2160<br>
&gt; +#define IMX274_MAX_WIDTH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(3840)<br>
&gt; +#define IMX274_MAX_HEIGHT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (2160)<br>
&gt; +#define IMX274_MAX_FRAME_RATE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (120)<br>
&gt; +#define IMX274_MIN_FRAME_RATE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (5)<br>
&gt; +#define IMX274_DEF_FRAME_RATE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (60)<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * register SHR is limited to (SVR value + 1) x VMAX value - 4<br>
&gt; + */<br>
&gt; +#define IMX274_SHR_LIMIT_CONST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(4)<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Constants for sensor reset delay<br>
&gt; + */<br>
&gt; +#define IMX274_RESET_DELAY1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 (2000)<br>
&gt; +#define IMX274_RESET_DELAY2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 (2200)<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * shift and mask constants<br>
&gt; + */<br>
&gt; +#define IMX274_SHIFT_8_BITS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 (8)<br>
&gt; +#define IMX274_SHIFT_16_BITS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0(16)<br>
&gt; +#define IMX274_MASK_LSB_2_BITS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x03)<br>
&gt; +#define IMX274_MASK_LSB_3_BITS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x07)<br>
&gt; +#define IMX274_MASK_LSB_4_BITS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x0f)<br>
&gt; +#define IMX274_MASK_LSB_8_BITS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x00ff)<br>
&gt; +<br>
&gt; +#define DRIVER_NAME &quot;IMX274&quot;<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * IMX274 register definitions<br>
&gt; + */<br>
&gt; +#define IMX274_FRAME_LENGTH_ADDR_1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00x30FA /* VMAX, MSB */<br>
&gt; +#define IMX274_FRAME_LENGTH_ADDR_2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00x30F9 /* VMAX */<br>
&gt; +#define IMX274_FRAME_LENGTH_ADDR_3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00x30F8 /* VMAX, LSB */<br>
&gt; +#define IMX274_SVR_REG_MSB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00x300F /* SVR */<br>
&gt; +#define IMX274_SVR_REG_LSB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00x300E /* SVR */<br>
&gt; +#define IMX274_HMAX_REG_MSB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0x30F7 /* HMAX */<br>
&gt; +#define IMX274_HMAX_REG_LSB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0x30F6 /* HMAX */<br>
&gt; +#define IMX274_COARSE_TIME_ADDR_MSB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 0x300D /* SHR */<br>
&gt; +#define IMX274_COARSE_TIME_ADDR_LSB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 0x300C /* SHR */<br>
&gt; +#define IMX274_ANALOG_GAIN_ADDR_LSB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 0x300A /* ANALOG GAIN LSB */<br>
&gt; +#define IMX274_ANALOG_GAIN_ADDR_MSB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 0x300B /* ANALOG GAIN MSB */<br>
&gt; +#define IMX274_DIGITAL_GAIN_REG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x3012 /* Digital Gain */<br>
&gt; +#define IMX274_VFLIP_REG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x301A /* VERTICAL FLIP */<br>
&gt; +#define IMX274_STANDBY_REG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00x3000 /* STANDBY */<br>
&gt; +<br>
&gt; +#define IMX274_TABLE_WAIT_MS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A00<br>
&gt; +#define IMX274_TABLE_END=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * imx274 I2C operation related structure<br>
&gt; + */<br>
&gt; +struct reg_8 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 addr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 val;<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const struct regmap_config imx274_regmap_config =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.reg_bits =3D 16,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.val_bits =3D 8,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.cache_type =3D REGCACHE_RBTREE,<br>
&gt; +};<br>
&gt; +<br>
&gt; +enum imx274_mode {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0IMX274_MODE_3840X2160,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0IMX274_MODE_1920X1080,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0IMX274_MODE_1280X720,<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0IMX274_MODE_START_STREAM_1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0IMX274_MODE_START_STREAM_2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0IMX274_MODE_START_STREAM_3,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0IMX274_MODE_START_STREAM_4,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0IMX274_MODE_STOP_STREAM<br>
&gt; +};<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * imx274 format related structure<br>
&gt; + */<br>
&gt; +struct imx274_frmfmt {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 mbus_code;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0enum v4l2_colorspace colorspace;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct v4l2_frmsize_discrete size;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0enum imx274_mode mode;<br>
&gt; +};<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * imx274 test pattern related structure<br>
&gt; + */<br>
&gt; +enum {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TEST_PATTERN_DISABLED =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TEST_PATTERN_ALL_000H,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TEST_PATTERN_ALL_FFFH,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TEST_PATTERN_ALL_555H,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TEST_PATTERN_ALL_AAAH,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TEST_PATTERN_VSP_5AH, /* VERTICAL STRIPE PATTERN =
555H/AAAH */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TEST_PATTERN_VSP_A5H, /* VERTICAL STRIPE PATTERN =
AAAH/555H */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TEST_PATTERN_VSP_05H, /* VERTICAL STRIPE PATTERN =
000H/555H */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TEST_PATTERN_VSP_50H, /* VERTICAL STRIPE PATTERN =
555H/000H */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TEST_PATTERN_VSP_0FH, /* VERTICAL STRIPE PATTERN =
000H/FFFH */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TEST_PATTERN_VSP_F0H, /* VERTICAL STRIPE PATTERN =
FFFH/000H */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TEST_PATTERN_H_COLOR_BARS,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TEST_PATTERN_V_COLOR_BARS,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const char * const tp_qmenu[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;Disabled&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;All 000h Pattern&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;All FFFh Pattern&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;All 555h Pattern&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;All AAAh Pattern&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;Vertical Stripe (555h / AAAh)&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;Vertical Stripe (AAAh / 555h)&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;Vertical Stripe (000h / 555h)&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;Vertical Stripe (555h / 000h)&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;Vertical Stripe (000h / FFFh)&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;Vertical Stripe (FFFh / 000h)&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;Horizontal Color Bars&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;Vertical Color Bars&quot;,<br>
&gt; +};<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * All-pixel scan mode (10-bit)<br>
&gt; + * imx274 mode1(refer to datasheet) register configuration with<br>
&gt; + * 3840x2160 resolution, raw10 data and mipi four lane output<br>
&gt; + */<br>
&gt; +static const struct reg_8 imx274_mode1_3840x2160_raw10[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3004, 0x01},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3005, 0x01},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3006, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3007, 0x02},<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3018, 0xA2}, /* output XVS, HVS */<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x306B, 0x05},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x30E2, 0x01},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x30F6, 0x07}, /* HMAX, 263 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x30F7, 0x01}, /* HMAX */<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x30dd, 0x01}, /* crop to 2160 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x30de, 0x06},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x30df, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x30e0, 0x12},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x30e1, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3037, 0x01}, /* to crop to 3840 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3038, 0x0c},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3039, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x303a, 0x0c},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x303b, 0x0f},<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x30EE, 0x01},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3130, 0x86},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3131, 0x08},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3132, 0x7E},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3133, 0x08},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3342, 0x0A},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3343, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3344, 0x16},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3345, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x33A6, 0x01},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3528, 0x0E},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3554, 0x1F},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3555, 0x01},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3556, 0x01},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3557, 0x01},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3558, 0x01},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3559, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x355A, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x35BA, 0x0E},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x366A, 0x1B},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x366B, 0x1A},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x366C, 0x19},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x366D, 0x17},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3A41, 0x08},<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{IMX274_TABLE_END, 0x00}<br>
&gt; +};<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Horizontal/vertical 2/2-line binning<br>
&gt; + * (Horizontal and vertical weightedbinning, 10-bit)<br>
&gt; + * imx274 mode3(refer to datasheet) register configuration with<br>
&gt; + * 1920x1080 resolution, raw10 data and mipi four lane output<br>
&gt; + */<br>
&gt; +static const struct reg_8 imx274_mode3_1920x1080_raw10[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3004, 0x02},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3005, 0x21},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3006, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3007, 0x11},<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3018, 0xA2}, /* output XVS, HVS */<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x306B, 0x05},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x30E2, 0x02},<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x30F6, 0x04}, /* HMAX, 260 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x30F7, 0x01}, /* HMAX */<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x30dd, 0x01}, /* to crop to 1920x1080 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x30de, 0x05},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x30df, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x30e0, 0x04},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x30e1, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3037, 0x01},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3038, 0x0c},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3039, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x303a, 0x0c},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x303b, 0x0f},<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x30EE, 0x01},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3130, 0x4E},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3131, 0x04},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3132, 0x46},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3133, 0x04},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3342, 0x0A},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3343, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3344, 0x1A},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3345, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x33A6, 0x01},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3528, 0x0E},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3554, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3555, 0x01},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3556, 0x01},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3557, 0x01},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3558, 0x01},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3559, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x355A, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x35BA, 0x0E},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x366A, 0x1B},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x366B, 0x1A},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x366C, 0x19},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x366D, 0x17},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3A41, 0x08},<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{IMX274_TABLE_END, 0x00}<br>
&gt; +};<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Vertical 2/3 subsampling binning horizontal 3 binning<br>
&gt; + * imx274 mode5(refer to datasheet) register configuration with<br>
&gt; + * 1280x720 resolution, raw10 data and mipi four lane output<br>
&gt; + */<br>
&gt; +static const struct reg_8 imx274_mode5_1280x720_raw10[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3004, 0x03},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3005, 0x31},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3006, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3007, 0x09},<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3018, 0xA2}, /* output XVS, HVS */<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x306B, 0x05},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x30E2, 0x03},<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x30F6, 0x04}, /* HMAX, 260 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x30F7, 0x01}, /* HMAX */<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x30DD, 0x01},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x30DE, 0x07},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x30DF, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x40E0, 0x04},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x30E1, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3030, 0xD4},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3031, 0x02},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3032, 0xD0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3033, 0x02},<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x30EE, 0x01},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3130, 0xE2},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3131, 0x02},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3132, 0xDE},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3133, 0x02},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3342, 0x0A},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3343, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3344, 0x1B},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3345, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x33A6, 0x01},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3528, 0x0E},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3554, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3555, 0x01},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3556, 0x01},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3557, 0x01},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3558, 0x01},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3559, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x355A, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x35BA, 0x0E},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x366A, 0x1B},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x366B, 0x19},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x366C, 0x17},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x366D, 0x17},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3A41, 0x04},<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{IMX274_TABLE_END, 0x00}<br>
&gt; +};<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * imx274 first step register configuration for<br>
&gt; + * starting stream<br>
&gt; + */<br>
&gt; +static const struct reg_8 imx274_start_1[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{IMX274_STANDBY_REG, 0x12},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{IMX274_TABLE_END, 0x00}<br>
&gt; +};<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * imx274 second step register configuration for<br>
&gt; + * starting stream<br>
&gt; + */<br>
&gt; +static const struct reg_8 imx274_start_2[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3120, 0xF0}, /* clock settings */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3121, 0x00}, /* clock settings */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3122, 0x02}, /* clock settings */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3129, 0x9C}, /* clock settings */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x312A, 0x02}, /* clock settings */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x312D, 0x02}, /* clock settings */<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x310B, 0x00},<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* PLSTMG */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x304C, 0x00}, /* PLSTMG01 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x304D, 0x03},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x331C, 0x1A},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x331D, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3502, 0x02},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3529, 0x0E},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x352A, 0x0E},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x352B, 0x0E},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3538, 0x0E},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3539, 0x0E},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3553, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x357D, 0x05},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x357F, 0x05},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3581, 0x04},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3583, 0x76},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3587, 0x01},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x35BB, 0x0E},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x35BC, 0x0E},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x35BD, 0x0E},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x35BE, 0x0E},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x35BF, 0x0E},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x366E, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x366F, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3670, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3671, 0x00},<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* PSMIPI */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3304, 0x32}, /* PSMIPI1 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3305, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3306, 0x32},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3307, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3590, 0x32},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3591, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3686, 0x32},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3687, 0x00},<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{IMX274_TABLE_END, 0x00}<br>
&gt; +};<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * imx274 third step register configuration for<br>
&gt; + * starting stream<br>
&gt; + */<br>
&gt; +static const struct reg_8 imx274_start_3[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{IMX274_STANDBY_REG, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x303E, 0x02}, /* SYS_MODE =3D 2 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{IMX274_TABLE_END, 0x00}<br>
&gt; +};<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * imx274 forth step register configuration for<br>
&gt; + * starting stream<br>
&gt; + */<br>
&gt; +static const struct reg_8 imx274_start_4[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x30F4, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3018, 0xA2}, /* XHS VHS OUTUPT */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{IMX274_TABLE_END, 0x00}<br>
&gt; +};<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * imx274 register configuration for stoping stream<br>
&gt; + */<br>
&gt; +static const struct reg_8 imx274_stop[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{IMX274_STANDBY_REG, 0x01},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{IMX274_TABLE_END, 0x00}<br>
&gt; +};<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * imx274 disable test pattern register configuration<br>
&gt; + */<br>
&gt; +static const struct reg_8 imx274_tp_disabled[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x303C, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x377F, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3781, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x370B, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{IMX274_TABLE_END, 0x00}<br>
&gt; +};<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * imx274 test pattern register configuration<br>
&gt; + * reg 0x303D defines the test pattern modes<br>
&gt; + */<br>
&gt; +static struct reg_8 imx274_tp_regs[] =3D {<br>
<br>
</div></div>const?<br>
<div><div class=3D"gmail-h5"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x303D, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x303C, 0x11},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x370E, 0x01},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x377F, 0x01},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x3781, 0x01},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{0x370B, 0x11},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{IMX274_TABLE_END, 0x00}<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const struct reg_8 *mode_table[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[IMX274_MODE_3840X2160]=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D imx274_mode1_3840x2160_raw10,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[IMX274_MODE_1920X1080]=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D imx274_mode3_1920x1080_raw10,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[IMX274_MODE_1280X720]=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =3D imx274_mode5_1280x720_raw10,<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[IMX274_MODE_START_STREAM_1]=C2=A0 =C2=A0 =3D imx=
274_start_1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[IMX274_MODE_START_STREAM_2]=C2=A0 =C2=A0 =3D imx=
274_start_2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[IMX274_MODE_START_STREAM_3]=C2=A0 =C2=A0 =3D imx=
274_start_3,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[IMX274_MODE_START_STREAM_4]=C2=A0 =C2=A0 =3D imx=
274_start_4,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[IMX274_MODE_STOP_STREAM]=C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D imx274_stop,<br>
&gt; +};<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * imx274 format related structure<br>
&gt; + */<br>
&gt; +static const struct imx274_frmfmt imx274_formats[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{MEDIA_BUS_FMT_SRGGB10_1X10, V4L2_COLORSPACE_SRGB=
, {3840, 2160},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMX274_MODE_3840X2160=
},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{MEDIA_BUS_FMT_SRGGB10_1X10, V4L2_COLORSPACE_SRGB=
, {1920, 1080},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMX274_MODE_1920X1080=
},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{MEDIA_BUS_FMT_SRGGB10_1X10, V4L2_COLORSPACE_SRGB=
, {1280, 720},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMX274_MODE_1280X720}=
,<br>
&gt; +};<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * minimal frame length for each mode<br>
&gt; + * refer to datasheet section &quot;Frame Rate Adjustment (CSI-2)&quo=
t;<br>
&gt; + */<br>
&gt; +static const int min_frame_len[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A04550, /* mode 1, 4K */<br>
&gt; +=C2=A0 =C2=A0 =C2=A02310, /* mode 3, 1080p */<br>
&gt; +=C2=A0 =C2=A0 =C2=A02310 /* mode 5, 720p */<br>
&gt; +};<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * minimal numbers of SHR register<br>
&gt; + * refer to datasheet table &quot;Shutter Setting (CSI-2)&quot;<br>
&gt; + */<br>
&gt; +static const int min_SHR[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A012, /* mode 1, 4K */<br>
&gt; +=C2=A0 =C2=A0 =C2=A08, /* mode 3, 1080p */<br>
&gt; +=C2=A0 =C2=A0 =C2=A08 /* mode 5, 720p */<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const int max_frame_rate[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A060, /* mode 1 , 4K */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0120, /* mode 3, 1080p */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0120 /* mode 5, 720p */<br>
&gt; +};<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Number of clocks per internal offset period<br>
&gt; + * a constant based on mode<br>
&gt; + * refer to section &quot;Integration Time in Each Readout Drive Mode=
 (CSI-2)&quot;<br>
&gt; + * in the datasheet<br>
&gt; + * for the implemented 3 modes, it happens to be the same number<br>
&gt; + */<br>
&gt; +static const int nocpiop[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0112, /* mode 1 , 4K */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0112, /* mode 3, 1080p */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0112 /* mode 5, 720p */<br>
&gt; +};<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * struct imx274_ctrls - imx274 ctrl structure<br>
&gt; + * @handler: V4L2 ctrl handler structure<br>
&gt; + * @exposure: Pointer to expsure ctrl structure<br>
&gt; + * @gain: Pointer to gain ctrl structure<br>
&gt; + * @vflip: Pointer to vflip ctrl structure<br>
&gt; + * @test_pattern: Pointer to test pattern ctrl structure<br>
&gt; + */<br>
&gt; +struct imx274_ctrls {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct v4l2_ctrl_handler handler;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct v4l2_ctrl *exposure;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct v4l2_ctrl *gain;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct v4l2_ctrl *vflip;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct v4l2_ctrl *test_pattern;<br>
&gt; +};<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * struct stim274 - imx274 device structure<br>
&gt; + * @sd: V4L2 subdevice structure<br>
&gt; + * @pd: Media pad structure<br>
&gt; + * @client: Pointer to I2C client<br>
&gt; + * @ctrls: imx274 control structure<br>
&gt; + * @format: V4L2 media bus frame format structure<br>
&gt; + * @frame_rate: V4L2 frame rate structure<br>
&gt; + * @regmap: Pointer to regmap structure<br>
&gt; + * @reset_gpio: Pointer to reset gpio<br>
&gt; + * @lock: Mutex structure<br>
&gt; + * @mode_index: Resolution mode index<br>
&gt; + */<br>
&gt; +struct stimx274 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct v4l2_subdev sd;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct media_pad pad;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct i2c_client *client;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct imx274_ctrls ctrls;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct v4l2_mbus_framefmt format;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct v4l2_fract frame_interval;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct regmap *regmap;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct gpio_desc *reset_gpio;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mutex lock; /* mutex lock for operations *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 mode_index;<br>
&gt; +};<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Function declaration<br>
&gt; + */<br>
&gt; +static int imx274_set_gain(struct stimx274 *priv, struct v4l2_ctrl *c=
trl);<br>
&gt; +static int imx274_set_exposure(struct stimx274 *priv, int val);<br>
&gt; +static int imx274_set_vflip(struct stimx274 *priv, int val);<br>
&gt; +static int imx274_set_test_pattern(struct stimx274 *priv, int val);<b=
r>
&gt; +static int imx274_set_frame_interval(<wbr>struct stimx274 *priv,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct v4l2_fract frame_i=
nterval);<br>
&gt; +<br>
&gt; +static inline void msleep_range(unsigned int delay_base)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0usleep_range(delay_base * 1000, delay_base * 1000=
 + 500);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * v4l2_ctrl and v4l2_subdev related operations<br>
&gt; + */<br>
&gt; +static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)<=
br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return &amp;container_of(ctrl-&gt;handler,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 struct stimx274, ctrls.handler)-&gt;sd;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline struct stimx274 *to_imx274(struct v4l2_subdev *sd)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return container_of(sd, struct stimx274, sd);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * imx274_regmap_util_write_<wbr>table_8 - Function for writing regis=
ter table<br>
&gt; + * @regmap: Pointer to device reg map structure<br>
&gt; + * @table: Table containing register values<br>
&gt; + * @wait_ms_addr: Flag for performing delay<br>
&gt; + * @end_addr: Flag for incating end of table<br>
&gt; + *<br>
&gt; + * This is used to write register table into sensor&#39;s reg map.<br=
>
&gt; + *<br>
&gt; + * Return: 0 on success, errors otherwise<br>
&gt; + */<br>
&gt; +static int imx274_regmap_util_write_<wbr>table_8(struct regmap *regma=
p,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0const struct reg_8 table[],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0u16 wait_ms_addr, u16 end_addr)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int err;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const struct reg_8 *next;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 val;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int range_start =3D -1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int range_count =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 range_vals[16];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int max_range_vals =3D ARRAY_SIZE(range_vals);<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (next =3D table;; next++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((next-&gt;addr !=
=3D range_start + range_count) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(next-&=
gt;addr =3D=3D end_addr) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(next-&=
gt;addr =3D=3D wait_ms_addr) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(range_=
count =3D=3D max_range_vals)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (range_count =3D=3D 1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D regmap_write(regmap,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 range_start, range_vals[0]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0else if (range_count &gt; 1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D regmap_bulk_write(regmap, range_=
start,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;range_vals[0],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0range_count);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0range_start =3D -1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0range_count =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0/* Handle special address values */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (next-&gt;addr =3D=3D end_addr)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (next-&gt;addr =3D=3D wait_ms_addr) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msleep_range(next-&gt;val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D next-&gt;val;=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (range_start =3D=
=3D -1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0range_start =3D next-&gt;addr;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0range_vals[range_coun=
t++] =3D val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline int imx274_read_reg(struct stimx274 *priv, u16 addr, u8=
 *val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int err;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D regmap_read(priv-&gt;regmap, addr, (unsig=
ned int *)val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;priv-&gt=
;client-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;%s : i2c read failed, addr =3D %x\n&quot;, __func__, addr);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;priv-&gt=
;client-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;%s : addr 0x%x, val=3D0x%x\n&quot;, __func__,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0addr, *val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return err;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline int imx274_write_reg(struct stimx274 *priv, u16 addr, u=
8 val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int err;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D regmap_write(priv-&gt;regmap, addr, val);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;priv-&gt=
;client-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;%s : i2c write failed, %x =3D %x\n&quot;, __func__,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0addr, val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;priv-&gt=
;client-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;%s : addr 0x%x, val=3D0x%x\n&quot;, __func__,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0addr, val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return err;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int imx274_write_table(struct stimx274 *priv, const struct reg=
_8 table[])<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return imx274_regmap_util_write_<wbr>table_8(priv=
-&gt;regmap,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0table, IMX274_TABLE_W=
AIT_MS, IMX274_TABLE_END);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * imx274_mode_regs - Function for set mode registers per mode index<=
br>
&gt; + * @priv: Pointer to device structure<br>
&gt; + * @mode: Mode index value<br>
&gt; + *<br>
&gt; + * This is used to start steam per mode index.<br>
&gt; + * mode =3D 0, start stream for sensor Mode 1: 4K/raw10<br>
&gt; + * mode =3D 1, start stream for sensor Mode 3: 1080p/raw10<br>
&gt; + * mode =3D 2, start stream for sensor Mode 5: 720p/raw10<br>
&gt; + *<br>
&gt; + * Return: 0 on success, errors otherwise<br>
&gt; + */<br>
&gt; +static int imx274_mode_regs(struct stimx274 *priv, int mode)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int err =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D imx274_write_table(priv, mode_table[IMX27=
4_MODE_START_<wbr>STREAM_1]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D imx274_write_table(priv, mode_table[IMX27=
4_MODE_START_<wbr>STREAM_2]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D imx274_write_table(priv, mode_table[mode]=
);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return err;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * imx274_start_stream - Function for starting stream per mode index<=
br>
&gt; + * @priv: Pointer to device structure<br>
&gt; + *<br>
&gt; + * Return: 0 on success, errors otherwise<br>
&gt; + */<br>
&gt; +static int imx274_start_stream(struct stimx274 *priv)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int err =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Refer to &quot;Standby Cancel Sequence when us=
ing CSI-2&quot; in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * imx274 datasheet, it should wait 10ms or more =
here.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * give it 1 extra ms for margin<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0msleep_range(11);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D imx274_write_table(priv, mode_table[IMX27=
4_MODE_START_<wbr>STREAM_3]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Refer to &quot;Standby Cancel Sequence when us=
ing CSI-2&quot; in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * imx274 datasheet, it should wait 7ms or more h=
ere.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * give it 1 extra ms for margin<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0msleep_range(8);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D imx274_write_table(priv, mode_table[IMX27=
4_MODE_START_<wbr>STREAM_4]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * imx274_reset - Function called to reset the sensor<br>
&gt; + * @priv: Pointer to device structure<br>
&gt; + * @rst: Input value for determining the sensor&#39;s end state after=
 reset<br>
&gt; + *<br>
&gt; + * Set the senor in reset and then<br>
&gt; + * if rst =3D 0, keep it in reset;<br>
&gt; + * if rst =3D 1, bring it out of reset.<br>
&gt; + *<br>
&gt; + */<br>
&gt; +static void imx274_reset(struct stimx274 *priv, int rst)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gpiod_set_value_cansleep(priv-<wbr>&gt;reset_gpio=
, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0usleep_range(IMX274_RESET_<wbr>DELAY1, IMX274_RES=
ET_DELAY2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gpiod_set_value_cansleep(priv-<wbr>&gt;reset_gpio=
, !!rst);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0usleep_range(IMX274_RESET_<wbr>DELAY1, IMX274_RES=
ET_DELAY2);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * imx274_s_ctrl - This is used to set the imx274 V4L2 controls<br>
&gt; + * @ctrl: V4L2 control to be set<br>
&gt; + *<br>
&gt; + * This function is used to set the V4L2 controls for the imx274 sens=
or.<br>
&gt; + *<br>
&gt; + * Return: 0 on success, errors otherwise<br>
&gt; + */<br>
&gt; +static int imx274_s_ctrl(struct v4l2_ctrl *ctrl)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct v4l2_subdev *sd =3D ctrl_to_sd(ctrl);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct stimx274 *imx274 =3D to_imx274(sd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret =3D -EINVAL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;imx274-&gt;client-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%s : s_ctrl: %s=
, value: %d\n&quot;, __func__,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctrl-&gt;name, ctrl-&=
gt;val);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (ctrl-&gt;id) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case V4L2_CID_EXPOSURE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;imx274-&=
gt;client-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;%s : set V4L2_CID_EXPOSURE\n&quot;, __func__);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D imx274_set_ex=
posure(imx274, ctrl-&gt;val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case V4L2_CID_GAIN:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;imx274-&=
gt;client-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;%s : set V4L2_CID_GAIN\n&quot;, __func__);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D imx274_set_ga=
in(imx274, ctrl);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case V4L2_CID_VFLIP:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;imx274-&=
gt;client-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;%s : set V4L2_CID_VFLIP\n&quot;, __func__);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D imx274_set_vf=
lip(imx274, ctrl-&gt;val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case V4L2_CID_TEST_PATTERN:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;imx274-&=
gt;client-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;%s : set V4L2_CID_TEST_PATTERN\n&quot;, __func__);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D imx274_set_te=
st_pattern(<wbr>imx274, ctrl-&gt;val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * imx274_get_fmt - Get the pad format<br>
&gt; + * @sd: Pointer to V4L2 Sub device structure<br>
&gt; + * @cfg: Pointer to sub device pad information structure<br>
&gt; + * @fmt: Pointer to pad level media bus format<br>
&gt; + *<br>
&gt; + * This function is used to get the pad format information.<br>
&gt; + *<br>
&gt; + * Return: 0 on success<br>
&gt; + */<br>
&gt; +static int imx274_get_fmt(struct v4l2_subdev *sd,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0struct v4l2_subdev_pad_config *cfg,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0struct v4l2_subdev_format *fmt)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct stimx274 *imx274 =3D to_imx274(sd);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;imx274-&gt;lock);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fmt-&gt;format =3D imx274-&gt;format;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;imx274-&gt;lock);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * imx274_set_fmt - This is used to set the pad format<br>
&gt; + * @sd: Pointer to V4L2 Sub device structure<br>
&gt; + * @cfg: Pointer to sub device pad information structure<br>
&gt; + * @format: Pointer to pad level media bus format<br>
&gt; + *<br>
&gt; + * This function is used to set the pad format.<br>
&gt; + *<br>
&gt; + * Return: 0 on success<br>
&gt; + */<br>
&gt; +static int imx274_set_fmt(struct v4l2_subdev *sd,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0struct v4l2_subdev_pad_config *cfg,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0struct v4l2_subdev_format *format)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct v4l2_mbus_framefmt *fmt =3D &amp;format-&g=
t;format;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct stimx274 *imx274 =3D to_imx274(sd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct i2c_client *client =3D imx274-&gt;client;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0int index;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;client-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%s: width =3D %=
d height =3D %d code =3D %d mbus_code =3D %d\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__func__, fmt-&gt;wid=
th, fmt-&gt;height, fmt-&gt;code,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0imx274_formats[imx274=
-&gt;mode_<wbr>index].mbus_code);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;imx274-&gt;lock);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (index =3D 0; index &lt; ARRAY_SIZE(imx274_fo=
rmats); index++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (imx274_formats[in=
dex].size.<wbr>width =3D=3D fmt-&gt;width &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0imx274_=
formats[index].size.<wbr>height =3D=3D fmt-&gt;height)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (index &gt;=3D ARRAY_SIZE(imx274_formats)) {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* default to first f=
ormat */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0index =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0imx274-&gt;mode_index =3D index;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (fmt-&gt;width &gt; IMX274_MAX_WIDTH)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fmt-&gt;width =3D IMX=
274_MAX_WIDTH;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (fmt-&gt;height &gt; IMX274_MAX_HEIGHT)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fmt-&gt;height =3D IM=
X274_MAX_HEIGHT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fmt-&gt;width =3D fmt-&gt;width &amp; (~IMX274_MA=
SK_LSB_2_BITS);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fmt-&gt;height =3D fmt-&gt;height &amp; (~IMX274_=
MASK_LSB_2_BITS);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fmt-&gt;field =3D V4L2_FIELD_NONE;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (format-&gt;which =3D=3D V4L2_SUBDEV_FORMAT_TR=
Y)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cfg-&gt;try_fmt =3D *=
fmt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0imx274-&gt;format =3D=
 *fmt;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;imx274-&gt;lock);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * imx274_g_frame_interval - Get the frame interval<br>
&gt; + * @sd: Pointer to V4L2 Sub device structure<br>
&gt; + * @fi: Pointer to V4l2 Sub device frame interval structure<br>
&gt; + *<br>
&gt; + * This function is used to get the frame interval.<br>
&gt; + *<br>
&gt; + * Return: 0 on success<br>
&gt; + */<br>
&gt; +static int imx274_g_frame_interval(struct v4l2_subdev *sd,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct v4l2_subdev_frame_interva=
l *fi)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct stimx274 *imx274 =3D to_imx274(sd);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fi-&gt;interval =3D imx274-&gt;frame_interval;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;imx274-&gt;client-&gt;dev, &quot;%s =
frame rate =3D %d / %d\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__func__, imx274-&gt;=
frame_interval.<wbr>numerator,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0imx274-&gt;frame_inte=
rval.<wbr>denominator);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * imx274_s_frame_interval - Set the frame interval<br>
&gt; + * @sd: Pointer to V4L2 Sub device structure<br>
&gt; + * @fi: Pointer to V4l2 Sub device frame interval structure<br>
&gt; + *<br>
&gt; + * This function is used to set the frame intervavl.<br>
&gt; + *<br>
&gt; + * Return: 0 on success<br>
&gt; + */<br>
&gt; +static int imx274_s_frame_interval(struct v4l2_subdev *sd,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct v4l2_subdev_frame_interva=
l *fi)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct stimx274 *imx274 =3D to_imx274(sd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct v4l2_ctrl *ctrl =3D imx274-&gt;ctrls.expos=
ure;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int min, max, def;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;imx274-&gt;lock);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D imx274_set_frame_interval(<wbr>imx274, fi=
-&gt;interval);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * exposure time rang=
e is decided by frame interval<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * need to update it =
after frame interal changes<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0min =3D IMX274_MIN_EX=
POSURE_TIME;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max =3D fi-&gt;interv=
al.numerator * 1000000<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0/ fi-&gt;interval.denominator;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0def =3D max;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (__v4l2_ctrl_modif=
y_range(<wbr>ctrl, min, max, 1, def)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_err(&amp;imx274-&gt;client-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Exposure ctrl range update failed\=
n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto unlock;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* update exposure ti=
me accordingly */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0imx274_set_exposure(i=
mx274, imx274-&gt;ctrls.exposure-&gt;val);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;imx274-&=
gt;client-&gt;dev, &quot;set frame interval to %uus\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0fi-&gt;interval.numerator * 1000000<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0/ fi-&gt;interval.denominator);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +unlock:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;imx274-&gt;lock);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * imx274_load_default - load default control values<br>
&gt; + * @priv: Pointer to device structure<br>
&gt; + *<br>
&gt; + * Return: 0 on success, errors otherwise<br>
&gt; + */<br>
&gt; +static int imx274_load_default(struct stimx274 *priv)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* load default control values */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;frame_interval.numerator =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;frame_interval.<wbr>denominator =3D IMX2=
74_DEF_FRAME_RATE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;ctrls.exposure-&gt;val =3D 1000000 / IMX=
274_DEF_FRAME_RATE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;ctrls.gain-&gt;val =3D IMX274_DEF_GAIN;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;ctrls.vflip-&gt;val =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;ctrls.test_pattern-&gt;val =3D TEST_PATT=
ERN_DISABLED;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* update frame rate */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D imx274_set_frame_interval(<wbr>priv,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;fra=
me_interval);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* update exposure time */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D v4l2_ctrl_s_ctrl(priv-&gt;ctrls.<wbr>expo=
sure, priv-&gt;ctrls.exposure-&gt;val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* update gain */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D v4l2_ctrl_s_ctrl(priv-&gt;ctrls.<wbr>gain=
, priv-&gt;ctrls.gain-&gt;val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* update vflip */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D v4l2_ctrl_s_ctrl(priv-&gt;ctrls.<wbr>vfli=
p, priv-&gt;ctrls.vflip-&gt;val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * imx274_s_stream - It is used to start/stop the streaming.<br>
&gt; + * @sd: V4L2 Sub device<br>
&gt; + * @on: Flag (True / False)<br>
&gt; + *<br>
&gt; + * This function controls the start or stop of streaming for the<br>
&gt; + * imx274 sensor.<br>
&gt; + *<br>
&gt; + * Return: 0 on success, errors otherwise<br>
&gt; + */<br>
&gt; +static int imx274_s_stream(struct v4l2_subdev *sd, int on)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct stimx274 *imx274 =3D to_imx274(sd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;imx274-&gt;client-&gt;dev, &quot;%s =
: %s, mode index =3D %d\n&quot;, __func__,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0on ? &quot;Stream Sta=
rt&quot; : &quot;Stream Stop&quot;, imx274-&gt;mode_index);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;imx274-&gt;lock);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (on) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* load mode register=
s */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0imx274_mode_regs(imx2=
74, imx274-&gt;mode_index);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto fail;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * update frame rate =
&amp; expsoure. if the last mode is different,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * HMAX could be chan=
ged. As the result, frame rate &amp; exposure<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * are changed.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * gain is not affect=
ed.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D imx274_set_fr=
ame_interval(<wbr>imx274,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0imx274-&gt;frame_interval);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto fail;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;imx=
274-&gt;lock);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* update exposure ti=
me */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D v4l2_ctrl_s_c=
trl(imx274-&gt;<wbr>ctrls.exposure,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 imx274-&gt;ctrls.e=
xposure-&gt;val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto fail;<br>
<br>
</div></div>Here, you&#39;ll end up unlocking a mutex which was just unlock=
ed.<br>
<br>
As setting streaming should probably be serialised entirely, I&#39;d sugges=
t<br>
not releasing and reacquiring the mutex to begin with, and switching to<br>
__v4l2_ctrl_s_ctrl().<br>
<div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5"><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;imx27=
4-&gt;lock);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* start stream */<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D imx274_start_=
stream(imx274);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto fail;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* stop stream */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D imx274_write_=
table(imx274,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mode_table[=
IMX274_MODE_STOP_<wbr>STREAM]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto fail;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;imx274-&gt;lock);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;imx274-&gt;client-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%s : Done: mode=
 =3D %d\n&quot;, __func__, imx274-&gt;mode_index);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +fail:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;imx274-&gt;lock);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_err(&amp;imx274-&gt;client-&gt;dev, &quot;s_s=
tream failed\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * imx274_get_frame_length - Function for obtaining current frame len=
gth<br>
&gt; + * @priv: Pointer to device structure<br>
&gt; + * @val: Pointer to obainted value<br>
&gt; + *<br>
&gt; + * frame_length =3D vmax x (svr + 1), in unit of hmax.<br>
&gt; + *<br>
&gt; + * Return: 0 on success<br>
&gt; + */<br>
&gt; +static int imx274_get_frame_length(struct stimx274 *priv, u32 *val)<b=
r>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int err;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 svr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 vmax;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 reg_val[3];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* svr */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D imx274_read_reg(priv, IMX274_SVR_REG_LSB,=
 &amp;reg_val[0]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D imx274_read_reg(priv, IMX274_SVR_REG_MSB,=
 &amp;reg_val[1]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0svr =3D (reg_val[1] &lt;&lt; IMX274_SHIFT_8_BITS)=
 + reg_val[0];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* vmax */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D imx274_read_reg(priv, IMX274_FRAME_LENGTH=
_ADDR_3, &amp;reg_val[0]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D imx274_read_reg(priv, IMX274_FRAME_LENGTH=
_ADDR_2, &amp;reg_val[1]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D imx274_read_reg(priv, IMX274_FRAME_LENGTH=
_ADDR_1, &amp;reg_val[2]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vmax =3D ((reg_val[2] &amp; IMX274_MASK_LSB_3_BIT=
S) &lt;&lt; IMX274_SHIFT_16_BITS)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+ (reg_val[1] &lt;&lt=
; IMX274_SHIFT_8_BITS) + reg_val[0];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*val =3D vmax * (svr + 1);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +fail:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_err(&amp;priv-&gt;client-&gt;dev, &quot;%s er=
ror =3D %d\n&quot;, __func__, err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return err;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int imx274_clamp_coarse_time(<wbr>struct stimx274 *priv, u32 *=
val,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 *frame_length)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int err;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D imx274_get_frame_length(priv, frame_lengt=
h);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (*frame_length &lt; min_frame_len[priv-&gt;mod=
e_<wbr>index])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*frame_length =3D min=
_frame_len[priv-&gt;mode_<wbr>index];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*val =3D *frame_length - *val; /* convert to raw =
shr */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (*val &gt; *frame_length - IMX274_SHR_LIMIT_CO=
NST)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D *frame_lengt=
h - IMX274_SHR_LIMIT_CONST;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (*val &lt; min_SHR[priv-&gt;mode_index])<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D min_SHR[priv=
-&gt;mode_index];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * imx274_set_digital gain - Function called when setting digital gai=
n<br>
&gt; + * @priv: Pointer to device structure<br>
&gt; + * @dgain: Value of digital gain.<br>
&gt; + *<br>
&gt; + * Digital gain has only 4 steps: 1x, 2x, 4x, and 8x<br>
&gt; + *<br>
&gt; + * Return: 0 on success<br>
&gt; + */<br>
&gt; +static int imx274_set_digital_gain(struct stimx274 *priv, u32 dgain)<=
br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 reg_val;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg_val =3D ffs(dgain);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (reg_val)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val--;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg_val =3D clamp(reg_val, (u8)0, (u8)3);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return imx274_write_reg(priv, IMX274_DIGITAL_GAIN=
_REG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val &amp; IMX274_MASK_LSB_4_BITS);<b=
r>
&gt; +}<br>
&gt; +<br>
&gt; +static inline void imx274_calculate_gain_regs(<wbr>struct reg_8 regs[=
2], u16 gain)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regs-&gt;addr =3D IMX274_ANALOG_GAIN_ADDR_MSB;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0regs-&gt;val =3D (gain &gt;&gt; IMX274_SHIFT_8_BI=
TS) &amp; IMX274_MASK_LSB_3_BITS;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0(regs + 1)-&gt;addr =3D IMX274_ANALOG_GAIN_ADDR_L=
SB;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0(regs + 1)-&gt;val =3D (gain) &amp; IMX274_MASK_L=
SB_8_BITS;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * imx274_set_gain - Function called when setting gain<br>
&gt; + * @priv: Pointer to device structure<br>
&gt; + * @val: Value of gain. the real value =3D val &lt;&lt; IMX274_GAIN_S=
HIFT;<br>
&gt; + * @ctrl: v4l2 control pointer<br>
&gt; + *<br>
&gt; + * Set the gain based on input value.<br>
&gt; + * The caller should hold the mutex lock imx274-&gt;lock if necessary=
<br>
&gt; + *<br>
&gt; + * Return: 0 on success<br>
&gt; + */<br>
&gt; +static int imx274_set_gain(struct stimx274 *priv, struct v4l2_ctrl *c=
trl)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct reg_8 reg_list[2];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int err;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 gain, analog_gain, digital_gain, gain_reg;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gain =3D (u32)(ctrl-&gt;val);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;priv-&gt;client-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%s : input gain=
 =3D %d.%d\n&quot;, __func__,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gain &gt;&gt; IMX274_=
GAIN_SHIFT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((gain &amp; IMX274_G=
AIN_SHIFT_MASK) * 100) &gt;&gt; IMX274_GAIN_SHIFT);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (gain &gt; IMX274_MAX_DIGITAL_GAIN * IMX274_MA=
X_ANALOG_GAIN)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gain =3D IMX274_MAX_D=
IGITAL_GAIN * IMX274_MAX_ANALOG_GAIN;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (gain &lt; IMX274_MIN_GAIN)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gain =3D IMX274_MIN_G=
AIN;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (gain &lt;=3D IMX274_MAX_ANALOG_GAIN)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0digital_gain =3D 1;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (gain &lt;=3D IMX274_MAX_ANALOG_GAIN * 2)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0digital_gain =3D 2;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (gain &lt;=3D IMX274_MAX_ANALOG_GAIN * 4)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0digital_gain =3D 4;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0digital_gain =3D IMX2=
74_MAX_DIGITAL_GAIN;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0analog_gain =3D gain / digital_gain;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;priv-&gt;client-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%s : digital ga=
in =3D %d, analog gain =3D %d.%d\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__func__, digital_gai=
n, analog_gain &gt;&gt; IMX274_GAIN_SHIFT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((analog_gain &amp; I=
MX274_GAIN_SHIFT_MASK) * 100)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; IMX274_GAIN_=
SHIFT);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D imx274_set_digital_gain(priv, digital_gai=
n);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* convert to register value, refer to imx274 dat=
asheet */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gain_reg =3D (u32)IMX274_GAIN_CONST -<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(IMX274_GAIN_CONST &l=
t;&lt; IMX274_GAIN_SHIFT) / analog_gain;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (gain_reg &gt; IMX274_GAIN_REG_MAX)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gain_reg =3D IMX274_G=
AIN_REG_MAX;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0imx274_calculate_gain_regs(<wbr>reg_list, (u16)ga=
in_reg);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; ARRAY_SIZE(reg_list); i++) {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D imx274_write_=
reg(priv, reg_list[i].addr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg_list[i].val);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto fail;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* convert register value back to gain value */<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0ctrl-&gt;val =3D (IMX274_GAIN_CONST &lt;&lt; IMX2=
74_GAIN_SHIFT)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0/ (IMX274_GAIN_CONST - gain_reg) * digital_gain;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;priv-&gt;client-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%s : GAIN contr=
ol success, gain_reg =3D %d, new gain =3D %d\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__func__, gain_reg, c=
trl-&gt;val);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +fail:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_err(&amp;priv-&gt;client-&gt;dev, &quot;%s er=
ror =3D %d\n&quot;, __func__, err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return err;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline void imx274_calculate_coarse_time_<wbr>regs(struct reg_=
8 regs[2],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 coarse_time)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regs-&gt;addr =3D IMX274_COARSE_TIME_ADDR_MSB;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0regs-&gt;val =3D (coarse_time &gt;&gt; IMX274_SHI=
FT_8_BITS)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&amp; IMX274_MASK_LSB_8_BITS;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0(regs + 1)-&gt;addr =3D IMX274_COARSE_TIME_ADDR_L=
SB;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0(regs + 1)-&gt;val =3D (coarse_time) &amp; IMX274=
_MASK_LSB_8_BITS;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * imx274_set_coarse_time - Function called when setting SHR value<br=
>
&gt; + * @priv: Pointer to device structure<br>
&gt; + * @val: Value for exposure time in number of line_length, or [HMAX]<=
br>
&gt; + *<br>
&gt; + * Set SHR value based on input value.<br>
&gt; + *<br>
&gt; + * Return: 0 on success<br>
&gt; + */<br>
&gt; +static int imx274_set_coarse_time(struct stimx274 *priv, u32 *val)<br=
>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct reg_8 reg_list[2];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int err;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 coarse_time, frame_length;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0coarse_time =3D *val;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* convert exposure_time to appropriate SHR value=
 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D imx274_clamp_coarse_time(priv, &amp;coars=
e_time, &amp;frame_length);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* prepare SHR registers */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0imx274_calculate_coarse_time_<wbr>regs(reg_list, =
coarse_time);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* write to SHR registers */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; ARRAY_SIZE(reg_list); i++) {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D imx274_write_=
reg(priv, reg_list[i].addr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg_list[i].val);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto fail;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*val =3D frame_length - coarse_time;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +fail:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_err(&amp;priv-&gt;client-&gt;dev, &quot;%s er=
ror =3D %d\n&quot;, __func__, err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return err;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * imx274_set_exposure - Function called when setting exposure time<b=
r>
&gt; + * @priv: Pointer to device structure<br>
&gt; + * @val: Variable for exposure time, in the unit of micro-second<br>
&gt; + *<br>
&gt; + * Set exposure time based on input value.<br>
&gt; + * The caller should hold the mutex lock imx274-&gt;lock if necessary=
<br>
&gt; + *<br>
&gt; + * Return: 0 on success<br>
&gt; + */<br>
&gt; +static int imx274_set_exposure(struct stimx274 *priv, int val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int err;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 hmax;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 reg_val[2];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 coarse_time; /* exposure time in unit of line=
 (HMAX)*/<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;priv-&gt;client-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%s : EXPOSURE c=
ontrol input =3D %d\n&quot;, __func__, val);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* step 1: convert input exposure_time (val) into=
 number of 1[HMAX] */<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* obtain HMAX value */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D imx274_read_reg(priv, IMX274_HMAX_REG_LSB=
, &amp;reg_val[0]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D imx274_read_reg(priv, IMX274_HMAX_REG_MSB=
, &amp;reg_val[1]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0hmax =3D (reg_val[1] &lt;&lt; IMX274_SHIFT_8_BITS=
) + reg_val[0];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (hmax =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0coarse_time =3D (IMX274_PIXCLK_CONST1 / IMX274_PI=
XCLK_CONST2 * val<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0- nocpiop[priv-&gt;mode_index]) / hmax;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* step 2: convert exposure_time into SHR value *=
/<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* set SHR */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D imx274_set_coarse_time(priv, &amp;coarse_=
time);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;ctrls.exposure-&gt;val =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0(coarse_time * hmax + nocpiop[priv-&gt;mode_index])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0/ (IMX274_PIXCLK_CONST1 / IMX274_PIXCLK_CONST2);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;priv-&gt;client-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%s : EXPOSURE c=
ontrol success\n&quot;, __func__);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +fail:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_err(&amp;priv-&gt;client-&gt;dev, &quot;%s er=
ror =3D %d\n&quot;, __func__, err);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return err;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * imx274_set_vflip - Function called when setting vertical flip<br>
&gt; + * @priv: Pointer to device structure<br>
&gt; + * @val: Value for vflip setting<br>
&gt; + *<br>
&gt; + * Set vertical flip based on input value.<br>
&gt; + * val =3D 0: normal, no vertical flip<br>
&gt; + * val =3D 1: vertical flip enabled<br>
&gt; + * The caller should hold the mutex lock imx274-&gt;lock if necessary=
<br>
&gt; + *<br>
&gt; + * Return: 0 on success<br>
&gt; + */<br>
&gt; +static int imx274_set_vflip(struct stimx274 *priv, int val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int err;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D imx274_write_reg(priv, IMX274_VFLIP_REG, =
val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;priv-&gt=
;client-&gt;dev, &quot;VFILP control error\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;priv-&gt;client-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%s : VFLIP cont=
rol success\n&quot;, __func__);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * imx274_set_test_pattern - Function called when setting test patter=
n<br>
&gt; + * @priv: Pointer to device structure<br>
&gt; + * @val: Variable for test pattern<br>
&gt; + *<br>
&gt; + * Set to different test patterns based on input value.<br>
&gt; + *<br>
&gt; + * Return: 0 on success<br>
&gt; + */<br>
&gt; +static int imx274_set_test_pattern(struct stimx274 *priv, int val)<br=
>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int err =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (val =3D=3D TEST_PATTERN_DISABLED) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D imx274_write_=
table(priv, imx274_tp_disabled);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else if (val &lt;=3D TEST_PATTERN_V_COLOR_BARS)=
 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0imx274_tp_regs[0].val=
 =3D val - 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D imx274_write_=
table(priv, imx274_tp_regs);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;priv-&gt=
;client-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;%s : TEST PATTERN control success\n&quot;, __func__);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;priv-&gt=
;client-&gt;dev, &quot;%s error =3D %d\n&quot;, __func__, err);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return err;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline void imx274_calculate_frame_length_<wbr>regs(struct reg=
_8 regs[3],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 frame_length)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regs-&gt;addr =3D IMX274_FRAME_LENGTH_ADDR_1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regs-&gt;val =3D (frame_length &gt;&gt; IMX274_SH=
IFT_16_BITS)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&amp; IMX274_MASK_LSB_4_BITS;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0(regs + 1)-&gt;addr =3D IMX274_FRAME_LENGTH_ADDR_=
2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0(regs + 1)-&gt;val =3D (frame_length &gt;&gt; IMX=
274_SHIFT_8_BITS)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&amp; IMX274_MASK_LSB_8_BITS;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0(regs + 2)-&gt;addr =3D IMX274_FRAME_LENGTH_ADDR_=
3;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0(regs + 2)-&gt;val =3D (frame_length) &amp; IMX27=
4_MASK_LSB_8_BITS;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * imx274_set_frame_length - Function called when setting frame lengt=
h<br>
&gt; + * @priv: Pointer to device structure<br>
&gt; + * @val: Variable for frame length (=3D VMAX, i.e. vertical drive per=
iod length)<br>
&gt; + *<br>
&gt; + * Set frame length based on input value.<br>
&gt; + *<br>
&gt; + * Return: 0 on success<br>
&gt; + */<br>
&gt; +static int imx274_set_frame_length(struct stimx274 *priv, u32 val)<br=
>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct reg_8 reg_list[3];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int err;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 frame_length;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;priv-&gt;client-&gt;dev, &quot;%s : =
input length =3D %d\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__func__, val);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0frame_length =3D (u32)val;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0imx274_calculate_frame_length_<wbr>regs(reg_list,=
 frame_length);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; ARRAY_SIZE(reg_list); i++) {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D imx274_write_=
reg(priv, reg_list[i].addr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg_list[i].val);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto fail;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +fail:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_err(&amp;priv-&gt;client-&gt;dev, &quot;%s er=
ror =3D %d\n&quot;, __func__, err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return err;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * imx274_set_frame_interval - Function called when setting frame int=
erval<br>
&gt; + * @priv: Pointer to device structure<br>
&gt; + * @frame_interval: Variable for frame interval<br>
&gt; + *<br>
&gt; + * Change frame interval by updating VMAX value<br>
&gt; + * The caller should hold the mutex lock imx274-&gt;lock if necessary=
<br>
&gt; + *<br>
&gt; + * Return: 0 on success<br>
&gt; + */<br>
&gt; +static int imx274_set_frame_interval(<wbr>struct stimx274 *priv,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct v4l2_fract frame_i=
nterval)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int err;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 frame_length, req_frame_rate;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 svr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 hmax;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 reg_val[2];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;priv-&gt;client-&gt;dev, &quot;%s: i=
nput frame interval =3D %d / %d&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__func__, frame_inter=
val.numerator,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0frame_interval.denomi=
nator);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (frame_interval.denominator =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0req_frame_rate =3D (u32)(frame_interval.<wbr>deno=
minator<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/ frame_interval.numerator);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* boundary check */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (req_frame_rate &gt; max_frame_rate[priv-&gt;m=
ode_<wbr>index]) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0frame_interval.numera=
tor =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0frame_interval.denomi=
nator =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max_frame_ra=
te[priv-&gt;mode_<wbr>index];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else if (req_frame_rate &lt; IMX274_MIN_FRAME_R=
ATE) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0frame_interval.numera=
tor =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0frame_interval.denomi=
nator =3D IMX274_MIN_FRAME_RATE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * VMAX =3D 1/frame_rate x 72M / (SVR+1) / HMAX<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 * frame_length (i.e. VMAX) =3D (frame_interval) =
x 72M /(SVR+1) / HMAX<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* SVR */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D imx274_read_reg(priv, IMX274_SVR_REG_LSB,=
 &amp;reg_val[0]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D imx274_read_reg(priv, IMX274_SVR_REG_MSB,=
 &amp;reg_val[1]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0svr =3D (reg_val[1] &lt;&lt; IMX274_SHIFT_8_BITS)=
 + reg_val[0];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;priv-&gt;client-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%s : register S=
VR =3D %d\n&quot;, __func__, svr);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* HMAX */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D imx274_read_reg(priv, IMX274_HMAX_REG_LSB=
, &amp;reg_val[0]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D imx274_read_reg(priv, IMX274_HMAX_REG_MSB=
, &amp;reg_val[1]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0hmax =3D (reg_val[1] &lt;&lt; IMX274_SHIFT_8_BITS=
) + reg_val[0];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;priv-&gt;client-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%s : register H=
MAX =3D %d\n&quot;, __func__, hmax);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0frame_length =3D IMX274_PIXCLK_CONST1 / (svr + 1)=
 / hmax<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* frame_inte=
rval.numerator<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/ frame_inte=
rval.denominator;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D imx274_set_frame_length(priv, frame_lengt=
h);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;frame_interval =3D frame_interval;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +fail:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_err(&amp;priv-&gt;client-&gt;dev, &quot;%s er=
ror =3D %d\n&quot;, __func__, err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return err;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct v4l2_subdev_pad_ops imx274_pad_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.get_fmt =3D imx274_get_fmt,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.set_fmt =3D imx274_set_fmt,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const struct v4l2_subdev_video_ops imx274_video_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.g_frame_interval =3D imx274_g_frame_interval,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0.s_frame_interval =3D imx274_s_frame_interval,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0.s_stream =3D imx274_s_stream,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const struct v4l2_subdev_ops imx274_subdev_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.pad =3D &amp;imx274_pad_ops,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.video =3D &amp;imx274_video_ops,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const struct v4l2_ctrl_ops imx274_ctrl_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.s_ctrl =3D imx274_s_ctrl,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const struct of_device_id imx274_of_id_table[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;sony,imx274&quot; },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ }<br>
&gt; +};<br>
&gt; +MODULE_DEVICE_TABLE(of, imx274_of_id_table);<br>
&gt; +<br>
&gt; +static const struct i2c_device_id imx274_id[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ &quot;IMX274&quot;, 0 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ }<br>
&gt; +};<br>
&gt; +MODULE_DEVICE_TABLE(i2c, imx274_id);<br>
&gt; +<br>
&gt; +static int imx274_probe(struct i2c_client *client,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0const struct i2c_device_id *id)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct v4l2_subdev *sd;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct stimx274 *imx274;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* initialize imx274 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0imx274 =3D devm_kzalloc(&amp;client-&gt;dev, size=
of(*imx274), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!imx274)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_init(&amp;imx274-&gt;lock);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* initialize regmap */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0imx274-&gt;regmap =3D devm_regmap_init_i2c(client=
, &amp;imx274_regmap_config);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(imx274-&gt;regmap)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;regmap init failed: %ld\n&quot;, PTR_ERR(imx274-&gt;regmap));<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -ENODEV;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_regmap;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* initialize subdevice */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0imx274-&gt;client =3D client;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sd =3D &amp;imx274-&gt;sd;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0v4l2_i2c_subdev_init(sd, client, &amp;imx274_subd=
ev_ops);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0strlcpy(sd-&gt;name, DRIVER_NAME, sizeof(sd-&gt;n=
ame));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sd-&gt;flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE | V4=
L2_SUBDEV_FL_HAS_EVENTS;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* initialize subdev media pad */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0imx274-&gt;pad.flags =3D MEDIA_PAD_FL_SOURCE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sd-&gt;entity.function =3D MEDIA_ENT_F_CAM_SENSOR=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D media_entity_pads_init(&amp;sd-&gt;<wbr>e=
ntity, 1, &amp;imx274-&gt;pad);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;%s : media entity init Failed %d\n&quot;, __func__, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_regmap;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* initialize sensor reset gpio */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0imx274-&gt;reset_gpio =3D devm_gpiod_get_optional=
(&amp;<wbr>client-&gt;dev, &quot;reset&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPIOD_OUT_HIGH);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(imx274-&gt;reset_gpio)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (PTR_ERR(imx274-&g=
t;reset_gpio) !=3D -EPROBE_DEFER)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_err(&amp;client-&gt;dev, &quot;Reset GPIO not setup in DT&quot;)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D PTR_ERR(imx27=
4-&gt;reset_gpio);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_me;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* pull sensor out of reset */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0imx274_reset(imx274, 1);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* initialize controls */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D v4l2_ctrl_handler_init(&amp;<wbr>imx274-&=
gt;ctrls.handler, 2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;%s : ctrl handler init Failed\n&quot;, __func__);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_me;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0imx274-&gt;ctrls.handler.lock =3D &amp;imx274-&gt=
;lock;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* add new controls */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0imx274-&gt;ctrls.test_pattern =3D v4l2_ctrl_new_s=
td_menu_items(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;imx274-&gt;ctrls=
.handler, &amp;imx274_ctrl_ops,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0V4L2_CID_TEST_PATTERN=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARRAY_SIZE(tp_qmenu) =
- 1, 0, 0, tp_qmenu);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0imx274-&gt;ctrls.gain =3D v4l2_ctrl_new_std(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;imx274-&gt;ctrls=
.handler,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;imx274_ctrl_ops,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0V4L2_CID_GAIN, IMX274=
_MIN_GAIN,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMX274_MAX_DIGITAL_GA=
IN * IMX274_MAX_ANALOG_GAIN, 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMX274_DEF_GAIN);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0imx274-&gt;ctrls.exposure =3D v4l2_ctrl_new_std(<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;imx274-&gt;ctrls=
.handler,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;imx274_ctrl_ops,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0V4L2_CID_EXPOSURE, IM=
X274_MIN_EXPOSURE_TIME,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01000000 / IMX274_DEF_=
FRAME_RATE, 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMX274_MIN_EXPOSURE_T=
IME);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0imx274-&gt;ctrls.vflip =3D v4l2_ctrl_new_std(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;imx274-&gt;ctrls=
.handler,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;imx274_ctrl_ops,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0V4L2_CID_VFLIP, 0, 1,=
 1, 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0imx274-&gt;sd.ctrl_handler =3D &amp;imx274-&gt;ct=
rls.handler;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (imx274-&gt;ctrls.handler.error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D imx274-&gt;ct=
rls.handler.error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_ctrls;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* setup default controls */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D v4l2_ctrl_handler_setup(&amp;<wbr>imx274-=
&gt;ctrls.handler);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;Error %d setup default controls\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_ctrls;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* initialize format */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0imx274-&gt;mode_index =3D IMX274_MODE_3840X2160;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0imx274-&gt;format.width =3D imx274_formats[0].siz=
e.width;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0imx274-&gt;format.height =3D imx274_formats[0].si=
ze.height;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0imx274-&gt;format.field =3D V4L2_FIELD_NONE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0imx274-&gt;format.code =3D MEDIA_BUS_FMT_SRGGB10_=
1X10;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0imx274-&gt;format.colorspace =3D V4L2_COLORSPACE_=
SRGB;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0imx274-&gt;frame_interval.<wbr>numerator =3D 1;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0imx274-&gt;frame_interval.<wbr>denominator =3D IM=
X274_DEF_FRAME_RATE;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* load default control values */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D imx274_load_default(imx274);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;%s : imx274_load_default failed %d\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0__func__, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_ctrls;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* register subdevice */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D v4l2_async_register_subdev(sd)<wbr>;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;%s : v4l2_async_register_subdev failed %d\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0__func__, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_ctrls;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_info(&amp;client-&gt;dev, &quot;imx274 : imx2=
74 probe success !\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +err_ctrls:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0v4l2_async_unregister_subdev(<wbr>sd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0v4l2_ctrl_handler_free(sd-&gt;<wbr>ctrl_handler);=
<br>
&gt; +err_me:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0media_entity_cleanup(&amp;sd-&gt;<wbr>entity);<br=
>
&gt; +err_regmap:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_destroy(&amp;imx274-&gt;lock);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int imx274_remove(struct i2c_client *client)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct v4l2_subdev *sd =3D i2c_get_clientdata(cli=
ent);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct stimx274 *imx274 =3D to_imx274(sd);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* stop stream */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0imx274_write_table(imx274, mode_table[IMX274_MODE=
_STOP_<wbr>STREAM]);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0v4l2_async_unregister_subdev(<wbr>sd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0v4l2_ctrl_handler_free(sd-&gt;<wbr>ctrl_handler);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0media_entity_cleanup(&amp;sd-&gt;<wbr>entity);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_destroy(&amp;imx274-&gt;lock);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static struct i2c_driver imx274_i2c_driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0=3D=
 DRIVER_NAME,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_table =3D i=
mx274_of_id_table,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D imx2=
74_probe,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D imx2=
74_remove,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.id_table=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D imx274_id=
,<br>
&gt; +};<br>
&gt; +<br>
&gt; +module_i2c_driver(imx274_i2c_<wbr>driver);<br>
&gt; +<br>
&gt; +MODULE_AUTHOR(&quot;Leon Luo &lt;<a href=3D"mailto:leonl@leopardimagi=
ng.com">leonl@leopardimaging.com</a>&gt;&quot;);<br>
&gt; +MODULE_DESCRIPTION(&quot;IMX274 CMOS Image Sensor driver&quot;);<br>
&gt; +MODULE_LICENSE(&quot;GPL v2&quot;);<br>
&gt; --<br>
&gt; 2.14.0.rc1<br>
&gt;<br>
<br>
</div></div><span class=3D"gmail-HOEnZb"><font color=3D"#888888">--<br>
Regards,<br>
<br>
Sakari Ailus<br>
e-mail: <a href=3D"mailto:sakari.ailus@iki.fi">sakari.ailus@iki.fi</a><br>
</font></span></blockquote></div><br></div></div>

--f403045cf3d855b918055a3a4bcf--
