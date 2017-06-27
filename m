From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/4] misc: sram: Allow ARM64 to select SRAM_EXEC
Date: Tue, 27 Jun 2017 18:38:59 +0100
Message-ID: <20170627173859.GA5189@leverpostej>
References: <20170626223248.14199-1-f.fainelli@gmail.com>
 <20170626223248.14199-3-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170626223248.14199-3-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, lorenzo.pieralisi@arm.com
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Markus Mayer <mmayer@broadcom.com>, Arnd Bergmann <arnd@arndb.de>, Eric Anholt <eric@anholt.net>, Justin Chen <justinpopo6@gmail.com>, Doug Berger <opendmb@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:BROADCOM BCM47XX MIPS ARCHITECTURE" <linux-mips@linux-mips.org>, linux-pm@vger
List-Id: devicetree@vger.kernel.org

On Mon, Jun 26, 2017 at 03:32:42PM -0700, Florian Fainelli wrote:
> Now that ARM64 also has a fncpy() implementation, allow selection
> SRAM_EXEC for ARM64 as well.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Sorr,y but I must NAK this patch.

As mentioned on prior threads regarding fncpy, I do not think it makes
sense to enable this for arm64. The only use-cases that have been
described so far for this are power-management stuff that should live in
PSCI or other secure FW, and have no place in the kernel on arm64.

There are no other users of this functionality, and until there are, I
see no reason to enable this, and risk a proliferation of unnecessary
platform-specific code.

It should be possible to #ifdef-ise the relevant callers of this such
that they can be built on arm64 without using fncpy or sram_exec
functionality. AFAICT, there are no users on arm64 introduced by this
series.

Thanks,
Mark.

> ---
>  drivers/misc/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index 07bbd4cc1852..ac8779278c0c 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -464,7 +464,7 @@ config SRAM
>  	bool "Generic on-chip SRAM driver"
>  	depends on HAS_IOMEM
>  	select GENERIC_ALLOCATOR
> -	select SRAM_EXEC if ARM
> +	select SRAM_EXEC if ARM || ARM64
>  	help
>  	  This driver allows you to declare a memory region to be managed by
>  	  the genalloc API. It is supposed to be used for small on-chip SRAM
> -- 
> 2.9.3
> 
