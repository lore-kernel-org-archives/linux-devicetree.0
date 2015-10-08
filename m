From: wangfei <w.f-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/8] dt-bindings: pmic: Document Hi655x pmic driver
Date: Thu, 8 Oct 2015 15:03:17 +0800
Message-ID: <56161535.1030801@huawei.com>
References: <1443611111-3196-1-git-send-email-w.f@huawei.com> <1443611111-3196-2-git-send-email-w.f@huawei.com> <20151001075844.GL3214@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151001075844.GL3214@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, z.liuxinliang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, william.wfei-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2015/10/1 15:58, Lee Jones wrote:
> I just noticed that you Cc'ed all of the Core ARM people too.  Please
> do not do that.  I'm sure they have enough of their own mail to trawl
> though.
>=20
> Only mail relevant parties i.e. those who show up when you use:
>=20
>   ./scripts/get_maintainer.pl.
>=20
OK=EF=BC=8Ci see=EF=BC=8Cthank you=EF=BC=81
>> Document the new compatible for Hisilicon Hi655x pmic driver.
>>
>> Signed-off-by: Fei Wang <w.f-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>> ---
>>  .../devicetree/bindings/mfd/hisilicon,hi655x.txt   |   80 +++++++++=
+++++++++++
>>  1 file changed, 80 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mfd/hisilicon,=
hi655x.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/hisilicon,hi655x.=
txt b/Documentation/devicetree/bindings/mfd/hisilicon,hi655x.txt
>> new file mode 100644
>> index 0000000..17bd8ca
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/hisilicon,hi655x.txt
>> @@ -0,0 +1,80 @@
>> +Hisilicon hi655x Power Management Integrated Circuit (PMIC)
>> +
>> +hi655x consists of a large and varied group of sub-devices:
>> +
>> +Device			 Supply Names	 Description
>> +------			 ------------	 -----------
>> +hi655x-powerkey		:		: Powerkey
>> +hi655x-regulator-pmic	:		: Regulators
>> +hi655x-usbvbus		:		: USB plug detection
>> +hi655x-pmu-rtc		:		: RTC
>> +hi655x-coul		:		: Coulomb
>> +
>> +Required properties:
>> +- compatible : Should be "hisilicon,hi655x-pmic-driver"
>> +- reg: Base address of PMIC on hi6220 soc
>> +- #interrupt-cells: Should be 2, is the local IRQ number for hi655x=
=2E
>> +- interrupt-controller: hi655x has internal IRQs (has own IRQ domai=
n).
>> +- pmu_irq_gpio: should be &gpio_pmu_irq_n, is the IRQ gpio of hi655=
x.
>> +
>> +Example:
>> +	pmic: pmic@F8000000 {
>> +                compatible =3D "hisilicon,hi655x-pmic-driver";
>> +                reg =3D <0x0 0xF8000000 0x0 0x1000>;
>> +                #interrupt-cells =3D <2>;
>> +                interrupt-controller;
>> +                pmu_irq_gpio =3D <&gpio_pmu_irq_n>;
>> +                status =3D "ok";
>> +
>> +                ponkey:ponkey@b1{
>> +                        compatible =3D "hisilicon,hi655x-powerkey";
>> +                        interrupt-parent =3D <&pmic>;
>> +                        interrupts =3D <6 0>, <5 0>, <4 0>;
>> +                        interrupt-names =3D "down", "up", "hold 1s"=
;
>> +                };
>> +
>> +                coul: coul@1 {
>> +                        compatible =3D "hisilicon,hi655x-coul";
>> +                        interrupt-parent =3D <&pmic>;
>> +                        interrupts =3D <24 0>, <25 0>, <26 0>, <27 =
0>;
>> +                        interrupt-names =3D "cl_int_i", "cl_out_i",=
 "cl_in_i", "vbat_int_i";
>> +                        battery_product_index =3D <0>;
>> +                        status =3D "ok";
>> +                };
>> +
>> +                rtc: rtc@1 {
>> +                        compatible =3D "hisilicon,hi655x-pmu-rtc";
>> +                        interrupt-parent =3D <&pmic>;
>> +                        interrupts =3D <20 0>;
>> +                        interrupt-names =3D "hi655x_pmu_rtc";
>> +                        board_id =3D <1>;
>> +                };
>> +
>> +                usbvbus:usbvbus@b2{
>> +                        compatible =3D "hisilicon,hi655x-usbvbus";
>> +                        interrupt-parent =3D <&pmic>;
>> +                        interrupts =3D <9 0>, <8 0>;
>> +                        interrupt-names =3D "connect", "disconnect"=
;
>> +                };
>> +
>> +		ldo2: regulator@a21 {
>> +                        compatible =3D "hisilicon,hi655x-regulator-=
pmic";
>> +                        regulator-name =3D "ldo2";
>> +                        regulator-min-microvolt =3D <2500000>;
>> +                        regulator-max-microvolt =3D <3200000>;
>> +                        hisilicon,valid-modes-mask =3D <0x02>;
>> +                        hisilicon,valid-ops-mask =3D <0x01d>;
>> +                        hisilicon,initial-mode =3D <0x02>;
>> +                        hisilicon,regulator-type =3D <0x01>;
>> +
>> +                        hisilicon,off-on-delay =3D <120>;
>> +                        hisilicon,ctrl-regs =3D <0x029 0x02a 0x02b>=
;
>> +                        hisilicon,ctrl-data =3D <0x1 0x1>;
>> +                        hisilicon,vset-regs =3D <0x072>;
>> +                        hisilicon,vset-data =3D <0 0x3>;
>> +                        hisilicon,regulator-n-vol =3D <8>;
>> +                        hisilicon,vset-table =3D <2500000>,<2600000=
>,<2700000>,<2800000>,<2900000>,<3000000>,<3100000>,<3200000>;
>> +                        hisilicon,num_consumer_supplies =3D <1>;
>> +                        hisilicon,consumer-supplies =3D "sensor_ana=
log";
>> +                };
>> +	};
>=20


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
