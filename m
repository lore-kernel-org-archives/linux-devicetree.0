From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL 3.19] Broadcom Cygnus SoC platform support
Date: Thu, 20 Nov 2014 13:11:14 +0100
Message-ID: <201411201311.14549.arnd@arndb.de>
References: <1415826266-6867-1-git-send-email-f.fainelli@gmail.com> <1415826266-6867-4-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415826266-6867-4-git-send-email-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, jdzheng-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 12 November 2014, Florian Fainelli wrote:
> The following changes since commit f114040e3ea6e07372334ade75d1ee0775c355e1:
> 
>   Linux 3.18-rc1 (2014-10-19 18:08:38 -0700)
> 
> are available in the git repository at:
> 
>   http://github.com/brcm/linux.git tags/arm-soc/for-3.19/cygnus-platform-v2
> 
> for you to fetch changes up to 64e74aa788f996cd0e328a1c4223e9d438b78e9c:
> 
>   ARM: mach-bcm: ARCH_BCM_MOBILE: remove one level of menu from Kconfig (2014-11-11 22:35:45 -0800)
> 
> ----------------------------------------------------------------
> This pull request contains the platform code to support the Broadcom Cygnus SoC
> using the iProc architecture:
> 
> - add support for the Broadcom Cygnus SoC
> - consolidate the BCM5301X Kconfig options under the iProc menuconfig entry
> - remove one level of menu in menuconfig
> 
> ----------------------------------------------------------------
> Jonathan Richardson (1):
>       ARM: cygnus: Initial support for Broadcom Cygnus SoC
> 
> Scott Branden (2):
>       ARM: mach-bcm: Consolidate currently supported IPROC SoCs
>       ARM: mach-bcm: ARCH_BCM_MOBILE: remove one level of menu from Kconfig
> 
>  arch/arm/mach-bcm/Kconfig      | 93 ++++++++++++++++++++++++++----------------
>  arch/arm/mach-bcm/Makefile     |  3 ++
>  arch/arm/mach-bcm/bcm_cygnus.c | 25 ++++++++++++
>  3 files changed, 85 insertions(+), 36 deletions(-)
>  create mode 100644 arch/arm/mach-bcm/bcm_cygnus.c
> 

Pulled into next/soc, thanks!

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
