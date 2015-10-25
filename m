From: Martin Kepplinger <martink-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v4] iio: mma8452: support either of the available interrupt pins
Date: Sun, 25 Oct 2015 14:04:27 +0100
Message-ID: <591E5883-8D38-47C2-8679-EDC3D7C01A5C@posteo.de>
References: <1444914632-4486-1-git-send-email-martink@posteo.de> <CAL_Jsq+cd0A7wczT-KC3TT_2UmZDqjr799uRMR_WA_JFfTw6dA@mail.gmail.com> <562CB761.9050905@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <562CB761.9050905-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Martin Kepplinger <martink-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



Am 25. Oktober 2015 12:05:05 MEZ, schrieb Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
>On 22/10/15 19:22, Rob Herring wrote:
>> On Thu, Oct 15, 2015 at 8:10 AM, Martin Kepplinger
><martink-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org> wrote:
>>> This change is important in order for everyone to be easily able to
>use the
>>> driver for one of the supported accelerometer chips!
>>>
>>> Until now, the driver blindly assumed that the INT1 interrupt line
>is wired
>>> on a user's board. But these devices have 2 interrupt lines and can
>route
>>> their interrupt sources to one of them. Now, if "INT2" is found and
>matches
>>> i2c_client->irq, INT2 will be used.
>>>
>>> The chip's default actually is INT2, which is why probably many
>boards will
>>> have it wired and can make use of this.
>>>
>>> Of course, this also falls back to assuming INT1, so for existing
>users
>>> nothing will break. The new functionality is described in the
>bindings doc.
>>>
>>> Signed-off-by: Martin Kepplinger
><martin.kepplinger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>
>>> ---
>>> changelog:
>>> v4: use irq that matches client->irq, backwards compatible
>>> v3: correctly assign irq if both pins are described in DT
>>> v2: don't warn but normally handle if both pins are described in dts
>>>     thanks Mark Rutland
>>> v1: initial post
>>>
>>>  .../devicetree/bindings/iio/accel/mma8452.txt       |  6 ++++++
>> 
>> For the binding:
>> 
>> Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>I've guessed that was an Acked-by :)
>
>Anyhow, applied to the togreg branch of iio.git.
>
>I'm afraid after my hiatus for a couple of weeks (day job work crisis
>now
>over) this has missed going in for the current cycle.
>
>IIO merge closes more than a week before the merge window opens and
>Linus
>just announced probably release a week today.
>
>Sorry about that, will be queued up for an early entry into linux next
>after the merge window closes.
>
>Jonathan

That's fine. Thanks

>> 
>>>  drivers/iio/accel/mma8452.c                         | 21
>+++++++++++++++------
>>>  2 files changed, 21 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/iio/accel/mma8452.txt
>b/Documentation/devicetree/bindings/iio/accel/mma8452.txt
>>> index e3c3746..3c10e85 100644
>>> --- a/Documentation/devicetree/bindings/iio/accel/mma8452.txt
>>> +++ b/Documentation/devicetree/bindings/iio/accel/mma8452.txt
>>> @@ -7,13 +7,18 @@ Required properties:
>>>      * "fsl,mma8453"
>>>      * "fsl,mma8652"
>>>      * "fsl,mma8653"
>>> +
>>>    - reg: the I2C address of the chip
>>>
>>>  Optional properties:
>>>
>>>    - interrupt-parent: should be the phandle for the interrupt
>controller
>>> +
>>>    - interrupts: interrupt mapping for GPIO IRQ
>>>
>>> +  - interrupt-names: should contain "INT1" and/or "INT2", the
>accelerometer's
>>> +                    interrupt line in use.
>>> +
>>>  Example:
>>>
>>>         mma8453fc@1d {
>>> @@ -21,4 +26,5 @@ Example:
>>>                 reg = <0x1d>;
>>>                 interrupt-parent = <&gpio1>;
>>>                 interrupts = <5 0>;
>>> +               interrupt-names = "INT2";
>>>         };
>>> diff --git a/drivers/iio/accel/mma8452.c
>b/drivers/iio/accel/mma8452.c
>>> index 1eccc2d..116a6e4 100644
>>> --- a/drivers/iio/accel/mma8452.c
>>> +++ b/drivers/iio/accel/mma8452.c
>>> @@ -29,6 +29,7 @@
>>>  #include <linux/iio/events.h>
>>>  #include <linux/delay.h>
>>>  #include <linux/of_device.h>
>>> +#include <linux/of_irq.h>
>>>
>>>  #define MMA8452_STATUS                         0x00
>>>  #define  MMA8452_STATUS_DRDY                   (BIT(2) | BIT(1) |
>BIT(0))
>>> @@ -1130,13 +1131,21 @@ static int mma8452_probe(struct i2c_client
>*client,
>>>                                            MMA8452_INT_FF_MT;
>>>                 int enabled_interrupts = MMA8452_INT_TRANS |
>>>                                          MMA8452_INT_FF_MT;
>>> +               int irq2;
>>>
>>> -               /* Assume wired to INT1 pin */
>>> -               ret = i2c_smbus_write_byte_data(client,
>>> -                                               MMA8452_CTRL_REG5,
>>> -                                              
>supported_interrupts);
>>> -               if (ret < 0)
>>> -                       return ret;
>>> +               irq2 = of_irq_get_byname(client->dev.of_node,
>"INT2");
>>> +
>>> +               if (irq2 == client->irq) {
>>> +                       dev_dbg(&client->dev, "using interrupt line
>INT2\n");
>>> +               } else {
>>> +                       ret = i2c_smbus_write_byte_data(client,
>>> +                                                      
>MMA8452_CTRL_REG5,
>>> +                                                      
>supported_interrupts);
>>> +                       if (ret < 0)
>>> +                               return ret;
>>> +
>>> +                       dev_dbg(&client->dev, "using interrupt line
>INT1\n");
>>> +               }
>>>
>>>                 ret = i2c_smbus_write_byte_data(client,
>>>                                                 MMA8452_CTRL_REG4,
>>> --
>>> 2.1.4
>>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-iio"
>in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
