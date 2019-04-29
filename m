From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2 4/4] ARM: dts: aspeed-g5: Add video engine
Date: Mon, 29 Apr 2019 07:51:40 +0000
Message-ID: <CACPK8XcncJuMMK-MQuu29dbeZbU57+a84RL+kuN9LkctZpFZfA@mail.gmail.com>
References: <1556119194-10917-1-git-send-email-eajames@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556119194-10917-1-git-send-email-eajames@linux.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eddie James <eajames@linux.ibm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree <devicetree@vger.kernel.org>, linux-media@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, mchehab@kernel.org, hverkuil@xs4all.nl
List-Id: devicetree@vger.kernel.org

On Wed, 24 Apr 2019 at 15:20, Eddie James <eajames@linux.ibm.com> wrote:
>
> Add a node to describe the video engine on the AST2500.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Applied to the aspeed SoC tree.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-g5.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> index 85ed9db..c6d5edc 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -243,6 +243,16 @@
>                                 status = "disabled";
>                         };
>
> +                       video: video@1e700000 {
> +                               compatible = "aspeed,ast2500-video-engine";
> +                               reg = <0x1e700000 0x1000>;
> +                               clocks = <&syscon ASPEED_CLK_GATE_VCLK>,
> +                                        <&syscon ASPEED_CLK_GATE_ECLK>;
> +                               clock-names = "vclk", "eclk";
> +                               interrupts = <7>;
> +                               status = "disabled";
> +                       };
> +
>                         sram: sram@1e720000 {
>                                 compatible = "mmio-sram";
>                                 reg = <0x1e720000 0x9000>;      // 36K
> --
> 1.8.3.1
>
