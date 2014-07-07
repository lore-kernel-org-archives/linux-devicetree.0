From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 00/18] AT91: cleanup of the reset and poweroff code
Date: Mon, 7 Jul 2014 17:01:26 +0200
Message-ID: <20140707150126.GE3113@piout.net>
References: <1404743131-24569-1-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1404743131-24569-1-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Boris Brezillon <boris-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/07/2014 at 16:25:13 +0200, Maxime Ripard wrote :
> Hi,
> 
> This patchset is an attempt to further cleanup mach-at91 by removing
> code that can be put into a driver nowadays.
> 
> This time, the target is the reset and poweroff code, that can now be
> put in drivers/power/reset.
> 

Apart from my two other comments, I'm fine with the full series.

> Maxime
> 
> Changes from v1:
>   - Added the missing copyrights in the new reset and poweroff drivers
>   - Renamed the platform names for the reset driver to match the name
>     of the first SoC that introduced them
>   - Fixed a few typos in the commit logs
>   - Added missing comments in the assembly code in the reset driver
>   - Splitted the reset probe to handle the DT and platform probe in
>     separate functions.
> 
> Maxime Ripard (18):
>   power: reset: Add if statement isntead of multiple depends on
>   AT91: setup: Switch to pr_fmt
>   AT91: G45: DT: Declare a second ram controller
>   AT91: Rework ramc mapping code
>   AT91: SAMA5D3: DT: Add shutdown controller
>   power: reset: Add AT91 reset driver
>   AT91: DT: Remove the old-style reset probing
>   AT91: soc: Introduce register_devices callback
>   AT91: Probe the reset driver
>   AT91: Call at91_register_devices in the board files
>   AT91: Remove reset code from the machine code
>   power: reset: Add AT91 poweroff driver
>   AT91: DT: Remove poweroff DT probing
>   AT91: Register the poweroff driver
>   AT91: Remove poweroff code
>   AT91: pm: Remove show_reset_status function
>   AT91: Remove rstc and shdwnc global base addresses
>   AT91: Remove rstc and shdwc headers
> 
>  arch/arm/boot/dts/at91sam9g45.dtsi      |   8 +-
>  arch/arm/boot/dts/sama5d3.dtsi          |   5 +
>  arch/arm/mach-at91/Kconfig              |   8 --
>  arch/arm/mach-at91/Makefile             |   2 -
>  arch/arm/mach-at91/at91_rstc.h          |  53 -------
>  arch/arm/mach-at91/at91_shdwc.h         |  50 -------
>  arch/arm/mach-at91/at91sam9260.c        |  45 +++++-
>  arch/arm/mach-at91/at91sam9261.c        |  45 +++++-
>  arch/arm/mach-at91/at91sam9263.c        |  45 +++++-
>  arch/arm/mach-at91/at91sam9_alt_reset.S |  40 ------
>  arch/arm/mach-at91/at91sam9g45.c        |  49 ++++++-
>  arch/arm/mach-at91/at91sam9g45_reset.S  |  45 ------
>  arch/arm/mach-at91/at91sam9rl.c         |  45 +++++-
>  arch/arm/mach-at91/board-afeb-9260v1.c  |   2 +
>  arch/arm/mach-at91/board-cam60.c        |   2 +
>  arch/arm/mach-at91/board-cpu9krea.c     |   2 +
>  arch/arm/mach-at91/board-flexibity.c    |   2 +
>  arch/arm/mach-at91/board-sam9-l9260.c   |   2 +
>  arch/arm/mach-at91/board-sam9260ek.c    |   3 +-
>  arch/arm/mach-at91/board-sam9261ek.c    |   3 +-
>  arch/arm/mach-at91/board-sam9263ek.c    |   3 +-
>  arch/arm/mach-at91/board-sam9m10g45ek.c |   3 +-
>  arch/arm/mach-at91/board-sam9rlek.c     |   3 +-
>  arch/arm/mach-at91/board-snapper9260.c  |   2 +
>  arch/arm/mach-at91/generic.h            |  10 +-
>  arch/arm/mach-at91/pm.c                 |  72 ----------
>  arch/arm/mach-at91/setup.c              | 178 ++++-------------------
>  arch/arm/mach-at91/soc.h                |   1 +
>  drivers/power/reset/Kconfig             |  31 ++--
>  drivers/power/reset/Makefile            |   2 +
>  drivers/power/reset/at91-poweroff.c     | 156 ++++++++++++++++++++
>  drivers/power/reset/at91-reset.c        | 246 ++++++++++++++++++++++++++++++++
>  32 files changed, 701 insertions(+), 462 deletions(-)
>  delete mode 100644 arch/arm/mach-at91/at91_rstc.h
>  delete mode 100644 arch/arm/mach-at91/at91_shdwc.h
>  delete mode 100644 arch/arm/mach-at91/at91sam9_alt_reset.S
>  delete mode 100644 arch/arm/mach-at91/at91sam9g45_reset.S
>  create mode 100644 drivers/power/reset/at91-poweroff.c
>  create mode 100644 drivers/power/reset/at91-reset.c
> 
> -- 
> 2.0.1
> 

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
