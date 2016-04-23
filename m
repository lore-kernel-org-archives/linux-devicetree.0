From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/2] arm64: dts: uniphier: fix I2C nodes of PH1-LD20
Date: Sat, 23 Apr 2016 22:09:21 +0200
Message-ID: <4326944.O9ELFsuto4@wuerfel>
References: <1460716247-28049-1-git-send-email-yamada.masahiro@socionext.com> <1460716247-28049-2-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460716247-28049-2-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: arm@kernel.org, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Friday 15 April 2016 19:30:46 Masahiro Yamada wrote:
> The I2C hardware blocks on this SoC are connected as follows:
> 
>   I2C0: external connection
>   I2C1: external connection
>   I2C2: internal connection
>   I2C3: external connection
>   I2C4: external connection
>   I2C5: internal connection
>   I2C6: no connection (not accessible)
> 
> Delete pinctrl from Ch2, add pinctrl to Ch4, and remove the Ch6 node.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> 


Applied patch 1/2 to the fixes branch now, thanks!

	Arnd
