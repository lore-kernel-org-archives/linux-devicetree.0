Return-Path: <kiran.padwal@smartplayin.com>
Date: Mon, 21 Jul 2014 07:13:22 -0400 (EDT)
Subject: RE: [PATCH v2 2/4] pinctrl: qpnp: Qualcomm PMIC pin controller driver
From: kiran.padwal@smartplayin.com
MIME-Version: 1.0
Content-Type: multipart/alternative;boundary="----=_20140721071322000000_82253"
In-Reply-To: <1405610748-7583-3-git-send-email-iivanov@mm-sol.com>
References: <1405610748-7583-1-git-send-email-iivanov@mm-sol.com>
 <1405610748-7583-3-git-send-email-iivanov@mm-sol.com>
Message-ID: <1405941202.870420632@apps.rackspace.com>
To: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

------=_20140721071322000000_82253
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=0AHi,=0A =0AOn Thursday, July 17, 2014 11:25am, "Ivan T. Ivanov" <iivanov@=
mm-sol.com> said:=0A=0A=0A=0A> From: "Ivan T. Ivanov" <iivanov@mm-sol.com>=
=0A> =0A> This is the pinctrl, pinmux, pinconf and gpiolib driver for the=
=0A> Qualcomm GPIO and MPP sub-function blocks found in the PMIC chips.=0A>=
 =0A> Signed-off-by: Ivan T. Ivanov <iivanov@mm-sol.com>=0A> ---=0A> driver=
s/pinctrl/Kconfig | 12 +=0A> drivers/pinctrl/Makefile | 1 +=0A.=0A[snip]=0A=
.=0A> diff --git a/drivers/pinctrl/pinctrl-qpnp.c b/drivers/pinctrl/pinctrl=
-qpnp.c=0A> new file mode 100644=0A> index 0000000..aedc72e=0A> --- /dev/nu=
ll=0A> +++ b/drivers/pinctrl/pinctrl-qpnp.c=0A.=0A[snip]=0A.=0A> +#define Q=
PNP_MPP_CS_OUT_40MA 7=0A> +=0A> +/* revision registers base address offsets=
 */=0A =0Aunused define, can you please remove it=0A=0A> +#define QPNP_REG_=
DIG_MINOR_REV 0x0=0A> +#define QPNP_REG_DIG_MAJOR_REV 0x1=0A =0Aditto=0A=0A=
> +#define QPNP_REG_ANA_MINOR_REV 0x2=0A> +=0A> +/* type registers base add=
ress offsets */=0A> +#define QPNP_REG_TYPE 0x4=0A> +#define QPNP_REG_SUBTYP=
E 0x5=0A> +=0A> +/* GPIO peripheral type and subtype values */=0A> +#define=
 QPNP_GPIO_TYPE 0x10=0A> +#define QPNP_GPIO_SUBTYPE_GPIO_4CH 0x1=0A> +#defi=
ne QPNP_GPIO_SUBTYPE_GPIOC_4CH 0x5=0A> +#define QPNP_GPIO_SUBTYPE_GPIO_8CH =
0x9=0A> +#define QPNP_GPIO_SUBTYPE_GPIOC_8CH 0xd=0A> +=0A> +/* mpp peripher=
al type and subtype values */=0A> +#define QPNP_MPP_TYPE 0x11=0A> +#define =
QPNP_MPP_SUBTYPE_4CH_NO_ANA_OUT 0x3=0A> +#define QPNP_MPP_SUBTYPE_ULT_4CH_N=
O_ANA_OUT 0x4=0A> +#define QPNP_MPP_SUBTYPE_4CH_NO_SINK 0x5=0A> +#define QP=
NP_MPP_SUBTYPE_ULT_4CH_NO_SINK 0x6=0A> +#define QPNP_MPP_SUBTYPE_4CH_FULL_F=
UNC 0x7=0A> +#define QPNP_MPP_SUBTYPE_8CH_FULL_FUNC 0xf=0A> +=0A> +#define =
QPNP_REG_STATUS1 0x8=0A> +#define QPNP_REG_STATUS1_VAL_MASK 0x1=0A> +#defin=
e QPNP_REG_STATUS1_GPIO_EN_REV0_MASK 0x2=0A> +#define QPNP_REG_STATUS1_GPIO=
_EN_MASK 0x80=0A> +#define QPNP_REG_STATUS1_MPP_EN_MASK 0x80=0A> +=0A> +/* =
control register base address offsets */=0A> +#define QPNP_REG_MODE_CTL 0x4=
0=0A> +#define QPNP_REG_DIG_VIN_CTL 0x41=0A> +#define QPNP_REG_DIG_PULL_CTL=
 0x42=0A =0Aditto=0A=0A> +#define QPNP_REG_DIG_IN_CTL 0x43=0A> +#define QPN=
