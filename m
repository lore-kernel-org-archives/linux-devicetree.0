From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM: dts: uniphier: fix a typo in comment block
Date: Thu, 31 Dec 2015 17:28:41 +0100
Message-ID: <2655737.rfUv6oI9D8@wuerfel>
References: <1450884220-8751-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450884220-8751-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, arm@kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Thursday 24 December 2015 00:23:40 Masahiro Yamada wrote:
> 
> -/* UART3 unavilable: the pads are not wired to the package balls */
> +/* UART3 unavailable: the pads are not wired to the package balls */
>  &serial3 {
>         status = "disabled";
>  };
> 

Applied on next/dt, thanks!

	Arnd
