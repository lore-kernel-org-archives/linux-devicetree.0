From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: [PATCH] gpio/serial: revert "linux,first-pin" property handling
Date: Wed, 12 Jul 2017 13:30:43 +0200
Message-ID: <6b28ae9a-9393-1c97-4ef2-aaf69ec6a522@siemens.com>
References: <20170710140902.21935-1-linus.walleij@linaro.org>
 <db1ae5e9-dc03-403e-2f46-e05cbd4a7b4f@siemens.com>
 <5310fa81-dc0e-75b1-05fb-2ec9b558f867@siemens.com>
 <CACRpkdb9sOj5DgeCwD1FK5yCNUmMiC0JKXL4H7z0RfK1DfUH8g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdb9sOj5DgeCwD1FK5yCNUmMiC0JKXL4H7z0RfK1DfUH8g@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 2017-07-12 11:30, Linus Walleij wrote:
> On Tue, Jul 11, 2017 at 5:42 PM, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>> On 2017-07-10 16:23, Jan Kiszka wrote:
>>> On 2017-07-10 16:09, Linus Walleij wrote:
>>>> This is not a legal device tree property, because its binding has
>>>> not been reviewed and approved, nor does it exist in any device
>>>> tree binding document.
>>>>
>>>> It is further wrong, because it is added to the GPIO offset which
>>>> is by definition controller-local.
>>
>> BTW, I don't get this second statement. The parameter passed in is
>> controlling which pin of the GPIO device can be controlled by the driver
>> at all. And that's also a very private interface between 8250_exar and
>> gpio-exar: the former tells the latter which pins are physically
>> available to drive, because the former operates the others already.
> 
> Then it seems like the big confusion here is the "linux,*" prefix in
> the DT binding.
> 
> We only use that for information which is necessary evil Linux-specific
> stuff.
> 
> What you are talking about should be hardware-and-vendor specific
> info and prefixed "exar,*".

"exar," or rather "gpio-exar,", like in [1]?

> 
> Can you propose a patch simply changing the binding and try to get
> the DT maintainers ACK on it?

Sure, will do then.

Jan

[1]
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1407975.html
