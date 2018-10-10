From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH 6/6] arm64: dts: xilinx: ultra96: Standardize LED labels
 and triggers
Date: Wed, 10 Oct 2018 09:25:24 +0200
Message-ID: <7b94c09d-ecbd-e48e-6583-127566715a76@xilinx.com>
References: <20181009140522.6492-1-manivannan.sadhasivam@linaro.org>
 <20181009140522.6492-7-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181009140522.6492-7-manivannan.sadhasivam@linaro.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, robh+dt@kernel.org, heiko@sntech.de, ezequiel@collabora.com, xuwei5@hisilicon.com, michal.simek@xilinx.com
Cc: devicetree@vger.kernel.org, daniel.thompson@linaro.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, amit.kucheria@linaro.org, linux-rockchip@lists.infradead.org, koen.kooi@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 9.10.2018 16:05, Manivannan Sadhasivam wrote:
> For all 96Boards, the following standard is used for onboard LEDs.
> 
> device-name:green:user1  default-trigger: heartbeat
> device-name:green:user2  default-trigger: mmc0/disk-activity
>                                           (onboard-storage)
> device-name:green:user3  default-trigger: mmc1 (SD-card)
> device-name:green:user4  default-trigger: none, panic-indicator
> device-name:yellow:wlan  default-trigger: phy0tx
> device-name:blue:bt      default-trigger: hci0-power
> 
> So lets adopt the same for Ultra96, which is one of the 96Boards
> CE and AI platform. Since the WLAN and BT LEDs are hardwired onboard,
> consolidate only User LEDs.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
> index eb5e8bddb610..565ceb390f99 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
> @@ -57,29 +57,30 @@
>  	leds {
>  		compatible = "gpio-leds";
>  		ds2 {
> -			label = "ds2";
> +			label = "zynqmp-zcu100-revC:green:user1";

The purpose of this series should be standardize Led labels that's why I
would expect that leds will be called in the same way on all these
boards that's why I am not getting why there is board name.

green:user1 or just user1 should be enough.

Thanks,
Michal
