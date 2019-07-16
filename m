From: Leo Li <leoyang.li@nxp.com>
Subject: RE: [v5,2/2] Documentation: dt: binding: rtc: add binding for ftm
 alarm driver
Date: Tue, 16 Jul 2019 20:31:01 +0000
Message-ID: <VE1PR04MB668718A642D1E521BF5F3F198FCE0@VE1PR04MB6687.eurprd04.prod.outlook.com>
References: <20190716101655.47418-1-biwen.li@nxp.com>
 <20190716101655.47418-2-biwen.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190716101655.47418-2-biwen.li@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "a.zummo@towertech.it" <a.zummo@towertech.it>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Xiaobo Xie <xiaobo.xie@nxp.com>, Jiafei Pan <jiafei.pan@nxp.com>, Ran Wang <ran.wang_1@nxp.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Biwen Li <biwen.li@nxp.com>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Biwen Li <biwen.li@nxp.com>
> Sent: Tuesday, July 16, 2019 5:17 AM
> To: a.zummo@towertech.it; alexandre.belloni@bootlin.com; Leo Li
> <leoyang.li@nxp.com>; robh+dt@kernel.org
> Cc: linux-rtc@vger.kernel.org; linux-kernel@vger.kernel.org; Xiaobo Xie
> <xiaobo.xie@nxp.com>; Jiafei Pan <jiafei.pan@nxp.com>; Ran Wang
> <ran.wang_1@nxp.com>; mark.rutland@arm.com;
> devicetree@vger.kernel.org; Biwen Li <biwen.li@nxp.com>
> Subject: [v5,2/2] Documentation: dt: binding: rtc: add binding for ftm al=
arm
> driver
>=20
> The patch adds binding for ftm alarm driver
>=20
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
> Change in v5:
>     - None
>=20
> Change in v4:
>     - add note about dts and kernel options
>     - add aliases in example
>=20
> Change in v3:
> 	- remove reg-names property
> 	- correct cells number
>=20
> Change in v2:
> 	- replace ls1043a with ls1088a as example
> 	- add rcpm node and fsl,rcpm-wakeup property
>=20
>=20
>  .../bindings/rtc/rtc-fsl-ftm-alarm.txt        | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-
> alarm.txt
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> new file mode 100644
> index 000000000000..fb018065406c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> @@ -0,0 +1,49 @@
> +Freescale FlexTimer Module (FTM) Alarm
> +
> +Note:
> +- The driver depends on RCPM driver
> +  to wake up system in sleep.
> +- Need stop using RTC_HCTOSYS or use the DT aliases
> +  to ensure the driver is not used as the primary RTC.
> +  (Select DT aliases defaultly)
> +
> +Required properties:
> +- compatible : Should be "fsl,<chip>-ftm-alarm", the
> +	       supported chips include
> +	       "fsl,ls1012a-ftm-alarm"
> +	       "fsl,ls1021a-ftm-alarm"
> +	       "fsl,ls1028a-ftm-alarm"
> +	       "fsl,ls1043a-ftm-alarm"
> +	       "fsl,ls1046a-ftm-alarm"
> +	       "fsl,ls1088a-ftm-alarm"
> +	       "fsl,ls208xa-ftm-alarm"
> +- reg : Specifies base physical address and size of the register sets fo=
r the
> +  FlexTimer Module and base physical address of IP Powerdown Exception
> Control
> +  Register.

You removed the IP Powerdown exception register in the examples, but not he=
re.

> +- interrupts : Should be the FlexTimer Module interrupt.
> +- fsl,rcpm-wakeup property and rcpm node : Please refer
> +	Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> +
> +Optional properties:
> +- big-endian: If the host controller is big-endian mode, specify this pr=
operty.
> +  The default endian mode is little-endian.
> +
> +Example:
> +aliases {
> +	...
> +	rtc1 =3D ftm_alarm0; /* Use flextimer alarm driver as /dev/rtc1 */
> +	...
> +};
> +
> +rcpm: rcpm@1e34040 {
> +	compatible =3D "fsl,ls1088a-rcpm", "fsl,qoriq-rcpm-2.1+";
> +	reg =3D <0x0 0x1e34040 0x0 0x18>;
> +	fsl,#rcpm-wakeup-cells =3D <6>;
> +};
> +
> +ftm_alarm0: timer@2800000 {
> +	compatible =3D "fsl,ls1088a-ftm-alarm";
> +	reg =3D <0x0 0x2800000 0x0 0x10000>;
> +	fsl,rcpm-wakeup =3D <&rcpm 0x0 0x0 0x0 0x0 0x4000 0x0>;
> +	interrupts =3D <0 44 4>;
> +};
> --
> 2.17.1
