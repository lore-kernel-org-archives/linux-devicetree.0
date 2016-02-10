From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 7/8] arm: multi_v7_defconfig: add MACH_ARTPEC6
Date: Wed, 10 Feb 2016 15:42:32 +0100
Message-ID: <22004657.zNDLNVmTMr@wuerfel>
References: <cover.1455107681.git.larper@axis.com> <36d8a6a0236e08bc7286085018e2fa7a67691b39.1455107681.git.larper@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <36d8a6a0236e08bc7286085018e2fa7a67691b39.1455107681.git.larper@axis.com>
Sender: linux-clk-owner@vger.kernel.org
To: Lars Persson <lars.persson@axis.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-kernel@vger.kernel.org, Lars Persson <larper@axis.com>
List-Id: devicetree@vger.kernel.org

On Wednesday 10 February 2016 13:41:56 Lars Persson wrote:
> Signed-off-by: Lars Persson <larper@axis.com>
> ---
>  arch/arm/configs/multi_v7_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index 8e8b2ac..bf3840e 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -16,6 +16,8 @@ CONFIG_ARCH_MULTI_V7=y
>  # CONFIG_ARCH_MULTI_V4 is not set
>  CONFIG_ARCH_VIRT=y
>  CONFIG_ARCH_ALPINE=y
> +CONFIG_ARCH_ARTPEC=y
> +CONFIG_MACH_ARTPEC6=y
>  CONFIG_ARCH_MVEBU=y
>  CONFIG_MACH_ARMADA_370=y
>  CONFIG_MACH_ARMADA_375=y
> 

No other drivers that you need here?

	Arnd
