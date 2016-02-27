From: Florian Fainelli <florian.fainelli-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 1/5] arm64: Broadcom Vulcan support
Date: Sat, 27 Feb 2016 12:03:01 -0800
Message-ID: <56D200F5.7010505@broadcom.com>
References: <56C8C38E.50007@gmail.com>
 <1456555925-11583-1-git-send-email-jchandra@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456555925-11583-1-git-send-email-jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jayachandran C <jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
Cc: Zi Shen Lim <zlim-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 26/02/16 22:52, Jayachandran C wrote:
> From: Zi Shen Lim <zlim-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> 
> Add a configuration option and a device tree for Broadcom's Vulcan
> ARM64 processor. vulcan.dtsi has the on-chip blocks like the PCIe
> controller, GICv3 with ITS, PMU, system timer and the pl011 UART.
> vulcan-eval.dts has definitions for a basic evaluation board.
> 
> Vulcan's processor cores support the ARMv8.1 instruction set and
> will use "brcm,vulcan" as the compatible property. The firmware
> has PSCI 0.2 support for cpu wakeup.
> 
> Signed-off-by: Zi Shen Lim <zlim-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> [ updated and split dts - jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org ]
> Signed-off-by: Jayachandran C <jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> ---
> 
> There is a minor update to this patch.
> 
> After some discussions here, it looks like it is necessary to increase the
> PCI mem and mem64 ranges to support all the use cases. We are updating the
> firmware to use these ranges as well.
> 
> Hope it is not too late to fix this, sorry for the late churn.

V2 got merged already into next/dt64 by the arm-soc maintainers, could
you provide an incremental patch to your v2? Thanks!
--
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
