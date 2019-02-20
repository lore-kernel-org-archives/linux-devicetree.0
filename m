From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 3/9] iio: accel: bmc150: add mount matrix support
Date: Wed, 20 Feb 2019 17:09:53 +0000
Message-ID: <20190220170953.0200e256@archlinux>
References: <cover.1550671256.git.hns@goldelico.com>
        <71ef51037525ae6324bc22e933c00a514d518b31.1550671256.git.hns@goldelico.com>
        <20190220161444.78f34a61@archlinux>
        <4C07F0C8-3149-4DEA-B108-39F2CC04ED88@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4C07F0C8-3149-4DEA-B108-39F2CC04ED88@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Song Qiang <songqiang1304521@gmail.com>, letux-kernel@openphoenux.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 20 Feb 2019 17:20:29 +0100
"H. Nikolaus Schaller" <hns@goldelico.com> wrote:

> > Am 20.02.2019 um 17:14 schrieb Jonathan Cameron <jic23@kernel.org>:
> > 
> > On Wed, 20 Feb 2019 15:00:50 +0100
> > "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
> >   
> >> This patch allows to read a mount-matrix device tree
> >> property and report to user-space or in-kernel iio
> >> clients.
> >> 
> >> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>  
> > This will clash with Andy's current patch, but I'll fix that up if
> > needed. Otherwise, one trivial suggestion inline.  
> 
> Ok, thanks!
> 
> > 
> > Jonathan
> >   
> >> ---
> >> drivers/iio/accel/bmc150-accel-core.c | 19 +++++++++++++++++++
> >> 1 file changed, 19 insertions(+)
> >> 
> >> diff --git a/drivers/iio/accel/bmc150-accel-core.c b/drivers/iio/accel/bmc150-accel-core.c
> >> index 383c802eb5b8..9178846cfddc 100644
> >> --- a/drivers/iio/accel/bmc150-accel-core.c
> >> +++ b/drivers/iio/accel/bmc150-accel-core.c
> >> @@ -204,6 +204,7 @@ struct bmc150_accel_data {
> >> 	int ev_enable_state;
> >> 	int64_t timestamp, old_timestamp; /* Only used in hw fifo mode. */
> >> 	const struct bmc150_accel_chip_info *chip_info;
> >> +	struct iio_mount_matrix orientation;
> >> };
> >> 
> >> static const struct {
> >> @@ -796,6 +797,18 @@ static ssize_t bmc150_accel_get_fifo_state(struct device *dev,
> >> 	return sprintf(buf, "%d\n", state);
> >> }
> >> 
> >> +static const struct iio_mount_matrix *
> >> +bmc150_accel_get_mount_matrix(const struct iio_dev *indio_dev,
> >> +				const struct iio_chan_spec *chan)
> >> +{
> >> +	return &((struct bmc150_accel_data *)iio_priv(indio_dev))->orientation;  
> > 
> > I would use a local variable as that casting is less than simple to parse
> > to my eyes anyway!  
> 
> Yes, Andy already suggested that. I just happend to pick one of the only two bad examples
> from all iio drivers as template...
> 
> drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
> drivers/iio/magnetometer/ak8975.c

If you like, feel free to send patches to tidy those up as well!
Then no one else can be unlucky on the same thing in future.

Jonathan

> 
> >   
> >> +}
> >> +
> >> +static const struct iio_chan_spec_ext_info bmc150_accel_ext_info[] = {
> >> +	IIO_MOUNT_MATRIX(IIO_SHARED_BY_DIR, bmc150_accel_get_mount_matrix),
> >> +	{ },
> >> +};
> >> +
> >> static IIO_CONST_ATTR(hwfifo_watermark_min, "1");
> >> static IIO_CONST_ATTR(hwfifo_watermark_max,
> >> 		      __stringify(BMC150_ACCEL_FIFO_LENGTH));
> >> @@ -978,6 +991,7 @@ static const struct iio_event_spec bmc150_accel_event = {
> >> 		.shift = 16 - (bits),					\
> >> 		.endianness = IIO_LE,					\
> >> 	},								\
> >> +	.ext_info = bmc150_accel_ext_info,				\
> >> 	.event_spec = &bmc150_accel_event,				\
> >> 	.num_event_specs = 1						\
> >> }
> >> @@ -1555,6 +1569,11 @@ int bmc150_accel_core_probe(struct device *dev, struct regmap *regmap, int irq,
> >> 
> >> 	data->regmap = regmap;
> >> 
> >> +	ret = of_iio_read_mount_matrix(dev, "mount-matrix",
> >> +				       &data->orientation);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> 	ret = bmc150_accel_chip_init(data);
> >> 	if (ret < 0)
> >> 		return ret;  
> >   
> 
> BR and thanks,
> Nikolaus
> 
