From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v5] iio: dac: Add support for the AD5592R/AD5593R
 ADCs/DACs
Date: Sun, 3 Apr 2016 10:39:52 +0100
Message-ID: <5700E4E8.40304@kernel.org>
References: <1458721195-28915-1-git-send-email-michael.hennerich@analog.com>
 <CACRpkdYAqPn9o-wMbb-iZn7bjad8u9JmdwRqwrjFMArPrOXEOQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYAqPn9o-wMbb-iZn7bjad8u9JmdwRqwrjFMArPrOXEOQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Michael Hennerich <michael.hennerich@analog.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, Hartmut Knaack <knaack.h@gmx.de>, Paul Cercueil <paul.cercueil@analog.com>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Pawe=c5=82_Moll?= <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 31/03/16 09:01, Linus Walleij wrote:
> On Wed, Mar 23, 2016 at 9:19 AM,  <michael.hennerich@analog.com> wrote:
> 
>> From: Paul Cercueil <paul.cercueil@analog.com>
>>
>> This patch adds support for the AD5592R (spi) and AD5593R (i2c)
>> ADC/DAC/GPIO devices.
>>
>> Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
>> Signed-off-by: Michael Hennerich <michael.hennerich@analog.com>
> 
> For this v5 version:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> I'm fine with this new gpiochip driver being merged into the
> IIO tree.
> 
Cool,  Paul / Michael,

I still had a few trivial outstanding comments. Please remember to add
this reviewed-by to V6.

thanks,

Jonathan
> Yours,
> Linus Walleij
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

