From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/4] arm: mediatek: Add earlyprintk support for MT6589
Date: Thu, 10 Apr 2014 10:22:34 +0200
Message-ID: <CABuKBeK9QE8ZGx1AKa9Cr9GLdHDKW-+NBirWs=uekqKxMP65EQ@mail.gmail.com>
References: <1397072736-10793-1-git-send-email-matthias.bgg@gmail.com>
	<1397072736-10793-5-git-send-email-matthias.bgg@gmail.com>
	<CAL_JsqKq+D+c-qznP5aE3uyXf_YXyYzvoKRONAY7eXBkWcvqsw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKq+D+c-qznP5aE3uyXf_YXyYzvoKRONAY7eXBkWcvqsw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Vaussard <florian.vaussard-p8DiymsW2f8@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Silvio F <silvio.fricke-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko.stuebner-K3U4GQvHnyU@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-doc-u79uwXL29TbrhsbdSgBK9A@public.gmane.org
List-Id: devicetree@vger.kernel.org

2014-04-09 23:39 GMT+02:00 Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> On Wed, Apr 9, 2014 at 2:45 PM, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Signed-off-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  arch/arm/Kconfig.debug            |   49 +++++++++++++++++++++++++++++++++++--
>>  arch/arm/include/debug/mediatek.S |   38 ++++++++++++++++++++++++++++
>>  2 files changed, 85 insertions(+), 2 deletions(-)
>>  create mode 100644 arch/arm/include/debug/mediatek.S
>>
>> diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
>> index 4a2fc0b..dc51495 100644
>> --- a/arch/arm/Kconfig.debug
>> +++ b/arch/arm/Kconfig.debug
>> @@ -797,6 +797,38 @@ choice
>>                   Say Y here if you want kernel low-level debugging support
>>                   on Ux500 based platforms.
>>
>> +       config DEBUG_MTK6589_UART0
>> +               depends on ARCH_MEDIATEK
>> +               bool "Mediatek mt6589 UART0"
>> +               select DEBUG_UART_MEDIATEK
>> +               help
>> +                 Say Y here if you want kernel low-level debugging support
>> +                 on Mediatek mt6589 based platforms.
>> +
>> +       config DEBUG_MTK6589_UART1
>> +               depends on ARCH_MEDIATEK
>> +               bool "Mediatek mt6589 UART1"
>> +               select DEBUG_UART_MEDIATEK
>> +               help
>> +                 Say Y here if you want kernel low-level debugging support
>> +                 on Mediatek mt6589 based platforms.
>> +
>> +       config DEBUG_MTK6589_UART2
>> +               depends on ARCH_MEDIATEK
>> +               bool "Mediatek mt6589 UART2"
>> +               select DEBUG_UART_MEDIATEK
>> +               help
>> +                 Say Y here if you want kernel low-level debugging support
>> +                 on Mediatek mt6589 based platforms.
>> +
>> +       config DEBUG_MTK6589_UART3
>> +               depends on ARCH_MEDIATEK
>> +               bool "Mediatek mt6589 UART3"
>> +               select DEBUG_UART_MEDIATEK
>> +               help
>> +                 Say Y here if you want kernel low-level debugging support
>> +                 on Mediatek mt6589 based platforms.
>> +
>
> Do you really need all uarts defined? Only define what you have boards using.
>
> Also, you have no uarts defined in your dts. Please add them there
> (and any necessary serial driver) before adding debug functionality.
> Otherwise, you can't actually boot a multi-platform kernel with this
> series.

Up to now, there no serial driver exists. Should I skip this patch and
re-submit it when the serial driver is integrated?


-- 
motzblog.wordpress.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
