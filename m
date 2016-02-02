From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 1/2] dt/bindings: Add bindings for PIC32 deadman timer
 peripheral
Date: Tue, 2 Feb 2016 14:14:40 +0300
Message-ID: <56B08FA0.9070008@cogentembedded.com>
References: <1454371348-25104-1-git-send-email-joshua.henderson@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454371348-25104-1-git-send-email-joshua.henderson@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joshua Henderson <joshua.henderson@microchip.com>, linux-kernel@vger.kernel.org
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, Purna Chandra Mandal <purna.mandal@microchip.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2/2/2016 3:02 AM, Joshua Henderson wrote:

> From: Purna Chandra Mandal <purna.mandal@microchip.com>
>
> Document the devicetree bindings for the deadman timer peripheral found on
> Microchip PIC32 SoC class devices.
>
> Signed-off-by: Purna Chandra Mandal <purna.mandal@microchip.com>
> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: <linux-mips@linux-mips.org>
> ---
> Note: Please merge this patch series through the MIPS tree.
> ---
>   .../bindings/watchdog/microchip,pic32-dmt.txt      |   19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/watchdog/microchip,pic32-dmt.txt
>
> diff --git a/Documentation/devicetree/bindings/watchdog/microchip,pic32-dmt.txt b/Documentation/devicetree/bindings/watchdog/microchip,pic32-dmt.txt
> new file mode 100644
> index 0000000..f7374ee
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/microchip,pic32-dmt.txt
> @@ -0,0 +1,19 @@
> +* Microchip PIC32 Deadman Timer
> +
> +The deadman timer is used to reset the processor in the event of a software
> +malfunction. It is a free-running instruction fetch timer, which is clocked
> +whenever an instruction fetch occurs until a count match occurs.
> +
> +Required properties:
> +- compatible: must be "microchip,pic32mzda-dmt".
> +- reg: physical base address of the controller and length of memory mapped
> +  region.
> +- clocks: phandle of parent clock (should be &PBCLK7).
> +
> +Example:
> +
> +	watchdog2: dmt@1f800a00 {

    The node names should be generic, i.e. "watchdog" in this case.

[...]

MBR, Sergei
