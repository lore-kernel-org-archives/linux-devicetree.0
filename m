From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 0/2] SoC driver for Broadcom STB DPFE
Date: Thu, 24 Aug 2017 17:54:42 -0700
Message-ID: <e98bdead-41e3-dd04-c13a-5ef734569796@gmail.com>
References: <20170824233626.1343-1-code@mmayer.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170824233626.1343-1-code-7CzEARzsJhSsTnJN9+BGXg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Markus Mayer <code-7CzEARzsJhSsTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Markus Mayer <mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Broadcom Kernel List <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Device Tree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/24/2017 04:36 PM, Markus Mayer wrote:
> From: Markus Mayer <mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> 
> This series introduces a driver to interact with the Broadcom STB DDR
> PHY Front End (DPFE), specifically to communicate with the DCPU that is
> part of the DDR PHY and which is running its own firmware.
> 
> The DCPU provides information such as DRAM refresh rate, which can be
> used as indirect indicator for the DRAM temperature (the higher the
> refresh rate, the hotter the RAM).
> 
> The series was previously submitted as HWMON driver[1]. It has been
> removed from that subsystem, because it doesn't provide any standard
> HWMON data due to hardware design properties, and is now implemented as
> SoC driver.
> 
> Changes since v2:
>   - moved driver from drivers/soc/bcm/brcmstb to drivers/memory
>   - renamed the driver from dpfe.c to brcmstb_dpfe.c
>   - added le32_to_cpu() in a few places (where be32_to_cpu() calls
>     already existed)
>   - added a little blurb what the le32_to_cpu()/be32_to_cpu() business
>     is all about
> 
> Changes since v1:
>   - binding simplified to use one node with three memory regions
>     instead of three nodes with one region
>   - no longer part of the HWMON subsystem
>   - better error handling and error reporting to userland
>   - uses [readl|writel]_relaxed() directly, since there is no need for
>     wrappers doing endian conversion
>   - re-download firmware upon "resume"
>   - minor changes to improve clarity
> 
> [1] https://lkml.org/lkml/2017/4/18/640

Applied, thanks Markus! Will get that resubmitted in a short while:

https://github.com/Broadcom/stblinux/commits/drivers/next
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
