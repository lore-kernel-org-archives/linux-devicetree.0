From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RESEND PATCH 2/3] iio: st_sensors: add device tree bindings
Date: Mon, 07 Jul 2014 13:25:37 +0100
Message-ID: <53BA91C1.10808@kernel.org>
References: <1404726486-2610-1-git-send-email-linus.walleij@linaro.org> <CACRpkdY+xa6TAOcyEb6ZO37RmshsjmB4WgPD59UPn=WEBnR7nQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdY+xa6TAOcyEb6ZO37RmshsjmB4WgPD59UPn=WEBnR7nQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Denis CIOCCA <denis.ciocca-qxv4g6HH51o@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/07/14 10:52, Linus Walleij wrote:
> On Mon, Jul 7, 2014 at 11:48 AM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>
>> This adds some basic, simple device tree bindings to the STMicro
>> MEMS sensor drivers.
>>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Cc: Denis CIOCCA <denis.ciocca-qxv4g6HH51o@public.gmane.org>
>> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> I'd like an indication of if we can merge this thing as I can then merge the
> corresponding device tree changes for Ux500 to the ARM SoC tree.
It's been a while.
No one has commented.
This is pretty obviously good.

Applied to the togreg branch of iio.git - initially pushed out as testing.

Thanks

Jonathan
