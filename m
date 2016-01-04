From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [PATCH 09/10] [media] tvp5150: Initialize the chip on probe
Date: Mon, 4 Jan 2016 09:53:05 -0300
Message-ID: <568A6B31.1080603@osg.samsung.com>
References: <201601042006.Dk9Wav4W%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201601042006.Dk9Wav4W%fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: kbuild-all-JC7UmRfGjtg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Enrico Butera <ebutera-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Enric Balletbo i Serra <eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eduard Gavin <egavinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

On 01/04/2016 09:40 AM, kbuild test robot wrote:
> Hi Javier,
> 
> [auto build test ERROR on linuxtv-media/master]
> [also build test ERROR on v4.4-rc8 next-20151231]
> [if your patch is applied to the wrong git tree, please drop us a note to help improving the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Javier-Martinez-Canillas/tvp5150-add-MC-and-DT-support/20160104-203224
> base:   git://linuxtv.org/media_tree.git master
> config: x86_64-randconfig-x008-01040711 (attached as .config)
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=x86_64 
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/media/i2c/tvp5150.c: In function 'tvp5150_init':
>>> drivers/media/i2c/tvp5150.c:1206:13: error: implicit declaration of function 'devm_gpiod_get_optional' [-Werror=implicit-function-declaration]
>      pdn_gpio = devm_gpiod_get_optional(&c->dev, "powerdown", GPIOD_OUT_HIGH);
>                 ^
>>> drivers/media/i2c/tvp5150.c:1206:59: error: 'GPIOD_OUT_HIGH' undeclared (first use in this function)
>      pdn_gpio = devm_gpiod_get_optional(&c->dev, "powerdown", GPIOD_OUT_HIGH);
>                                                               ^
>    drivers/media/i2c/tvp5150.c:1206:59: note: each undeclared identifier is reported only once for each function it appears in
>>> drivers/media/i2c/tvp5150.c:1211:3: error: implicit declaration of function 'gpiod_set_value_cansleep' [-Werror=implicit-function-declaration]
>       gpiod_set_value_cansleep(pdn_gpio, 0);
>

Sigh, it's caused by a missing include for the <linux/gpio/consumer.h> header.

Thanks for reporting, I'll wait a couple of days to see if I get more feedback
and then post a v2 fixing this.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
