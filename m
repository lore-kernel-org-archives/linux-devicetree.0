From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] itg3200: add dt support.
Date: Sat, 23 Nov 2013 18:46:45 +0000
Message-ID: <5290F815.10102@kernel.org>
References: <20131101154854.2d7d1432@notabene.brown>	<20131118115742.GG30853@e106331-lin.cambridge.arm.com> <20131119095625.1fc4f66f@notabene.brown>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131119095625.1fc4f66f-wvvUuzkyo1EYVZTmpyfIwg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Manuel Stahl <manuel.stahl-GeUHRtUQU7nSyEMIgutvibNAH6kLmebB@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 11/18/13 22:56, NeilBrown wrote:
> On Mon, 18 Nov 2013 11:57:42 +0000 Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> 
>> On Fri, Nov 01, 2013 at 04:48:54AM +0000, NeilBrown wrote:
>>> 
>>> 
>>> No new configuration, just a 'compatible' string and documentation.
>>> 
>>> Signed-off-by: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
>>> 
>>> diff --git a/Documentation/devicetree/bindings/iio/gyro/itg3200.txt
>>> b/Documentation/devicetree/bindings/iio/gyro/itg3200.txt new file mode 100644 index 000000000000..4581620632df 
>>> --- /dev/null +++ b/Documentation/devicetree/bindings/iio/gyro/itg3200.txt @@ -0,0 +1,20 @@ +* InvenSense
>>> ITG3200 3-axis gyroscope + +Required properties: + +  - compatible : "invensense,itg3200" +  - reg : I2C
>>> address, typically 0x68 + +Optional properties: + +  - interrupt-parent : should be the phandle for the
>>> interrupt controller +  - interrupts : interrupt mapping for GPIO IRQ
>> 
>> Why is this a "GPIO IRQ"? This device das no GPIO. The fact that it might be wired to a GPIO controller has
>> nothing to do with the ITG3200, and shouldn't be a concern of its binding.
>> 
> 
> You are of course correct.  I'll resubmit with that word removed.
> 
> I probably copied it from bma180.txt without thinking.
> 
> /home/git/linux$ git grep 'GPIO IRQ' Documentation/devicetree/bindings/ 
> Documentation/devicetree/bindings/gpio/8xxx_gpio.txt: - interrupts : Interrupt mapping for GPIO IRQ. 
> Documentation/devicetree/bindings/gpio/gpio-xilinx.txt:- interrupts : Interrupt mapping for GPIO IRQ. 
> Documentation/devicetree/bindings/gpio/pl061-gpio.txt:- interrupts : Interrupt mapping for GPIO IRQ. 
> Documentation/devicetree/bindings/iio/accel/bma180.txt:  - interrupts : interrupt mapping for GPIO IRQ, it should
> by configured wi Documentation/devicetree/bindings/iio/light/apds9300.txt:  - interrupts : interrupt mapping for
> GPIO IRQ
> 
> Both bma180.txt and apds9300.txt seem to use the phrase "GPIO IRQ" inappropriately.
Fixes are always welcome ;)

Jonathan
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJSkPgVAAoJEFSFNJnE9BaI2HwQALgU62ckBDUiDCxImT7vfdRC
ey6YP5REWO+J8igW6pvjq+mElj2QjQcnbKbuGbEsEFM5f1tZ8+udjsJ0teZyyO30
+P42S6UsGuGEru3KBwU/m46aASYOtKiTeRcYsOq+DGM8DixTDDtRU7tlIwCA11tJ
49SH4aK0T8ktV2Cu4184TkoWNOhHdd1Qwbc8K2xQqxO94t/xgXXCLJe6trKZFC7A
5jQwex+wZnJcxEduSN5LJgi1BqgXIUzoImVZyyZ2nxaVhHPJld5a4VCAGTcaBYLf
jZQYOp1LstS3/Rx1KcKRMyPt0y9j58ZpmP/rGbX3jrKmg0WL5hq9HP53BXdXTpOu
fXilORCDqdf4g2n2pRO+UONE3foVfXPlYfxYQ1KxIVIZNptYEUE5cvKQA7Oafl42
kUpQPbgdnq8Jlnh2+HalxN8Wn0oav3Iljugya+HSjJnnt/TLUxM3bwn84rA3qae7
kbmvzA2ag8CS01dLVu7tGOGthFiV2DAosIVbdFiyPBdS0rFM8QVa2s/oVJr5UyBt
2d/VYOPwSYJbWwMSRM/zdrpRKiXBtpiYsR6aqFWu9vuploaW7i29P6YB7h69+CYw
lLVw8uIYuH+6FIlD/tbhmmKLPo6gMPCVrS7/qQWmzoyT6eKnX5Ys+N8kH6NVA2iS
UeJ82ZYn2sWcuriM17W1
=msEy
-----END PGP SIGNATURE-----
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
