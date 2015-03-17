Return-Path: <cooloney@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1426175228-29208-1-git-send-email-bjorn.andersson@sonymobile.com>
References: <1426175228-29208-1-git-send-email-bjorn.andersson@sonymobile.com>
From: Bryan Wu <cooloney@gmail.com>
Date: Tue, 17 Mar 2015 11:05:27 -0700
Message-ID: <CAK5ve-LiwU_eWGwFtbV6M8goxyQzCyjdSA+U5OtOBn91G51zXg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] leds: add DT binding for Qualcomm PM8941 WLED block
Content-Type: multipart/alternative; boundary=047d7b10ca55f14ae705117fd0d0
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Purdie <rpurdie@rpsys.net>, Grant Likely <grant.likely@linaro.org>, Courtney Cavin <courtney.cavin@sonymobile.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--047d7b10ca55f14ae705117fd0d0
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 12, 2015 at 8:47 AM, Bjorn Andersson <
bjorn.andersson@sonymobile.com> wrote:

> From: Courtney Cavin <courtney.cavin@sonymobile.com>
>
> This adds device tree binding documentation for the WLED ('White' LED)
> block on Qualcomm's PM8941 PMICs.
>
>
Applied to my tree.
Thanks,
-Bryan


> Signed-off-by: Courtney Cavin <courtney.cavin@sonymobile.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> ---
> Changes since v3:
> - None
>
> Changes since v2:
> - None
>
> Changes since v1:
> - None
>
>  .../devicetree/bindings/leds/leds-pm8941-wled.txt  | 43
> ++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/leds/leds-pm8941-wled.txt
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-pm8941-wled.txt
> b/Documentation/devicetree/bindings/leds/leds-pm8941-wled.txt
> new file mode 100644
> index 0000000..a85a964
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-pm8941-wled.txt
> @@ -0,0 +1,43 @@
> +Binding for Qualcomm PM8941 WLED driver
> +
> +Required properties:
> +- compatible: should be "qcom,pm8941-wled"
> +- reg: slave address
> +
> +Optional properties:
> +- label: The label for this led
> +  See Documentation/devicetree/bindings/leds/common.txt
> +- linux,default-trigger: Default trigger assigned to the LED
> +  See Documentation/devicetree/bindings/leds/common.txt
> +- qcom,cs-out: bool; enable current sink output
> +- qcom,cabc: bool; enable content adaptive backlight control
> +- qcom,ext-gen: bool; use externally generated modulator signal to dim
> +- qcom,current-limit: mA; per-string current limit; value from 0 to 25
> +       default: 20mA
> +- qcom,current-boost-limit: mA; boost current limit; one of:
> +       105, 385, 525, 805, 980, 1260, 1400, 1680
> +       default: 805mA
> +- qcom,switching-freq: kHz; switching frequency; one of:
> +       600, 640, 685, 738, 800, 872, 960, 1066, 1200, 1371,
> +       1600, 1920, 2400, 3200, 4800, 9600,
> +       default: 1600kHz
> +- qcom,ovp: V; Over-voltage protection limit; one of:
> +       27, 29, 32, 35
> +       default: 29V
> +- qcom,num-strings: #; number of led strings attached; value from 1 to 3
> +       default: 2
> +
> +Example:
> +
> +pm8941-wled@d800 {
> +       compatible = "qcom,pm8941-wled";
> +       reg = <0xd800>;
> +       label = "backlight";
> +
> +       qcom,cs-out;
> +       qcom,current-limit = <20>;
> +       qcom,current-boost-limit = <805>;
> +       qcom,switching-freq = <1600>;
> +       qcom,ovp = <29>;
> +       qcom,num-strings = <2>;
> +};
> --
> 1.8.2.2
>
>

