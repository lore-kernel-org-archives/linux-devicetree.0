From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] iio: st-sensors: add support for lis3lv02d accelerometer
Date: Wed, 27 Aug 2014 15:38:37 +0200
Message-ID: <CACRpkdb5NXJiTvaHz9_nJiZcFsyVnjPYjaYZ1YH9meBgJhoTJA@mail.gmail.com>
References: <1408815064-5763-1-git-send-email-linus.walleij@linaro.org>
	<53FB6205.5020704@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53FB6205.5020704-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Eric Piel <eric.piel-VkQ1JFuSMpfAbQlEx87xDw@public.gmane.org>, Yan Burman <burman.yan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yan Burman <yanb-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Denis CIOCCA <denis.ciocca-qxv4g6HH51o@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 25, 2014 at 6:19 PM, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On 23/08/14 18:31, Linus Walleij wrote:
>> This adds support for the LIS3LV02 accelerometer found in the
>> ST Microelectronics Nomadik board series.
>>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Cc: Denis CIOCCA <denis.ciocca-qxv4g6HH51o@public.gmane.org>
>> Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> This is a little 'interesting', given the part is already supported by
> drivers/misc/lis3lv02d*.c and already has bindings under there.
> Documentation/devicetree/bindings/misc/lis302.txt
> (some of these are interesting).

Grrr how come I missed this... It was originally merged as a
hwmon driver.


>> +/* CUSTOM VALUES FOR SENSOR 4 */
>>
> I wish now we'd nipped this naming convention in the bud and insisted
> on naming after a relevant part. Oh well.

Well we can always make an invasive patch fixing that. I can
probably do it using sed or something.

> Do we think this is the right way to handle the alternative support
> here?

Well this patch is a driver using the IIO framework and was written
by ST, but the other driver support a few other interesting features
and seems to be for the laptop usecase.

Adding the other authors to the TO: line...

Yours,
Linus Walleij
