From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v4 0/2] ARM64: Enable SP805 WDT support for FSL LS2080A
Date: Thu, 14 Apr 2016 16:48:40 +0100
Message-ID: <570FBBD8.4030704@arm.com>
References: <1451296884-7932-1-git-send-email-bhupesh.sharma@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1451296884-7932-1-git-send-email-bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bhupesh Sharma <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, LeoLi-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Catalin.Marinas-5wv7dgnIgG8@public.gmane.org, stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, bhupesh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Bhupesh,

On 28/12/15 10:01, Bhupesh Sharma wrote:
> Hi Arnd, Kevin, Olof
> 
> This is the v4 of patchset which adds the support for SP805 WDT on FSL LS2080A
> and also adds the missing documentation of SP805 WDT device-tree bindings.
> 
> Rebased against arm-soc/next/dt
> 
> Changes since v3:
> (v3 can be viewed here: https://www.mail-archive.com/devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg97249.html)
> - Added Rob's Acked-by for patch 1/2.
> - Sending to 'arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org' list and also cc'ed Shawn Guo
> 
> Changes since v2:
> (v2 can be viewed here: http://permalink.gmane.org/gmane.linux.ports.arm.kernel/463141)
> - Addressed Rob's comments regarding the second mandatory CLK source's
>   (WDOGCLK) name in the bindings.
> 
> Changes since v1:
> (v1 can be viewed here: http://www.spinics.net/lists/devicetree/msg102487.html)
> 
> - Addressed Rob and Mark's comments regarding the mandatory CLK sources
> - Removed interrupt property from the bindings for now (as discussed
>   with Mark on IRC) till Will's patch proceeds further and enables
>   handling the WDOG interrupts for each core connected to the same PPI
>   line (http://lists.infradead.org/pipermail/linux-arm-kernel/2015-December/391616.html)

Will just pointed me to this series. I've recently posted a set of
patches that should be able to deal with the quirkiness of your HW with
regards to PPIs:

http://thread.gmane.org/gmane.linux.drivers.devicetree/163464

Could you please let me know if this works for you?

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
