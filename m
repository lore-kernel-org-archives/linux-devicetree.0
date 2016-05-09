From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V11 1/6] mfd: add device-tree binding doc for PMIC
 max77620/max20024
Date: Mon, 9 May 2016 15:38:32 +0100
Message-ID: <20160509143832.GN8324@dell>
References: <1461837540-17071-1-git-send-email-ldewangan@nvidia.com>
 <1461837540-17071-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1461837540-17071-2-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 28 Apr 2016, Laxman Dewangan wrote:

> The MAXIM PMIC MAX77620 and MAX20024 are power management IC
> which supports RTC, GPIO, DCDC/LDO regulators, interrupt,
> watchdog etc.
>=20
> Add DT binding document for the different functionality of
> this device.
>=20
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>=20
> ---
> Changes from V1:
> - Added units in some of properties.
> - Change the boolean property to tristate type and detail some of
>   properties.
>=20
> Change from V2:
> - added unit in period related dt property.
>=20
> Change from V3: None
> - Added Rob's ack.
>=20
> Changes from V4:
> - A- Provide more details in the dt binding doc.
> - Take care of fps nodes.
> - Split the submodule's DT binding doc on respective folder.
> - Drop the battery charger and low battery binding and related code a=
s
>   it need to go on power driver.
>=20
> Change from V5:
> - None
>=20
> Change from V6:
> -start the patch title with mfd instead of DT: mfd:
>=20
> Change from V7:
> - Better describe the FPS to make more clear.
>=20
> Changes from V8/V9/V10:
> None
>=20
>  Documentation/devicetree/bindings/mfd/max77620.txt | 143 +++++++++++=
++++++++++
>  include/dt-bindings/mfd/max77620.h                 |  39 ++++++
>  2 files changed, 182 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/max77620.tx=
t
>  create mode 100644 include/dt-bindings/mfd/max77620.h

Applied, thanks.

> diff --git a/Documentation/devicetree/bindings/mfd/max77620.txt b/Doc=
umentation/devicetree/bindings/mfd/max77620.txt
> new file mode 100644
> index 0000000..2ad44f7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/max77620.txt
> @@ -0,0 +1,143 @@
> +MAX77620 Power management IC from Maxim Semiconductor.
> +
> +Required properties:
> +-------------------
> +- compatible: Must be one of
> +		"maxim,max77620"
> +		"maxim,max20024".
> +- reg: I2C device address.
> +
> +Optional properties:
> +-------------------
> +- interrupts:		The interrupt on the parent the controller is
> +			connected to.
> +- interrupt-controller: Marks the device node as an interrupt contro=
ller.
> +- #interrupt-cells:	is <2> and their usage is compliant to the 2 cel=
ls
> +			variant of <../interrupt-controller/interrupts.txt>
> +			IRQ numbers for different interrupt source of MAX77620
> +			are defined at dt-bindings/mfd/max77620.h.
> +
> +Optional subnodes and their properties:
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Flexible power sequence configurations:
> +--------------------------------------
> +The Flexible Power Sequencer (FPS) allows each regulator to power up=
 under
> +hardware or software control. Additionally, each regulator can power=
 on
> +independently or among a group of other regulators with an adjustabl=
e power-up
> +and power-down delays (sequencing). GPIO1, GPIO2, and GPIO3 can be p=
rogrammed
> +to be part of a sequence allowing external regulators to be sequence=
d along
> +with internal regulators. 32KHz clock can be programmed to be part o=
f a
> +sequence.
> +
> +The flexible sequencing structure consists of two hardware enable in=
puts
> +(EN0, EN1), and 3 master sequencing timers called FPS0, FPS1 and FPS=
2.
> +Each master sequencing timer is programmable through its configurati=
on
> +register to have a hardware enable source (EN1 or EN2) or a software=
 enable
> +source (SW). When enabled/disabled, the master sequencing timer gene=
rates
> +eight sequencing events on different time periods called slots. The =
time
> +period between each event is programmable within the configuration r=
egister.
> +Each regulator, GPIO1, GPIO2, GPIO3, and 32KHz clock has a flexible =
power
> +sequence slave register which allows its enable source to be specifi=
ed as
> +a flexible power sequencer timer or a software bit. When a FPS sourc=
e of
> +regulators, GPIOs and clocks specifies the enable source to be a fle=
xible
> +power sequencer, the power up and power down delays can be specified=
 in
