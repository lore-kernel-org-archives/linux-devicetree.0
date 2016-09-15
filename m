From: Vinay Simha <simhavcs@gmail.com>
Subject: Re: [PATCH v4] dt-bindings: Add jdi lt070me05000 panel bindings
Date: Thu, 15 Sep 2016 20:15:16 +0530
Message-ID: <CAGWqDJ6YmxK+QR1E=733wzBxe_nvP_1iudCf5CMHi=1G+Mv4ig@mail.gmail.com>
References: <1473311672-20782-1-git-send-email-simhavcs@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0252641205=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1473311672-20782-1-git-send-email-simhavcs@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Vinay Simha BN <simhavcs@gmail.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>, Archit Taneja <archit.taneja@gmail.com>
List-Id: devicetree@vger.kernel.org

--===============0252641205==
Content-Type: multipart/alternative; boundary=001a11394e2ce78166053c8ce4df

--001a11394e2ce78166053c8ce4df
Content-Type: text/plain; charset=UTF-8

Hi Tierry,

Could you please review the patch and integrate?

On Thu, Sep 8, 2016 at 10:44 AM, Vinay Simha BN <simhavcs@gmail.com> wrote:

> Add documentation for lt070me05000 panel
>
> Cc: Archit Taneja <archit.taneja@gmail.com>
> Cc: John Stultz <john.stultz@linaro.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
>
> ---
> v2:
>  * incorporated rob herring and thierry reviews
>    gpio to gpios, gpio to regulator using fixed regulators
>    and pwm backlight is removed, since it is controlled by
>    dcs commands
>
> v3:
>  * incorporated thierry reviews
>    - Added gpio polarity details for reset-gpios
>    - proper naming conventions and sequence wrt panel datasheet
>      (vddp-supply, iovcc-supply,
>       enable-gpios, reset-gpios, dcdc-en-gpios)
> v4:
>  * pinctrl-names, pinctrl-0 removed, not required for
>    reset-gpios
> ---
>  .../bindings/display/panel/jdi,lt070me05000.txt    | 31
> ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/jdi,
> lt070me05000.txt
>
> diff --git a/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
> b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
> new file mode 100644
> index 0000000..4989c91d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
> @@ -0,0 +1,31 @@
> +JDI model LT070ME05000 1200x1920 7" DSI Panel
> +
> +Required properties:
> +- compatible: should be "jdi,lt070me05000"
> +- vddp-supply: phandle of the regulator that provides the supply voltage
> +  Power IC supply (3-5V)
> +- iovcc-supply: phandle of the regulator that provides the supply voltage
> +  IOVCC , power supply for LCM (1.8V)
> +- enable-gpios: phandle of gpio for enable line
> +  LED_EN, LED backlight enable, High active
> +- reset-gpios: phandle of gpio for reset line
> +  This should be 8mA, gpio can be configured using mux, pinctrl,
> pinctrl-names
> +  XRES, Reset, Low active
> +- dcdc-en-gpios: phandle of the gpio for power ic line
> +  Power IC supply enable, High active
> +
> +Example:
> +
> +       dsi0: qcom,mdss_dsi@4700000 {
> +               panel@0 {
> +                       compatible = "jdi,lt070me05000";
> +                       reg = <0>;
> +
> +                       vddp-supply = <&pm8921_l17>;
> +                       iovcc-supply = <&pm8921_lvs7>;
> +
> +                       enable-gpios = <&pm8921_gpio 36 GPIO_ACTIVE_HIGH>;
> +                       reset-gpios = <&tlmm_pinmux 54 GPIO_ACTIVE_LOW>;
> +                       dcdc-en-gpios = <&pm8921_gpio 23 GPIO_ACTIVE_HIGH>;
> +               };
> +       };
> --
> 2.1.2
>
>


-- 
regards,
vinaysimha

