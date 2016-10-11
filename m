From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] iio: accel: Add driver for the MiraMEMS DA280 3-axis
 14-bit digital accelerometer
Date: Tue, 11 Oct 2016 19:40:30 +0100
Message-ID: <6c3e5afc-b0a1-11d4-83a7-e8883212700d@kernel.org>
References: <20161008181527.6646-1-hdegoede@redhat.com>
 <20161010214404.GA16737@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161010214404.GA16737@rob-hp-laptop>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/10/16 22:44, Rob Herring wrote:
> On Sat, Oct 08, 2016 at 08:15:27PM +0200, Hans de Goede wrote:
>> Add an iio driver for the MiraMEMS DA280 3-axis 14-bit accelerometer, as
>> well as for the DA226 which is a fully compatible 2-axis version.
>>
>> Datasheets for the DA280 and DA226 can be found at the manufacturers site:
>> http://www.miramems.com/en/products.asp?list=1
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>> Changes in v2:
>> -Drop le16_to_cpu, i2c_smbus_read_word_data() already does this
>> ---
>>  .../devicetree/bindings/i2c/trivial-devices.txt    |   2 +
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Added.
> 
>>  drivers/iio/accel/Kconfig                          |  10 ++
>>  drivers/iio/accel/Makefile                         |   1 +
>>  drivers/iio/accel/da280.c                          | 183 +++++++++++++++++++++
>>  4 files changed, 196 insertions(+)
>>  create mode 100644 drivers/iio/accel/da280.c
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
