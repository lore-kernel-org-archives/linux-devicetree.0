From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 3/3] mfd: tps65912: Rewrite driver adding DT support
 and using regmap
Date: Wed, 23 Sep 2015 13:49:40 -0500
Message-ID: <5602F444.7030209@ti.com>
References: <1443024459-15770-1-git-send-email-afd@ti.com>
 <1443024459-15770-4-git-send-email-afd@ti.com>
 <20150923175317.GU30445@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150923175317.GU30445-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/23/2015 12:53 PM, Mark Brown wrote:
> On Wed, Sep 23, 2015 at 11:07:39AM -0500, Andrew F. Davis wrote:
>
>>   drivers/gpio/Kconfig                   |   6 +
>>   drivers/gpio/Makefile                  |   1 +
>>   drivers/gpio/gpio-tps65912.c           | 138 ++++++++++++
>>   drivers/mfd/Kconfig                    |  24 ++
>>   drivers/mfd/Makefile                   |   3 +
>>   drivers/mfd/tps65912-core.c            | 114 ++++++++++
>>   drivers/mfd/tps65912-i2c.c             |  86 ++++++++
>>   drivers/mfd/tps65912-spi.c             |  85 +++++++
>>   drivers/regulator/Kconfig              |   6 +
>>   drivers/regulator/Makefile             |   1 +
>>   drivers/regulator/tps65912-regulator.c | 240 ++++++++++++++++++++
>>   include/linux/mfd/tps65912.h           | 393 +++++++++++++++++++++++++++++++++
>
> Please submit this like a normal driver, not as one enormous patch
> covering every subsystem.
>

OK, I'll break-out the regulator and gpio into their own patches and
send this series again, sorry about the noise.

Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
