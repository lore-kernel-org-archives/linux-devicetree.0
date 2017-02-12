Return-Path: <SRS0=z5Vp=ZZ=gmail.com=slongerbeam@kernel.org>
From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH v3 22/24] media: imx: Add MIPI CSI-2 OV5640 sensor subdev
 driver
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com>
 <1483755102-24785-23-git-send-email-steve_longerbeam@mentor.com>
 <15482412.XOGz6nc3Rt@avalon>
Message-ID: <4f8a588d-9667-0fa1-dc84-840d8f5f0efc@gmail.com>
Date: Sun, 12 Feb 2017 14:46:50 -0800
MIME-Version: 1.0
In-Reply-To: <15482412.XOGz6nc3Rt@avalon>
Content-Type: multipart/alternative;
 boundary="------------B6339356D7EB75AE990F9013"
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com, linux@armlinux.org.uk, mchehab@kernel.org, hverkuil@xs4all.nl, nick@shmanahar.org, markus.heiser@darmarit.de, p.zabel@pengutronix.de, laurent.pinchart+renesas@ideasonboard.com, bparrot@ti.com, geert@linux-m68k.org, arnd@arndb.de, sudipm.mukherjee@gmail.com, minghsiu.tsai@mediatek.com, tiffany.lin@mediatek.com, jean-christophe.trotin@st.com, horms+renesas@verge.net.au, niklas.soderlund+renesas@ragnatech.se, robert.jarzmik@free.fr, songjun.wu@microchip.com, andrew-ct.chen@mediatek.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, Steve Longerbeam <steve_longerbeam@mentor.com>
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------B6339356D7EB75AE990F9013
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 02/02/2017 02:36 AM, Laurent Pinchart wrote:
> Hi Steve,
>
> Thank you for the patch. Many of the comments below apply to the ov5642 driver
> too, please take them into account when reworking patch 23/24.
>
> On Friday 06 Jan 2017 18:11:40 Steve Longerbeam wrote:
>> This driver is based on ov5640_mipi.c from Freescale imx_3.10.17_1.0.0_beta
>> branch, modified heavily to bring forward to latest interfaces and code
>> cleanup.
>>
>> Signed-off-by: Steve Longerbeam<steve_longerbeam@mentor.com>
>> ---
>>   drivers/staging/media/imx/Kconfig       |    8 +
>>   drivers/staging/media/imx/Makefile      |    2 +
>>   drivers/staging/media/imx/ov5640-mipi.c | 2348 ++++++++++++++++++++++++++++
> You're missing DT bindings.

Done, created Documentation/devicetree/bindings/media/i2c/ov5640.txt.

> The driver should go to drivers/media/i2c/ as it should not be specific to the
> i.MX6, and you can just call it ov5640.c.

Done.

>> diff --git a/drivers/staging/media/imx/Kconfig
>> b/drivers/staging/media/imx/Kconfig index ce2d2c8..09f373d 100644
>> --- a/drivers/staging/media/imx/Kconfig
>> +++ b/drivers/staging/media/imx/Kconfig
>> @@ -17,5 +17,13 @@ config VIDEO_IMX_CAMERA
>>   	---help---
>>   	  A video4linux camera capture driver for i.MX5/6.
>>
>> +config IMX_OV5640_MIPI
>> +       tristate "OmniVision OV5640 MIPI CSI-2 camera support"
>> +       depends on GPIOLIB && VIDEO_IMX_CAMERA
> The sensor driver is generic, it shouldn't depend on IMX. It should however
> depend on at least I2C and OF by the look of it.

Done.

>
>> +
>> +#include <linux/module.h>
>> +#include <linux/init.h>
>> +#include <linux/slab.h>
>> +#include <linux/ctype.h>
>> +#include <linux/types.h>
>> +#include <linux/delay.h>
>> +#include <linux/device.h>
>> +#include <linux/i2c.h>
>> +#include <linux/of_device.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/regulator/consumer.h>
>> +#include <linux/clk.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/clkdev.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/v4l2-subdev.h>
>> +#include <media/v4l2-async.h>
>> +#include <media/v4l2-of.h>
>> +#include <media/v4l2-ctrls.h>
> Pet peeve of mine, please sort the headers alphabetically. It makes it easier
> to locate duplicated.

Fixed.

>> +
>> +#define OV5640_CHIP_ID  0x300A
>> +#define OV5640_SLAVE_ID 0x3100
>> +#define OV5640_DEFAULT_SLAVE_ID 0x3c
> You're mixing lower-case and upper-case hex constants. Let's pick one. Kernel
> code usually favours lower-case.

Fixed.

> Please define macros for all the other numerical constants you use in the
> driver (register addresses and values). The large registers tables can be an
> exception if you don't have access to the information, but for registers
> written manually, hardcoding numerical values isn't good.

Done.

