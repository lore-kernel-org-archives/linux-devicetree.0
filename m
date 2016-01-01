From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 RESEND 0/2] WM8505/WM8650 DT fixes for SD card controller
Date: Fri, 01 Jan 2016 15:29:29 +0100
Message-ID: <7786478.TezhYjHkEF@wuerfel>
References: <1451655492-2569-1-git-send-email-v1ron@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1451655492-2569-1-git-send-email-v1ron-JGs/UdohzUI@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roman Volkov <v1ron-JGs/UdohzUI@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux+armsoc-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexey Charkov <alchark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Roman Volkov <rvolkov-oLhuKTjYqW/YtjvyW6yDsg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 01 January 2016 16:38:10 Roman Volkov wrote:
> From: Roman Volkov <rvolkov-oLhuKTjYqW/YtjvyW6yDsg@public.gmane.org>
> 
> This patch set enables SD controller support for WM8650 and
> fixes minor errors in WM8505 Device Tree file.
> 
> Changes in v3:
> 1. Add minor fixes for WM8505 SDHC node
> 
> Tested on both WM8505 and WM8650.
> 
> Roman Volkov (2):
>   dts: vt8500: Add SDHC node to DTS file for WM8650
>   dts: vt8500: Fix errors in SDHC node for WM8505
> 
>  arch/arm/boot/dts/wm8505.dtsi | 4 ++--
>  arch/arm/boot/dts/wm8650.dtsi | 9 +++++++++
>  2 files changed, 11 insertions(+), 2 deletions(-)
> 
> -- 
> Hi maintainers, I see my previous versions were not applied. Could this
> little patch set be applied for the linux-next? I don't think this is new
> functionality, this must be considered as bugfix for existing Device Tree.
> 
> Any other suggestions?
> 

Applied both to next/dt, thanks a lot for following up!

Let me know if you think this should go into stable backports as well,
I did not apply it to the fixes branch as you don't have a
'Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org' tag and it has never worked so far.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
