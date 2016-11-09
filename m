From: Marcin Niestroj <m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
Subject: Re: [PATCH 1/2] iio: bmi160: Support hardware fifo
Date: Wed, 9 Nov 2016 15:52:02 +0100
Message-ID: <1d50ebf1-2f14-2e3f-9b8e-b34a7ebca4c5@grinn-global.com>
References: <20161103112527.29623-1-m.niestroj@grinn-global.com>
 <b7dd5694-b757-c0d1-3400-46e92b8deb58@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b7dd5694-b757-c0d1-3400-46e92b8deb58-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Daniel Baluta <daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>, Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,
Thanks for review. I agree with all of the comments and will fix these 
in next patch version. Below is just a comment on hwfifo_* sysfs access.

On 06.11.2016 13:35, Jonathan Cameron wrote:
> On 03/11/16 11:25, Marcin Niestroj wrote:
>> This patch was developed primarily based on bmc150_accel hardware fifo
>> implementation.
>>
>> IRQ handler was added, which for now is responsible only for handling
>> watermark interrupts. The BMI160 chip has two interrupt outputs. By
>> default INT is considered to be connected. If INT2 is used instead, the
>> interrupt-names device-tree property can be used to specify that.
>>
>> Signed-off-by: Marcin Niestroj <m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
> I agree with Peter that there should have been a few precursor patches
> to this one doing various cleanups and reworking bits that you have
> in here.  Would have made it easier to review (always a good thing :)
>
> In general the resulting code looks good to me.  A few little
> additional comments inline from me.  Mostly about small code ordering things
> and function rename suggestions that would make the code more 'obviously'
> correct.
>
> Thanks,
>
> Jonathan
>> ---
>>  drivers/iio/imu/bmi160/bmi160.h      |   3 +-
>>  drivers/iio/imu/bmi160/bmi160_core.c | 633 +++++++++++++++++++++++++++++++++--
>>  drivers/iio/imu/bmi160/bmi160_i2c.c  |   7 +-
>>  drivers/iio/imu/bmi160/bmi160_spi.c  |   3 +-
>>  4 files changed, 618 insertions(+), 28 deletions(-)

<snip>

>> +
>> +static IIO_CONST_ATTR(hwfifo_watermark_min, "1");
>> +static IIO_CONST_ATTR(hwfifo_watermark_max,
>> +		      __stringify(BMI160_FIFO_LENGTH));
>> +static IIO_DEVICE_ATTR(hwfifo_enabled, S_IRUGO,
>> +		       bmi160_get_fifo_state, NULL, 0);
>> +static IIO_DEVICE_ATTR(hwfifo_watermark, S_IRUGO,
>> +		       bmi160_get_fifo_watermark, NULL, 0);
>> +
>> +static const struct attribute *bmi160_fifo_attributes[] = {
>> +	&iio_const_attr_hwfifo_watermark_min.dev_attr.attr,
>> +	&iio_const_attr_hwfifo_watermark_max.dev_attr.attr,
>> +	&iio_dev_attr_hwfifo_watermark.dev_attr.attr,
>> +	&iio_dev_attr_hwfifo_enabled.dev_attr.attr,
> There are enough of these drivers now that sometimes soon we should
> revisit the question of pulling these into the core.  Can certainly
> concieve of downstream consumer devices (in particular the iio_input
> bridge when that finally resurfaces - my fault) wanting to be able to
> manipulate or at least have visibilty of these.

One more thing to consider is setting hwfifo_watermark to other value 
than "userspace" watermark. It would be nice to set hwfifo_watermark to 
a *safe* value to be able to get all data from hardware to kfifo. By 
safe I mean that the chance of hardware fifo overflow will be small. On 
the other hand there might be no reason to have such small watermark for 
userspace application, so we can save scheduler cycles.


<snip>

-- 
Marcin Niestroj
