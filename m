From: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 0/4] ARM: keystone: enable gpio support
Date: Mon, 10 Feb 2014 10:53:42 -0500
Message-ID: <52F8F606.3020107@ti.com>
References: <1392050481-19086-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392050481-19086-1-git-send-email-grygorii.strashko-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ivan.khoronzhuk-l0cyMroinI0@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 10 February 2014 11:41 AM, Grygorii Strashko wrote:
> This series adds Keystone GPIO IP definition in DT and enable GPIO support in
> Keystone configuration file.
> 
> Also, it enables LEDs support for Keystone 2 K2H EVM as specified in board 
> schematic. For more information see:
> - http://www.advantech.com/Support/TI-EVM/EVMK2HX.aspx 
> 
> Changes in v3:
>  - rebased on top 3.14 + "[PATCH v2] arm: dts: keystone: add watchdog entry"
>    http://www.spinics.net/lists/devicetree/msg20211.html
> 
> [v1-v2] http://www.spinics.net/lists/arm-kernel/msg294655.html
> 
> Grygorii Strashko (4):
>   ARM: dts: keystone: add gpio device entry
>   ARM: dts: keystone-evm: add leds supports
>   ARM: keystone_defconfig: enable gpio support
>   ARM: keystone_defconfig: enable led support
> 
Thanks for reposting the patchset Grygorii. I will
take them for the 3.15.

Would be good to get the blessing from DT folks
on first two patches.

Regards,
Santosh

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
