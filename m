From: Thor Thayer <thor.thayer@linux.intel.com>
Subject: Re: [PATCH 2/2] arm64: dts: stratix10: Add SPI clocks for Stratix10
Date: Thu, 21 Jun 2018 13:25:08 -0500
Message-ID: <69d83030-efdc-ff16-a55c-3f0549ca29b6@linux.intel.com>
References: <1527617612-2205-1-git-send-email-thor.thayer@linux.intel.com>
 <1527617612-2205-2-git-send-email-thor.thayer@linux.intel.com>
Reply-To: thor.thayer@linux.intel.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1527617612-2205-2-git-send-email-thor.thayer@linux.intel.com>
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
To: dinguyen@kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Dinh,

On 05/29/2018 01:13 PM, thor.thayer@linux.intel.com wrote:
> From: Thor Thayer <thor.thayer@linux.intel.com>
> 
> Add the SPI clocks to the Stratix10 device tree.
> 
> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
> ---
>   arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> index 47fa4b450324..34658f135daf 100644
> --- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> +++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> @@ -316,6 +316,8 @@
>   			resets = <&rst SPIM0_RESET>;
>   			reg-io-width = <4>;
>   			num-cs = <4>;
> +			clocks = <&clkmgr STRATIX10_L4_MAIN_CLK>,
> +				 <&clkmgr STRATIX10_SPI_M_CLK>;
>   			status = "disabled";
>   		};
>   
> @@ -328,6 +330,8 @@
>   			resets = <&rst SPIM1_RESET>;
>   			reg-io-width = <4>;
>   			num-cs = <4>;
> +			clocks = <&clkmgr STRATIX10_L4_MAIN_CLK>,
> +				 <&clkmgr STRATIX10_SPI_M_CLK>;
>   			status = "disabled";
>   		};
>   
> 
Any comments on this patch?
