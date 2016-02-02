From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 1/2] dt/bindings: Add bindings for PIC32 watchdog
 peripheral
Date: Tue, 2 Feb 2016 14:16:21 +0300
Message-ID: <56B09005.2000006@cogentembedded.com>
References: <1454371381-25160-1-git-send-email-joshua.henderson@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454371381-25160-1-git-send-email-joshua.henderson@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joshua Henderson <joshua.henderson@microchip.com>, linux-kernel@vger.kernel.org
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2/2/2016 3:02 AM, Joshua Henderson wrote:

> Document the devicetree bindings for the watchdog peripheral found on Microchip
> PIC32 SoC class devices.
>
> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: <linux-mips@linux-mips.org>
> ---
> Note: Please merge this patch series through the MIPS tree.
> ---
>   .../bindings/watchdog/microchip,pic32-wdt.txt      |   18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/watchdog/microchip,pic32-wdt.txt
>
> diff --git a/Documentation/devicetree/bindings/watchdog/microchip,pic32-wdt.txt b/Documentation/devicetree/bindings/watchdog/microchip,pic32-wdt.txt
> new file mode 100644
> index 0000000..3ce2839
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/microchip,pic32-wdt.txt
> @@ -0,0 +1,18 @@
> +* Microchip PIC32 Watchdog Timer
> +
> +When enabled, the watchdog peripheral can be used to reset the device if the
> +WDT is not cleared periodically in software.
> +
> +Required properties:
> +- compatible: must be "microchip,pic32mzda-wdt".
> +- reg: physical base address of the controller and length of memory mapped
> +  region.
> +- clocks: phandle of source clk. should be <&LPRC> clk.
> +
> +Example:
> +
> +	watchdog0: wdt@1f800800 {

    The ePAPR standard tells to to use "watchdog@1f800800" as the node name.

[...]

MBR, Sergei
