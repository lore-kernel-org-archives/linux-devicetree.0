From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/4] arm,arm64: uniphier: add a new driver, device tree updates
Date: Sat, 12 Dec 2015 01:12:05 +0100
Message-ID: <10682472.c84OiaBWfX@wuerfel>
References: <1448357962-12259-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448357962-12259-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: arm@kernel.org, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@arm.linux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tuesday 24 November 2015 18:39:18 Masahiro Yamada wrote:
> 
> Here is another series for UniPhier SoC family:
> 
>  - 1/4: add a new driver.  The UniPhier System Bus is an external bus
>         where on-board devices are connected to the SoC.
>         (please check if the binding specification is OK.)
> 
>  - 2/4: device tree updates to use the driver added by 1/4
> 
>  - 3/4: trivial rename of device node names
> 
>  - 4/4: initial commit for ARMv8 SoC/Board device trees
> 
> Please apply 2/4, 3/4/, 4/4 into the same branch because 4/4 depends on 2/4 and 3/4.
> (4/4 creates symbolic links to ARM device trees.)

I'm a bit confused how this relates to the newer version ("[PATCH v5] bus:
uniphier-system-bus: add UniPhier System Bus driver"). The new version
only has one patch instead of four, so I'm not sure if the patches 2, 3
and 4 of this series still apply.

Can you clarify, or send the entire series again?

	Arnd
