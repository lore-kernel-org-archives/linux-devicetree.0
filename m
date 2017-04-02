From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] iio:imu:mpu6050 update i2c bindings to reflect
 i2c-gate and supported parts
Date: Sun, 2 Apr 2017 10:09:50 +0100
Message-ID: <ab168948-10f9-025b-6775-a7158e081481@kernel.org>
References: <20170326111100.2571-1-jic23@kernel.org>
 <20170326111100.2571-2-jic23@kernel.org>
 <20170330230252.cxbdh3g744qwdtfh@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170330230252.cxbdh3g744qwdtfh@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark.Rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 31/03/17 00:02, Rob Herring wrote:
> On Sun, Mar 26, 2017 at 12:10:59PM +0100, Jonathan Cameron wrote:
>> These bindings are somewhat lagging the state of the driver.  The i2c-gate
>> bindings are documented elsewhere, but it seems sensible to at least have
>> an example and cross reference in here.  SPI bindings will need to be the
>> subject of a future patch.
>>
>> Signed-off-by: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> ---
>>  .../devicetree/bindings/iio/imu/inv_mpu6050.txt    | 23 ++++++++++++++++++++--
>>  1 file changed, 21 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/iio/imu/inv_mpu6050.txt b/Documentation/devicetree/bindings/iio/imu/inv_mpu6050.txt
>> index a9fc11e43b45..e18e04f3c6f4 100644
>> --- a/Documentation/devicetree/bindings/iio/imu/inv_mpu6050.txt
>> +++ b/Documentation/devicetree/bindings/iio/imu/inv_mpu6050.txt
>> @@ -3,14 +3,17 @@ InvenSense MPU-6050 Six-Axis (Gyro + Accelerometer) MEMS MotionTracking Device
>>  http://www.invensense.com/mems/gyro/mpu6050.html
>>  
>>  Required properties:
>> - - compatible : should be "invensense,mpu6050"
>> + - compatible : should be "invensense,mpu6050", "invensense,mpu6500",
>> +   "invensense,mpu9150" or "invensense,icm20608"
> 
> One per line please. With that,
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
Fixed and applied.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