P_REG_DIG_OUT_CTL 0x45=0A> +#define QPNP_REG_EN_CTL 0x46=0A> +#define QPNP_=
REG_AOUT_CTL 0x4b=0A.=0A[snip]=0A.=0A> +#define PM8XXX_MPP_AIN_ABUS3 6=0A> =
+#define PM8XXX_MPP_AIN_ABUS4 7=0A> +=0A> +#endif=0A> --=0A> 1.8.3.2=0A> =
=0A> --=0A> To unsubscribe from this list: send the line "unsubscribe linux=
-arm-msm" in=0A> the body of a message to majordomo@vger.kernel.org=0A> Mor=
e majordomo info at http://vger.kernel.org/majordomo-info.html=0A> =0A =0AR=
egards,=0A--Kiran
------=_20140721071322000000_82253
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<font face=3D"arial" size=3D"2"><p style=3D"margin:0;padding:0;font-family:=
 arial; font-size: 10pt;">Hi,</p>=0A<p style=3D"margin:0;padding:0;font-fam=
ily: arial; font-size: 10pt;">&nbsp;</p>=0A<p style=3D"margin:0;padding:0;f=
ont-family: arial; font-size: 10pt;">On Thursday, July 17, 2014 11:25am, "I=
van T. Ivanov" &lt;iivanov@mm-sol.com&gt; said:<br /><br /></p>=0A<div id=
=3D"SafeStyles1405940668">=0A<p style=3D"margin:0;padding:0;font-family: ar=
ial; font-size: 10pt;">&gt; From: "Ivan T. Ivanov" &lt;iivanov@mm-sol.com&g=
t;<br />&gt; <br />&gt; This is the pinctrl, pinmux, pinconf and gpiolib dr=
iver for the<br />&gt; Qualcomm GPIO and MPP sub-function blocks found in t=
he PMIC chips.<br />&gt; <br />&gt; Signed-off-by: Ivan T. Ivanov &lt;iivan=
ov@mm-sol.com&gt;<br />&gt; ---<br />&gt; drivers/pinctrl/Kconfig | 12 +<br=
 />&gt; drivers/pinctrl/Makefile | 1 +</p>=0A<p style=3D"margin:0;padding:0=
;font-family: arial; font-size: 10pt;">.</p>=0A<p style=3D"margin:0;padding=
:0;font-family: arial; font-size: 10pt;">[snip]</p>=0A<p style=3D"margin:0;=
padding:0;font-family: arial; font-size: 10pt;">.<br />&gt; diff --git a/dr=
ivers/pinctrl/pinctrl-qpnp.c b/drivers/pinctrl/pinctrl-qpnp.c<br />&gt; new=
 file mode 100644<br />&gt; index 0000000..aedc72e<br />&gt; --- /dev/null<=
br />&gt; +++ b/drivers/pinctrl/pinctrl-qpnp.c</p>=0A<p style=3D"margin:0;p=
adding:0;font-family: arial; font-size: 10pt;">.</p>=0A<p style=3D"margin:0=
;padding:0;font-family: arial; font-size: 10pt;">[snip]</p>=0A<p style=3D"m=
argin:0;padding:0;font-family: arial; font-size: 10pt;">.</p>=0A<p style=3D=
"margin:0;padding:0;font-family: arial; font-size: 10pt;">&gt; +#define QPN=
P_MPP_CS_OUT_40MA 7<br />&gt; +<br />&gt; +/* revision registers base addre=
ss offsets */</p>=0A<p style=3D"margin:0;padding:0;font-family: arial; font=
-size: 10pt;">&nbsp;</p>=0A<p style=3D"margin:0;padding:0;font-family: aria=
l; font-size: 10pt;"><span style=3D"font-family: monospace;">unused define,=
 can you please remove it</span></p>=0A<p style=3D"margin:0;padding:0;font-=
family: arial; font-size: 10pt;"><br />&gt; +#define QPNP_REG_DIG_MINOR_REV=
 0x0<br />&gt; +#define QPNP_REG_DIG_MAJOR_REV 0x1</p>=0A<p style=3D"margin=
