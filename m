From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [PATCH] Add optional chip erase functionality to AT25 EEPROM
 driver.
Date: Mon, 12 Aug 2019 15:51:35 +0000
Message-ID: <9f1c7d45020d482390737be22c885a9b@AcuMS.aculab.com>
References: <20190809125358.24440-1-joe.burmeister@devtank.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190809125358.24440-1-joe.burmeister@devtank.co.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: 'Joe Burmeister' <joe.burmeister@devtank.co.uk>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, YueHaibing <yuehaibing@huawei.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Joe Burmeister
> Sent: 09 August 2019 13:54
> 
> Many, though not all, AT25s have an instruction for chip erase.
> If there is one in the datasheet, it can be added to device tree.
> Erase can then be done in userspace via the sysfs API with a new
> "erase" device attribute. This matches the eeprom_93xx46 driver's
> "erase".

Is it actually worth doing though?

I'm guessing that device erase can easily take over a minute.

When I looked at 'device erase' on an EEPROM it took just as long
as erasing the sectors one at a time - but without the warm cosy
feeling that progress was being made.

Not only that you can't really interrupt the erase, so either
the application has to sleep uninterruptibly for the duration
or you have to have some kind of 'device busy' response while
it is done asynchronously.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
