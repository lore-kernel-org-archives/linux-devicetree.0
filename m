From: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH] arm64: dts: stratix10: i2c clock running out of spec
Date: Wed, 15 Aug 2018 10:08:24 -0500
Message-ID: <dd109cc6-00a8-244b-07e9-97e29739d804@kernel.org>
References: <20180808154241.3760-1-atull@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180808154241.3760-1-atull@kernel.org>
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
To: Alan Tull <atull@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 08/08/2018 10:42 AM, Alan Tull wrote:
> DesignWare I2C controller was observed running at 105.93kHz rather
> than the specified 100kHz.  Adjust device tree settings to bring it
> within spec (a slightly conservative 98 MHz).
> 
> Signed-off-by: Alan Tull <atull@kernel.org>
> ---
>  arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
> index 6edc4fa..53cf195 100644
> --- a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
> +++ b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
> @@ -124,6 +124,8 @@
>  &i2c1 {
>  	status = "okay";
>  	clock-frequency = <100000>;
> +	i2c-sda-falling-time-ns = <890>;  /* hcnt */
> +	i2c-sdl-falling-time-ns = <890>;  /* lcnt */
>  
>  	adc@14 {
>  		compatible = "lltc,ltc2497";
> 

Applied!

Thanks,
Dinh
