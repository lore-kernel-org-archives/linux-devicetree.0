From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 0/6] Update Davinci watchdog driver
Date: Tue, 26 Nov 2013 21:40:50 +0200
Message-ID: <5294F942.8070401@ti.com>
References: <1385388285-10553-1-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385388285-10553-1-git-send-email-ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Sekhar,

On 11/25/2013 04:04 PM, Ivan Khoronzhuk wrote:
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
> 
> Based on
> git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone.git
> keystone/master
> 

Could you confirm that regression detected in v2 of series is gone?

Also would it be acceptable if this series will go via WDT tree?
- The first patch patch in series contains changes in both
 Davinci platform & wdt driver.

> v2..v3:
> - watchdog: davinci: change driver to use WDT core
> 	removed "ti,keystone-wdt" compatible from driver
> 	renamed wdt device names for mach-davinci from
> 		"watchdog" to "davinci-wdt"
> 
> - watchdog: davinci: reuse driver for keystone arch
> 	moved "clocks" property under "Optional properties"
> 	improved decsription of "clocks" property
> 
> - arm: dts: keystone: add watchdog entry
> 	replaced "ti,keystone-wdt" compatible on
> 		 "ti,keystone-wdt","ti,davinci-wdt"
> 
> Ivan Khoronzhuk (6):
>    watchdog: davinci: change driver to use WDT core
>    watchdog: davinci: use davinci_wdt_device structure to hold device
>      data
>    watchdog: davinci: add GET_TIMELEFT option support
>    watchdog: davinci: add "timeout-sec" property
>    watchdog: davinci: reuse driver for keystone arch
>    arm: dts: keystone: add watchdog entry
> 
>   .../devicetree/bindings/watchdog/davinci-wdt.txt   |   16 +-
>   arch/arm/boot/dts/keystone.dtsi                    |    6 +
>   arch/arm/mach-davinci/da8xx-dt.c                   |    2 +-
>   arch/arm/mach-davinci/devices-da8xx.c              |    4 +-
>   arch/arm/mach-davinci/devices.c                    |    2 +-
>   drivers/watchdog/Kconfig                           |    6 +-
>   drivers/watchdog/davinci_wdt.c                     |  225 +++++++++-----------
>   7 files changed, 126 insertions(+), 135 deletions(-)
> 

Thanks,
- grygorii
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
