Return-Path: <vinaysimha@inforcecomputing.com>
MIME-Version: 1.0
In-Reply-To: <1451993818-3469-1-git-send-email-vinaysimha@inforcecomputing.com>
References: <1451993818-3469-1-git-send-email-vinaysimha@inforcecomputing.com>
Date: Wed, 6 Jan 2016 12:08:25 +0530
Message-ID: <CAEEh9H0uy7tB+MWaGtAyhkCgqu7AmJigRSbGzYdX-Lw8LnDa3w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: apq8016-sbc: leds: bt and wlan
From: vinay simha <vinaysimha@inforcecomputing.com>
Content-Type: multipart/alternative; boundary=047d7b2e450eef9d910528a49982
To: Vinay Simha BN <vinaysimha@inforcecomputing.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "Ivan T. Ivanov" <ivan.ivanov@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Nicolas Dechesne <nicolas.dechesne@linaro.org>, Archit Taneja <architt@codeaurora.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, Andy Gross <agross@codeaurora.org>, linux-arm-msm@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--047d7b2e450eef9d910528a49982
Content-Type: text/plain; charset=UTF-8

++ andy gross, linux-arm-msm@vger.kernel.org

Regards,
vinay simha

On Tue, Jan 5, 2016 at 5:06 PM, Vinay Simha BN <
vinaysimha@inforcecomputing.com> wrote:

> BT LED   - PMIC - MPP_03
> WLAN LED - PMIC - MPP_02
>
> Signed-off-by: Vinay Simha BN <vinaysimha@inforcecomputing.com>
> ---
>  arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> index 7bb0ab8..37ca0c8 100644
> --- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> @@ -94,14 +94,14 @@
>                 led@5 {
>                         label = "apq8016-sbc:yellow:wifi";
>                         gpios = <&pm8916_mpps 2 GPIO_ACTIVE_HIGH>;
> -                       linux,default-trigger = "wlan";
> +                       linux,default-trigger = "rfkill0";
>                         default-state = "off";
>                 };
>
>                 led@6 {
>                         label = "apq8016-sbc:blue:bt";
>                         gpios = <&pm8916_mpps 3 GPIO_ACTIVE_HIGH>;
> -                       linux,default-trigger = "bt";
> +                       linux,default-trigger = "rfkill1";
>                         default-state = "off";
>                 };
>         };
> --
> 2.1.2
>
>

--047d7b2e450eef9d910528a49982
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">++ andy gross, <a href=3D"mailto:linux-arm-msm@vger.kernel=
.org">linux-arm-msm@vger.kernel.org</a></div><div class=3D"gmail_extra"><br=
 clear=3D"all"><div><div class=3D"gmail_signature"><div dir=3D"ltr">Regards=
,<div>vinay simha</div></div></div></div>
<br><div class=3D"gmail_quote">On Tue, Jan 5, 2016 at 5:06 PM, Vinay Simha =
BN <span dir=3D"ltr">&lt;<a href=3D"mailto:vinaysimha@inforcecomputing.com"=
 target=3D"_blank">vinaysimha@inforcecomputing.com</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">BT LED=C2=A0 =C2=A0- PMIC - MPP_03<br>
WLAN LED - PMIC - MPP_02<br>
<br>
Signed-off-by: Vinay Simha BN &lt;<a href=3D"mailto:vinaysimha@inforcecompu=
ting.com">vinaysimha@inforcecomputing.com</a>&gt;<br>
---<br>
=C2=A0arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dt=
s/qcom/apq8016-sbc.dtsi<br>
index 7bb0ab8..37ca0c8 100644<br>
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi<br>
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi<br>
@@ -94,14 +94,14 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 led@5 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 label =3D &quot;apq8016-sbc:yellow:wifi&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 gpios =3D &lt;&amp;pm8916_mpps 2 GPIO_ACTIVE_HIGH&gt;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0linux,default-trigger =3D &quot;wlan&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0linux,default-trigger =3D &quot;rfkill0&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 default-state =3D &quot;off&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 led@6 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 label =3D &quot;apq8016-sbc:blue:bt&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 gpios =3D &lt;&amp;pm8916_mpps 3 GPIO_ACTIVE_HIGH&gt;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0linux,default-trigger =3D &quot;bt&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0linux,default-trigger =3D &quot;rfkill1&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 default-state =3D &quot;off&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.2<br>
<br>
</font></span></blockquote></div><br></div>

--047d7b2e450eef9d910528a49982--
