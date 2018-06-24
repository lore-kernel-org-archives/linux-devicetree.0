Return-Path: <SRS0=W15n=JK=gmail.com=jacek.anaszewski@kernel.org>
Subject: Re: [PATCH] leds: lt3593: sync module license information with header
References: <20180623195729.1429-1-daniel@zonque.org>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <6c0d3789-5271-278d-c3a7-5889c004298c@gmail.com>
Date: Sun, 24 Jun 2018 12:37:32 +0200
MIME-Version: 1.0
In-Reply-To: <20180623195729.1429-1-daniel@zonque.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Daniel Mack <daniel@zonque.org>, robh+dt@kernel.org
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Daniel,

Thank you for the patch.

On 06/23/2018 09:57 PM, Daniel Mack wrote:
> Use GPLv2 for both the module information and the header.
> 
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
>   drivers/leds/leds-lt3593.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-lt3593.c b/drivers/leds/leds-lt3593.c
> index f6aae616242e..90a8c86c5341 100644
> --- a/drivers/leds/leds-lt3593.c
> +++ b/drivers/leds/leds-lt3593.c
> @@ -202,5 +202,5 @@ module_platform_driver(lt3593_led_driver);
>   
>   MODULE_AUTHOR("Daniel Mack <daniel@zonque.org>");
>   MODULE_DESCRIPTION("LED driver for LT3593 controllers");
> -MODULE_LICENSE("GPL");
> +MODULE_LICENSE("GPLv2");

s/GPLv2/GPL v2/

checkpatch.pl would catch that.

I've fixed it up by myself and applied.

-- 
Best regards,
Jacek Anaszewski
