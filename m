From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2] arm64: dts: meson-axg: Enable watchdog on Meson AXG
 SoCs
Date: Mon, 26 Nov 2018 16:14:19 +0100
Message-ID: <289f3009-528a-f4d6-5d33-69728d5b214d@baylibre.com>
References: <20181123144541.15114-1-ccaione@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181123144541.15114-1-ccaione@baylibre.com>
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
To: Carlo Caione <ccaione@baylibre.com>, robh+dt@kernel.org, mark.rutland@arm.com, khilman@baylibre.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, jbrunet@baylibre.com
List-Id: devicetree@vger.kernel.org

On 23/11/2018 15:45, Carlo Caione wrote:
> Add the watchdog node also on the AXG platforms.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
> V2:
>  - Remove amlogic,meson-axg-wdt compatible
> ---
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> index df017dbd2e57..27d73d831a13 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> @@ -1422,6 +1422,12 @@
>  				status = "disabled";
>  			};
>  
> +			watchdog@f0d0 {
> +				compatible = "amlogic,meson-gxbb-wdt";
> +				reg = <0x0 0xf0d0 0x0 0x10>;
> +				clocks = <&xtal>;
> +			};
> +
>  			pwm_ab: pwm@1b000 {
>  				compatible = "amlogic,meson-axg-ee-pwm";
>  				reg = <0x0 0x1b000 0x0 0x20>;
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
