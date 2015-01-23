From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/9] ARM: STi: DT: STiH407: Add Device Tree node for
 the LPC
Date: Fri, 23 Jan 2015 09:43:54 +0000
Message-ID: <20150123094354.GG9129@x1>
References: <1421927767-28889-1-git-send-email-lee.jones@linaro.org>
 <1421927767-28889-5-git-send-email-lee.jones@linaro.org>
 <54C208D9.6050006@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54C208D9.6050006-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Paris <david.paris-qxv4g6HH51o@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 23 Jan 2015, David Paris wrote:

> Hi Lee,
>=20
>     Just a minor remark/question,
>=20
>     David
>=20
> On 01/22/2015 12:56 PM, Lee Jones wrote:
> >On current ST platforms the LPC controls a number of functions.  Thi=
s
> >patch enables support for the LPC Watchdog and LPC RTC devices on LP=
C1
> >and LPC2 respectively.
> >
> >Signed-off-by: David Paris <david.paris-qxv4g6HH51o@public.gmane.org>
> >Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >---
> >  arch/arm/boot/dts/stih407-family.dtsi | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> >diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/d=
ts/stih407-family.dtsi
> >index 3e31d32..04448a7 100644
> >--- a/arch/arm/boot/dts/stih407-family.dtsi
> >+++ b/arch/arm/boot/dts/stih407-family.dtsi
> >@@ -7,6 +7,7 @@
> >   * publishhed by the Free Software Foundation.
> >   */
> >  #include "stih407-pinctrl.dtsi"
> >+#include <dt-bindings/mfd/st-lpc.h>
> >  #include <dt-bindings/reset-controller/stih407-resets.h>
> >  / {
> >  	#address-cells =3D <1>;
> >@@ -274,5 +275,24 @@
> >  			status =3D "disabled";
> >  		};
> >+
> >+		/* Watchdog and Real-Time Clock */
> >+		lpc@8787000 {
> >+			compatible =3D "st,stih407-lpc";
> >+			reg =3D <0x8787000 0x1000>;
> >+			interrupts =3D <GIC_SPI 129 IRQ_TYPE_EDGE_RISING>;
> In case of Watchdog, "interrupt" property is not used. So I think we
> can remove it ?

Sure thing.

> >+			clocks =3D <&clk_s_d3_flexgen CLK_LPC_0>;
> >+			timeout-sec =3D <120>;
> >+			st,syscfg =3D <&syscfg_core>;
> >+			st,lpc-mode =3D <ST_LPC_MODE_WDT>;
> >+		};
> >+
> >+		lpc@8788000 {
> >+			compatible =3D "st,stih407-lpc";
> >+			reg =3D <0x8788000 0x1000>;
> >+			interrupts =3D <GIC_SPI 130 IRQ_TYPE_EDGE_RISING>;
> >+			clocks =3D <&clk_s_d3_flexgen CLK_LPC_1>;
> >+			st,lpc-mode =3D <ST_LPC_MODE_RTC>;
> >+		};
> >  	};
> >  };
>=20

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
