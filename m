From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH v5 8/9] rtc: st: add new driver for ST's LPC RTC
Date: Wed, 04 Mar 2015 20:24:32 +0100
Message-ID: <1425497072.2090.4.camel@tiscali.nl>
References: <1425492398-27340-1-git-send-email-lee.jones@linaro.org>
	 <1425492398-27340-9-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425492398-27340-9-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, rtc-linux@googlegroups.com, wim@iguana.be, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux@roeck-us.net, david.paris@st.com, a.zummo@towertech.it
List-Id: devicetree@vger.kernel.org

Lee Jones schreef op wo 04-03-2015 om 18:06 [+0000]:
> --- /dev/null
> +++ b/drivers/rtc/rtc-st-lpc.c
> @@ -0,0 +1,354 @@
> +/*
> + * rtc-st-lpc.c - ST's LPC RTC, powered by the Low Power Timer
> + *
> + * Copyright (C) 2014 STMicroelectronics Limited
> + *
> + * Author: David Paris <david.paris@st.com> for STMicroelectronics
> + *         Lee Jones <lee.jones@linaro.org> for STMicroelectronics
> + *
> + * Based on the original driver written by Stuart Menefy.
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public Licence
> + * as published by the Free Software Foundation; either version
> + * 2 of the Licence, or (at your option) any later version.
> + */

This states the license is GPL v2 or later.

> +MODULE_LICENSE("GPLv2");

This will taint the kernel at module load, won't it? You probably meant
"GPL v2", but only
    MODULE_LICENSE("GPL");

correctly matches the license in the comment at the top of this file. 

(I assume I missed all this when looking at the v4 series.)


Paul Bolle