--001a11394e2ce78166053c8ce4df
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Tierry,<div><br class=3D"gmail-Apple-interchange-newlin=
e">Could you please review the patch and integrate?<br></div></div><div cla=
ss=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Sep 8, 2016 at 10=
:44 AM, Vinay Simha BN <span dir=3D"ltr">&lt;<a href=3D"mailto:simhavcs@gma=
il.com" target=3D"_blank">simhavcs@gmail.com</a>&gt;</span> wrote:<br><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">Add documentation for lt070me05000 panel<br>
<br>
Cc: Archit Taneja &lt;<a href=3D"mailto:archit.taneja@gmail.com">archit.tan=
eja@gmail.com</a>&gt;<br>
Cc: John Stultz &lt;<a href=3D"mailto:john.stultz@linaro.org">john.stultz@l=
inaro.org</a>&gt;<br>
Cc: Thierry Reding &lt;<a href=3D"mailto:thierry.reding@gmail.com">thierry.=
reding@gmail.com</a>&gt;<br>
Cc: Sumit Semwal &lt;<a href=3D"mailto:sumit.semwal@linaro.org">sumit.semwa=
l@linaro.org</a>&gt;<br>
Signed-off-by: Vinay Simha BN &lt;<a href=3D"mailto:simhavcs@gmail.com">sim=
havcs@gmail.com</a>&gt;<br>
Acked-by: Rob Herring &lt;<a href=3D"mailto:robh@kernel.org">robh@kernel.or=
g</a>&gt;<br>
<br>
---<br>
v2:<br>
=C2=A0* incorporated rob herring and thierry reviews<br>
=C2=A0 =C2=A0gpio to gpios, gpio to regulator using fixed regulators<br>
=C2=A0 =C2=A0and pwm backlight is removed, since it is controlled by<br>
=C2=A0 =C2=A0dcs commands<br>
<br>
v3:<br>
=C2=A0* incorporated thierry reviews<br>
=C2=A0 =C2=A0- Added gpio polarity details for reset-gpios<br>
=C2=A0 =C2=A0- proper naming conventions and sequence wrt panel datasheet<b=
r>
=C2=A0 =C2=A0 =C2=A0(vddp-supply, iovcc-supply,<br>
=C2=A0 =C2=A0 =C2=A0 enable-gpios, reset-gpios, dcdc-en-gpios)<br>
v4:<br>
=C2=A0* pinctrl-names, pinctrl-0 removed, not required for<br>
=C2=A0 =C2=A0reset-gpios<br>
---<br>
=C2=A0.../bindings/display/panel/<wbr>jdi,lt070me05000.txt=C2=A0 =C2=A0 | 3=
1 ++++++++++++++++++++++<br>
=C2=A01 file changed, 31 insertions(+)<br>
=C2=A0create mode 100644 Documentation/devicetree/<wbr>bindings/display/pan=
el/jdi,<wbr>lt070me05000.txt<br>
<br>
diff --git a/Documentation/devicetree/<wbr>bindings/display/panel/jdi,<wbr>=
lt070me05000.txt b/Documentation/devicetree/<wbr>bindings/display/panel/jdi=
,<wbr>lt070me05000.txt<br>
new file mode 100644<br>
index 0000000..4989c91d<br>
--- /dev/null<br>
+++ b/Documentation/devicetree/<wbr>bindings/display/panel/jdi,<wbr>lt070me=
05000.txt<br>
@@ -0,0 +1,31 @@<br>
+JDI model LT070ME05000 1200x1920 7&quot; DSI Panel<br>
+<br>
+Required properties:<br>
+- compatible: should be &quot;jdi,lt070me05000&quot;<br>
+- vddp-supply: phandle of the regulator that provides the supply voltage<b=
r>
+=C2=A0 Power IC supply (3-5V)<br>
+- iovcc-supply: phandle of the regulator that provides the supply voltage<=
br>
+=C2=A0 IOVCC , power supply for LCM (1.8V)<br>
+- enable-gpios: phandle of gpio for enable line<br>
+=C2=A0 LED_EN, LED backlight enable, High active<br>
+- reset-gpios: phandle of gpio for reset line<br>
+=C2=A0 This should be 8mA, gpio can be configured using mux, pinctrl, pinc=
trl-names<br>
+=C2=A0 XRES, Reset, Low active<br>
+- dcdc-en-gpios: phandle of the gpio for power ic line<br>
+=C2=A0 Power IC supply enable, High active<br>
+<br>
+Example:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dsi0: qcom,mdss_dsi@4700000 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0panel@0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0compatible =3D &quot;jdi,lt070me05000&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0reg =3D &lt;0&gt;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0vddp-supply =3D &lt;&amp;pm8921_l17&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0iovcc-supply =3D &lt;&amp;pm8921_lvs7&gt;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0enable-gpios =3D &lt;&amp;pm8921_gpio 36 GPIO_ACTIVE_HIGH&gt;;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0reset-gpios =3D &lt;&amp;tlmm_pinmux 54 GPIO_ACTIVE_LOW&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dcdc-en-gpios =3D &lt;&amp;pm8921_gpio 23 GPIO_ACTIVE_HIGH&gt;;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.2<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">regards=
,<br>vinaysimha</div>
</div>

--001a11394e2ce78166053c8ce4df--

--===============0252641205==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0252641205==--
