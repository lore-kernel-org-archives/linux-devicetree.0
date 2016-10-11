From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] iio: accel: Add driver for dmard10 3-axis
 Accelerometer
Date: Tue, 11 Oct 2016 19:39:20 +0100
Message-ID: <03c7f2cb-a327-2b03-5eab-a873d3fa4a02@kernel.org>
References: <20161008123426.8991-1-hdegoede@redhat.com>
 <20161008123426.8991-3-hdegoede@redhat.com>
 <20161010214113.GA15075@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161010214113.GA15075@rob-hp-laptop>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/10/16 22:41, Rob Herring wrote:
> On Sat, Oct 08, 2016 at 02:34:24PM +0200, Hans de Goede wrote:
>> Add a driver for the Domintech ARD10 3-axis Accelerometer, based on the
>> android driver found here: https://github.com/domintech/dmard10
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>> Changes in v2:
>> -prefix all defines with DMARD10_ and uppercase them all
>> -Cleanup typography of some comments
>> -Use defines for offsets in databuffer
>> -Use i2c_smbus_write_byte_data() where applicable
>> -Reduce unnecessarily large buffer size in dmard10_shutdown()
>> -Use __le16 buffer in dmard10_read_raw()
>> Changes in v3:
>> -Express unit in m/s^2 instead of in "G"
>> ---
>>  .../devicetree/bindings/i2c/trivial-devices.txt    |   1 +
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Added.
> 
>>  drivers/iio/accel/Kconfig                          |  10 +
>>  drivers/iio/accel/Makefile                         |   1 +
>>  drivers/iio/accel/dmard10.c                        | 266 +++++++++++++++++++++
>>  4 files changed, 278 insertions(+)
>>  create mode 100644 drivers/iio/accel/dmard10.c
