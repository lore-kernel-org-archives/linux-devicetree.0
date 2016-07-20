From: Dinh Nguyen <dinguyen@opensource.altera.com>
Subject: Re: [PATCH 10/10] ARM: dts: Add Arria10 USB EDAC devicetree entry
Date: Wed, 20 Jul 2016 11:05:51 -0500
Message-ID: <578FA15F.7000105@opensource.altera.com>
References: <1468512408-5156-1-git-send-email-tthayer@opensource.altera.com>
 <1468512408-5156-11-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1468512408-5156-11-git-send-email-tthayer@opensource.altera.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: tthayer@opensource.altera.com, bp@alien8.de, dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, grant.likely@linaro.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, tthayer.linux@gmail.com, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 07/14/2016 11:06 AM, tthayer@opensource.altera.com wrote:
> From: Thor Thayer <tthayer@opensource.altera.com>
> 
> Add the device tree entries needed to support the Altera USB
> FIFO buffer EDAC on the Arria10 chip.
> 
> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
> ---
>  arch/arm/boot/dts/socfpga_arria10.dtsi |    8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
> index a506ec0..bd548ab 100644
> --- a/arch/arm/boot/dts/socfpga_arria10.dtsi
> +++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
> @@ -652,6 +652,14 @@
>  				interrupts = <10 IRQ_TYPE_LEVEL_HIGH>,
>  					     <42 IRQ_TYPE_LEVEL_HIGH>;
>  			};
> +
> +			usb0-ecc@ff8c8800 {
> +				compatible = "altr,socfpga-usb-ecc";
> +				reg = <0xff8c8800 0x400>;
> +				altr,ecc-parent = <&usb0>;
> +				interrupts = <2 IRQ_TYPE_LEVEL_HIGH>,
> +					     <34 IRQ_TYPE_LEVEL_HIGH>;
> +			};
>  		};
>  
>  		rst: rstmgr@ffd05000 {
> 

Acked-by: Dinh Nguyen <dinguyen@opensource.altera.com>

Dinh