> +the regulators, GPIOs and clocks flexible power sequencer configurat=
ion
> +registers.
> +
> +When FPS event cleared (set to LOW), regulators, GPIOs and 32KHz
> +clock are set into following state at the sequencing event that
> +corresponds to its flexible sequencer configuration register.
> +	Sleep state: 			In this state, regulators, GPIOs
> +					and 32KHz clock get disabled at
> +					the sequencing event.
> +	Global Low Power Mode (GLPM):	In this state, regulators are set in
> +					low power mode at the sequencing event.
> +
> +The configuration parameters of FPS is provided through sub-node "fp=
s"
> +and their child for FPS specific. The child node name for FPS are "f=
ps0",
> +"fps1", and "fps2" for FPS0, FPS1 and FPS2 respectively.
> +
> +The FPS configurations like FPS source, power up and power down slot=
s for
> +regulators, GPIOs and 32kHz clocks are provided in their respective
> +configuration nodes which is explained in respective sub-system DT
> +binding document.
> +
> +There is need for different FPS configuration parameters based on sy=
stem
> +state like when system state changed from active to suspend or activ=
e to
> +power off (shutdown).
> +
> +Optional properties:
> +-------------------
> +-maxim,fps-event-source:		u32, FPS event source like external
> +					hardware input to PMIC i.e. EN0, EN1 or
> +					software (SW).
> +					The macros are defined on
> +						dt-bindings/mfd/max77620.h
> +					for different control source.
> +					- MAX77620_FPS_EVENT_SRC_EN0
> +						for hardware input pin EN0.
> +					- MAX77620_FPS_EVENT_SRC_EN1
> +						for hardware input pin EN1.
> +					- MAX77620_FPS_EVENT_SRC_SW
> +						for software control.
> +
> +-maxim,shutdown-fps-time-period-us:	u32, FPS time period in microsec=
onds
> +					when system enters in to shutdown
> +					state.
> +
> +-maxim,suspend-fps-time-period-us:	u32, FPS time period in microseco=
nds
> +					when system enters in to suspend state.
> +
> +-maxim,device-state-on-disabled-event:	u32, describe the PMIC state =
when FPS
> +					event cleared (set to LOW) whether it
> +					should go to sleep state or low-power
> +					state. Following are valid values:
> +					- MAX77620_FPS_INACTIVE_STATE_SLEEP
> +						to set the PMIC state to sleep.
> +					- MAX77620_FPS_INACTIVE_STATE_LOW_POWER
> +						to set the PMIC state to low
> +						power.
> +					Absence of this property or other value
> +					will not change device state when FPS
> +					event get cleared.
> +
> +Here supported time periods by device in microseconds are as follows=
:
> +MAX77620 supports 40, 80, 160, 320, 640, 1280, 2560 and 5120 microse=
conds.
> +MAX20024 supports 20, 40, 80, 160, 320, 640, 1280 and 2540 microseco=
nds.
> +
> +For DT binding details of different sub modules like GPIO, pincontro=
l,
> +regulator, power, please refer respective device-tree binding docume=
nt
> +under their respective sub-system directories.
> +
> +Example:
> +--------
> +#include <dt-bindings/mfd/max77620.h>
> +
> +max77620@3c {
> +	compatible =3D "maxim,max77620";
> +	reg =3D <0x3c>;
> +
> +	interrupt-parent =3D <&intc>;
> +	interrupts =3D <0 86 IRQ_TYPE_NONE>;
> +
> +	interrupt-controller;
> +	#interrupt-cells =3D <2>;
> +
> +	fps {
> +		fps0 {
> +			maxim,shutdown-fps-time-period-us =3D <1280>;
> +			maxim,fps-event-source =3D <MAX77620_FPS_EVENT_SRC_EN1>;
> +		};
> +
> +		fps1 {
> +			maxim,shutdown-fps-time-period-us =3D <1280>;
> +			maxim,fps-event-source =3D <MAX77620_FPS_EVENT_SRC_EN0>;
> +		};
> +
> +		fps2 {
> +			maxim,shutdown-fps-time-period-us =3D <1280>;
> +			maxim,fps-event-source =3D <MAX77620_FPS_EVENT_SRC_SW>;
> +		};
> +	};
> +};
> diff --git a/include/dt-bindings/mfd/max77620.h b/include/dt-bindings=
/mfd/max77620.h
> new file mode 100644
> index 0000000..b911a07
> --- /dev/null
> +++ b/include/dt-bindings/mfd/max77620.h
> @@ -0,0 +1,39 @@
> +/*
> + * This header provides macros for MAXIM MAX77620 device bindings.
> + *
> + * Copyright (c) 2016, NVIDIA Corporation.
> + * Author: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> + */
> +
> +#ifndef _DT_BINDINGS_MFD_MAX77620_H
> +#define _DT_BINDINGS_MFD_MAX77620_H
> +
> +/* MAX77620 interrupts */
> +#define MAX77620_IRQ_TOP_GLBL		0 /* Low-Battery */
> +#define MAX77620_IRQ_TOP_SD		1 /* SD power fail */
> +#define MAX77620_IRQ_TOP_LDO		2 /* LDO power fail */
> +#define MAX77620_IRQ_TOP_GPIO		3 /* GPIO internal int to MAX77620 */
> +#define MAX77620_IRQ_TOP_RTC		4 /* RTC */
> +#define MAX77620_IRQ_TOP_32K		5 /* 32kHz oscillator */
> +#define MAX77620_IRQ_TOP_ONOFF		6 /* ON/OFF oscillator */
> +#define MAX77620_IRQ_LBT_MBATLOW	7 /* Thermal alarm status, > 120C *=
/
> +#define MAX77620_IRQ_LBT_TJALRM1	8 /* Thermal alarm status, > 120C *=
/
> +#define MAX77620_IRQ_LBT_TJALRM2	9 /* Thermal alarm status, > 140C *=
/
> +
> +/* FPS event source */
> +#define MAX77620_FPS_EVENT_SRC_EN0		0
> +#define MAX77620_FPS_EVENT_SRC_EN1		1
> +#define MAX77620_FPS_EVENT_SRC_SW		2
> +
> +/* Device state when FPS event LOW  */
> +#define MAX77620_FPS_INACTIVE_STATE_SLEEP	0
> +#define MAX77620_FPS_INACTIVE_STATE_LOW_POWER	1
> +
> +/* FPS source */
> +#define MAX77620_FPS_SRC_0			0
> +#define MAX77620_FPS_SRC_1			1
> +#define MAX77620_FPS_SRC_2			2
> +#define MAX77620_FPS_SRC_NONE			3
> +#define MAX77620_FPS_SRC_DEF			4
> +
> +#endif

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
