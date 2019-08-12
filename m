From: Joe Burmeister <joe.burmeister@devtank.co.uk>
Subject: Re: [PATCH] Add optional chip erase functionality to AT25 EEPROM
 driver.
Date: Mon, 12 Aug 2019 22:03:32 +0100
Message-ID: <dd5f6b9f-13bd-8127-71a8-40e7a7017d25@devtank.co.uk>
References: <20190809125358.24440-1-joe.burmeister@devtank.co.uk>
 <9f1c7d45020d482390737be22c885a9b@AcuMS.aculab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9f1c7d45020d482390737be22c885a9b@AcuMS.aculab.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: David Laight <David.Laight@ACULAB.COM>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, YueHaibing <yuehaibing@huawei.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 12/08/2019 16:51, David Laight wrote:
> From: Joe Burmeister
>> Sent: 09 August 2019 13:54
>>
>> Many, though not all, AT25s have an instruction for chip erase.
>> If there is one in the datasheet, it can be added to device tree.
>> Erase can then be done in userspace via the sysfs API with a new
>> "erase" device attribute. This matches the eeprom_93xx46 driver's
>> "erase".
> Is it actually worth doing though?
>
> I'm guessing that device erase can easily take over a minute.


That must depend on the AT25. The one we're using (AT25F512A), as it's 
setup, it's fast enough. The datasheet states "The CHIP ERASE cycle time 
typically is 2 seconds.". I've not timed it's because as I said, seamed 
fast enough.


If you can't erase it, then it's basically write once, or you expose it 
with spi_dev to Flashrom to erase it.


> When I looked at 'device erase' on an EEPROM it took just as long
> as erasing the sectors one at a time - but without the warm cosy
> feeling that progress was being made.


I didn't look at sector erase as I'm only interested in erasing it all 
and there was a command for it. I figured if someone wanted sector by 
sector they would implement it.



> Not only that you can't really interrupt the erase, so either
> the application has to sleep uninterruptibly for the duration
> or you have to have some kind of 'device busy' response while
> it is done asynchronously.


That's true, but as I said, it's fast enough it's not an issue for us.

> 	David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)

Regards,

Joe
