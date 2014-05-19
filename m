From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/3] Documentation: Update Arasan SDHC documentation for the APM X-Gene SoC SDHC DTS binding
Date: Mon, 19 May 2014 11:09:38 +0200
Message-ID: <7213964.4Qu0G1nWOL@wuerfel>
References: <1400398918-1502-1-git-send-email-lho@apm.com> <1400398918-1502-2-git-send-email-lho@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <1400398918-1502-2-git-send-email-lho@apm.com>
Sender: linux-mmc-owner@vger.kernel.org
To: Loc Ho <lho@apm.com>
Cc: chris@printf.net, ulf.hansson@linaro.org, michal.simek@xilinx.com, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jcm@redhat.com, patches@apm.com
List-Id: devicetree@vger.kernel.org

On Sunday 18 May 2014 01:41:56 Loc Ho wrote:
> --- a/Documentation/devicetree/bindings/mmc/arasan,sdhci.txt
> +++ b/Documentation/devicetree/bindings/mmc/arasan,sdhci.txt
> @@ -8,14 +8,17 @@ Device Tree Bindings for the Arasan SDHCI Controller
>    [3] Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
>  
>  Required Properties:
> -  - compatible: Compatibility string. Must be 'arasan,sdhci-8.9a'
> +  - compatible: Compatibility string. Must be 'arasan,sdhci-8.9a' or
> +                'xgene,arasan,sdhci-8.9a'
>    - reg: From mmc bindings: Register location and length.
> -  - clocks: From clock bindings: Handles to clock inputs.
> -  - clock-names: From clock bindings: Tuple including "clk_xin" and "clk_ahb"
> 

The driver as you patch is in this version actually requires a second set
of registers. As I commented there, it's probably not the best way to do
things, but you also forgot to update the binding here.

Always make sure that the binding document actually documents what you
implement!

	Arnd
