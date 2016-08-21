From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] iio: gyro: Add MPU-3050 device tree bindings
Date: Sun, 21 Aug 2016 12:13:20 +0100
Message-ID: <42334499-131e-eca7-1d8f-86fe2585f0cf@kernel.org>
References: <1471286275-25024-1-git-send-email-linus.walleij@linaro.org>
 <20160816142819.GA15545@rob-hp-laptop>
 <CACRpkdacvNPsQPY41odrqfPPbuxVJ8wWNR1yqBXi4inMuhEr3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdacvNPsQPY41odrqfPPbuxVJ8wWNR1yqBXi4inMuhEr3w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 16/08/16 20:33, Linus Walleij wrote:
> On Tue, Aug 16, 2016 at 4:28 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> On Mon, Aug 15, 2016 at 08:37:55PM +0200, Linus Walleij wrote:
>>> This adds device tree bindings for the MPU-3050 gyroscope. Since it
>>> is the first set of bindings for a gyroscope, the folder for it
>>> is also created.
>>
>> Is this not similar to mpu-6050 and other Invsense devices:
>>
>> Documentation/devicetree/bindings/iio/imu/inv_mpu6050.txt
> 
> I guess it was a precursor.
> 
> The MPU-3050 is a pure gyroscope, the MPU-6050 combines
> the gyro with an accelerometer. That is why it is classified as
> an IMU rather than a gyro.
> 
I did wonder if the 3050 was a subset of the 6050 but the
register maps are clearly totally different. Hence any sort
of unified driver would be a mess on any OS.

Probably fair to keep the binding docs separate (though in
sync where it makes sense!)

Jonathan
