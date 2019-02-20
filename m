From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 5/9] iio: accel: bma180: convert to devm
Date: Wed, 20 Feb 2019 18:09:51 +0200
Message-ID: <20190220160951.GX9224@smile.fi.intel.com>
References: <cover.1550671256.git.hns@goldelico.com>
 <900f59b94ef2e1b5559b363c0d1af4fefccd0366.1550671256.git.hns@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <900f59b94ef2e1b5559b363c0d1af4fefccd0366.1550671256.git.hns@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Song Qiang <songqiang1304521@gmail.com>, letux-kernel@openphoenux.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 20, 2019 at 03:00:52PM +0100, H. Nikolaus Schaller wrote:
> This simplifies the code a little.

> -err_buffer_cleanup:
> -	iio_triggered_buffer_cleanup(indio_dev);
> -err_trigger_unregister:
> -	if (data->trig)
> -		iio_trigger_unregister(data->trig);
> -err_trigger_free:
> -	iio_trigger_free(data->trig);

> -err_chip_disable:
> +err:

Please, leave the original label name as it's more self-explanatory.

>  	data->part_info->chip_disable(data);
>  
>  	return ret;

-- 
With Best Regards,
Andy Shevchenko
