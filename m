From: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [GIT PULL] Broadcom Device Tree changes for 4.2 (part 3)
Date: Wed, 10 Jun 2015 17:11:36 -0700
Message-ID: <7hioavgl3b.fsf@deeprootsystems.com>
References: <1433640869-12746-1-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433640869-12746-1-git-send-email-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> (Florian
	Fainelli's message of "Sat, 6 Jun 2015 18:34:28 -0700")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org, gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> The following changes since commit 9d7ef1b76c131f9b5e0a31fd1444d4fa6b8a841c:
>
>   ARM: dts: BCM63xx: re-parent NAND controller node (2015-05-27 09:57:34 -0700)
>
> are available in the git repository at:
>
>   https://github.com/Broadcom/stblinux tags/arm-soc/for-4.2/dts-part3
>
> for you to fetch changes up to 26343bdacfcdbf6ee3303d6078a015b908f90193:
>
>   ARM: BCM5301X: Add DT for Asus RT-AC87U (2015-06-06 16:13:16 -0700)
>
> ----------------------------------------------------------------
> This pull request contains Broadcom BCM5301x related changes:
>
> - Hauke adds the interrupt mapping for the BCM5301x PCIe controller
>
> - Haule adds support for NAND flash using the standard Broadcom NAND controller
>   iProc specific binding on BCM4708/5301x
>
> - Rafal adds support for the Asus RT-AC87U router
>
> ----------------------------------------------------------------

Pulled into next/dt,

Thanks,

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
