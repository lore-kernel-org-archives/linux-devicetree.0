From: Himanshu Jha <himanshujha199640@gmail.com>
Subject: Re: [PATCH v4 3/3] iio: magnetometer: Add driver support for PNI
 RM3100
Date: Fri, 12 Oct 2018 18:23:16 +0530
Message-ID: <20181012125316.GA6480@himanshu-Vostro-3559>
References: <20181002143812.3661-1-songqiang1304521@gmail.com>
 <20181012073536.20339-1-songqiang1304521@gmail.com>
 <20181012073536.20339-4-songqiang1304521@gmail.com>
 <436097c6-b32b-42e4-e704-a15280e13cb0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <436097c6-b32b-42e4-e704-a15280e13cb0@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Song Qiang <songqiang1304521@gmail.com>
Cc: jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com, preid@electromag.com.au, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Qiang,

On Fri, Oct 12, 2018 at 04:36:01PM +0800, Song Qiang wrote:
> 
> 
> On 2018年10月12日 15:35, Song Qiang wrote:
> > PNI RM3100 is a high resolution, large signal immunity magnetometer,
> > composed of 3 single sensors and a processing chip with a MagI2C
> > interface.
> > 
> ...
> > +static irqreturn_t rm3100_trigger_handler(int irq, void *p)
> > +{
> > +	struct iio_poll_func *pf = p;
> > +	struct iio_dev *indio_dev = pf->indio_dev;
> > +	unsigned long scan_mask = *indio_dev->active_scan_mask;
> > +	unsigned int mask_len = indio_dev->masklength;
> > +	struct rm3100_data *data = iio_priv(indio_dev);
> > +	struct regmap *regmap = data->regmap;
> > +	int ret, i, bit;
> > +
> > +	mutex_lock(&data->lock);
> > +	switch (scan_mask) {
> > +	case BIT(0) | BIT(1) | BIT(2):
> > +		ret = regmap_bulk_read(regmap, RM3100_REG_MX2, data->buffer, 9);
> > +		mutex_unlock(&data->lock);
> > +		if (ret < 0)
> > +			goto done;
> > +	break;
> > +	case BIT(0) | BIT(1):
> > +		ret = regmap_bulk_read(regmap, RM3100_REG_MX2, data->buffer, 6);
> > +		mutex_unlock(&data->lock);
> > +		if (ret < 0)
> > +			goto done;
> > +	break;
> > +	case BIT(1) | BIT(2):
> > +		ret = regmap_bulk_read(regmap, RM3100_REG_MY2, data->buffer, 6);
> > +		mutex_unlock(&data->lock);
> > +		if (ret < 0)
> > +			goto done;
> > +	break;
> Hi Jonathan,
> 
> I just noticed that these three breaks are not proper aligned.

Please send the new version of a patch as a *new* thread and don't
use `--in-reply-to` flag(if you're using) to chain into older versions
as whole thread of older discussion comes up and is often not required.

The changelog gives enough info of what's new in the revised series.


-- 
Himanshu Jha
Undergraduate Student
Department of Electronics & Communication
Guru Tegh Bahadur Institute of Technology
