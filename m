From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio/serial: revert "linux,first-pin" property handling
Date: Wed, 12 Jul 2017 13:39:44 +0200
Message-ID: <CACRpkdZAwXZn+dJ-XB6wEbVLLiOfhumdrXDx4K-bMFN-p3-PSA@mail.gmail.com>
References: <20170710140902.21935-1-linus.walleij@linaro.org>
 <db1ae5e9-dc03-403e-2f46-e05cbd4a7b4f@siemens.com> <5310fa81-dc0e-75b1-05fb-2ec9b558f867@siemens.com>
 <CACRpkdb9sOj5DgeCwD1FK5yCNUmMiC0JKXL4H7z0RfK1DfUH8g@mail.gmail.com> <6b28ae9a-9393-1c97-4ef2-aaf69ec6a522@siemens.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <6b28ae9a-9393-1c97-4ef2-aaf69ec6a522@siemens.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 12, 2017 at 1:30 PM, Jan Kiszka <jan.kiszka@siemens.com> wrote:
> On 2017-07-12 11:30, Linus Walleij wrote:

>> What you are talking about should be hardware-and-vendor specific
>> info and prefixed "exar,*".
>
> "exar," or rather "gpio-exar,", like in [1]?

HW-specific DT bindings have this form: "vendor,foo".

So "exar,gpio-first-exported-pin" is some kind of overstating of the
fact, but correct.

The bindings (put with the rest of the exar DT bindings if there
are such somewhere in Documentation/devicetree/bindings/* else
in a new file) should make it very clear that this is a
hardware-specific thing telling us which hardware pin is the
first offset to be used for GPIO.

Yours,
Linus Walleij
