From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH] arm64: zynqmp: Add dr_mode property to usb node
Date: Thu, 26 Sep 2019 12:11:42 +0200
Message-ID: <e0f8681e-1c0e-668e-25af-270574d4d748@xilinx.com>
References: <1568128642-4782-1-git-send-email-anurag.kumar.vulisha@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568128642-4782-1-git-send-email-anurag.kumar.vulisha@xilinx.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>, robh+dt@kernel.org, mark.rutland@arm.com, michal.simek@xilinx.com, ulf.hansson@linaro.org, sudeep.holla@arm.com, jan.kiszka@siemens.com
Cc: v.anuragkumar@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10. 09. 19 17:17, Anurag Kumar Vulisha wrote:
> This patch adds dr_mode property to the usb node for
> zynqmp boards.
> 
> Signed-off-by: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
> ---
>  arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts | 1 +
>  arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dts | 1 +
>  arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts      | 2 ++
>  arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts      | 1 +
>  arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts      | 1 +
>  arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts      | 1 +
>  arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts      | 1 +
>  7 files changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts
> index 9a3e39d..386f701 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts
> @@ -128,4 +128,5 @@
>  /* ULPI SMSC USB3320 */
>  &usb0 {
>  	status = "okay";
> +	dr_mode = "host";
>  };
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dts
> index 2421ec7..c6c8e2c 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dts
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dts
> @@ -158,6 +158,7 @@
>  /* ULPI SMSC USB3320 */
>  &usb1 {
>  	status = "okay";
> +	dr_mode = "host";
>  };
>  
>  &uart0 {
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
> index e5699d0..c64c7b8 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
> @@ -274,11 +274,13 @@
>  /* ULPI SMSC USB3320 */
>  &usb0 {
>  	status = "okay";
> +	dr_mode = "peripheral";
>  };
>  
>  /* ULPI SMSC USB3320 */
>  &usb1 {
>  	status = "okay";
> +	dr_mode = "host";
>  };
>  
>  &watchdog0 {
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
> index 2a3b665..011f138 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
> @@ -540,6 +540,7 @@
>  /* ULPI SMSC USB3320 */
>  &usb0 {
>  	status = "okay";
> +	dr_mode = "host";
>  };
>  
>  &watchdog0 {
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
> index 8f45614..7e372b1 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
> @@ -189,6 +189,7 @@
>  /* ULPI SMSC USB3320 */
>  &usb0 {
>  	status = "okay";
> +	dr_mode = "host";
>  };
>  
>  &watchdog0 {
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
> index 93ce7eb..c4aac7a 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
> @@ -514,6 +514,7 @@
>  /* ULPI SMSC USB3320 */
>  &usb0 {
>  	status = "okay";
> +	dr_mode = "host";
>  };
>  
>  &watchdog0 {
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
> index 8bb0001..4909533 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
> @@ -440,4 +440,5 @@
>  /* ULPI SMSC USB3320 */
>  &usb0 {
>  	status = "okay";
> +	dr_mode = "host";
>  };
> 

Applied.
M
