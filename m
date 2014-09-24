From: "Bird, Tim" <Tim.Bird@sonymobile.com>
Subject: RE: [PATCH v2] ARM: dts: Add initial DTS file for Sony Xperia Z1
Date: Wed, 24 Sep 2014 23:38:22 +0200
Message-ID: <F5184659D418E34EA12B1903EE5EF5FD0170C7C7B85C@seldmbx02.corpusers.net>
References: <5422DF46.90306@sonymobile.com>,<B9941F2B-B82A-475B-A482-9C774E3C11FA@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=Windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <B9941F2B-B82A-475B-A482-9C774E3C11FA@codeaurora.org>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, =?Windows-1252?Q?=22Andersson=2C_Bj=F6rn=22?= <Bjorn.Andersson@sonymobile.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "arnd.bergmann@linaro.org" <arnd.bergmann@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kevin Hilman <khilman@linaro.org>
List-Id: devicetree@vger.kernel.org

On Wednesday, September 24, 2014 11:21 AM, Kumar Gala [galak@codeaurora=
=2Eorg] wrote:
>
> On Sep 24, 2014, at 10:12 AM, Tim Bird <tim.bird@sonymobile.com> wrot=
e:
>
> > This DTS has support for the Sony Xperia Z1 phone (codenamed Honami=
).
> > This first version of the DTS supports just a serial console.
> >
> > changes from v1
> > - removed qcom,msm-id attribute
> > - removed mis-capitalized Qualcomm word
> > - changed dts file name
> > - added board-specific compatible-string
> >
> > Signed-off-by: Tim Bird <tim.bird@sonymobile.com>
> > =97
>
> Does this actually boot?  I=92d be surprised since =93qcom,msm8974=94=
 isn=92t in the match table (just sent a patch for that).

Yeah.  It booted just fine.  Apparently with CONFIG_ARCH_MULTIPLATFORM =
the
match table entry is not needed.

Do you want me to re-spin with an addition for "sony,xperia-honami" in =
the match table?

 -- Tim

> > Documentation/devicetree/bindings/vendor-prefixes.txt |  1 +
> > arch/arm/boot/dts/Makefile                            |  3 ++-
> > arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts | 17 ++++++++=
+++++++++
> > 3 files changed, 20 insertions(+), 1 deletion(-)
> > create mode 100644 arch/arm/boot/dts/qcom-msm8974-sony-xperia-honam=
i.dts
> >
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt =
b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > index ac7269f..d3a4579 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > @@ -128,6 +128,7 @@ sirf      SiRF Technology, Inc.
> > smsc  Standard Microsystems Corporation
> > snps  Synopsys, Inc.
> > solidrun      SolidRun
> > +sony Sony Corporation
> > spansion      Spansion Inc.
> > st    STMicroelectronics
> > ste   ST-Ericsson
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefil=
e
> > index b8c5cd3..0c2702e 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -343,7 +343,8 @@ dtb-$(CONFIG_ARCH_QCOM) +=3D \
> >       qcom-apq8074-dragonboard.dtb \
> >       qcom-apq8084-mtp.dtb \
> >       qcom-msm8660-surf.dtb \
> > -     qcom-msm8960-cdp.dtb
> > +     qcom-msm8960-cdp.dtb \
> > +     qcom-msm8974-sony-honami-xperia.dtb
> > dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D \
> >       rk3066a-bqcurie2.dtb \
> >       rk3188-radxarock.dtb \
> > diff --git a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts =
b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts
> > new file mode 100644
> > index 0000000..cccc21b
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts
> > @@ -0,0 +1,17 @@
> > +#include "qcom-msm8974.dtsi"
> > +
> > +/ {
> > +     model =3D "Sony Xperia Z1";
> > +     compatible =3D "sony,xperia-honami", "qcom,msm8974";
> > +
> > +     memory@0 {
> > +             reg =3D <0 0x40000000>, <0x40000000 0x40000000>;
> > +             device_type =3D "memory";
> > +     };
> > +};
> > +
> > +&soc {
> > +     serial@f991e000 {
> > +             status =3D "ok";
> > +     };
> > +};
> > --
> > 1.8.2.2
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-arm=
-msm" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
> --
> Employee of Qualcomm Innovation Center, Inc.
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, ho=
sted by The Linux Foundation
>
