From: George Cherian <george.cherian-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 0/5] Add dt support for extcon gpio driver
Date: Tue, 16 Sep 2014 12:11:33 +0530
Message-ID: <5417DB9D.8090000@ti.com>
References: <1410236078-11713-1-git-send-email-george.cherian@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410236078-11713-1-git-send-email-george.cherian-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rongjun.ying-kQvG35nSl+M@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Chanwoo,

Could you please look into this series?

On 09/09/2014 09:44 AM, George Cherian wrote:
> This series
>          - Convert extcon-gpio driver to use gpiod_* API's
>          - Adds dt support to extcon-gpio driver.
> 	- Add cable name support in case of dt.
>
> George Cherian (5):
>    extcon: gpio: Minor cleanups
>    extcon: gpio: Convert the driver to use gpio desc API's
>    extcon: gpio: Add dt support for the driver.
>    extcon: gpio: Always use  gpio_get_value_cansleep
>    extcon: gpio: Add support for using cable names
>
>   .../devicetree/bindings/extcon/extcon-gpio.txt     |  23 +++++
>   drivers/extcon/extcon-gpio.c                       | 100 +++++++++++++--------
>   include/linux/extcon/extcon-gpio.h                 |   4 +-
>   3 files changed, 89 insertions(+), 38 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/extcon/extcon-gpio.txt
>
Regards
-George
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
