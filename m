From: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH V4 6/7] MAINTAINERS: Entry for Cygnus/iproc arm architecture
 and clock drivers
Date: Thu, 9 Oct 2014 16:18:07 -0700
Message-ID: <543717AF.6090500@broadcom.com>
References: <Scott Branden <sbranden@broadcom.com>	 <1412894671-5921-1-git-send-email-sbranden@broadcom.com>	 <1412894671-5921-7-git-send-email-sbranden@broadcom.com> <1412895651.8770.7.camel@joe-AO725>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412895651.8770.7.camel@joe-AO725>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Cc: Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Antti Palosaari <crope-X3B1VOXEql0@public.gmane.org>, JD Zheng <jdzheng-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 14-10-09 04:00 PM, Joe Perches wrote:
> On Thu, 2014-10-09 at 15:44 -0700, Scott Branden wrote:
>> Acked-by: Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Signed-off-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> ---
>>   MAINTAINERS |   17 ++++++++++++++++-
>>   1 file changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index a12edf2..0900082 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -2071,9 +2071,24 @@ L:	linux-scsi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>   S:	Supported
>>   F:	drivers/scsi/bnx2i/
>>
>> -BROADCOM KONA GPIO DRIVER
>> +BROADCOM CYGNUS/IPROC ARM ARCHITECTURE
>>   M:	Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> +M:	Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> +L:	linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org (moderated for non-subscribers)
>>   L:	bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/arm/bcm/cygnus.txt
>> +F:	arch/arm/boot/dts/bcm-cygnus.dtsi
>> +F:	arch/arm/boot/dts/bcm911360_entphn.dts
>> +F:	arch/arm/configs/bcm_cygnus_defconfig
>> +F:	arch/arm/mach-bcm/bcm_cygnus.c
>> +F:	Documentation/devicetree/bindings/clock/clk-cygnus.txt
>> +F:	Documentation/devicetree/bindings/clock/clk-iproc.txt
>> +F:	drivers/clk/bcm/clk-cygnus.c
>> +F:	drivers/clk/bcm/clk-iproc.c
>> +
>> +BROADCOM KONA GPIO DRIVER
>> +M:	Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>   S:	Supported
>>   F:	drivers/gpio/gpio-bcm-kona.c
>>   F:	Documentation/devicetree/bindings/gpio/gpio-bcm-kona.txt
>
> This drops this L line from BROADCOM KONA GPIO DRIVER
> L:	bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
>
> Is that what you want?
Wow, sorry.  I'll correct after further comments.
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
