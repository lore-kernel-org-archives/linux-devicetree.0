From: Jonathan Cameron <jic23-tko9wxEg+fIOOJlXag/Snyp2UmYkHbXO@public.gmane.org>
Subject: Re: [PATCH v5] iio: dac: Add support for the AD5592R/AD5593R ADCs/DACs
Date: Tue, 05 Apr 2016 14:11:57 +0100
Message-ID: <7C7C5530-7B41-4AEE-A689-613B9D2679E0@jic23.retrosnub.co.uk>
References: <1458721195-28915-1-git-send-email-michael.hennerich@analog.com> <CACRpkdYAqPn9o-wMbb-iZn7bjad8u9JmdwRqwrjFMArPrOXEOQ@mail.gmail.com> <5700E4E8.40304@kernel.org> <57036769.4070102@analog.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57036769.4070102-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Paul Cercueil <paul.cercueil-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 5 April 2016 08:21:13 BST, Michael Hennerich <michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org> wrote:
>On 04/03/2016 11:39 AM, Jonathan Cameron wrote:
>> On 31/03/16 09:01, Linus Walleij wrote:
>>> On Wed, Mar 23, 2016 at 9:19 AM,  <michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
>wrote:
>>>
>>>> From: Paul Cercueil <paul.cercueil-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
>>>>
>>>> This patch adds support for the AD5592R (spi) and AD5593R (i2c)
>>>> ADC/DAC/GPIO devices.
>>>>
>>>> Signed-off-by: Paul Cercueil <paul.cercueil-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
>>>> Signed-off-by: Michael Hennerich <michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
>>>
>>> For this v5 version:
>>> Reviewed-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>
>>> I'm fine with this new gpiochip driver being merged into the
>>> IIO tree.
>>>
>> Cool,  Paul / Michael,
>>
>> I still had a few trivial outstanding comments. Please remember to
>add
>> this reviewed-by to V6.
>
>
>Hi Jonathan,
>
>Sorry I missed these -
>
>With the comment added to the CH_MODE_DAC_AND_ADC description in the 
>bindings. Do you think we need another ACK from Rob?
I am sure Rob won't mind the addition of this clarification so no need to get
 another review (though always welcome if Rob happens to give one!)

Jonathan

-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.
