Return-Path: <gabriel.fernandez@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1397226820-5604-1-git-send-email-gabriel.fernandez@linaro.org>
References: <1397226820-5604-1-git-send-email-gabriel.fernandez@linaro.org>
Date: Fri, 11 Apr 2014 16:53:56 +0200
Message-ID: <CAG374jCL3m0Yxkbim-VpJn+Q0Gv+pSUgR19L0gWwLDZW3axU_A@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] Add ST Keyscan driver
From: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Content-Type: multipart/alternative; boundary=001a1134f2bec99d6404f6c58092
To: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, kernel@stlinux.com, Lee Jones <lee.jones@linaro.org>
List-ID: <devicetree@vger.kernel.org>

--001a1134f2bec99d6404f6c58092
Content-Type: text/plain; charset=ISO-8859-1

Sorry,  don't review this v3 version, i made mistake...

i prepare a v4 version.

Best regards.

Gabriel



On 11 April 2014 16:33, Gabriel FERNANDEZ <gabriel.fernandez@st.com> wrote:

> Changes in v3:
> - add reset controller management
> - rename 'st,debounce_us' into 'st,debounce-us' in dt binding
>
> Changes in v2:
> - use standard format for matrix keymap
> - suppress __exit mark for keyscan_remove()
> - Call to keyscan_stop() shoudl go into keyscan_close() implementation
> - use of SIMPLE_DEV_PM_OPS()
> - rename compatibility name into "st,sti-keyscan"
> - suppress platform data management
> - omit vendor information
> - cosmetic change and renaming
>
> The goal of this series is to add ST Keyscan support to ST SoCs.
> The DT definition is added for STiH415 and STiH416 SoCs on
> B2000 board.
>
> Gabriel Fernandez (5):
>   drivers: input: keyboard: st-keyscan: add keyscan driver
>   ARM: STi: DT: add keyscan for stih415
>   ARM: STi: DT: add keyscan for stih416
>   ARM: STi: DT: add keyscan for stih41x-b2000
>   ARM: multi_v7_defconfig: add ST Keyscan driver
>
> Giuseppe CONDORELLI (2):
>   driver: reset: sti: add keyscan for stih415
>   driver: reset: sti: add keyscan for stih416
>
>  .../devicetree/bindings/input/st-keyscan.txt       |  60 +++++
>  arch/arm/boot/dts/stih415-pinctrl.dtsi             |  16 ++
>  arch/arm/boot/dts/stih415.dtsi                     |  12 +
>  arch/arm/boot/dts/stih416-pinctrl.dtsi             |  16 ++
>  arch/arm/boot/dts/stih416.dtsi                     |  12 +
>  arch/arm/boot/dts/stih41x-b2000.dtsi               |  23 ++
>  arch/arm/configs/multi_v7_defconfig                |   1 +
>  drivers/input/keyboard/Kconfig                     |  12 +
>  drivers/input/keyboard/Makefile                    |   1 +
>  drivers/input/keyboard/st-keyscan.c                | 260
> +++++++++++++++++++++
>  drivers/reset/sti/reset-stih415.c                  |   1 +
>  drivers/reset/sti/reset-stih416.c                  |   1 +
>  .../dt-bindings/reset-controller/stih415-resets.h  |   1 +
>  .../dt-bindings/reset-controller/stih416-resets.h  |   1 +
>  14 files changed, 417 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/st-keyscan.txt
>  create mode 100644 drivers/input/keyboard/st-keyscan.c
>
> --
> 1.9.1
>
>

--001a1134f2bec99d6404f6c58092
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Sorry,=A0 don&#39;t review this v3 version, i ma=
de mistake...<br><br></div><div>i prepare a v4 version.<br></div><div><br><=
/div>Best regards.<br><br></div>Gabriel<br><div><div><br></div></div></div>=
<div class=3D"gmail_extra">
<br><br><div class=3D"gmail_quote">On 11 April 2014 16:33, Gabriel FERNANDE=
Z <span dir=3D"ltr">&lt;<a href=3D"mailto:gabriel.fernandez@st.com" target=
=3D"_blank">gabriel.fernandez@st.com</a>&gt;</span> wrote:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">
Changes in v3:<br>
- add reset controller management<br>
- rename &#39;st,debounce_us&#39; into &#39;st,debounce-us&#39; in dt bindi=
ng<br>
<br>
Changes in v2:<br>
- use standard format for matrix keymap<br>
- suppress __exit mark for keyscan_remove()<br>
- Call to keyscan_stop() shoudl go into keyscan_close() implementation<br>
- use of SIMPLE_DEV_PM_OPS()<br>
- rename compatibility name into &quot;st,sti-keyscan&quot;<br>
- suppress platform data management<br>
- omit vendor information<br>
- cosmetic change and renaming<br>
<br>
The goal of this series is to add ST Keyscan support to ST SoCs.<br>
The DT definition is added for STiH415 and STiH416 SoCs on<br>
B2000 board.<br>
<br>
Gabriel Fernandez (5):<br>
=A0 drivers: input: keyboard: st-keyscan: add keyscan driver<br>
=A0 ARM: STi: DT: add keyscan for stih415<br>
=A0 ARM: STi: DT: add keyscan for stih416<br>
=A0 ARM: STi: DT: add keyscan for stih41x-b2000<br>
=A0 ARM: multi_v7_defconfig: add ST Keyscan driver<br>
<br>
Giuseppe CONDORELLI (2):<br>
=A0 driver: reset: sti: add keyscan for stih415<br>
=A0 driver: reset: sti: add keyscan for stih416<br>
<br>
=A0.../devicetree/bindings/input/st-keyscan.txt =A0 =A0 =A0 | =A060 +++++<b=
r>
=A0arch/arm/boot/dts/stih415-pinctrl.dtsi =A0 =A0 =A0 =A0 =A0 =A0 | =A016 +=
+<br>
=A0arch/arm/boot/dts/stih415.dtsi =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A012 +<br>
=A0arch/arm/boot/dts/stih416-pinctrl.dtsi =A0 =A0 =A0 =A0 =A0 =A0 | =A016 +=
+<br>
=A0arch/arm/boot/dts/stih416.dtsi =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A012 +<br>
=A0arch/arm/boot/dts/stih41x-b2000.dtsi =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A023=
 ++<br>
=A0arch/arm/configs/multi_v7_defconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 1 +<br>
=A0drivers/input/keyboard/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A012 +<br>
=A0drivers/input/keyboard/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 1 +<br>
=A0drivers/input/keyboard/st-keyscan.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| 260=
 +++++++++++++++++++++<br>
=A0drivers/reset/sti/reset-stih415.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 1 +<br>
=A0drivers/reset/sti/reset-stih416.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 1 +<br>
=A0.../dt-bindings/reset-controller/stih415-resets.h =A0| =A0 1 +<br>
=A0.../dt-bindings/reset-controller/stih416-resets.h =A0| =A0 1 +<br>
=A014 files changed, 417 insertions(+)<br>
=A0create mode 100644 Documentation/devicetree/bindings/input/st-keyscan.tx=
t<br>
=A0create mode 100644 drivers/input/keyboard/st-keyscan.c<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
1.9.1<br>
<br>
</font></span></blockquote></div><br></div>

--001a1134f2bec99d6404f6c58092--
