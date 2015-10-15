From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] ARM: dts: uniphier: fix IRQ number for devices on PH1-LD6b ref board
Date: Thu, 15 Oct 2015 17:12:55 +0200
Message-ID: <5206613.F0g35kh7aj@wuerfel>
References: <1444908725-6069-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444908725-6069-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Thursday 15 October 2015 20:32:05 Masahiro Yamada wrote:
> The IRQ signal from external devices on this board is connected to
> the XIRQ4 pin of the SoC.  The IRQ number should be 52, not 50.
> 
> Fixes: a5e921b4771f ("ARM: dts: uniphier: add ProXstream2 and PH1-LD6b SoC/board support")
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> Changes in v2:
>   - change IRQ to 52
> 
>  arch/arm/boot/dts/uniphier-ph1-ld6b-ref.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/uniphier-ph1-ld6b-ref.dts b/arch/arm/boot/dts/uniphier-ph1-ld6b-ref.dts
> index 33963ac..f80f772 100644
> --- a/arch/arm/boot/dts/uniphier-ph1-ld6b-ref.dts
> +++ b/arch/arm/boot/dts/uniphier-ph1-ld6b-ref.dts
> @@ -85,7 +85,7 @@
>  };
>  
>  &ethsc {
> -	interrupts = <0 50 4>;
> +	interrupts = <0 52 4>;
>  };
>  
>  &serial0 {
> 

Applied to fixes, thanks!

	Arnd
