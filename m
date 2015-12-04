From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v5 2/5] ARM: BCM: Clean up SMP support for Broadcom Kona
Date: Fri, 04 Dec 2015 15:07:15 -0800
Message-ID: <56621CA3.3090903@gmail.com>
References: <1449260611-24417-1-git-send-email-kapilh@broadcom.com> <1449260611-24417-3-git-send-email-kapilh@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449260611-24417-3-git-send-email-kapilh@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kapil Hali <kapilh@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: Gregory Fong <gregory.0xf0@gmail.com>, Lee Jones <lee@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, Kever Yang <kever.yang@rock-chips.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Olof Johansson <olof@lixom.net>, Paul Walmsley <paul@pwsan.com>, Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On 04/12/15 12:23, Kapil Hali wrote:
> These changes cleans up SMP implementaion for Broadcom's
> Kona SoC which are required for handling SMP for iProc
> family of SoCs at a single place for BCM NSP and BCM Kona.
> 
> Signed-off-by: Kapil Hali <kapilh@broadcom.com>
> ---
>  arch/arm/boot/dts/bcm11351.dtsi |  2 +-
>  arch/arm/boot/dts/bcm21664.dtsi |  2 +-
>  arch/arm/mach-bcm/kona_smp.c    | 82 +++++++++++++++++++++++++++--------------
>  3 files changed, 56 insertions(+), 30 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/bcm11351.dtsi b/arch/arm/boot/dts/bcm11351.dtsi
> index 2ddaa51..3dc7a8c 100644
> --- a/arch/arm/boot/dts/bcm11351.dtsi
> +++ b/arch/arm/boot/dts/bcm11351.dtsi
> @@ -31,7 +31,6 @@
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  		enable-method = "brcm,bcm11351-cpu-method";
> -		secondary-boot-reg = <0x3500417c>;

I would expect the 'enable-method' to be moved as well to be consistent
with what you are adding for NSP later on.

>  
>  		cpu0: cpu@0 {
>  			device_type = "cpu";
> @@ -42,6 +41,7 @@
>  		cpu1: cpu@1 {
>  			device_type = "cpu";
>  			compatible = "arm,cortex-a9";
> +			secondary-boot-reg = <0x3500417c>;
>  			reg = <1>;
>  		};
-- 
Florian
