From: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/6] pinctrl: sunxi: Add H3 PIO controller support
Date: Sat, 09 May 2015 11:17:51 +0200
Message-ID: <554DD0BF.9080108@gmail.com>
References: <1430904693-1404-1-git-send-email-jenskuske@gmail.com>	 <1430904693-1404-4-git-send-email-jenskuske@gmail.com> <1430986247.8171.37.camel@x220>
Reply-To: jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCC5XIE2SIHBBQ5BW6VAKGQE4ZCOIFI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1430986247.8171.37.camel@x220>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: =?UTF-8?B?RW1pbGlvIEzDs3Bleg==?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 07/05/15 10:10, Paul Bolle wrote:
> On Wed, 2015-05-06 at 11:31 +0200, Jens Kuske wrote:
>> --- a/drivers/pinctrl/sunxi/Kconfig
>> +++ b/drivers/pinctrl/sunxi/Kconfig
>  
>> +config PINCTRL_SUN8I_H3
>> +	def_bool MACH_SUN8I
>> +	select PINCTRL_SUNXI_COMMON
> 
>> --- a/drivers/pinctrl/sunxi/Makefile
>> +++ b/drivers/pinctrl/sunxi/Makefile
> 
>> +obj-$(CONFIG_PINCTRL_SUN8I_H3)		+= pinctrl-sun8i-h3.o
> 
> PINCTRL_SUN8I_H3 is a bool symbol, so pinctrl-sun8i-h3.o will never be
> part of a module, right?
> 
> (Note that PINCTRL_SUN8I_H3 appears to be an alias for MACH_SUN8I. Ie,
> these two symbols operate in lockstep.)
> 
>> --- /dev/null
>> +++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c
> 
>> +#include <linux/module.h>
> 
>> +MODULE_DEVICE_TABLE(of, sun8i_h3_pinctrl_match);
> 
>> +MODULE_AUTHOR("Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>");
>> +MODULE_DESCRIPTION("Allwinner H3 pinctrl driver");
>> +MODULE_LICENSE("GPL");
> 
> This adds some module specific boilerplate. Was it perhaps your
> intention to make PINCTRL_SUN8I_H3 a tristate symbol?
> 

I don't know to be honest, I just followed the pattern of all the other
pinctrl-sun?i-*.c files. But it sounds logical that this is needless
in the current state.

Looks like it got introduced when splitting up the driver:
http://lists.infradead.org/pipermail/linux-arm-kernel/2014-April/251712.html

Maybe there were plans to use separate modules some day. If not, we
should remove it from the other files as well I guess. Maxime, could
you please comment on that?

Regards,
Jens