:0;padding:0;font-family: arial; font-size: 10pt;">&nbsp;</p>=0A<p style=3D=
"margin:0;padding:0;font-family: arial; font-size: 10pt;">ditto</p>=0A<p st=
yle=3D"margin:0;padding:0;font-family: arial; font-size: 10pt;"><br />&gt; =
+#define QPNP_REG_ANA_MINOR_REV 0x2<br />&gt; +<br />&gt; +/* type register=
s base address offsets */<br />&gt; +#define QPNP_REG_TYPE 0x4<br />&gt; +#=
define QPNP_REG_SUBTYPE 0x5<br />&gt; +<br />&gt; +/* GPIO peripheral type =
and subtype values */<br />&gt; +#define QPNP_GPIO_TYPE 0x10<br />&gt; +#de=
fine QPNP_GPIO_SUBTYPE_GPIO_4CH 0x1<br />&gt; +#define QPNP_GPIO_SUBTYPE_GP=
IOC_4CH 0x5<br />&gt; +#define QPNP_GPIO_SUBTYPE_GPIO_8CH 0x9<br />&gt; +#d=
efine QPNP_GPIO_SUBTYPE_GPIOC_8CH 0xd<br />&gt; +<br />&gt; +/* mpp periphe=
ral type and subtype values */<br />&gt; +#define QPNP_MPP_TYPE 0x11<br />&=
gt; +#define QPNP_MPP_SUBTYPE_4CH_NO_ANA_OUT 0x3<br />&gt; +#define QPNP_MP=
P_SUBTYPE_ULT_4CH_NO_ANA_OUT 0x4<br />&gt; +#define QPNP_MPP_SUBTYPE_4CH_NO=
_SINK 0x5<br />&gt; +#define QPNP_MPP_SUBTYPE_ULT_4CH_NO_SINK 0x6<br />&gt;=
 +#define QPNP_MPP_SUBTYPE_4CH_FULL_FUNC 0x7<br />&gt; +#define QPNP_MPP_SU=
BTYPE_8CH_FULL_FUNC 0xf<br />&gt; +<br />&gt; +#define QPNP_REG_STATUS1 0x8=
<br />&gt; +#define QPNP_REG_STATUS1_VAL_MASK 0x1<br />&gt; +#define QPNP_R=
EG_STATUS1_GPIO_EN_REV0_MASK 0x2<br />&gt; +#define QPNP_REG_STATUS1_GPIO_E=
N_MASK 0x80<br />&gt; +#define QPNP_REG_STATUS1_MPP_EN_MASK 0x80<br />&gt; =
+<br />&gt; +/* control register base address offsets */<br />&gt; +#define=
 QPNP_REG_MODE_CTL 0x40<br />&gt; +#define QPNP_REG_DIG_VIN_CTL 0x41<br />&=
gt; +#define QPNP_REG_DIG_PULL_CTL 0x42</p>=0A<p style=3D"margin:0;padding:=
0;font-family: arial; font-size: 10pt;">&nbsp;</p>=0A<p style=3D"margin:0;p=
adding:0;font-family: arial; font-size: 10pt;">ditto</p>=0A<p style=3D"marg=
in:0;padding:0;font-family: arial; font-size: 10pt;"><br />&gt; +#define QP=
NP_REG_DIG_IN_CTL 0x43<br />&gt; +#define QPNP_REG_DIG_OUT_CTL 0x45<br />&g=
t; +#define QPNP_REG_EN_CTL 0x46<br />&gt; +#define QPNP_REG_AOUT_CTL 0x4b<=
/p>=0A<p style=3D"margin:0;padding:0;font-family: arial; font-size: 10pt;">=
.</p>=0A<p style=3D"margin:0;padding:0;font-family: arial; font-size: 10pt;=
">[snip]</p>=0A<p style=3D"margin:0;padding:0;font-family: arial; font-size=
: 10pt;">.<br />&gt; +#define PM8XXX_MPP_AIN_ABUS3 6<br />&gt; +#define PM8=
XXX_MPP_AIN_ABUS4 7<br />&gt; +<br />&gt; +#endif<br />&gt; --<br />&gt; 1.=
8.3.2<br />&gt; <br />&gt; --<br />&gt; To unsubscribe from this list: send=
 the line "unsubscribe linux-arm-msm" in<br />&gt; the body of a message to=
 majordomo@vger.kernel.org<br />&gt; More majordomo info at http://vger.ker=
nel.org/majordomo-info.html<br />&gt;&nbsp;</p>=0A<p style=3D"margin:0;padd=
ing:0;font-family: arial; font-size: 10pt;">&nbsp;</p>=0A<p style=3D"margin=
:0;padding:0;font-family: arial; font-size: 10pt;">Regards,</p>=0A<p style=
=3D"margin:0;padding:0;font-family: arial; font-size: 10pt;">--Kiran</p>=0A=
</div></font>
------=_20140721071322000000_82253--
