From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 3/3] ARM: dts: UniPhier: add ProXstream2 and PH1-LD6b
 SoC/board support
Date: Tue, 11 Aug 2015 15:07:39 +0200
Message-ID: <20150811130739.GD30181@localhost>
References: <1438687264-26538-1-git-send-email-yamada.masahiro@socionext.com>
 <1438687264-26538-4-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1438687264-26538-4-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: arm@kernel.org, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Aug 04, 2015 at 08:21:04PM +0900, Masahiro Yamada wrote:
> Initial version of DTSI for ProXstream2 and PH1-LD6b and DTS for
> PH1-LD6b reference board.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  arch/arm/boot/dts/Makefile                  |   3 +-
>  arch/arm/boot/dts/uniphier-ph1-ld6b-ref.dts | 105 +++++++++++
>  arch/arm/boot/dts/uniphier-ph1-ld6b.dtsi    |  67 +++++++
>  arch/arm/boot/dts/uniphier-proxstream2.dtsi | 273 ++++++++++++++++++++++++++++
>  4 files changed, 447 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/uniphier-ph1-ld6b-ref.dts
>  create mode 100644 arch/arm/boot/dts/uniphier-ph1-ld6b.dtsi
>  create mode 100644 arch/arm/boot/dts/uniphier-proxstream2.dtsi
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 246473a..6eb3f2f 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -645,7 +645,8 @@ dtb-$(CONFIG_ARCH_UNIPHIER) += \
>  	uniphier-ph1-sld3-ref.dtb \
>  	uniphier-ph1-ld4-ref.dtb \
>  	uniphier-ph1-pro4-ref.dtb \
> -	uniphier-ph1-sld8-ref.dtb
> +	uniphier-ph1-sld8-ref.dtb \
> +	uniphier-ph1-ld6b-ref.dtb

Please always add entries here sorted, don't just append. I've fixed it
up for you this time.


-Olof
