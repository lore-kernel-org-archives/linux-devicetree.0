From: Zhi Li <lznuaa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 07/11] ARM: imx: add msl support for imx7d
Date: Tue, 21 Apr 2015 10:19:35 -0500
Message-ID: <CAHrpEqR+7dnBgP2eYUmYVqX2KeCffUX6HFb6AnXnS1ETKP2_aw@mail.gmail.com>
References: <1429628007-8892-1-git-send-email-Frank.Li@freescale.com>
	<1429628007-8892-8-git-send-email-Frank.Li@freescale.com>
	<20150421151225.GZ12732@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150421151225.GZ12732-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: "Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 21, 2015 at 10:12 AM, Russell King - ARM Linux
<linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> On Tue, Apr 21, 2015 at 10:53:23PM +0800, Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org wrote:
>> diff --git a/arch/arm/mach-imx/mx7.h b/arch/arm/mach-imx/mx7.h
>> new file mode 100644
>> index 0000000..bfef936
>> --- /dev/null
>> +++ b/arch/arm/mach-imx/mx7.h
>> @@ -0,0 +1,38 @@
>> +/*
>> + * Copyright (C) 2015 Freescale Semiconductor, Inc. All Rights Reserved.
>> + */
>> +
>> +/*
>> + *  * This program is free software; you can redistribute it and/or modify
>> + *   * it under the terms of the GNU General Public License version 2 as
>> + *    * published by the Free Software Foundation.
>> + *     */
>
> Something obviously went wrong here.

Sorry for that. I will fix at next version.

>
> --
> FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
> according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