--047d7b10ca55f14ae705117fd0d0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Mar 12, 2015 at 8:47 AM, Bjorn Andersson <span dir=3D"ltr">&lt;=
<a href=3D"mailto:bjorn.andersson@sonymobile.com" target=3D"_blank">bjorn.a=
ndersson@sonymobile.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">From: Courtney Cavin &lt;<a href=3D"mailto:courtney.cavin@sonymobile.c=
om">courtney.cavin@sonymobile.com</a>&gt;<br>
<br>
This adds device tree binding documentation for the WLED (&#39;White&#39; L=
ED)<br>
block on Qualcomm&#39;s PM8941 PMICs.<br>
<br></blockquote><div><br></div><div>Applied to my tree.</div><div>Thanks,<=
/div><div>-Bryan</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Signed-off-by: Courtney Cavin &lt;<a href=3D"mailto:courtney.cavin@sonymobi=
le.com">courtney.cavin@sonymobile.com</a>&gt;<br>
Signed-off-by: Bjorn Andersson &lt;<a href=3D"mailto:bjorn.andersson@sonymo=
bile.com">bjorn.andersson@sonymobile.com</a>&gt;<br>
---<br>
Changes since v3:<br>
- None<br>
<br>
Changes since v2:<br>
- None<br>
<br>
Changes since v1:<br>
- None<br>
<br>
=C2=A0.../devicetree/bindings/leds/leds-pm8941-wled.txt=C2=A0 | 43 ++++++++=
++++++++++++++<br>
=C2=A01 file changed, 43 insertions(+)<br>
=C2=A0create mode 100644 Documentation/devicetree/bindings/leds/leds-pm8941=
-wled.txt<br>
<br>
diff --git a/Documentation/devicetree/bindings/leds/leds-pm8941-wled.txt b/=
Documentation/devicetree/bindings/leds/leds-pm8941-wled.txt<br>
new file mode 100644<br>
index 0000000..a85a964<br>
--- /dev/null<br>
+++ b/Documentation/devicetree/bindings/leds/leds-pm8941-wled.txt<br>
@@ -0,0 +1,43 @@<br>
+Binding for Qualcomm PM8941 WLED driver<br>
+<br>
+Required properties:<br>
+- compatible: should be &quot;qcom,pm8941-wled&quot;<br>
+- reg: slave address<br>
+<br>
+Optional properties:<br>
+- label: The label for this led<br>
+=C2=A0 See Documentation/devicetree/bindings/leds/common.txt<br>
+- linux,default-trigger: Default trigger assigned to the LED<br>
+=C2=A0 See Documentation/devicetree/bindings/leds/common.txt<br>
+- qcom,cs-out: bool; enable current sink output<br>
+- qcom,cabc: bool; enable content adaptive backlight control<br>
+- qcom,ext-gen: bool; use externally generated modulator signal to dim<br>
+- qcom,current-limit: mA; per-string current limit; value from 0 to 25<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default: 20mA<br>
+- qcom,current-boost-limit: mA; boost current limit; one of:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0105, 385, 525, 805, 980, 1260, 1400, 1680<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default: 805mA<br>
+- qcom,switching-freq: kHz; switching frequency; one of:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0600, 640, 685, 738, 800, 872, 960, 1066, 1200, =
1371,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A01600, 1920, 2400, 3200, 4800, 9600,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default: 1600kHz<br>
+- qcom,ovp: V; Over-voltage protection limit; one of:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A027, 29, 32, 35<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default: 29V<br>
+- qcom,num-strings: #; number of led strings attached; value from 1 to 3<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default: 2<br>
+<br>
+Example:<br>
+<br>
+pm8941-wled@d800 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;qcom,pm8941-wled&quot;;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0xd800&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;backlight&quot;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0qcom,cs-out;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0qcom,current-limit =3D &lt;20&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0qcom,current-boost-limit =3D &lt;805&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0qcom,switching-freq =3D &lt;1600&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0qcom,ovp =3D &lt;29&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0qcom,num-strings =3D &lt;2&gt;;<br>
+};<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.8.2.2<br>
<br>
</font></span></blockquote></div><br></div></div>

--047d7b10ca55f14ae705117fd0d0--
