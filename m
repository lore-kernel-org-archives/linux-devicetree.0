From: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH] arm64: dts: stratix10: Add SPI node clocks for Stratix10
Date: Thu, 28 Jun 2018 14:37:54 -0500
Message-ID: <22497e7f-74dc-2427-6b36-5900fe062d9d@kernel.org>
References: <1530121827-32390-1-git-send-email-thor.thayer@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1530121827-32390-1-git-send-email-thor.thayer@linux.intel.com>
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
To: thor.thayer@linux.intel.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Thor

On 06/27/2018 12:50 PM, thor.thayer@linux.intel.com wrote:
> From: Thor Thayer <thor.thayer@linux.intel.com>
> 
> Add the required clocks for the new Stratix10 clock bindings
> to the SPI nodes.
> 
> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
> ---
>  arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> index 67dac595dc72..9e54282ee08c 100644
> --- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> +++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> @@ -310,6 +310,7 @@
>  			resets = <&rst SPIM0_RESET>;
>  			reg-io-width = <4>;
>  			num-cs = <4>;
> +			clocks = <&clkmgr STRATIX10_L4_MAIN_CLK>;
>  			status = "disabled";
>  		};
>  
> @@ -322,6 +323,7 @@
>  			resets = <&rst SPIM1_RESET>;
>  			reg-io-width = <4>;
>  			num-cs = <4>;
> +			clocks = <&clkmgr STRATIX10_L4_MAIN_CLK>;
>  			status = "disabled";
>  		};
>  
> 

I thought you already sent a patch for this?

http://lists.infradead.org/pipermail/linux-arm-kernel/2018-June/585514.html

Dinh
