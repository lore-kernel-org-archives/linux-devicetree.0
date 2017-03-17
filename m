From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: rockchip: add dmac nodes for rk3368 SoCs
Date: Fri, 17 Mar 2017 12:04:19 +0100
Message-ID: <36338936.qaTCZ9qzt4@phil>
References: <1488534549-26175-1-git-send-email-huibin.hong@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1488534549-26175-1-git-send-email-huibin.hong@rock-chips.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Huibin Hong <huibin.hong@rock-chips.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, felipe.balbi@linux.intel.com, johnyoun@synopsys.com, catalin.marinas@arm.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, jh80.chung@samsung.com, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, andy.yan@rock-chips.com, jic23@kernel.org, wxt@rock-chips.com
List-Id: devicetree@vger.kernel.org

Am Freitag, 3. M=E4rz 2017, 17:49:09 CET schrieb Huibin Hong:
> Addd dmac bus and dmac peri dts nodes for peripherals,
> such as I2S, SPI, UART and so on.
> =

> Signed-off-by: Huibin Hong <huibin.hong@rock-chips.com>

applied for 4.12, with the changes described below

> ---
>  arch/arm64/boot/dts/rockchip/rk3368.dtsi | 31
> +++++++++++++++++++++++++++++++ 1 file changed, 31 insertions(+)
> =

> diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> b/arch/arm64/boot/dts/rockchip/rk3368.dtsi index a635adc..c9be1b2 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> @@ -204,6 +204,37 @@
>  				     <&cpu_b2>, <&cpu_b3>;
>  	};
> =

> +	amba {

moved "amba" above "arm-pmu", please mind the alphabetical ordering in the =

future.

> +		compatible =3D "simple-bus";
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		dmac_peri: dma-controller@ff250000 {
> +			compatible =3D "arm,pl330", "arm,primecell";
> +			reg =3D <0x0 0xff250000 0x0 0x4000>;
> +			interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> +			#dma-cells =3D <1>;
> +			clocks =3D <&cru ACLK_DMAC_PERI>;
> +			clock-names =3D "apb_pclk";
> +			arm,pl330-broken-no-flushp;
> +			peripherals-req-type-burst;

dropped peripherals-req-type-burst, as it is not part of mainline (yet?).
Please send a patch readding that if it gets submitted and accepted at some =

point.


Heiko
