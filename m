From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/8] dt-bindings: pmic: Document Hi655x pmic driver
Date: Thu, 1 Oct 2015 08:58:44 +0100
Message-ID: <20151001075844.GL3214@x1>
References: <1443611111-3196-1-git-send-email-w.f@huawei.com>
 <1443611111-3196-2-git-send-email-w.f@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1443611111-3196-2-git-send-email-w.f@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fei Wang <w.f@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, khilman@linaro.org, sameo@linux.intel.com, broonie@kernel.org, lgirdwood@gmail.com, bintian.wang@huawei.com, xuwei5@hisilicon.com, haojian.zhuang@linaro.org, zhangfei.gao@linaro.org, guodong.xu@linaro.org, jorge.ramirez-ortiz@linaro.org, puck.chen@hisilicon.com, xuyiping@hisilicon.com, kong.kongxinwei@hisilicon.com, z.liuxinliang@hisilicon.com, william.wfei@gmail.com, zhongkaihua@huawei.com
List-Id: devicetree@vger.kernel.org

I just noticed that you Cc'ed all of the Core ARM people too.  Please
do not do that.  I'm sure they have enough of their own mail to trawl
though.

Only mail relevant parties i.e. those who show up when you use:

  ./scripts/get_maintainer.pl.

> Document the new compatible for Hisilicon Hi655x pmic driver.
>=20
> Signed-off-by: Fei Wang <w.f@huawei.com>
> ---
>  .../devicetree/bindings/mfd/hisilicon,hi655x.txt   |   80 ++++++++++=
++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/hisilicon,h=
i655x.txt
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/hisilicon,hi655x.t=
xt b/Documentation/devicetree/bindings/mfd/hisilicon,hi655x.txt
> new file mode 100644
> index 0000000..17bd8ca
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/hisilicon,hi655x.txt
> @@ -0,0 +1,80 @@
> +Hisilicon hi655x Power Management Integrated Circuit (PMIC)
> +
> +hi655x consists of a large and varied group of sub-devices:
> +
> +Device			 Supply Names	 Description
> +------			 ------------	 -----------
> +hi655x-powerkey		:		: Powerkey
> +hi655x-regulator-pmic	:		: Regulators
> +hi655x-usbvbus		:		: USB plug detection
> +hi655x-pmu-rtc		:		: RTC
> +hi655x-coul		:		: Coulomb
> +
> +Required properties:
> +- compatible : Should be "hisilicon,hi655x-pmic-driver"
> +- reg: Base address of PMIC on hi6220 soc
> +- #interrupt-cells: Should be 2, is the local IRQ number for hi655x.
> +- interrupt-controller: hi655x has internal IRQs (has own IRQ domain=
).
> +- pmu_irq_gpio: should be &gpio_pmu_irq_n, is the IRQ gpio of hi655x=
=2E
> +
> +Example:
> +	pmic: pmic@F8000000 {
> +                compatible =3D "hisilicon,hi655x-pmic-driver";
> +                reg =3D <0x0 0xF8000000 0x0 0x1000>;
> +                #interrupt-cells =3D <2>;
> +                interrupt-controller;
> +                pmu_irq_gpio =3D <&gpio_pmu_irq_n>;
> +                status =3D "ok";
> +
> +                ponkey:ponkey@b1{
> +                        compatible =3D "hisilicon,hi655x-powerkey";
> +                        interrupt-parent =3D <&pmic>;
> +                        interrupts =3D <6 0>, <5 0>, <4 0>;
> +                        interrupt-names =3D "down", "up", "hold 1s";
> +                };
> +
> +                coul: coul@1 {
> +                        compatible =3D "hisilicon,hi655x-coul";
> +                        interrupt-parent =3D <&pmic>;
> +                        interrupts =3D <24 0>, <25 0>, <26 0>, <27 0=
>;
> +                        interrupt-names =3D "cl_int_i", "cl_out_i", =
"cl_in_i", "vbat_int_i";
> +                        battery_product_index =3D <0>;
> +                        status =3D "ok";
> +                };
> +
> +                rtc: rtc@1 {
> +                        compatible =3D "hisilicon,hi655x-pmu-rtc";
> +                        interrupt-parent =3D <&pmic>;
> +                        interrupts =3D <20 0>;
> +                        interrupt-names =3D "hi655x_pmu_rtc";
> +                        board_id =3D <1>;
> +                };
> +
> +                usbvbus:usbvbus@b2{
> +                        compatible =3D "hisilicon,hi655x-usbvbus";
> +                        interrupt-parent =3D <&pmic>;
> +                        interrupts =3D <9 0>, <8 0>;
> +                        interrupt-names =3D "connect", "disconnect";
> +                };
> +
> +		ldo2: regulator@a21 {
> +                        compatible =3D "hisilicon,hi655x-regulator-p=
mic";
> +                        regulator-name =3D "ldo2";
> +                        regulator-min-microvolt =3D <2500000>;
> +                        regulator-max-microvolt =3D <3200000>;
> +                        hisilicon,valid-modes-mask =3D <0x02>;
> +                        hisilicon,valid-ops-mask =3D <0x01d>;
> +                        hisilicon,initial-mode =3D <0x02>;
> +                        hisilicon,regulator-type =3D <0x01>;
> +
> +                        hisilicon,off-on-delay =3D <120>;
> +                        hisilicon,ctrl-regs =3D <0x029 0x02a 0x02b>;
> +                        hisilicon,ctrl-data =3D <0x1 0x1>;
> +                        hisilicon,vset-regs =3D <0x072>;
> +                        hisilicon,vset-data =3D <0 0x3>;
> +                        hisilicon,regulator-n-vol =3D <8>;
> +                        hisilicon,vset-table =3D <2500000>,<2600000>=
,<2700000>,<2800000>,<2900000>,<3000000>,<3100000>,<3200000>;
> +                        hisilicon,num_consumer_supplies =3D <1>;
> +                        hisilicon,consumer-supplies =3D "sensor_anal=
og";
> +                };
> +	};

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
