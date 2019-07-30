From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 5/5] arm64: dts: meson: Link nvmem and secure-monitor nodes
Date: Tue, 30 Jul 2019 11:23:25 +0200
Message-ID: <1jpnlr27w2.fsf@starbuckisacylon.baylibre.com>
References: <20190729183941.18164-1-ccaione@baylibre.com>
 <20190729183941.18164-6-ccaione@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190729183941.18164-6-ccaione@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: srinivas.kandagatla@linaro.org, khilman@baylibre.com, narmstrong@baylibre.com, robh+dt@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Cc: Carlo Caione <ccaione@baylibre.com>
List-Id: devicetree@vger.kernel.org

On Mon 29 Jul 2019 at 19:39, Carlo Caione <ccaione@baylibre.com> wrote:

> The former is going to use the latter to retrieve the efuses data.

Actually, if you really want to not break bisect, this change must be
merged before the driver change (patch 4).

I'm a bit surpised to see only the axg and g12a here ?
Doesn't it apply to gxbb/gxl as well ?

>
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi  | 1 +
>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> index 6219337033a0..b8244efb85fa 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> @@ -117,6 +117,7 @@
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		read-only;
> +		secure-monitor = <&sm>;
>  	};
>  
>  	psci {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> index f8d43e3dcf20..2b07752e034f 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> @@ -100,6 +100,7 @@
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		read-only;
> +		secure-monitor = <&sm>;
>  	};
>  
>  	psci {
> -- 
> 2.20.1
