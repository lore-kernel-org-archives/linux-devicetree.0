From: Stefan Assmann <sassmann-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 1/2] mfd: twl-core: move TWL6030 defines to twl.h
Date: Thu, 31 Jul 2014 10:46:30 +0200
Message-ID: <53DA0266.6080807@kpanic.de>
References: <1406728949-7560-1-git-send-email-sassmann@kpanic.de> <1406728949-7560-2-git-send-email-sassmann@kpanic.de> <20140731083611.GI9030@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140731083611.GI9030@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, t-kristo-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 31.07.2014 10:36, Lee Jones wrote:
> On Wed, 30 Jul 2014, Stefan Assmann wrote:
> 
>> These defines should be available to all drivers. Also added register
>> offset for CLK32KG_CFG_STATE and GRP defines.
>>
>> Signed-off-by: Stefan Assmann <sassmann-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>
>> ---
>>  drivers/regulator/twl-regulator.c | 11 -----------
>>  include/linux/i2c/twl.h           | 20 ++++++++++++++++++++
>>  2 files changed, 20 insertions(+), 11 deletions(-)
> 
> This doesn't have anything to do with MFD?
> 

I added mfd because many other commits in include/linux/i2c/twl.h
reference it. We can drop it if you like.

  Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
