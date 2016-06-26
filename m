From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] iio: adc: max1363: Add device tree binding
Date: Sun, 26 Jun 2016 18:01:37 +0100
Message-ID: <3361d014-96a8-51cc-a799-4c7edc8aa5e0@kernel.org>
References: <201606211912.JCmJ2q9D%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201606211912.JCmJ2q9D%fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Florian Vaussard <florian.vaussard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: kbuild-all-JC7UmRfGjtg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Martin Kepplinger <martink-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 21/06/16 12:44, kbuild test robot wrote:
> Hi,
> 
Hi Florian,

Usual way around this is to make the devicetree pointers true pointers by
providing the address of the array member instead of it's index.

Only requires a slight rework of what you have.

Jonathan
> [auto build test WARNING on iio/togreg]
> [cannot apply to v4.7-rc4 next-20160621]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Florian-Vaussard/iio-adc-max1363-Fix-missing-parts-and-add-device-tree/20160621-174542
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
> config: x86_64-allmodconfig (attached as .config)
> compiler: gcc-6 (Debian 6.1.1-1) 6.1.1 20160430
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=x86_64 
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/iio/adc/max1363.c: In function 'max1363_probe':
>>> drivers/iio/adc/max1363.c:1578:11: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>       devid = (int)of_device_get_match_data(&client->dev);
>               ^
> 
> vim +1578 drivers/iio/adc/max1363.c
> 
>   1562	};
>   1563	#endif
>   1564	
>   1565	static int max1363_probe(struct i2c_client *client,
>   1566				 const struct i2c_device_id *id)
>   1567	{
>   1568		int ret;
>   1569		struct max1363_state *st;
>   1570		struct iio_dev *indio_dev;
>   1571		struct regulator *vref;
>   1572		unsigned long devid;
>   1573		const struct of_device_id *match;
>   1574	
>   1575		match = of_match_device(of_match_ptr(max1363_of_match),
>   1576					&client->dev);
>   1577		if (match)
>> 1578			devid = (int)of_device_get_match_data(&client->dev);
>   1579		else
>   1580			devid = id->driver_data;
>   1581	
>   1582		indio_dev = devm_iio_device_alloc(&client->dev,
>   1583						  sizeof(struct max1363_state));
>   1584		if (!indio_dev)
>   1585			return -ENOMEM;
>   1586	
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
> 
