Return-Path: <devicetree-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:48720 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751542Ab3HFNf2 (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 6 Aug 2013 09:35:28 -0400
Date: Tue, 6 Aug 2013 14:35:09 +0100
From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [RESEND PATCH 1/4] arm: socfpga: Enable ARM_TWD for socfpga
Message-ID: <20130806133509.GD25383@e106331-lin.cambridge.arm.com>
References: <1375739925-9110-1-git-send-email-dinguyen@altera.com>
 <1375739925-9110-2-git-send-email-dinguyen@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1375739925-9110-2-git-send-email-dinguyen@altera.com>
Sender: devicetree-owner@vger.kernel.org
To: "dinguyen@altera.com" <dinguyen@altera.com>
Cc: "dinh.linux@gmail.com" <dinh.linux@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Pawel Moll <Pawel.Moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pavel Machek <pavel@denx.de>, Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>, Stephen Boyd <sboyd@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, Aug 05, 2013 at 10:58:42PM +0100, dinguyen@altera.com wrote:
> From: Dinh Nguyen <dinguyen@altera.com>
> 
> Update Kconfig to enable TWD.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@altera.com>
> Tested-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> Reviewed-by: Pavel Machek <pavel@denx.de>
> CC: Arnd Bergmann <arnd@arndb.de>
> CC: Olof Johansson <olof@lixom.net>
> Cc: Rob Herring <rob.herring@calxeda.com>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Stephen Warren <swarren@wwwdotorg.org>
> Cc: Ian Campbell <ian.campbell@citrix.com>
> Cc: devicetree@vger.kernel.org
> Cc: Pavel Machek <pavel@denx.de>
> Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> ---
>  arch/arm/mach-socfpga/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-socfpga/Kconfig b/arch/arm/mach-socfpga/Kconfig
> index dd86db4..efad818 100644
> --- a/arch/arm/mach-socfpga/Kconfig
> +++ b/arch/arm/mach-socfpga/Kconfig
> @@ -11,6 +11,7 @@ config ARCH_SOCFPGA
>  	select GENERIC_CLOCKEVENTS
>  	select GPIO_PL061 if GPIOLIB
>  	select HAVE_ARM_SCU
> +	select HAVE_ARM_TWD if LOCAL_TIMERS

With Stephen Boyd's local timer API removal [1], LOCAL_TIMERS is
disappearing. I believe that you should just select HAVE_ARM_TWD.

Thanks,
Mark.

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2013-June/179983.html
