From: Mark Salter <msalter@redhat.com>
Subject: Re: [PATCH RESEND 1/7] arm64: dts: Add APM X-Gene USB DTS node
Date: Wed, 29 Oct 2014 12:23:37 -0400
Message-ID: <1414599817.1870.15.camel@deneb.redhat.com>
References: <1414438108-8384-1-git-send-email-fkan@apm.com>
 <1414438108-8384-2-git-send-email-fkan@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1414438108-8384-2-git-send-email-fkan@apm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Feng Kan <fkan@apm.com>
Cc: devicetree@vger.kernel.org, catalin.marinas@arm.com, patches@apm.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bao Truong <btruong@apm.com>
List-Id: devicetree@vger.kernel.org

On Mon, 2014-10-27 at 12:28 -0700, Feng Kan wrote:
> This parch adds the device tree nodes for APM X-Gnene USB host controller.
> Since X-Gene SOC supports maximum 2 USB ports, 2 dts node are added.
> 
> Signed-off-by: Bao Truong <btruong@apm.com>
> Signed-off-by: Feng Kan <fkan@apm.com>
> ---
>  arch/arm64/boot/dts/apm-storm.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apm-storm.dtsi b/arch/arm64/boot/dts/apm-storm.dtsi
> index 3eef74b..a80f2fa 100644
> --- a/arch/arm64/boot/dts/apm-storm.dtsi
> +++ b/arch/arm64/boot/dts/apm-storm.dtsi
> @@ -587,6 +587,20 @@
>  			phy-names = "sata-phy";
>  		};
>  
> +		usb0: dwusb@19000000 {
> +			status = "disabled";
> +			compatible = "xhci-platform";
> +			reg =  <0x0 0x19000000 0x0 0x100000>;
> +			interrupts = <0x0 0x89 0x4>;
> +		};
> +
> +		usb1: dwusb@19800000 {
> +			status = "disabled";
> +			compatible = "xhci-platform";
> +			reg =  <0x0 0x19800000 0x0 0x100000>;
> +			interrupts = <0x0 0x8a 0x4>;
> +		};
> +

Should these have "dma-coherent" properties?
