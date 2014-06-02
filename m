From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 1/5] ARM: berlin: add SMP support
Date: Mon, 2 Jun 2014 10:29:13 +0100
Message-ID: <20140602092913.GA933@n2100.arm.linux.org.uk>
References: <1401700866-24804-1-git-send-email-antoine.tenart@free-electrons.com> <1401700866-24804-2-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1401700866-24804-2-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart@free-electrons.com>
Cc: sebastian.hesselbarth@gmail.com, thomas.petazzoni@free-electrons.com, zmxu@marvell.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, alexandre.belloni@free-electrons.com, jszhang@marvell.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 02, 2014 at 11:21:02AM +0200, Antoine T=E9nart wrote:
> diff --git a/arch/arm/mach-berlin/Kconfig b/arch/arm/mach-berlin/Kcon=
fig
> index d3c5f14dc142..e3733692f67a 100644
> --- a/arch/arm/mach-berlin/Kconfig
> +++ b/arch/arm/mach-berlin/Kconfig
> @@ -4,6 +4,7 @@ config ARCH_BERLIN
>  	select GENERIC_IRQ_CHIP
>  	select DW_APB_ICTL
>  	select DW_APB_TIMER_OF
> +	select SMP

Please don't add selects of symbols which aren't absolutely necessary.

Since this has been merged without SMP support and presumably works wit=
hout
SMP support, it would appear that SMP support is not mandatory for the
platform to work.

--=20
=46TTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... sl=
owly
improving, and getting towards what was expected from it.
