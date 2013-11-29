From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v4 0/5] Update Davinci watchdog driver
Date: Fri, 29 Nov 2013 15:18:53 +0200
Message-ID: <5298943D.8010608@ti.com>
References: <1385556508-3935-1-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385556508-3935-1-git-send-email-ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel.Moll-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Sekhar,

On 11/27/2013 02:48 PM, Ivan Khoronzhuk wrote:
> These patches are intended to update Davinci watchdog to use WDT core
> and reuse driver for keystone arch, because Keystone uses the similar
> IP like Davinci.
> 
> See Documentation:
> Davinci DM646x - http://www.ti.com/lit/ug/spruer5b/spruer5b.pdf
> Keystone - http://www.ti.com/lit/ug/sprugv5a/sprugv5a.pdf
> 
> Also:
>   - improved to support GET_TIMELEFT option.
>   - added "clocks" and "timeout-sec" properties to DT.

Do you have any additional comments to this series?

By the way patch "[PATCH] watchdog: davinci: rename platform driver to davinci-wdt"
https://lkml.org/lkml/2013/11/27/201 can be applied as before as after this series
without conflicts.

> 
> Based on
> git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone.git
> keystone/master
> 
> v3..v4:
> - watchdog: davinci: change driver to use WDT core
> 	reverted rename of platform driver to "davinci-wdt"
> 	as it causes a regression on Davinci platforms.
> 
[...]
> 
> Ivan Khoronzhuk (5):
>    watchdog: davinci: change driver to use WDT core
>    watchdog: davinci: use davinci_wdt_device structure to hold device
>      data
>    watchdog: davinci: add GET_TIMELEFT option support
>    watchdog: davinci: add "timeout-sec" property
>    watchdog: davinci: reuse driver for keystone arch
> 
>   .../devicetree/bindings/watchdog/davinci-wdt.txt   |   16 +-
>   drivers/watchdog/Kconfig                           |    6 +-
>   drivers/watchdog/davinci_wdt.c                     |  221 +++++++++-----------
>   3 files changed, 114 insertions(+), 129 deletions(-)
> 


Regards,
-grygorii
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
