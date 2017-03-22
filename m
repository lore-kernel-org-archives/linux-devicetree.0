From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: rockchip: add dmac nodes for rk3368 SoCs
Date: Wed, 22 Mar 2017 13:49:36 +0100
Message-ID: <6714315.k8UebLJmJU@diego>
References: <1490184194-32051-1-git-send-email-huibin.hong@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1490184194-32051-1-git-send-email-huibin.hong@rock-chips.com>
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

Hi,

Am Mittwoch, 22. M=E4rz 2017, 20:03:14 CET schrieb Huibin Hong:
> Add dmac bus and dmac peri dts nodes for peripherals,
> such as I2S, SPI, UART and so on.
> =

> Signed-off-by: Huibin Hong <huibin.hong@rock-chips.com>

I applied that patch already in [0], did something change?


[0] https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.gi=
t/commit/?id=3D4b4c0db538fa6e3f31bc40ddc17c1d5facb49d36

> ---
>  arch/arm64/boot/dts/rockchip/rk3368.dtsi | 29 ++++++++++++++++++++++++++=
+++
> 1 file changed, 29 insertions(+)
> =

> diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> b/arch/arm64/boot/dts/rockchip/rk3368.dtsi index a635adc..2a0422f 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> @@ -189,6 +189,35 @@
>  		};
>  	};
> =

> +        amba {
> +                compatible =3D "simple-bus";
> +                #address-cells =3D <2>;
> +                #size-cells =3D <2>;
> +                ranges;
> +
> +                dmac_peri: dma-controller@ff250000 {
> +                        compatible =3D "arm,pl330", "arm,primecell";
> +                        reg =3D <0x0 0xff250000 0x0 0x4000>;
> +                        interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
> +                                     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> +                        #dma-cells =3D <1>;
> +                        clocks =3D <&cru ACLK_DMAC_PERI>;
> +                        clock-names =3D "apb_pclk";
> +                        arm,pl330-broken-no-flushp;
> +                };
> +
> +                dmac_bus: dma-controller@ff600000 {
> +                        compatible =3D "arm,pl330", "arm,primecell";
> +                        reg =3D <0x0 0xff600000 0x0 0x4000>;
> +                        interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> +                                     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
> +                        #dma-cells =3D <1>;
> +                        clocks =3D <&cru ACLK_DMAC_BUS>;
> +                        clock-names =3D "apb_pclk";
> +                        arm,pl330-broken-no-flushp;
> +                };
> +        };
> +
>  	arm-pmu {
>  		compatible =3D "arm,armv8-pmuv3";
>  		interrupts =3D <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
