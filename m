From: Karol Wrona <k.wrona-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 2/5] iio: sensorhub: Add sensorhub bindings
Date: Tue, 16 Dec 2014 08:30:42 +0100
Message-ID: <548FDFA2.1090002@samsung.com>
References: <1417809290-9662-1-git-send-email-k.wrona@samsung.com>
 <1417809290-9662-3-git-send-email-k.wrona@samsung.com>
 <548312D9.3070104@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <548312D9.3070104-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Karol Wrona <wrona.vy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/06/2014 03:29 PM, Jonathan Cameron wrote:
> On 05/12/14 19:54, Karol Wrona wrote:
>> Add sensorhub bindings for sensorhub on Galaxy Gear 2.
>>
>> Change-Id: I4ee25aef33c21a4662de230841de9a8684f2c26b
>> Signed-off-by: Karol Wrona <k.wrona-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Acked-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Looks good to me.  Comments inline.  Note I either need a device tree
> ack or a long delay before I can take this though.  Unlikely to get the
> device tree ack as you haven't cc'd the maintainers or list ;)
I am curious about DT community opinion and I prefer to know it before
v4 sending.

> 
> I've added the cc's. Please make sure future versions have them or you'll
> just be slowing the process down (particularly if no one notices they 
> are missing!)
Thanks, I will remember that.
> 
>> ---
>>  .../devicetree/bindings/iio/sensorhub.txt          |   46 ++++++++++++++++++++
>>  1 file changed, 46 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/iio/sensorhub.txt
>>
>> diff --git a/Documentation/devicetree/bindings/iio/sensorhub.txt b/Documentation/devicetree/bindings/iio/sensorhub.txt
>> new file mode 100644
>> index 0000000..2aca0c3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/sensorhub.txt
>> @@ -0,0 +1,46 @@
>> +Samsung Sensorhub driver
>> +
>> +Sensorhub is a MCU which manages several sensors and also plays the role
>> +of a virtual sensor device.
>> +
>> +Required properties:
>> +- compatible: "samsung,sensorhub-rinato" or "samsung,sensorhub-thermostat"
>> +- spi-max-frequency: max SPI clock frequency
>> +- interrupt-parent: interrupt parent
>> +- interrupts: communication interrupt
>> +- ap-mcu-gpio: [out] ap to sensorhub line - used during communication
>> +- mcu-ap-gpio: [in] sensorhub to ap - used during communication
>> +- mcu-reset: [out] sensorhub reset
> as commented in previous patch, why do the first two have -gpio and the
> third not?
Ok, all 3 will have "gpios" ending
>> +
>> +Optional properties:
>> +- sensor's nodes:
>> +  compatible = "samsung,mpu6500-accel"
>> +  compatible = "samsung,mpu6500-gyro"
>> +  compatible = "samsung,adpd142"
>> +
>> +Sensor compatibles are used to match proper sensor driver to real sensor on
>> +the board. The firmware does not give such information, so it helps to specify
>> +some sensors properties. Sensors have "samsung" prefixes because frequently
>> +they will not have much in common with sensors used without sensorhub because
>> +it can do some data processing.
> We'll keep that under review.  Might make sense, sometimes, to unify the
> drivers.  The different compatible will probably still be needed, but if
> these devices proliferate I don't want two drivers for everything that
> gets stuck behind them.
I think that sensorhub is very similar hid-sensor (without hotpluging) where
every sensor type has its own representation.  The real sensors are not driven
directly but by external MCU so very often these sensors will not have much
common with real ones.  So I wonder if it could be better to resign from these
sensor compatibles and represent each sensor as mfd cell so optional properties
probably will dropped (?)
Generally I intended to have i.e. one ssp-accel driver if they use another
accelerometer then mpu6500 the buffering manner and sysfs will be handled in the
same way.  I think I was mistaken with these compatibles.  There is also some
probability that the firmware will be fixed someday and it will be able to tell
more about sensor then the type.

>> +
>> +Example:
>> +
>> +	shub_spi: shub {
>> +		compatible = "samsung,sensorhub-rinato";
>> +		spi-max-frequency = <5000000>;
>> +		interrupt-parent = <&gpx0>;
>> +		interrupts = <2 0>;
>> +		ap-mcu-gpio = <&gpx0 0 0>;
>> +		mcu-ap-gpio = <&gpx0 4 0>;
>> +		mcu-reset = <&gpx0 5 0>;
>> +		sensor@0 {
>> +			compatible = "samsung,mpu6500-accel";
>> +		};
>> +		sensor@1 {
>> +			compatible = "samsung,mpu6500-gyro";
>> +		};
>> +		sensor@2 {
>> +			compatible = "samsung,adpd142";
>> +		};
>> +	};
>>
> 
> 
