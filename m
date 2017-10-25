From: Paul Burton <Paul.Burton@mips.com>
Subject: RE: [PATCH] MIPS: Boston: Fix earlycon baud rate selection
Date: Wed, 25 Oct 2017 22:09:57 +0000
Message-ID: <0F3A6103614E5547AAE5309112E22E9102C5C4FA@MIPSMAIL01.mipstec.com>
References: <1508246879-20580-1-git-send-email-matt.redfearn@mips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1508246879-20580-1-git-send-email-matt.redfearn@mips.com>
Content-Language: en-US
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Matt Redfearn <Matt.Redfearn@mips.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Paul Burton <paul.burton@imgtec.com>
List-Id: devicetree@vger.kernel.org

Hi Matt,

On Tuesday, October 17, 2017 at 6:28 AM Matt Redfearn wrote:
> During set up of the early console, the earlycon driver will attempt to
> configure a baud rate, if one is set in the earlycon structure.
> Previously, of_setup_earlycon left this field as 0, ignoring any baud
> rate selected by the DT. Commit 31cb9a8575ca ("earlycon: initialise baud
> field of earlycon device structure") changed this behaviour such that
> any selected baud rate is now set. The earlycon driver must deduce the
> divisor from the configured uartclk, which of_setup_earlycon sets to
> BASE_BAUD. MIPS generic kernels do not set BASE_BAUD (there is no
> practical way to set this generically for all supported platforms), so
> when the early console is configured an incorrect divisor is calculated
> for the selected baud rate, and garbage is printed to the console during
> boot.
> 
> Fix this by removing the configured baud rate from the device tree.
> This causes the early console to inherit the baud rate settings from the
> bootloader. By the time the real console is probed, the clock drivers
> necessary to calculate the divisor are enabled and the kernel can
> correctly configure the baud rate.

Sadly I think this breaks the proper console - my current understanding
is that we end up with it set to 9600 baud due to the defaults in
serial8250_console_setup(). So with your patch I see correct output from
the early console, then nothing when the proper console registers until
my userland starts a getty on ttyS0 which reconfigures it to 115200 baud.

Thanks,
    Paul

> Fixes: 31cb9a8575ca ("earlycon: initialise baud field of earlycon device
> structure")
> Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
> 
> ---
> 
>  arch/mips/boot/dts/img/boston.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/boot/dts/img/boston.dts
> b/arch/mips/boot/dts/img/boston.dts
> index 53bfa29a7093..179691aae7d7 100644
> --- a/arch/mips/boot/dts/img/boston.dts
> +++ b/arch/mips/boot/dts/img/boston.dts
> @@ -11,7 +11,7 @@
>  	compatible = "img,boston";
> 
>  	chosen {
> -		stdout-path = "uart0:115200";
> +		stdout-path = "uart0";
>  	};
> 
>  	aliases {
> --
> 2.7.4
