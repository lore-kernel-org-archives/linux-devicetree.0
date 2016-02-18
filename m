From: Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [1/4] arm64: Broadcom Vulcan support
Date: Thu, 18 Feb 2016 10:15:11 -0800
Message-ID: <0c75ddd6-d353-bb73-62e4-bae0ff95a3b0@broadcom.com>
References: <1455389195-31870-2-git-send-email-jchandra@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455389195-31870-2-git-send-email-jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Jayachandran C." <jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Zi Shen Lim <zlim-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

+ bcm-kernel-feedback-list mailing list

On 2/13/2016 10:46 AM, Jayachandran C. wrote:
> From: Zi Shen Lim <zlim-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>
> Add a configuration option and a device tree for Broadcom's Vulcan
> ARM64 processor. brcm-vulcan.dtsi has the on-chip blocks like the
> PCIe controller, GICv3 with ITS, PMU, system timer and pl011 UART.
> brcm-vulcan-eval.dts has definitions for a basic evaluation board.
> The firmware supports PSCI 0.2 for cpu wakeup.
>
> Signed-off-by: Zi Shen Lim <zlim-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> [ updated and split dts - jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org ]
> Signed-off-by: Jayachandran C <jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>
> ---
> arch/arm64/Kconfig.platforms                      |   5 +
>  arch/arm64/boot/dts/broadcom/Makefile             |   1 +
>  arch/arm64/boot/dts/broadcom/brcm-vulcan-eval.dts |  33 +++++
>  arch/arm64/boot/dts/broadcom/brcm-vulcan.dtsi     | 146 ++++++++++++++++++++++
>  4 files changed, 185 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/broadcom/brcm-vulcan-eval.dts
>  create mode 100644 arch/arm64/boot/dts/broadcom/brcm-vulcan.dtsi

Could you please name the files "vulcan.dtsi" and "vulcan-eval.dts" so 
it's consistent with the rest of files in the same directory?

Thanks,

Ray
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
