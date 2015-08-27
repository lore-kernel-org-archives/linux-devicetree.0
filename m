From: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 0/5] Add Broadcom Northstar Plus Support
Date: Thu, 27 Aug 2015 16:35:30 -0700
Message-ID: <55DF9EC2.4060902@broadcom.com>
References: <1440628530-6137-1-git-send-email-jonmason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440628530-6137-1-git-send-email-jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Patchset all look good.
Acked-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

On 15-08-26 03:35 PM, Jon Mason wrote:
>
> Changes in version 2 incorporate Olof's comments regarding:
> * the removal of all "Reviewed-by" lines not occurring on external
>    mailing lists
> * reordering of s-o-b lines
> * modification of the device tree file to use labels when enabling
> * increated description of the modification to the MAINTAINERS entry
>
> Also, modifying the "to" and "cc" recepients so that everyone is
> receving all of the patches.
>
> --
>
> This patch series adds support for the Broadcom Northstar Plus family of
> SoCs.  NSP is a Cortex A9 based SoC under the Broadcom iProc family.
>
> Jon Mason (5):
>    dt-bindings: Create Documentation for NSP DT bindings
>    ARM: NSP: add minimal Northstar Plus device tree
>    ARM: NSP: Add basic support for Broadcom Northstar Plus SoC
>    ARM: multi_v7_defconfig: Add NSP to defconfig
>    MAINTAINERS: add entry for the Broadcom Northstar Plus SoCs
>
>   .../devicetree/bindings/arm/bcm/brcm,nsp.txt       |  34 +++++++
>   MAINTAINERS                                        |  12 ++-
>   arch/arm/boot/dts/Makefile                         |   2 +
>   arch/arm/boot/dts/bcm-nsp.dtsi                     | 105 +++++++++++++++++++++
>   arch/arm/boot/dts/bcm958625k.dts                   |  57 +++++++++++
>   arch/arm/configs/multi_v7_defconfig                |   1 +
>   arch/arm/mach-bcm/Kconfig                          |  14 +++
>   arch/arm/mach-bcm/Makefile                         |   5 +-
>   arch/arm/mach-bcm/bcm_nsp.c                        |  25 +++++
>   9 files changed, 252 insertions(+), 3 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,nsp.txt
>   create mode 100644 arch/arm/boot/dts/bcm-nsp.dtsi
>   create mode 100644 arch/arm/boot/dts/bcm958625k.dts
>   create mode 100644 arch/arm/mach-bcm/bcm_nsp.c
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
