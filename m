From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 12/14] DEVICETREE: Add bindings for PIC32 SDHC host
 controller
Date: Sat, 21 Nov 2015 18:19:14 +0300
Message-ID: <56508B72.8070701@cogentembedded.com>
References: <1448065205-15762-1-git-send-email-joshua.henderson@microchip.com>
 <1448065205-15762-13-git-send-email-joshua.henderson@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1448065205-15762-13-git-send-email-joshua.henderson@microchip.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Joshua Henderson <joshua.henderson@microchip.com>, linux-kernel@vger.kernel.org
Cc: linux-mips@linux-mips.org, Andrei Pistirica <andrei.pistirica@microchip.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello.

On 11/21/2015 3:17 AM, Joshua Henderson wrote:

> From: Andrei Pistirica <andrei.pistirica@microchip.com>
>
> Document the devicetree bindings for the SDHC peripheral found on
> Microchip PIC32 class devices.
>
> Signed-off-by: Andrei Pistirica <andrei.pistirica@microchip.com>
> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
> ---
>   .../devicetree/bindings/mmc/sdhci-pic32.txt        |   24 ++++++++++++++++++++
>   1 file changed, 24 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/mmc/sdhci-pic32.txt
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-pic32.txt b/Documentation/devicetree/bindings/mmc/sdhci-pic32.txt
> new file mode 100644
> index 0000000..f16388c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-pic32.txt
> @@ -0,0 +1,24 @@
> +* Microchip PIC32 SDHCI Controller
> +
> +This file documents differences between the core properties in mmc.txt
> +and the properties used by the sdhci-pic32 driver.
> +
> +Required properties:
> +- compatible: Should be "microchip,pic32-sdhci"
> +- reg: Should contain registers location and length
> +- interrupts: Should contain interrupt
> +- pinctrl: Should contain pinctrl for data and command lines

    This is a required prop, yet the example doesn't contain it?

> +
> +Optional properties:
> +- no-1-8-v: 1.8V voltage selection not supported
> +- piomode: disable DMA support
> +
> +Example:
> +
> +	sdhci@1f8ec000 {
> +		compatible = "microchip,pic32-sdhci";
> +		reg = <0x1f8ec000 0x100>;
> +		interrupts = <SDHC_EVENT DEFAULT_INT_PRI IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&REFCLKO4>, <&PBCLK5>;
> +		clock-names = "base_clk", "sys_clk";

    The "clocks" and "clock-names" props are not documented.

[...]

MBR, Sergei
