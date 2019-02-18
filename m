From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: Re: [PATCH 1/4] dt-bindings: nvmem: Add STM32 factory-programmed romem
Date: Mon, 18 Feb 2019 14:20:01 +0100
Message-ID: <c733fe5d-0686-8596-6dc1-369969c782ed@st.com>
References: <1548866336-14765-1-git-send-email-fabrice.gasnier@st.com>
 <1548866336-14765-2-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1548866336-14765-2-git-send-email-fabrice.gasnier@st.com>
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
To: robh+dt@kernel.org
Cc: mark.rutland@arm.com, lionel.debieve@st.com, alexandre.torgue@st.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org, mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 1/30/19 5:38 PM, Fabrice Gasnier wrote:
> Add documentation for STMicroelectronics STM32 Factory-programmed
> read only memory area.

Hello Rob, DT Maintainers,

Gentlemen reminder for new DT bindings review.

Best Regards,
Fabrice
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---
>  .../devicetree/bindings/nvmem/st,stm32-romem.txt   | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/st,stm32-romem.txt
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/st,stm32-romem.txt b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.txt
> new file mode 100644
> index 0000000..fbff52e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.txt
> @@ -0,0 +1,31 @@
> +STMicroelectronics STM32 Factory-programmed data device tree bindings
> +
> +This represents STM32 Factory-programmed read only non-volatile area: locked
> +flash, OTP, read-only HW regs... This contains various information such as:
> +analog calibration data for temperature sensor (e.g. TS_CAL1, TS_CAL2),
> +internal vref (VREFIN_CAL), unique device ID...
> +
> +Required properties:
> +- compatible:		Should be one of:
> +			"st,stm32-romem"
> +			"st,stm32mp15-bsec"
> +- reg:			Offset and length of factory-programmed area.
> +- #address-cells:	Should be '<1>'.
> +- #size-cells:		Should be '<1>'.
> +
> +Optional Data cells:
> +- Must be child nodes as described in nvmem.txt.
> +
> +Example on stm32f4:
> +	romem: nvmem@1fff7800 {
> +		compatible = "st,stm32-romem";
> +		reg = <0x1fff7800 0x400>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		/* Data cells: ts_cal1 at 0x1fff7a2c */
> +		ts_cal1: calib@22c {
> +			reg = <0x22c 0x2>;
> +		};
> +		...
> +	};
> 