>> +
>> +#define OV5640_MAX_CONTROLS 64
>> +
>> +enum ov5640_mode {
>> +	ov5640_mode_MIN = 0,
>> +	ov5640_mode_QCIF_176_144 = 0,
>> +	ov5640_mode_QVGA_320_240,
>> +	ov5640_mode_VGA_640_480,
>> +	ov5640_mode_NTSC_720_480,
>> +	ov5640_mode_PAL_720_576,
>> +	ov5640_mode_XGA_1024_768,
>> +	ov5640_mode_720P_1280_720,
>> +	ov5640_mode_1080P_1920_1080,
>> +	ov5640_mode_QSXGA_2592_1944,
>> +	ov5640_num_modes,
>> +	ov5640_mode_INIT = 0xff, /*only for sensor init*/
> Please add spaces after /* and before */.
>
> Enumerated values should be all upper-case.

Fixed (and ov5640_mode_INIT is removed).
>> +
>> +/* image size under 1280 * 960 are SUBSAMPLING
>> + * image size upper 1280 * 960 are SCALING
>> + */
> The kernel multi-line comment style is
>
> /*
>   * text
>   * text
>   */

Fixed.

>> +
>> +struct ov5640_dev {
>> +	struct i2c_client *i2c_client;
>> +	struct device *dev;
>> +	struct v4l2_subdev sd;
>> +	struct media_pad pad;
>> +	struct v4l2_ctrl_handler ctrl_hdl;
>> +	struct v4l2_of_endpoint ep; /* the parsed DT endpoint info */
>> +	struct v4l2_mbus_framefmt fmt;
>> +	struct v4l2_captureparm streamcap;
>> +	struct clk *xclk; /* system clock to OV5640 */
>> +	int xclk_freq;    /* requested xclk freq from devicetree */
>> +
>> +	enum ov5640_mode current_mode;
> Store a (const) pointer to the corresponding ov5640_mode_info instead, it will
> simplify the code and allow you to get rid of the ov5640_mode enum.

Done.

>> +
>> +	int prev_sysclk, prev_hts;
>> +	int ae_low, ae_high, ae_target;
> Can't these be unsigned int ?

yep, an old left-over Freescale-ism, fixed.

>> +
>> +static void ov5640_power(struct ov5640_dev *sensor, bool enable);
>> +static void ov5640_reset(struct ov5640_dev *sensor);
>> +static int ov5640_restore_ctrls(struct ov5640_dev *sensor);
>> +static int ov5640_set_agc(struct ov5640_dev *sensor, int value);
>> +static int ov5640_set_exposure(struct ov5640_dev *sensor, int value);
>> +static int ov5640_get_exposure(struct ov5640_dev *sensor);
>> +static int ov5640_set_gain(struct ov5640_dev *sensor, int value);
>> +static int ov5640_get_gain(struct ov5640_dev *sensor);
> No forward declarations please. You should reorder functions as needed (and of
> course still group related functions together).

Fixed.

>> +static struct reg_value ov5640_init_setting_30fps_VGA[] = {
>> +
>> <snip>
>> +	{0x3a1f, 0x14, 0, 0}, {0x3008, 0x02, 0, 0}, {0x3c00, 0x04, 0, 300},
>> +};
> You only use the delay feature of the registers tables twice, once after
> writing the first two registers (to select the clock source and perform a
> software reset) and once at the very end.

There is a delay in other places as well. There is a 1 msec delay after
setting a PLL multiplier register, and another after programming the
15 fps 2592x1944 mode. I'd prefer to keep the delay support in place
for now. Later, removing these delays can be experimented with.

>   Remove it, write the first two
> registers manually in the code with a manual delay afterwards, and add another
> manual delay after writing the whole table.
>
> I'm actually wondering whether you couldn't remove the 300ms delay at the end,
> the 50/60Hz control register (0x3c00) doesn't look like it needs a delay after
> being written.
>
> [snip]
>
>> +static struct reg_value ov5640_setting_15fps_QSXGA_2592_1944[] = {
>> +	{0x4202, 0x0f, 0, 0},	/* stream off the sensor */
>> <snip>
>> +	{0x4202, 0x00, 0, 0},	/* stream on the sensor */
> Don't turn the stream on in the init sequences, it should only be turned on
> from the .s_stream() operation.

Fixed. More old FSL-isms.

>> +};
>> +
>> +static struct ov5640_mode_info
>> +ov5640_mode_info_data[ov5640_num_framerates][ov5640_num_modes] = {
> There's very few differences between the 15fps and 30fps tables. It would be
> better if you could merge them, and manually write the registers that differ.

Sorting that out will be a lot of work, I don't have the time, it will have
to wait for future fixes. The register tables are likely bloated with 
power-on
reset values that need to be pruned anyway (there is a FIXME added to that
effect).

>> +
>> +static int ov5640_probe(struct i2c_client *adapter,
>> +			const struct i2c_device_id *device_id);
>> +static int ov5640_remove(struct i2c_client *client);
> No forward declarations please.

Fixed, more FSL-isms.

>> +
>> +static int ov5640_read_reg(struct ov5640_dev *sensor, u16 reg, u8 *val)
>> +{
>> +	u8 reg_buf[2] = {0};
>> +	u8 read_val = 0;
>> +
>> +	reg_buf[0] = reg >> 8;
>> +	reg_buf[1] = reg & 0xff;
>> +
>> +	if (2 != i2c_master_send(sensor->i2c_client, reg_buf, 2)) {
>> +		v4l2_err(&sensor->sd, "%s: write reg error: reg=%x\n",
>> +			__func__, reg);
>> +		return -EIO;
>> +	}
>> +
>> +	if (1 != i2c_master_recv(sensor->i2c_client, &read_val, 1)) {
>> +		v4l2_err(&sensor->sd, "%s: read reg error: reg=%x, val=%x\n",
>> +			__func__, reg, read_val);
>> +		return -EIO;
>> +	}
> Wouldn't i2c_transfer() be more efficient here ?

Yep, done, for every register access function.

>> +	*val = read_val;
>> +	return 0;
>> +}
>> +
>> +#define OV5640_READ_REG(s, r, v) {				\
>> +		ret = ov5640_read_reg((s), (r), (v));		\
>> +		if (ret)					\
>> +			return ret;				\
>> +	}
> No. No. No no no. Don't ever return from a macro. Hiding the return makes
> following the code flow much more difficult, it's just asking for trouble.
>
> And don't use externally defined variables (ret in this case), that's also
> asking for trouble.

Fixed.

>> +
>> +static int ov5640_mod_reg(struct ov5640_dev *sensor, u16 reg,
>> +			  u8 mask, u8 val)
>> +{
>> +	u8 readval;
>> +	int ret;
>> +
>> +	OV5640_READ_REG(sensor, reg, &readval);
>> +
>> +	readval &= ~mask;
>> +	val &= mask;
>> +	val |= readval;
>> +
>> +	OV5640_WRITE_REG(sensor, reg, val);
>> +	return 0;
>> +}
>>
>> If you need to modify registers a lot, switch to regmap for register access.
>> It will provide you with a cache, removing the need to read registers back
>> from the device.

ov5640_mod_reg() is only called in a few places. If this needs more use
later, will convert to regmap.

>> +/* download ov5640 settings to sensor through i2c */
>> +static int ov5640_load_regs(struct ov5640_dev *sensor,
>> +			    struct reg_value *regs,
>> +			    int size)
> size is never negative.

Fixed, actually new prototype is much simpler:

static int ov5640_load_regs(struct ov5640_dev *sensor,
                 const struct ov5640_mode_info *mode);

>> +{
>> +	register u32 delay_ms = 0;
>> +	register u16 reg_addr = 0;
>> +	register u8 mask = 0;
>> +	register u8 val = 0;
> register ? The compiler is nowadays likely smarter than us when it comes to
> register allocation.

Yeah, nutty. I didn't write that, more old FSL-isms.
>> +
>> +static int ov5640_get_HTS(struct ov5640_dev *sensor)
>> +{
>> +	 /* read HTS from register settings */
>> +	u16 HTS;
> Function names and variables are lower case.

Fixed.

>> +
>> +static int ov5640_set_bandingfilter(struct ov5640_dev *sensor)
>> +{
>> +	int prev_vts;
>> +	int band_step60, max_band60, band_step50, max_band50;
> Aren't these values unsigned ?

Yep, fixed.

>> +
>> +static int ov5640_set_AE_target(struct ov5640_dev *sensor, int target)
>> +{
>> +	/* stable in high */
>> +	int fast_high, fast_low;
> Aren't these values unsigned ?

Fixed.

>> +	int ret;
>> +
>> +	sensor->ae_low = target * 23 / 25;	/* 0.92 */
>> +	sensor->ae_high = target * 27 / 25;	/* 1.08 */
>> +
>> +	fast_high = sensor->ae_high<<1;
> Missing spaces around <<

Fixed.

>> +
>> +static int ov5640_set_virtual_channel(struct ov5640_dev *sensor)
>> +{
>> +	u8 temp, channel = sensor->ep.base.id;
> The endpoint id isn't meant to select a virtual channel. V4L2 has no virtual
> channel API at the moment, you can hardcode the VC to 0 for now.

Yes, imx-media bridge driver _really_ needs a subdev/V4L2 API to
set the virtual channel that a CSI-2 sensor will transmit on, because
it fully supports receiving on any of the 4 virtual channels (via the
4 source pads from the imx6-mipi-csi2 / CSI2IPU gasket entity).

For now I've hardcoded the ov5640 to transmit over channel 1. This is
good for the imx-media graph because it allows simultaneous capture
from a parallel sensor via ipu1_csi0, while the ov5640 captures via
ipu1_csi1.

Channel 1 may not be good for other bridges though. Maybe this would
be a good candidate for a module parameter.

>> +	int ret;
>> +
>> +	OV5640_READ_REG(sensor, 0x4814, &temp);
>> +	temp &= ~(3 << 6);
>> +	temp |= (channel << 6);
>> +	OV5640_WRITE_REG(sensor, 0x4814, temp);
>> +
>> +	return 0;
>> +}
>> +
>> +static enum ov5640_mode
>> +ov5640_find_nearest_mode(struct ov5640_dev *sensor,
>> +			 int width, int height)
> How about using v4l2_find_nearest_format() ?

It doesn't really fit ATM, see below.

>
>> +
>> +	ret = ov5640_set_stream(sensor, true);
> This will turn streaming on when you set the format, which I don't think is
> correct. You should only turn streaming on in the .s_stream() operation. The
> same comment applies to the previous function.

Fixed, FSL-ism. Tested and still works fine.


>> +
>> +static int ov5640_change_mode(struct ov5640_dev *sensor,
>> +			      enum ov5640_frame_rate frame_rate,
>> +			      enum ov5640_mode mode,
>> +			      enum ov5640_mode orig_mode)
>> +{
>> +	enum ov5640_downsize_mode dn_mode, orig_dn_mode;
>> +	struct reg_value *mode_data = NULL;
>> +	int mode_size = 0;
>> +	int ret = 0;
> No need to initialize ret to 0.

Fixed.

>> +		sensor->fmt.width = 640;
>> +		sensor->fmt.height = 480;
> Don't reset the format here. The format must be preserved across subdev
> open/close.

Fixed.

>> +
>> +/* restore the last set video mode after chip power-on */
>> +static int ov5640_restore_mode(struct ov5640_dev *sensor)
>> +{
>> +	int ret = 0;
> No need to initialize ret to 0.

Fixed.

>> +
>> +	/* first we need to set some initial register values */
>> +	ret = ov5640_change_mode(sensor, sensor->current_fr,
>> +				    ov5640_mode_INIT, ov5640_mode_INIT);
> I wouldn't use ov5640_change_mode() here. You only need to apply the init
> register values, just call ov5640_load_regs(). The rest of the
> ov5640_change_mode() isn't needed, as you're calling it below. This will also
> allow you to get rid of ov5640_mode_INIT, simplifying the logic.

Fixed. I created an init register table, ov5640_mode_init_data, which is
loaded by ov5640_restore_mode().


>
>> +
>> +static int ov5640_regulators_on(struct ov5640_dev *sensor)
>> +{
>> +	int ret;
>> +
>> +	if (sensor->io_regulator) {
>> +		ret = regulator_enable(sensor->io_regulator);
>> +		if (ret) {
>> +			v4l2_err(&sensor->sd, "io reg enable failed\n");
>> +			return ret;
>> +		}
>> +	}
>> +	if (sensor->core_regulator) {
>> +		ret = regulator_enable(sensor->core_regulator);
>> +		if (ret) {
>> +			v4l2_err(&sensor->sd, "core reg enable failed\n");
>> +			return ret;
>> +		}
>> +	}
>> +	if (sensor->gpo_regulator) {
>> +		ret = regulator_enable(sensor->gpo_regulator);
>> +		if (ret) {
>> +			v4l2_err(&sensor->sd, "gpo reg enable failed\n");
>> +			return ret;
>> +		}
>> +	}
>> +	if (sensor->analog_regulator) {
>> +		ret = regulator_enable(sensor->analog_regulator);
>> +		if (ret) {
>> +			v4l2_err(&sensor->sd, "analog reg enable failed\n");
>> +			return ret;
>> +		}
>> +	}
> Maybe you should use the bulk regulator API ?

Done.

>> +
>> +/* --------------- Subdev Operations --------------- */
>> +
>> +static int ov5640_s_power(struct v4l2_subdev *sd, int on)
>> +{
>> +	struct ov5640_dev *sensor = to_ov5640_dev(sd);
>> +	int ret;
>> +
>> +	v4l2_info(sd, "power %s\n", on ? "ON" : "OFF");
>> +
>> +	if (on && !sensor->on) {
> The .s_power() calls need to be ref-counted, similarly to how the regulator
> enable/disable calls work. See the mt9p031 sensor driver for an example.

Done.

>> +		if (sensor->xclk)
>> +			clk_prepare_enable(sensor->xclk);
>> +
>> +		ret = ov5640_regulators_on(sensor);
>> +		if (ret)
>> +			return ret;
>> +
>> +		ov5640_reset(sensor);
>> +		ov5640_power(sensor, true);
>> +
>> +		ret = ov5640_init_slave_id(sensor);
> Why is this needed ?

Because on SabreLite, the ov5642 is at the same default
i2c slave address, so they both need to answer to a non-default
address.

>> +
>> +static int ov5640_s_parm(struct v4l2_subdev *sd, struct v4l2_streamparm *a)
>> +{
>> +	struct ov5640_dev *sensor = to_ov5640_dev(sd);
>> +	struct v4l2_fract *timeperframe = &a->parm.capture.timeperframe;
>> +	enum ov5640_frame_rate frame_rate;
>> +	u32 tgt_fps;	/* target frames per secound */
>> +	int ret = 0;
> No need to initialize ret to 0.

Fixed.

>> +	else {
>> +		v4l2_err(&sensor->sd, "frame rate %u not supported!\n",
>> +			 tgt_fps);
> Don't print an error message that is userspace-triggerable, we have enough
> ways for applications to flood the kernel log already :-)

Removed.

>> +
>> +static int ov5640_get_fmt(struct v4l2_subdev *sd,
>> +			  struct v4l2_subdev_pad_config *cfg,
>> +			  struct v4l2_subdev_format *format)
>> +{
>> +	struct ov5640_dev *sensor = to_ov5640_dev(sd);
>> +
>> +	if (format->pad != 0)
>> +		return -EINVAL;
>> +
>> +	format->format = sensor->fmt;
> You need to handle the TRY format here. You can have a look at the mt9p031
> driver for an example on how to do so.

Right, that was caught and fixed earlier.

>> +
>> +static int ov5640_set_fmt(struct v4l2_subdev *sd,
>> +			  struct v4l2_subdev_pad_config *cfg,
>> +			  struct v4l2_subdev_format *format)
>> +{
>> +	struct ov5640_dev *sensor = to_ov5640_dev(sd);
>> +	enum ov5640_mode new_mode;
>> +	int ret;
>> +
>> +	if (format->pad != 0)
>> +		return -EINVAL;
>> +
>> +	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
>> +		ret = ov5640_try_fmt_internal(sd, &format->format, NULL);
>> +		if (ret)
>> +			return ret;
> You can move this code above the test to avoid the duplicated call below.

Fixed.

>> +		cfg->try_fmt = format->format;
> Please use the v4l2_subdev_get_try_format() function to get the try format,
> don't dereference cfg directly.

Done.

>> +
>> +static int ov5640_set_hue(struct ov5640_dev *sensor, int value)
>> +{
>> +	int ret;
>> +
>> +	if (value) {
>> +		OV5640_MOD_REG(sensor, 0x5580, 1 << 0, 1 << 0);
>> +		OV5640_WRITE_REG16(sensor, 0x5581, value);
>> +	} else
>> +		OV5640_MOD_REG(sensor, 0x5580, 1 << 0, 0);
> According to the kernel coding style, you need curly braces around the else
> branch if you use them around the if branch.

Fixed everywhere.

>
>
>> +
>> +#if 0
> No compiled-out code please.

Removed ov5640_set_green_balance().

>> +static int ov5640_set_green_balance(struct ov5640_dev *sensor, int value)
>> +{
>> +	int ret;
>> +
>> +	if (sensor->awb_on)
>> +		return -EINVAL;
>> +
>> +	OV5640_WRITE_REG(sensor, 0x3403, value & 0xff);
>> +	OV5640_WRITE_REG(sensor, 0x3402, (value & 0xf00) >> 8);
>> +	return 0;
>> +}
>> +#endif
>> +
>> <snip>
>> +
>> +static int ov5640_set_gain(struct ov5640_dev *sensor, int value)
>> +{
>> +	int ret;
>> +
>> +	if (sensor->agc_on)
>> +		return -EINVAL;
> You can create a cluster with the autogain and manual gain controls
> (v4l2_ctrl_auto_cluster) to have the control framework disabling the manual
> control automatically when autogain is enabled.

Done. Also made white-balance and exposure auto clusters as well.
And in the process, got rid of the control table as Hans had suggested
earlier.


>> +	OV5640_WRITE_REG16(sensor, 0x350a, value & 0x3ff);
>> +	return 0;
>> +}
>> +
>> +static int ov5640_get_gain(struct ov5640_dev *sensor)
>> +{
>> +	u16 gain;
>> +	int ret;
>> +
>> +	if (sensor->agc_on)
>> +		return -EINVAL;
>> +
>> +	OV5640_READ_REG16(sensor, 0x350a, &gain);
>> +
>> +	return gain & 0x3ff;
>> +}
>> +
>> +#if 0
>> +static int ov5640_set_test_pattern(struct ov5640_dev *sensor, int value)
>> +{
>> +	int ret;
>> +
>> +	OV5640_MOD_REG(sensor, 0x503d, 0xa4, value ? 0xa4 : 0);
>> +	return 0;
>> +}
>> +#endif
> You can use a control to expose the test pattern function, it's quite useful.

Done, as a menu control for color bars.

>> +static struct ov5640_control *ov5640_get_ctrl(int id, int *index)
>> +{
>> +	struct ov5640_control *ret = NULL;
>> +	int i;
> i is never negative, it should be unsigned int.

Fixed.


>> +
>> +static int ov5640_restore_ctrls(struct ov5640_dev *sensor)
>> +{
>> +	struct ov5640_control *c;
>> +	int i;
> i is never negative, it should be unsigned int.

restore_ctrls is gone from earlier fixes.

>> +
>> +static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
>> +{
>> +	struct ov5640_dev *sensor = ctrl_to_ov5640_dev(ctrl);
>> +	struct ov5640_control *c;
>> +	int ret = 0;
>> +	int i;
>> +
>> +	c = ov5640_get_ctrl(ctrl->id, &i);
> You can inline the function call here as it's not used anywhere else.

Done.

>> +
>> +static int ov5640_init_controls(struct ov5640_dev *sensor)
>> +{
>> +	struct ov5640_control *c;
> I would name this ctrl or control, c can be a bit confusing. You can also
> declare it inside the loop.

Done.

>> +	int i;
> i can never be negative, you can make it an unsigned int.

Done.

>> +
>> +	v4l2_ctrl_handler_init(&sensor->ctrl_hdl, OV5640_NUM_CONTROLS);
>> +
>> +	for (i = 0; i < OV5640_NUM_CONTROLS; i++) {
>> +		c = &ov5640_ctrls[i];
>> +
>> +		v4l2_ctrl_new_std(&sensor->ctrl_hdl, &ov5640_ctrl_ops,
>> +				  c->ctrl.id, c->ctrl.minimum, c-
>> ctrl.maximum,
>> +				  c->ctrl.step, c->ctrl.default_value);
>> +	}
>> +
>> +	sensor->sd.ctrl_handler = &sensor->ctrl_hdl;
>> +	if (sensor->ctrl_hdl.error) {
>> +		int err = sensor->ctrl_hdl.error;
>> +
>> +		v4l2_ctrl_handler_free(&sensor->ctrl_hdl);
>> +
>> +		v4l2_err(&sensor->sd, "%s: error %d\n", __func__, err);
> I'm not sure this brings much value.

Removed.

>
>> +
>> +static int ov5640_enum_frame_interval(
>> +	struct v4l2_subdev *sd,
>> +	struct v4l2_subdev_pad_config *cfg,
>> +	struct v4l2_subdev_frame_interval_enum *fie)
>> +{
>> +	struct ov5640_dev *sensor = to_ov5640_dev(sd);
>> +	enum ov5640_mode mode;
>> +
>> +	if (fie->pad != 0)
>> +		return -EINVAL;
>> +	if (fie->index < 0 || fie->index >= ov5640_num_framerates)
>> +		return -EINVAL;
>> +
>> +	if (fie->width == 0 || fie->height == 0)
>> +		return -EINVAL;
>> +
>> +	mode = ov5640_find_nearest_mode(sensor, fie->width, fie->height);
> You should find an exact mode here, not the nearest one. If with and height
> don't match, return -EINVAL. That will replace with above width == 0 and
> height == 0 test.

Fixed, I modified ov5640_find_mode() (renamed from 
ov5640_find_nearest_mode())
to take a "nearest" boolean, which is passed as false here.

>> +
>> +	dev_dbg(sensor->dev, "%dx%d: [%d] = %d fps\n",
>> +		fie->width, fie->height, fie->index, fie-
>> interval.denominator);
> I'm not sure this is very useful, you can use ftrace if you want to trace
> function calls.

Removed.
>> +	return 0;
>> +}
>> +
>> +static int ov5640_g_input_status(struct v4l2_subdev *sd, u32 *status)
>> +{
>> +	struct ov5640_dev *sensor = to_ov5640_dev(sd);
>> +
>> +	*status = !sensor->on ? V4L2_IN_ST_NO_POWER : 0;
>> +
>> +	return 0;
>> +}
>> +
>> +static int ov5640_s_routing(struct v4l2_subdev *sd, u32 input,
>> +			    u32 output, u32 config)
>> +{
>> +	return (input != 0) ? -EINVAL : 0;
>> +}
> The g_input_status and s_routing subdev operations are not mandatory, you
> don't have to implement them as the sensor doesn't have multiple inputs.

Removed.

>> +static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
>> +{
>> +	struct ov5640_dev *sensor = to_ov5640_dev(sd);
>> +
>> +	v4l2_info(sd, "stream %s\n", enable ? "ON" : "OFF");
> You can use ftrace to trace function calls, there's no need to add debugging
> statements that duplicate the functionality.

Removed.

>> +
>> +static struct v4l2_subdev_ops ov5640_subdev_ops = {
>> +	.core = &ov5640_core_ops,
>> +	.video = &ov5640_video_ops,
>> +	.pad = &ov5640_pad_ops,
>> +};
> All these structures should be static const.

Fixed.

>> +
>> +static void ov5640_power(struct ov5640_dev *sensor, bool enable)
>> +{
>> +	gpiod_set_value(sensor->pwdn_gpio, enable ? 0 : 1);
>> +}
>> +
>> +static void ov5640_reset(struct ov5640_dev *sensor)
>> +{
>> +	gpiod_set_value(sensor->reset_gpio, 0);
>> +
>> +	/* camera power cycle */
>> +	ov5640_power(sensor, false);
>> +	usleep_range(5000, 10000);
>> +	ov5640_power(sensor, true);
>> +	usleep_range(5000, 10000);
>> +
>> +	gpiod_set_value(sensor->reset_gpio, 1);
>> +	usleep_range(1000, 2000);
>> +
>> +	gpiod_set_value(sensor->reset_gpio, 0);
>> +	usleep_range(5000, 10000);
>> +}
>> +
>> +static void ov5640_get_regulators(struct ov5640_dev *sensor)
>> +{
>> +	sensor->io_regulator = devm_regulator_get(sensor->dev, "DOVDD");
>> +	if (!IS_ERR(sensor->io_regulator)) {
>> +		regulator_set_voltage(sensor->io_regulator,
>> +				      OV5640_VOLTAGE_DIGITAL_IO,
>> +				      OV5640_VOLTAGE_DIGITAL_IO);
>> +	} else {
>> +		dev_dbg(sensor->dev, "%s: no io voltage reg found\n",
>> +			__func__);
>> +		sensor->io_regulator = NULL;
> How about making the power supplies mandatory in DT instead ? They are
> mandatory after all, if they're not controllable DT should just declare fixed
> supplies.

I guess that makes sense. They are now mandatory.

>> +
>> +static int ov5640_probe(struct i2c_client *client,
>> +			const struct i2c_device_id *id)
>> +{
>> +	struct device *dev = &client->dev;
>> +	struct device_node *endpoint;
>> +	struct ov5640_dev *sensor;
>> +	int i, xclk, ret;
> i and xclk are never negative, you can make them unsigned int.

This was removed from earlier cleanups.

>> +
>> +	sensor = devm_kzalloc(dev, sizeof(struct ov5640_dev), GFP_KERNEL);
> Please use sizeof(*variable) instead of sizeof(type).

Done.

> devm_kzalloc() doesn't play nicely with dynamic removal of devices. We're in
> the process of fixing related race conditions in the media subsystem. In order
> not to make the problem worse, please use kzalloc() instead.
>
>> +	if (!sensor)
>> +		return -ENOMEM;
>> +
>> +	sensor->i2c_client = client;
>> +	sensor->dev = dev;
> Do you really need to store both i2c_client and dev, given that the latter is
> just &client->dev ?

It was only for convenience, but sensor->dev was now only used in a
couple places, so sensor->dev removed.

>
>> +	sensor->fmt.code = MEDIA_BUS_FMT_UYVY8_2X8;
>> +	sensor->fmt.width = 640;
>> +	sensor->fmt.height = 480;
>> +	sensor->fmt.field = V4L2_FIELD_NONE;
>> +	sensor->streamcap.capability = V4L2_MODE_HIGHQUALITY |
>> +					   V4L2_CAP_TIMEPERFRAME;
> Please fix the indentation.

Fixed.

>> +
>> +	v4l2_of_parse_endpoint(endpoint, &sensor->ep);
>> +	if (sensor->ep.bus_type != V4L2_MBUS_CSI2) {
>> +		dev_err(dev, "invalid bus type, must be MIPI CSI2\n");
>> +		return -EINVAL;
> You're leaking endpoint here. You should move the of_node_put() call right
> after the v4l2_of_parse_endpoint() call.

oops, Fixed.

>> +
>> +	/* get system clock (xclk) frequency */
>> +	ret = of_property_read_u32(dev->of_node, "xclk", &xclk);
> Instead of adding a custom DT property for this, use assigned-clock-rates. You
> won't need to set it manually in the driver, and can verify its frequency with
> clk_get_rate().

This was done in earlier fixups.

>> +	if (!ret) {
>> +		if (xclk < OV5640_XCLK_MIN || xclk > OV5640_XCLK_MAX) {
> Are your register tables above independent of the clock frequency ? You should
> ideally compute register values at runtime instead of hardcoding them, but
> given the lack of information from Omnivision I understand this isn't
> possible. You thus need to be stricter here and reject any value other than
> the nominal frequency.

I went back and looked at the original driver from Freescale that these
register tables are based on, and that driver does allow a range between
6 and 24 MHz. I've updated the min/max for xclk to that range. I agree
though that this will need some experimentation to verify these xclk ranges
actually work.


>
>> +
>> +	/* get system clock (xclk) */
>> +	sensor->xclk = devm_clk_get(dev, "xclk");
>> +	if (!IS_ERR(sensor->xclk)) {
>> +		if (!sensor->xclk_freq) {
>> +			dev_err(dev, "xclk requires xclk frequency!\n");
>> +			return -EINVAL;
>> +		}
>> +		clk_set_rate(sensor->xclk, sensor->xclk_freq);
>> +	} else {
>> +		/* assume system clock enabled by default */
>> +		sensor->xclk = NULL;
> Please don't. The clock should be mandatory.

This was done in earlier fixups.


>> +	}
>> +
>> +	/* request power down pin */
>> +	sensor->pwdn_gpio = devm_gpiod_get(dev, "pwdn", GPIOD_OUT_HIGH);
> Are the GPIOs mandatory or optional ? Can a system tie some of them to ground
> or a voltage rail, or do they need to always be manually controllable ?

Yes, they could be tied to ground or a rail, and are not required. I
made both reset and pwdn gpios optional.

>
>> +
>> +	ret = ov5640_s_power(&sensor->sd, 1);
>> +	if (ret)
>> +		goto entity_cleanup;
>> +	ret = ov5640_init_controls(sensor);
>> +	if (ret)
>> +		goto power_off;
>> +
>> +	ret = ov5640_s_power(&sensor->sd, 0);
>> +	if (ret)
>> +		goto free_ctrls;
> Writing the controls here is pointless, as powering the chip down will lose
> all the values. You shouldn't call v4l2_ctrl_handler_setup() in
> ov5640_init_controls(), and you can then remove the ov5640_s_power() calls
> here.

Good idea, done.

>> +
>> +free_ctrls:
>> +	v4l2_ctrl_handler_free(&sensor->ctrl_hdl);
>> +power_off:
>> +	ov5640_s_power(&sensor->sd, 0);
>> +entity_cleanup:
>> +	media_entity_cleanup(&sensor->sd.entity);
>> +	ov5640_regulators_off(sensor);
> Won't ov5640_s_power(0) already disable the regulators ?

Not applicable anymore, as there's no need to enable power in probe.

>> +	return ret;
>> +}
>> +
>> +/*!
>> + * ov5640 I2C detach function
>> + *
>> + * @param client            struct i2c_client *
>> + * @return  Error code indicating success or failure
>> + */
> That's not the kerneldoc comment style. Given that this is the only documented
> function, and that the comment is completely useless, you can just drop it.

yuck, old FSL-isms, removed.

>> +static int ov5640_remove(struct i2c_client *client)
>> +{
>> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>> +	struct ov5640_dev *sensor = to_ov5640_dev(sd);
>> +
>> +	ov5640_regulators_off(sensor);
>> +
>> +	v4l2_async_unregister_subdev(&sensor->sd);
>> +	media_entity_cleanup(&sensor->sd.entity);
>> +	v4l2_device_unregister_subdev(sd);
> This function is called by v4l2_async_unregister_subdev(), there's no need to
> duplicate it.

Removed.

>> +MODULE_AUTHOR("Freescale Semiconductor, Inc.");
> MODULE_AUTHOR isn't a synonym for copyright ownership. I don't think you
> should add Freescale as an author. If you know who wrote the original code you
> can list that developer explicitly.

I have no clue who the original author was, I just removed
MODULE_AUTHOR(s).

>> +MODULE_AUTHOR("Steve Longerbeam<steve_longerbeam@mentor.com>");
>> +MODULE_DESCRIPTION("OV5640 MIPI Camera Subdev Driver");
>> +MODULE_LICENSE("GPL");
>> +MODULE_VERSION("1.0");
> Version numbers are never updated. I wouldn't bother adding one.

Removed.

Steve


--------------B6339356D7EB75AE990F9013
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 02/02/2017 02:36 AM, Laurent
      Pinchart wrote:<br>
    </div>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <pre wrap="">Hi Steve,

Thank you for the patch. Many of the comments below apply to the ov5642 driver 
too, please take them into account when reworking patch 23/24.

On Friday 06 Jan 2017 18:11:40 Steve Longerbeam wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">This driver is based on ov5640_mipi.c from Freescale imx_3.10.17_1.0.0_beta
branch, modified heavily to bring forward to latest interfaces and code
cleanup.

Signed-off-by: Steve Longerbeam <a class="moz-txt-link-rfc2396E" href="mailto:steve_longerbeam@mentor.com">&lt;steve_longerbeam@mentor.com&gt;</a>
---
 drivers/staging/media/imx/Kconfig       |    8 +
 drivers/staging/media/imx/Makefile      |    2 +
 drivers/staging/media/imx/ov5640-mipi.c | 2348 ++++++++++++++++++++++++++++
</pre>
      </blockquote>
      <pre wrap="">You're missing DT bindings.</pre>
    </blockquote>
    <br>
    Done, created
    Documentation/devicetree/bindings/media/i2c/ov5640.txt.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <pre wrap="">The driver should go to drivers/media/i2c/ as it should not be specific to the 
i.MX6, and you can just call it ov5640.c.
</pre>
    </blockquote>
    <br>
    Done.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">diff --git a/drivers/staging/media/imx/Kconfig
b/drivers/staging/media/imx/Kconfig index ce2d2c8..09f373d 100644
--- a/drivers/staging/media/imx/Kconfig
+++ b/drivers/staging/media/imx/Kconfig
@@ -17,5 +17,13 @@ config VIDEO_IMX_CAMERA
 	---help---
 	  A video4linux camera capture driver for i.MX5/6.

+config IMX_OV5640_MIPI
+       tristate "OmniVision OV5640 MIPI CSI-2 camera support"
+       depends on GPIOLIB &amp;&amp; VIDEO_IMX_CAMERA
</pre>
      </blockquote>
      <pre wrap="">The sensor driver is generic, it shouldn't depend on IMX. It should however 
depend on at least I2C and OF by the look of it.</pre>
    </blockquote>
    <br>
    Done.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite"> <br>
      <blockquote type="cite">
        <pre wrap="">+
+#include &lt;linux/module.h&gt;
+#include &lt;linux/init.h&gt;
+#include &lt;linux/slab.h&gt;
+#include &lt;linux/ctype.h&gt;
+#include &lt;linux/types.h&gt;
+#include &lt;linux/delay.h&gt;
+#include &lt;linux/device.h&gt;
+#include &lt;linux/i2c.h&gt;
+#include &lt;linux/of_device.h&gt;
+#include &lt;linux/gpio/consumer.h&gt;
+#include &lt;linux/regulator/consumer.h&gt;
+#include &lt;linux/clk.h&gt;
+#include &lt;linux/clk-provider.h&gt;
+#include &lt;linux/clkdev.h&gt;
+#include &lt;media/v4l2-device.h&gt;
+#include &lt;media/v4l2-subdev.h&gt;
+#include &lt;media/v4l2-async.h&gt;
+#include &lt;media/v4l2-of.h&gt;
+#include &lt;media/v4l2-ctrls.h&gt;
</pre>
      </blockquote>
      <pre wrap="">Pet peeve of mine, please sort the headers alphabetically. It makes it easier 
to locate duplicated.</pre>
    </blockquote>
    <br>
    Fixed.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+
+#define OV5640_CHIP_ID  0x300A
+#define OV5640_SLAVE_ID 0x3100
+#define OV5640_DEFAULT_SLAVE_ID 0x3c
</pre>
      </blockquote>
      <pre wrap="">You're mixing lower-case and upper-case hex constants. Let's pick one. Kernel 
code usually favours lower-case.</pre>
    </blockquote>
    <br>
    Fixed.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <pre wrap="">Please define macros for all the other numerical constants you use in the 
driver (register addresses and values). The large registers tables can be an 
exception if you don't have access to the information, but for registers 
written manually, hardcoding numerical values isn't good.</pre>
    </blockquote>
    <br>
    Done.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+
+#define OV5640_MAX_CONTROLS 64
+
+enum ov5640_mode {
+	ov5640_mode_MIN = 0,
+	ov5640_mode_QCIF_176_144 = 0,
+	ov5640_mode_QVGA_320_240,
+	ov5640_mode_VGA_640_480,
+	ov5640_mode_NTSC_720_480,
+	ov5640_mode_PAL_720_576,
+	ov5640_mode_XGA_1024_768,
+	ov5640_mode_720P_1280_720,
+	ov5640_mode_1080P_1920_1080,
+	ov5640_mode_QSXGA_2592_1944,
+	ov5640_num_modes,
+	ov5640_mode_INIT = 0xff, /*only for sensor init*/
</pre>
      </blockquote>
      <pre wrap="">Please add spaces after /* and before */.

Enumerated values should be all upper-case.</pre>
    </blockquote>
    <br>
    Fixed (and ov5640_mode_INIT is removed).<br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+
+/* image size under 1280 * 960 are SUBSAMPLING
+ * image size upper 1280 * 960 are SCALING
+ */
</pre>
      </blockquote>
      <pre wrap="">The kernel multi-line comment style is

/*
 * text
 * text
 */
</pre>
    </blockquote>
    <br>
    Fixed.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+
+struct ov5640_dev {
+	struct i2c_client *i2c_client;
+	struct device *dev;
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+	struct v4l2_ctrl_handler ctrl_hdl;
+	struct v4l2_of_endpoint ep; /* the parsed DT endpoint info */
+	struct v4l2_mbus_framefmt fmt;
+	struct v4l2_captureparm streamcap;
+	struct clk *xclk; /* system clock to OV5640 */
+	int xclk_freq;    /* requested xclk freq from devicetree */
+
+	enum ov5640_mode current_mode;
</pre>
      </blockquote>
      <pre wrap="">Store a (const) pointer to the corresponding ov5640_mode_info instead, it will 
simplify the code and allow you to get rid of the ov5640_mode enum.</pre>
    </blockquote>
    <br>
    Done.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+
+	int prev_sysclk, prev_hts;
+	int ae_low, ae_high, ae_target;
</pre>
      </blockquote>
      <pre wrap="">Can't these be unsigned int ?</pre>
    </blockquote>
    <br>
    yep, an old left-over Freescale-ism, fixed.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+
+static void ov5640_power(struct ov5640_dev *sensor, bool enable);
+static void ov5640_reset(struct ov5640_dev *sensor);
+static int ov5640_restore_ctrls(struct ov5640_dev *sensor);
+static int ov5640_set_agc(struct ov5640_dev *sensor, int value);
+static int ov5640_set_exposure(struct ov5640_dev *sensor, int value);
+static int ov5640_get_exposure(struct ov5640_dev *sensor);
+static int ov5640_set_gain(struct ov5640_dev *sensor, int value);
+static int ov5640_get_gain(struct ov5640_dev *sensor);
</pre>
      </blockquote>
      <pre wrap="">No forward declarations please. You should reorder functions as needed (and of 
course still group related functions together).
</pre>
    </blockquote>
    <br>
    Fixed.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+static struct reg_value ov5640_init_setting_30fps_VGA[] = {
+
&lt;snip&gt;
+	{0x3a1f, 0x14, 0, 0}, {0x3008, 0x02, 0, 0}, {0x3c00, 0x04, 0, 300},
+};
</pre>
      </blockquote>
      <pre wrap="">You only use the delay feature of the registers tables twice, once after 
writing the first two registers (to select the clock source and perform a 
software reset) and once at the very end.</pre>
    </blockquote>
    <br>
    There is a delay in other places as well. There is a 1 msec delay
    after <br>
    setting a PLL multiplier register, and another after programming the<br>
    15 fps 2592x1944 mode. I'd prefer to keep the delay support in place<br>
    for now. Later, removing these delays can be experimented with.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <pre wrap=""> Remove it, write the first two 
registers manually in the code with a manual delay afterwards, and add another 
manual delay after writing the whole table.

I'm actually wondering whether you couldn't remove the 300ms delay at the end, 
the 50/60Hz control register (0x3c00) doesn't look like it needs a delay after 
being written.

[snip]

</pre>
      <blockquote type="cite">
        <pre wrap="">+static struct reg_value ov5640_setting_15fps_QSXGA_2592_1944[] = {
+	{0x4202, 0x0f, 0, 0},	/* stream off the sensor */
&lt;snip&gt;
+	{0x4202, 0x00, 0, 0},	/* stream on the sensor */
</pre>
      </blockquote>
      <pre wrap="">Don't turn the stream on in the init sequences, it should only be turned on 
from the .s_stream() operation.</pre>
    </blockquote>
    <br>
    Fixed. More old FSL-isms.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+};
+
+static struct ov5640_mode_info
+ov5640_mode_info_data[ov5640_num_framerates][ov5640_num_modes] = {
</pre>
      </blockquote>
      <pre wrap="">There's very few differences between the 15fps and 30fps tables. It would be 
better if you could merge them, and manually write the registers that differ.</pre>
    </blockquote>
    <br>
    Sorting that out will be a lot of work, I don't have the time, it
    will have<br>
    to wait for future fixes. The register tables are likely bloated
    with power-on<br>
    reset values that need to be pruned anyway (there is a FIXME added
    to that<br>
    effect).<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+
+static int ov5640_probe(struct i2c_client *adapter,
+			const struct i2c_device_id *device_id);
+static int ov5640_remove(struct i2c_client *client);
</pre>
      </blockquote>
      <pre wrap="">No forward declarations please.</pre>
    </blockquote>
    <br>
    Fixed, more FSL-isms.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+
+static int ov5640_read_reg(struct ov5640_dev *sensor, u16 reg, u8 *val)
+{
+	u8 reg_buf[2] = {0};
+	u8 read_val = 0;
+
+	reg_buf[0] = reg &gt;&gt; 8;
+	reg_buf[1] = reg &amp; 0xff;
+
+	if (2 != i2c_master_send(sensor-&gt;i2c_client, reg_buf, 2)) {
+		v4l2_err(&amp;sensor-&gt;sd, "%s: write reg error: reg=%x\n",
+			__func__, reg);
+		return -EIO;
+	}
+
+	if (1 != i2c_master_recv(sensor-&gt;i2c_client, &amp;read_val, 1)) {
+		v4l2_err(&amp;sensor-&gt;sd, "%s: read reg error: reg=%x, val=%x\n",
+			__func__, reg, read_val);
+		return -EIO;
+	}
</pre>
      </blockquote>
      <pre wrap="">Wouldn't i2c_transfer() be more efficient here ?</pre>
    </blockquote>
    <br>
    Yep, done, for every register access function.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+	*val = read_val;
+	return 0;
+}
+
+#define OV5640_READ_REG(s, r, v) {				\
+		ret = ov5640_read_reg((s), (r), (v));		\
+		if (ret)					\
+			return ret;				\
+	}
</pre>
      </blockquote>
      <pre wrap="">No. No. No no no. Don't ever return from a macro. Hiding the return makes 
following the code flow much more difficult, it's just asking for trouble.

And don't use externally defined variables (ret in this case), that's also 
asking for trouble.
</pre>
    </blockquote>
    <br>
    Fixed.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+
+static int ov5640_mod_reg(struct ov5640_dev *sensor, u16 reg,
+			  u8 mask, u8 val)
+{
+	u8 readval;
+	int ret;
+
+	OV5640_READ_REG(sensor, reg, &amp;readval);
+
+	readval &amp;= ~mask;
+	val &amp;= mask;
+	val |= readval;
+
+	OV5640_WRITE_REG(sensor, reg, val);
+	return 0;
+}

If you need to modify registers a lot, switch to regmap for register access. 
It will provide you with a cache, removing the need to read registers back 
from the device.</pre>
      </blockquote>
    </blockquote>
    <br>
    ov5640_mod_reg() is only called in a few places. If this needs more
    use<br>
    later, will convert to regmap.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite"> </blockquote>
      <blockquote type="cite">
        <pre wrap="">+/* download ov5640 settings to sensor through i2c */
+static int ov5640_load_regs(struct ov5640_dev *sensor,
+			    struct reg_value *regs,
+			    int size)
</pre>
      </blockquote>
      <pre wrap="">size is never negative.
</pre>
    </blockquote>
    <br>
    Fixed, actually new prototype is much simpler:<br>
    <br>
    static int ov5640_load_regs(struct ov5640_dev *sensor,<br>
    ��� ��� ��� ��� const struct ov5640_mode_info *mode);<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+{
+	register u32 delay_ms = 0;
+	register u16 reg_addr = 0;
+	register u8 mask = 0;
+	register u8 val = 0;
</pre>
      </blockquote>
      <pre wrap="">register ? The compiler is nowadays likely smarter than us when it comes to 
register allocation.</pre>
    </blockquote>
    <br>
    Yeah, nutty. I didn't write that, more old FSL-isms.<br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+
+static int ov5640_get_HTS(struct ov5640_dev *sensor)
+{
+	 /* read HTS from register settings */
+	u16 HTS;
</pre>
      </blockquote>
      <pre wrap="">Function names and variables are lower case.
</pre>
    </blockquote>
    <br>
    Fixed.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+
+static int ov5640_set_bandingfilter(struct ov5640_dev *sensor)
+{
+	int prev_vts;
+	int band_step60, max_band60, band_step50, max_band50;
</pre>
      </blockquote>
      <pre wrap="">Aren't these values unsigned ?
</pre>
    </blockquote>
    <br>
    Yep, fixed.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+
+static int ov5640_set_AE_target(struct ov5640_dev *sensor, int target)
+{
+	/* stable in high */
+	int fast_high, fast_low;
</pre>
      </blockquote>
      <pre wrap="">Aren't these values unsigned ?</pre>
    </blockquote>
    <br>
    Fixed.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+	int ret;
+
+	sensor-&gt;ae_low = target * 23 / 25;	/* 0.92 */
+	sensor-&gt;ae_high = target * 27 / 25;	/* 1.08 */
+
+	fast_high = sensor-&gt;ae_high&lt;&lt;1;
</pre>
      </blockquote>
      <pre wrap="">Missing spaces around &lt;&lt;</pre>
    </blockquote>
    <br>
    Fixed.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+
+static int ov5640_set_virtual_channel(struct ov5640_dev *sensor)
+{
+	u8 temp, channel = sensor-&gt;ep.base.id;
</pre>
      </blockquote>
      <pre wrap="">The endpoint id isn't meant to select a virtual channel. V4L2 has no virtual 
channel API at the moment, you can hardcode the VC to 0 for now.</pre>
    </blockquote>
    <br>
    Yes, imx-media bridge driver _really_ needs a subdev/V4L2 API to<br>
    set the virtual channel that a CSI-2 sensor will transmit on,
    because<br>
    it fully supports receiving on any of the 4 virtual channels (via
    the<br>
    4 source pads from the imx6-mipi-csi2 / CSI2IPU gasket entity).<br>
    <br>
    For now I've hardcoded the ov5640 to transmit over channel 1. This
    is<br>
    good for the imx-media graph because it allows simultaneous capture<br>
    from a parallel sensor via ipu1_csi0, while the ov5640 captures via<br>
    ipu1_csi1.<br>
    <br>
    Channel 1 may not be good for other bridges though. Maybe this would<br>
    be a good candidate for a module parameter.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+	int ret;
+
+	OV5640_READ_REG(sensor, 0x4814, &amp;temp);
+	temp &amp;= ~(3 &lt;&lt; 6);
+	temp |= (channel &lt;&lt; 6);
+	OV5640_WRITE_REG(sensor, 0x4814, temp);
+
+	return 0;
+}
+
+static enum ov5640_mode
+ov5640_find_nearest_mode(struct ov5640_dev *sensor,
+			 int width, int height)
</pre>
      </blockquote>
      <pre wrap="">How about using v4l2_find_nearest_format() ?</pre>
    </blockquote>
    <br>
    It doesn't really fit ATM, see below.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite"> <br>
      <blockquote type="cite">
        <pre wrap="">+
+	ret = ov5640_set_stream(sensor, true);
</pre>
      </blockquote>
      <pre wrap="">This will turn streaming on when you set the format, which I don't think is 
correct. You should only turn streaming on in the .s_stream() operation. The 
same comment applies to the previous function.</pre>
    </blockquote>
    <br>
    Fixed, FSL-ism. Tested and still works fine.<br>
    <br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+
+static int ov5640_change_mode(struct ov5640_dev *sensor,
+			      enum ov5640_frame_rate frame_rate,
+			      enum ov5640_mode mode,
+			      enum ov5640_mode orig_mode)
+{
+	enum ov5640_downsize_mode dn_mode, orig_dn_mode;
+	struct reg_value *mode_data = NULL;
+	int mode_size = 0;
+	int ret = 0;
</pre>
      </blockquote>
      <pre wrap="">No need to initialize ret to 0.
</pre>
    </blockquote>
    <br>
    Fixed.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+		sensor-&gt;fmt.width = 640;
+		sensor-&gt;fmt.height = 480;
</pre>
      </blockquote>
      <pre wrap="">Don't reset the format here. The format must be preserved across subdev 
open/close.</pre>
    </blockquote>
    <br>
    Fixed.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+
+/* restore the last set video mode after chip power-on */
+static int ov5640_restore_mode(struct ov5640_dev *sensor)
+{
+	int ret = 0;
</pre>
      </blockquote>
    </blockquote>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <pre wrap="">No need to initialize ret to 0.</pre>
    </blockquote>
    <br>
    Fixed.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+
+	/* first we need to set some initial register values */
+	ret = ov5640_change_mode(sensor, sensor-&gt;current_fr,
+				    ov5640_mode_INIT, ov5640_mode_INIT);
</pre>
      </blockquote>
      <pre wrap="">I wouldn't use ov5640_change_mode() here. You only need to apply the init 
register values, just call ov5640_load_regs(). The rest of the 
ov5640_change_mode() isn't needed, as you're calling it below. This will also 
allow you to get rid of ov5640_mode_INIT, simplifying the logic.</pre>
    </blockquote>
    <br>
    Fixed. I created an init register table, ov5640_mode_init_data,
    which is<br>
    loaded by ov5640_restore_mode().<br>
    <br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite"> <br>
      <blockquote type="cite">
        <pre wrap="">+
+static int ov5640_regulators_on(struct ov5640_dev *sensor)
+{
+	int ret;
+
+	if (sensor-&gt;io_regulator) {
+		ret = regulator_enable(sensor-&gt;io_regulator);
+		if (ret) {
+			v4l2_err(&amp;sensor-&gt;sd, "io reg enable failed\n");
+			return ret;
+		}
+	}
+	if (sensor-&gt;core_regulator) {
+		ret = regulator_enable(sensor-&gt;core_regulator);
+		if (ret) {
+			v4l2_err(&amp;sensor-&gt;sd, "core reg enable failed\n");
+			return ret;
+		}
+	}
+	if (sensor-&gt;gpo_regulator) {
+		ret = regulator_enable(sensor-&gt;gpo_regulator);
+		if (ret) {
+			v4l2_err(&amp;sensor-&gt;sd, "gpo reg enable failed\n");
+			return ret;
+		}
+	}
+	if (sensor-&gt;analog_regulator) {
+		ret = regulator_enable(sensor-&gt;analog_regulator);
+		if (ret) {
+			v4l2_err(&amp;sensor-&gt;sd, "analog reg enable failed\n");
+			return ret;
+		}
+	}
</pre>
      </blockquote>
      <pre wrap="">Maybe you should use the bulk regulator API ?</pre>
    </blockquote>
    <br>
    Done.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+
+/* --------------- Subdev Operations --------------- */
+
+static int ov5640_s_power(struct v4l2_subdev *sd, int on)
+{
+	struct ov5640_dev *sensor = to_ov5640_dev(sd);
+	int ret;
+
+	v4l2_info(sd, "power %s\n", on ? "ON" : "OFF");
+
+	if (on &amp;&amp; !sensor-&gt;on) {
</pre>
      </blockquote>
      <pre wrap="">The .s_power() calls need to be ref-counted, similarly to how the regulator 
enable/disable calls work. See the mt9p031 sensor driver for an example.
</pre>
    </blockquote>
    <br>
    Done.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+		if (sensor-&gt;xclk)
+			clk_prepare_enable(sensor-&gt;xclk);
+
+		ret = ov5640_regulators_on(sensor);
+		if (ret)
+			return ret;
+
+		ov5640_reset(sensor);
+		ov5640_power(sensor, true);
+
+		ret = ov5640_init_slave_id(sensor);
</pre>
      </blockquote>
      <pre wrap="">Why is this needed ?</pre>
    </blockquote>
    <br>
    Because on SabreLite, the ov5642 is at the same default<br>
    i2c slave address, so they both need to answer to a non-default<br>
    address.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+
+static int ov5640_s_parm(struct v4l2_subdev *sd, struct v4l2_streamparm *a)
+{
+	struct ov5640_dev *sensor = to_ov5640_dev(sd);
+	struct v4l2_fract *timeperframe = &amp;a-&gt;parm.capture.timeperframe;
+	enum ov5640_frame_rate frame_rate;
+	u32 tgt_fps;	/* target frames per secound */
+	int ret = 0;
</pre>
      </blockquote>
      <pre wrap="">No need to initialize ret to 0.
</pre>
    </blockquote>
    <br>
    Fixed.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+	else {
+		v4l2_err(&amp;sensor-&gt;sd, "frame rate %u not supported!\n",
+			 tgt_fps);
</pre>
      </blockquote>
      <pre wrap="">Don't print an error message that is userspace-triggerable, we have enough 
ways for applications to flood the kernel log already :-)
</pre>
    </blockquote>
    <br>
    Removed.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+
+static int ov5640_get_fmt(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_format *format)
+{
+	struct ov5640_dev *sensor = to_ov5640_dev(sd);
+
+	if (format-&gt;pad != 0)
+		return -EINVAL;
+
+	format-&gt;format = sensor-&gt;fmt;
</pre>
      </blockquote>
      <pre wrap="">You need to handle the TRY format here. You can have a look at the mt9p031 
driver for an example on how to do so.
</pre>
    </blockquote>
    <br>
    Right, that was caught and fixed earlier.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+
+static int ov5640_set_fmt(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_format *format)
+{
+	struct ov5640_dev *sensor = to_ov5640_dev(sd);
+	enum ov5640_mode new_mode;
+	int ret;
+
+	if (format-&gt;pad != 0)
+		return -EINVAL;
+
+	if (format-&gt;which == V4L2_SUBDEV_FORMAT_TRY) {
+		ret = ov5640_try_fmt_internal(sd, &amp;format-&gt;format, NULL);
+		if (ret)
+			return ret;
</pre>
      </blockquote>
      <pre wrap="">You can move this code above the test to avoid the duplicated call below.</pre>
    </blockquote>
    <br>
    Fixed.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+		cfg-&gt;try_fmt = format-&gt;format;
</pre>
      </blockquote>
      <pre wrap="">Please use the v4l2_subdev_get_try_format() function to get the try format, 
don't dereference cfg directly.</pre>
    </blockquote>
    <br>
    Done.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+
+static int ov5640_set_hue(struct ov5640_dev *sensor, int value)
+{
+	int ret;
+
+	if (value) {
+		OV5640_MOD_REG(sensor, 0x5580, 1 &lt;&lt; 0, 1 &lt;&lt; 0);
+		OV5640_WRITE_REG16(sensor, 0x5581, value);
+	} else
+		OV5640_MOD_REG(sensor, 0x5580, 1 &lt;&lt; 0, 0);
</pre>
      </blockquote>
      <pre wrap="">According to the kernel coding style, you need curly braces around the else 
branch if you use them around the if branch.</pre>
    </blockquote>
    <br>
    Fixed everywhere.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite"> <br>
      <br>
      <blockquote type="cite">
        <pre wrap="">+
+#if 0
</pre>
      </blockquote>
      <pre wrap="">No compiled-out code please.</pre>
    </blockquote>
    <br>
    Removed ov5640_set_green_balance().<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+static int ov5640_set_green_balance(struct ov5640_dev *sensor, int value)
+{
+	int ret;
+
+	if (sensor-&gt;awb_on)
+		return -EINVAL;
+
+	OV5640_WRITE_REG(sensor, 0x3403, value &amp; 0xff);
+	OV5640_WRITE_REG(sensor, 0x3402, (value &amp; 0xf00) &gt;&gt; 8);
+	return 0;
+}
+#endif
+
&lt;snip&gt;
+
+static int ov5640_set_gain(struct ov5640_dev *sensor, int value)
+{
+	int ret;
+
+	if (sensor-&gt;agc_on)
+		return -EINVAL;
</pre>
      </blockquote>
      <pre wrap="">You can create a cluster with the autogain and manual gain controls 
(v4l2_ctrl_auto_cluster) to have the control framework disabling the manual 
control automatically when autogain is enabled.</pre>
    </blockquote>
    <br>
    Done. Also made white-balance and exposure auto clusters as well.<br>
    And in the process, got rid of the control table as Hans had
    suggested<br>
    earlier.<br>
    <br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+	OV5640_WRITE_REG16(sensor, 0x350a, value &amp; 0x3ff);
+	return 0;
+}
+
+static int ov5640_get_gain(struct ov5640_dev *sensor)
+{
+	u16 gain;
+	int ret;
+
+	if (sensor-&gt;agc_on)
+		return -EINVAL;
+
+	OV5640_READ_REG16(sensor, 0x350a, &amp;gain);
+
+	return gain &amp; 0x3ff;
+}
+
+#if 0
+static int ov5640_set_test_pattern(struct ov5640_dev *sensor, int value)
+{
+	int ret;
+
+	OV5640_MOD_REG(sensor, 0x503d, 0xa4, value ? 0xa4 : 0);
+	return 0;
+}
+#endif
</pre>
      </blockquote>
      <pre wrap="">You can use a control to expose the test pattern function, it's quite useful.</pre>
    </blockquote>
    <br>
    Done, as a menu control for color bars.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+static struct ov5640_control *ov5640_get_ctrl(int id, int *index)
+{
+	struct ov5640_control *ret = NULL;
+	int i;
</pre>
      </blockquote>
      <pre wrap="">i is never negative, it should be unsigned int.</pre>
    </blockquote>
    <br>
    Fixed.<br>
    <br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+
+static int ov5640_restore_ctrls(struct ov5640_dev *sensor)
+{
+	struct ov5640_control *c;
+	int i;
</pre>
      </blockquote>
      <pre wrap="">i is never negative, it should be unsigned int.</pre>
    </blockquote>
    <br>
    restore_ctrls is gone from earlier fixes.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+
+static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct ov5640_dev *sensor = ctrl_to_ov5640_dev(ctrl);
+	struct ov5640_control *c;
+	int ret = 0;
+	int i;
+
+	c = ov5640_get_ctrl(ctrl-&gt;id, &amp;i);
</pre>
      </blockquote>
      <pre wrap="">You can inline the function call here as it's not used anywhere else.</pre>
    </blockquote>
    <br>
    Done.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+
+static int ov5640_init_controls(struct ov5640_dev *sensor)
+{
+	struct ov5640_control *c;
</pre>
      </blockquote>
      <pre wrap="">I would name this ctrl or control, c can be a bit confusing. You can also 
declare it inside the loop.</pre>
    </blockquote>
    <br>
    Done.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+	int i;
</pre>
      </blockquote>
      <pre wrap="">i can never be negative, you can make it an unsigned int.
</pre>
    </blockquote>
    <br>
    Done.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+
+	v4l2_ctrl_handler_init(&amp;sensor-&gt;ctrl_hdl, OV5640_NUM_CONTROLS);
+
+	for (i = 0; i &lt; OV5640_NUM_CONTROLS; i++) {
+		c = &amp;ov5640_ctrls[i];
+
+		v4l2_ctrl_new_std(&amp;sensor-&gt;ctrl_hdl, &amp;ov5640_ctrl_ops,
+				  c-&gt;ctrl.id, c-&gt;ctrl.minimum, c-
ctrl.maximum,
+				  c-&gt;ctrl.step, c-&gt;ctrl.default_value);
+	}
+
+	sensor-&gt;sd.ctrl_handler = &amp;sensor-&gt;ctrl_hdl;
+	if (sensor-&gt;ctrl_hdl.error) {
+		int err = sensor-&gt;ctrl_hdl.error;
+
+		v4l2_ctrl_handler_free(&amp;sensor-&gt;ctrl_hdl);
+
+		v4l2_err(&amp;sensor-&gt;sd, "%s: error %d\n", __func__, err);
</pre>
      </blockquote>
      <pre wrap="">I'm not sure this brings much value.</pre>
    </blockquote>
    <br>
    Removed.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite"> <br>
      <blockquote type="cite">
        <pre wrap="">+
+static int ov5640_enum_frame_interval(
+	struct v4l2_subdev *sd,
+	struct v4l2_subdev_pad_config *cfg,
+	struct v4l2_subdev_frame_interval_enum *fie)
+{
+	struct ov5640_dev *sensor = to_ov5640_dev(sd);
+	enum ov5640_mode mode;
+
+	if (fie-&gt;pad != 0)
+		return -EINVAL;
+	if (fie-&gt;index &lt; 0 || fie-&gt;index &gt;= ov5640_num_framerates)
+		return -EINVAL;
+
+	if (fie-&gt;width == 0 || fie-&gt;height == 0)
+		return -EINVAL;
+
+	mode = ov5640_find_nearest_mode(sensor, fie-&gt;width, fie-&gt;height);
</pre>
      </blockquote>
      <pre wrap="">You should find an exact mode here, not the nearest one. If with and height 
don't match, return -EINVAL. That will replace with above width == 0 and 
height == 0 test.</pre>
    </blockquote>
    <br>
    Fixed, I modified ov5640_find_mode() (renamed from
    ov5640_find_nearest_mode())<br>
    to take a "nearest" boolean, which is passed as false here.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+
+	dev_dbg(sensor-&gt;dev, "%dx%d: [%d] = %d fps\n",
+		fie-&gt;width, fie-&gt;height, fie-&gt;index, fie-
interval.denominator);
</pre>
      </blockquote>
      <pre wrap="">I'm not sure this is very useful, you can use ftrace if you want to trace 
function calls.
</pre>
    </blockquote>
    <br>
    Removed.<br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+	return 0;
+}
+
+static int ov5640_g_input_status(struct v4l2_subdev *sd, u32 *status)
+{
+	struct ov5640_dev *sensor = to_ov5640_dev(sd);
+
+	*status = !sensor-&gt;on ? V4L2_IN_ST_NO_POWER : 0;
+
+	return 0;
+}
+
+static int ov5640_s_routing(struct v4l2_subdev *sd, u32 input,
+			    u32 output, u32 config)
+{
+	return (input != 0) ? -EINVAL : 0;
+}
</pre>
      </blockquote>
      <pre wrap="">The g_input_status and s_routing subdev operations are not mandatory, you 
don't have to implement them as the sensor doesn't have multiple inputs.</pre>
    </blockquote>
    <br>
    Removed.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct ov5640_dev *sensor = to_ov5640_dev(sd);
+
+	v4l2_info(sd, "stream %s\n", enable ? "ON" : "OFF");
</pre>
      </blockquote>
      <pre wrap="">You can use ftrace to trace function calls, there's no need to add debugging 
statements that duplicate the functionality.</pre>
    </blockquote>
    <br>
    Removed.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+
+static struct v4l2_subdev_ops ov5640_subdev_ops = {
+	.core = &amp;ov5640_core_ops,
+	.video = &amp;ov5640_video_ops,
+	.pad = &amp;ov5640_pad_ops,
+};
</pre>
      </blockquote>
      <pre wrap="">All these structures should be static const.</pre>
    </blockquote>
    <br>
    Fixed.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+
+static void ov5640_power(struct ov5640_dev *sensor, bool enable)
+{
+	gpiod_set_value(sensor-&gt;pwdn_gpio, enable ? 0 : 1);
+}
+
+static void ov5640_reset(struct ov5640_dev *sensor)
+{
+	gpiod_set_value(sensor-&gt;reset_gpio, 0);
+
+	/* camera power cycle */
+	ov5640_power(sensor, false);
+	usleep_range(5000, 10000);
+	ov5640_power(sensor, true);
+	usleep_range(5000, 10000);
+
+	gpiod_set_value(sensor-&gt;reset_gpio, 1);
+	usleep_range(1000, 2000);
+
+	gpiod_set_value(sensor-&gt;reset_gpio, 0);
+	usleep_range(5000, 10000);
+}
+
+static void ov5640_get_regulators(struct ov5640_dev *sensor)
+{
+	sensor-&gt;io_regulator = devm_regulator_get(sensor-&gt;dev, "DOVDD");
+	if (!IS_ERR(sensor-&gt;io_regulator)) {
+		regulator_set_voltage(sensor-&gt;io_regulator,
+				      OV5640_VOLTAGE_DIGITAL_IO,
+				      OV5640_VOLTAGE_DIGITAL_IO);
+	} else {
+		dev_dbg(sensor-&gt;dev, "%s: no io voltage reg found\n",
+			__func__);
+		sensor-&gt;io_regulator = NULL;
</pre>
      </blockquote>
      <pre wrap="">How about making the power supplies mandatory in DT instead ? They are 
mandatory after all, if they're not controllable DT should just declare fixed 
supplies.</pre>
    </blockquote>
    <br>
    I guess that makes sense. They are now mandatory.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+
+static int ov5640_probe(struct i2c_client *client,
+			const struct i2c_device_id *id)
+{
+	struct device *dev = &amp;client-&gt;dev;
+	struct device_node *endpoint;
+	struct ov5640_dev *sensor;
+	int i, xclk, ret;
</pre>
      </blockquote>
      <pre wrap="">i and xclk are never negative, you can make them unsigned int.</pre>
    </blockquote>
    <br>
    This was removed from earlier cleanups.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+
+	sensor = devm_kzalloc(dev, sizeof(struct ov5640_dev), GFP_KERNEL);
</pre>
      </blockquote>
      <pre wrap="">Please use sizeof(*variable) instead of sizeof(type).</pre>
    </blockquote>
    <br>
    Done.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <pre wrap="">devm_kzalloc() doesn't play nicely with dynamic removal of devices. We're in 
the process of fixing related race conditions in the media subsystem. In order 
not to make the problem worse, please use kzalloc() instead.

</pre>
      <blockquote type="cite">
        <pre wrap="">+	if (!sensor)
+		return -ENOMEM;
+
+	sensor-&gt;i2c_client = client;
+	sensor-&gt;dev = dev;
</pre>
      </blockquote>
      <pre wrap="">Do you really need to store both i2c_client and dev, given that the latter is 
just &amp;client-&gt;dev ?</pre>
    </blockquote>
    <br>
    It was only for convenience, but sensor-&gt;dev was now only used in
    a<br>
    couple places, so sensor-&gt;dev removed.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+	sensor-&gt;fmt.code = MEDIA_BUS_FMT_UYVY8_2X8;
+	sensor-&gt;fmt.width = 640;
+	sensor-&gt;fmt.height = 480;
+	sensor-&gt;fmt.field = V4L2_FIELD_NONE;
+	sensor-&gt;streamcap.capability = V4L2_MODE_HIGHQUALITY |
+					   V4L2_CAP_TIMEPERFRAME;
</pre>
      </blockquote>
      <pre wrap="">Please fix the indentation.</pre>
    </blockquote>
    <br>
    Fixed.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+
+	v4l2_of_parse_endpoint(endpoint, &amp;sensor-&gt;ep);
+	if (sensor-&gt;ep.bus_type != V4L2_MBUS_CSI2) {
+		dev_err(dev, "invalid bus type, must be MIPI CSI2\n");
+		return -EINVAL;
</pre>
      </blockquote>
      <pre wrap="">You're leaking endpoint here. You should move the of_node_put() call right 
after the v4l2_of_parse_endpoint() call.</pre>
    </blockquote>
    <br>
    oops, Fixed.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+
+	/* get system clock (xclk) frequency */
+	ret = of_property_read_u32(dev-&gt;of_node, "xclk", &amp;xclk);
</pre>
      </blockquote>
      <pre wrap="">Instead of adding a custom DT property for this, use assigned-clock-rates. You 
won't need to set it manually in the driver, and can verify its frequency with 
clk_get_rate().</pre>
    </blockquote>
    <br>
    This was done in earlier fixups.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+	if (!ret) {
+		if (xclk &lt; OV5640_XCLK_MIN || xclk &gt; OV5640_XCLK_MAX) {
</pre>
      </blockquote>
      <pre wrap="">Are your register tables above independent of the clock frequency ? You should 
ideally compute register values at runtime instead of hardcoding them, but 
given the lack of information from Omnivision I understand this isn't 
possible. You thus need to be stricter here and reject any value other than 
the nominal frequency.</pre>
    </blockquote>
    <br>
    I went back and looked at the original driver from Freescale that
    these<br>
    register tables are based on, and that driver does allow a range
    between<br>
    6 and 24 MHz. I've updated the min/max for xclk to that range. I
    agree<br>
    though that this will need some experimentation to verify these xclk
    ranges<br>
    actually work.<br>
    <br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+
+	/* get system clock (xclk) */
+	sensor-&gt;xclk = devm_clk_get(dev, "xclk");
+	if (!IS_ERR(sensor-&gt;xclk)) {
+		if (!sensor-&gt;xclk_freq) {
+			dev_err(dev, "xclk requires xclk frequency!\n");
+			return -EINVAL;
+		}
+		clk_set_rate(sensor-&gt;xclk, sensor-&gt;xclk_freq);
+	} else {
+		/* assume system clock enabled by default */
+		sensor-&gt;xclk = NULL;
</pre>
      </blockquote>
      <pre wrap="">Please don't. The clock should be mandatory.</pre>
    </blockquote>
    <br>
    This was done in earlier fixups.<br>
    <br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+	}
+
+	/* request power down pin */
+	sensor-&gt;pwdn_gpio = devm_gpiod_get(dev, "pwdn", GPIOD_OUT_HIGH);
</pre>
      </blockquote>
      <pre wrap="">Are the GPIOs mandatory or optional ? Can a system tie some of them to ground 
or a voltage rail, or do they need to always be manually controllable ?</pre>
    </blockquote>
    <br>
    Yes, they could be tied to ground or a rail, and are not required. I<br>
    made both reset and pwdn gpios optional.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+
+	ret = ov5640_s_power(&amp;sensor-&gt;sd, 1);
+	if (ret)
+		goto entity_cleanup;
+	ret = ov5640_init_controls(sensor);
+	if (ret)
+		goto power_off;
+
+	ret = ov5640_s_power(&amp;sensor-&gt;sd, 0);
+	if (ret)
+		goto free_ctrls;
</pre>
      </blockquote>
      <pre wrap="">Writing the controls here is pointless, as powering the chip down will lose 
all the values. You shouldn't call v4l2_ctrl_handler_setup() in 
ov5640_init_controls(), and you can then remove the ov5640_s_power() calls 
here.</pre>
    </blockquote>
    <br>
    Good idea, done.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+
+free_ctrls:
+	v4l2_ctrl_handler_free(&amp;sensor-&gt;ctrl_hdl);
+power_off:
+	ov5640_s_power(&amp;sensor-&gt;sd, 0);
+entity_cleanup:
+	media_entity_cleanup(&amp;sensor-&gt;sd.entity);
+	ov5640_regulators_off(sensor);
</pre>
      </blockquote>
      <pre wrap="">Won't ov5640_s_power(0) already disable the regulators ?</pre>
    </blockquote>
    <br>
    Not applicable anymore, as there's no need to enable power in probe.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+	return ret;
+}
+
+/*!
+ * ov5640 I2C detach function
+ *
+ * @param client            struct i2c_client *
+ * @return  Error code indicating success or failure
+ */
</pre>
      </blockquote>
      <pre wrap="">That's not the kerneldoc comment style. Given that this is the only documented 
function, and that the comment is completely useless, you can just drop it.
</pre>
    </blockquote>
    <br>
    yuck, old FSL-isms, removed.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+static int ov5640_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ov5640_dev *sensor = to_ov5640_dev(sd);
+
+	ov5640_regulators_off(sensor);
+
+	v4l2_async_unregister_subdev(&amp;sensor-&gt;sd);
+	media_entity_cleanup(&amp;sensor-&gt;sd.entity);
+	v4l2_device_unregister_subdev(sd);
</pre>
      </blockquote>
      <pre wrap="">This function is called by v4l2_async_unregister_subdev(), there's no need to 
duplicate it.</pre>
    </blockquote>
    <br>
    Removed.<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+MODULE_AUTHOR("Freescale Semiconductor, Inc.");
</pre>
      </blockquote>
      <pre wrap="">MODULE_AUTHOR isn't a synonym for copyright ownership. I don't think you 
should add Freescale as an author. If you know who wrote the original code you 
can list that developer explicitly.</pre>
    </blockquote>
    <br>
    I have no clue who the original author was, I just removed<br>
    MODULE_AUTHOR(s).<br>
    <br>
    <blockquote cite="mid:15482412.XOGz6nc3Rt@avalon" type="cite">
      <blockquote type="cite">
        <pre wrap="">+MODULE_AUTHOR("Steve Longerbeam <a class="moz-txt-link-rfc2396E" href="mailto:steve_longerbeam@mentor.com">&lt;steve_longerbeam@mentor.com&gt;</a>");
+MODULE_DESCRIPTION("OV5640 MIPI Camera Subdev Driver");
+MODULE_LICENSE("GPL");
+MODULE_VERSION("1.0");
</pre>
      </blockquote>
      <pre wrap="">Version numbers are never updated. I wouldn't bother adding one.</pre>
    </blockquote>
    <br>
    Removed.<br>
    <br>
    Steve<br>
    <br>
  </body>
</html>

--------------B6339356D7EB75AE990F9013--
