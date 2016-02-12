From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/6] More updates for NS2 DT
Date: Fri, 12 Feb 2016 15:50:40 -0800
Message-ID: <56BE6FD0.3010103@gmail.com>
References: <1455084651-29325-1-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455084651-29325-1-git-send-email-anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yendapally Reddy Dhananjaya Reddy <yrdreddy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Vikram Prakash <vikramp-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/02/16 22:10, Anup Patel wrote:
> This patchset primarily adds more DT nodes for NS2 SVK. It also does
> minor update to arch/arm64/Kconfig.platforms and adds missing DT
> bindings document for sp805 driver.
> 
> The patchset is based on v4.5-rc3 tag and is available in ns2_dt2_v1
> branch of https://github.com/Broadcom/arm64-linux.git
> 
> All patches have been tested on Broadcom NS2 SVK.
> 
> Anup Patel (5):
>   arm64: Select COMMON_CLK_IPROC, PINCTRL and GPIOLIB for iProc SoCs
>   arm64: dts: Add SDHCI DT node for NS2
>   arm64: dts: Add ARM SP804 timer DT nodes for NS2
>   dt-bindings: watchdog: Add ARM SP805 DT bindings
>   arm64: dts: Add ARM SP805 watchdog DT node for NS2
> 
> Ray Jui (1):
>   arm64: dts: Add PCIe0 and PCIe4 DT nodes for NS2

Patch 1 applied to soc-arm64/next

Patch 2-6 applied to devicetree-arm64/next, with Rob's Acked-by and the
suggested rename from wdt@ to watchdog@ that he recommended, thanks
everyone!
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
