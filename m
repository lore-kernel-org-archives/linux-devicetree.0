Return-Path: <SRS0=B2FP=XQ=broadcom.com=jon.mason@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20161128140134.25128-1-zajec5@gmail.com>
References: <20161128140134.25128-1-zajec5@gmail.com>
From: Jon Mason <jon.mason@broadcom.com>
Date: Thu, 1 Dec 2016 12:14:51 -0500
Message-ID: <CAC3K-4o3-eSDU5JvjkgohtWLUmZqQViHvX1h2zfdPAGe+qbCOg@mail.gmail.com>
Subject: Re: [PATCH] ARM: BCM5301X: Enable UART by default for BCM4708(1) and BCM4709(4)
Content-Type: multipart/alternative; boundary=001a11440feaa3d18c05429bf5ef
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Hauke Mehrtens <hauke@hauke-m.de>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
List-ID: <devicetree@vger.kernel.org>

--001a11440feaa3d18c05429bf5ef
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 28, 2016 at 9:01 AM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>=
 wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> Every device tested so far got UART0 (at 0x18000300) working as serial
> console. It's most likely part of reference design and all vendors use
> it that way.
>
> It seems to be easier to enable it by default and just disable it if we
> ever see a device with different hardware design.
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> ---
>  arch/arm/boot/dts/bcm4708-buffalo-wzr-1750dhp.dts  | 4 ----
>  arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts       | 4 ----
>  arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts       | 4 ----
>  arch/arm/boot/dts/bcm4708-netgear-r6250.dts        | 4 ----
>  arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts      | 4 ----
>  arch/arm/boot/dts/bcm4708.dtsi                     | 4 ++++
>  arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dts | 4 ----
>  arch/arm/boot/dts/bcm47081.dtsi                    | 4 ++++
>  arch/arm/boot/dts/bcm4709-netgear-r7000.dts        | 4 ----
>  arch/arm/boot/dts/bcm4709-netgear-r8000.dts        | 4 ----
>  arch/arm/boot/dts/bcm4709-tplink-archer-c9-v1.dts  | 4 ----
>  arch/arm/boot/dts/bcm4709.dtsi                     | 1 +
>  arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts      | 4 ----
>  arch/arm/boot/dts/bcm47094-luxul-xwr-3100.dts      | 4 ----
>  arch/arm/boot/dts/bcm47094-netgear-r8500.dts       | 4 ----
>  arch/arm/boot/dts/bcm47094.dtsi                    | 1 +
>

I think there are a few missing here.  A quick grep shows

$ grep -rI '#include "bcm470[89].dtsi"'  arch/arm/boot/dts/*.dts
arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dts:#include "bcm4708.dtsi"
arch/arm/boot/dts/bcm4708-asus-rt-ac68u.dts:#include "bcm4708.dtsi"
arch/arm/boot/dts/bcm4708-buffalo-wzr-1750dhp.dts:#include "bcm4708.dtsi"
arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts:#include "bcm4708.dtsi"
arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts:#include "bcm4708.dtsi"
arch/arm/boot/dts/bcm4708-netgear-r6250.dts:#include "bcm4708.dtsi"
arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dts:#include "bcm4708.dtsi"
arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts:#include "bcm4708.dtsi"
arch/arm/boot/dts/bcm4709-asus-rt-ac87u.dts:#include "bcm4709.dtsi"
arch/arm/boot/dts/bcm4709-buffalo-wxr-1900dhp.dts:#include "bcm4709.dtsi"
arch/arm/boot/dts/bcm4709-netgear-r7000.dts:#include "bcm4709.dtsi"
arch/arm/boot/dts/bcm4709-netgear-r8000.dts:#include "bcm4709.dtsi"
arch/arm/boot/dts/bcm4709-tplink-archer-c9-v1.dts:#include "bcm4709.dtsi"
arch/arm/boot/dts/bcm94708.dts:#include "bcm4708.dtsi"
arch/arm/boot/dts/bcm94709.dts:#include "bcm4708.dtsi"
arch/arm/boot/dts/bcm953012er.dts:#include "bcm4708.dtsi"
arch/arm/boot/dts/bcm953012k.dts:#include "bcm4708.dtsi"

I specifically care about the last 4 :)

Thanks,
Jon


>  16 files changed, 10 insertions(+), 48 deletions(-)
>
> diff --git a/arch/arm/boot/dts/bcm4708-buffalo-wzr-1750dhp.dts
> b/arch/arm/boot/dts/bcm4708-buffalo-wzr-1750dhp.dts
> index 9cb186e..d49afec0 100644
> --- a/arch/arm/boot/dts/bcm4708-buffalo-wzr-1750dhp.dts
> +++ b/arch/arm/boot/dts/bcm4708-buffalo-wzr-1750dhp.dts
> @@ -136,10 +136,6 @@
>         };
>  };
>
> -&uart0 {
> -       status =3D "okay";
> -};
> -
>  &usb2 {
>         vcc-gpio =3D <&chipcommon 9 GPIO_ACTIVE_HIGH>;
>  };
> diff --git a/arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts
> b/arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts
> index 35e6ed6..f591b0f 100644
> --- a/arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts
> +++ b/arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts
> @@ -55,10 +55,6 @@
>         };
>  };
>
> -&uart0 {
> -       status =3D "okay";
> -};
> -
>  &spi_nor {
>         status =3D "okay";
>  };
> diff --git a/arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts
> b/arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts
> index 1c7e53d..50d65d8 100644
> --- a/arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts
> +++ b/arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts
> @@ -56,10 +56,6 @@
>         };
>  };
>
> -&uart0 {
> -       status =3D "okay";
> -};
> -
>  &spi_nor {
>         status =3D "okay";
>  };
> diff --git a/arch/arm/boot/dts/bcm4708-netgear-r6250.dts
> b/arch/arm/boot/dts/bcm4708-netgear-r6250.dts
> index 8ce39d5..8519548 100644
> --- a/arch/arm/boot/dts/bcm4708-netgear-r6250.dts
> +++ b/arch/arm/boot/dts/bcm4708-netgear-r6250.dts
> @@ -83,10 +83,6 @@
>         };
>  };
>
> -&uart0 {
> -       status =3D "okay";
> -};
> -
>  &usb3 {
>         vcc-gpio =3D <&chipcommon 0 GPIO_ACTIVE_HIGH>;
>  };
> diff --git a/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts
> b/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts
> index 70f4bb9..74cfcd3 100644
> --- a/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts
> +++ b/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts
> @@ -119,10 +119,6 @@
>         };
>  };
>
> -&uart0 {
> -       status =3D "okay";
> -};
> -
>  &spi_nor {
>         status =3D "okay";
>  };
> diff --git a/arch/arm/boot/dts/bcm4708.dtsi b/arch/arm/boot/dts/bcm4708.
> dtsi
> index eed4dd1..d0eec09 100644
> --- a/arch/arm/boot/dts/bcm4708.dtsi
> +++ b/arch/arm/boot/dts/bcm4708.dtsi
> @@ -34,3 +34,7 @@
>         };
>
>  };
> +
> +&uart0 {
> +       status =3D "okay";
> +};
> diff --git a/arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dts
> b/arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dts
> index a9c8def..2922536 100644
> --- a/arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dts
> +++ b/arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dts
> @@ -122,7 +122,3 @@
>                 };
>         };
>  };
> -
> -&uart0 {
> -       status =3D "okay";
> -};
> diff --git a/arch/arm/boot/dts/bcm47081.dtsi b/arch/arm/boot/dts/bcm47081=
.
> dtsi
> index f720012..c5f7619 100644
> --- a/arch/arm/boot/dts/bcm47081.dtsi
> +++ b/arch/arm/boot/dts/bcm47081.dtsi
> @@ -24,3 +24,7 @@
>                 };
>         };
>  };
> +
> +&uart0 {
> +       status =3D "okay";
> +};
> diff --git a/arch/arm/boot/dts/bcm4709-netgear-r7000.dts
> b/arch/arm/boot/dts/bcm4709-netgear-r7000.dts
> index fd38d2a..0225d82 100644
> --- a/arch/arm/boot/dts/bcm4709-netgear-r7000.dts
> +++ b/arch/arm/boot/dts/bcm4709-netgear-r7000.dts
> @@ -100,7 +100,3 @@
>                 };
>         };
>  };
> -
> -&uart0 {
> -       status =3D "okay";
> -};
> diff --git a/arch/arm/boot/dts/bcm4709-netgear-r8000.dts
> b/arch/arm/boot/dts/bcm4709-netgear-r8000.dts
> index 92f8a72..56d38a3 100644
> --- a/arch/arm/boot/dts/bcm4709-netgear-r8000.dts
> +++ b/arch/arm/boot/dts/bcm4709-netgear-r8000.dts
> @@ -107,10 +107,6 @@
>         };
>  };
>
> -&uart0 {
> -       status =3D "okay";
> -};
> -
>  &usb2 {
>         vcc-gpio =3D <&chipcommon 0 GPIO_ACTIVE_HIGH>;
>  };
> diff --git a/arch/arm/boot/dts/bcm4709-tplink-archer-c9-v1.dts
> b/arch/arm/boot/dts/bcm4709-tplink-archer-c9-v1.dts
> index 9a92c24..c67bfaa 100644
> --- a/arch/arm/boot/dts/bcm4709-tplink-archer-c9-v1.dts
> +++ b/arch/arm/boot/dts/bcm4709-tplink-archer-c9-v1.dts
> @@ -97,10 +97,6 @@
>         };
>  };
>
> -&uart0 {
> -       status =3D "okay";
> -};
> -
>  &usb2 {
>         vcc-gpio =3D <&chipcommon 13 GPIO_ACTIVE_HIGH>;
>  };
> diff --git a/arch/arm/boot/dts/bcm4709.dtsi b/arch/arm/boot/dts/bcm4709.
> dtsi
> index f039765..c645fea 100644
> --- a/arch/arm/boot/dts/bcm4709.dtsi
> +++ b/arch/arm/boot/dts/bcm4709.dtsi
> @@ -8,4 +8,5 @@
>
>  &uart0 {
>         clock-frequency =3D <125000000>;
> +       status =3D "okay";
>  };
> diff --git a/arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts
> b/arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts
> index 661348d..7fb9270 100644
> --- a/arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts
> +++ b/arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts
> @@ -105,10 +105,6 @@
>         };
>  };
>
> -&uart0 {
> -       status =3D "okay";
> -};
> -
>  &usb3 {
>         vcc-gpio =3D <&chipcommon 18 GPIO_ACTIVE_HIGH>;
>  };
> diff --git a/arch/arm/boot/dts/bcm47094-luxul-xwr-3100.dts
> b/arch/arm/boot/dts/bcm47094-luxul-xwr-3100.dts
> index 169b35f..2f4a651 100644
> --- a/arch/arm/boot/dts/bcm47094-luxul-xwr-3100.dts
> +++ b/arch/arm/boot/dts/bcm47094-luxul-xwr-3100.dts
> @@ -98,10 +98,6 @@
>         };
>  };
>
> -&uart0 {
> -       status =3D "okay";
> -};
> -
>  &usb3 {
>         vcc-gpio =3D <&chipcommon 18 GPIO_ACTIVE_HIGH>;
>  };
> diff --git a/arch/arm/boot/dts/bcm47094-netgear-r8500.dts
> b/arch/arm/boot/dts/bcm47094-netgear-r8500.dts
> index 521b415..7ecd57c 100644
> --- a/arch/arm/boot/dts/bcm47094-netgear-r8500.dts
> +++ b/arch/arm/boot/dts/bcm47094-netgear-r8500.dts
> @@ -97,7 +97,3 @@
>                 };
>         };
>  };
> -
> -&uart0 {
> -       status =3D "okay";
> -};
> diff --git a/arch/arm/boot/dts/bcm47094.dtsi b/arch/arm/boot/dts/bcm47094=
.
> dtsi
> index 4f09aa0..4840a78 100644
> --- a/arch/arm/boot/dts/bcm47094.dtsi
> +++ b/arch/arm/boot/dts/bcm47094.dtsi
> @@ -14,4 +14,5 @@
>
>  &uart0 {
>         clock-frequency =3D <125000000>;
> +       status =3D "okay";
>  };
> --
> 2.10.1
>
>

--001a11440feaa3d18c05429bf5ef
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Nov 28, 2016 at 9:01 AM, Rafa=C5=82 Mi=C5=82ecki <span dir=3D"l=
tr">&lt;<a href=3D"mailto:zajec5@gmail.com" target=3D"_blank">zajec5@gmail.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">From: Rafa=C5=82 Mi=C5=82ecki &lt;<a href=3D"mailto:rafal@milecki.pl">r=
afal@milecki.pl</a>&gt;<br>
<br>
Every device tested so far got UART0 (at 0x18000300) working as serial<br>
console. It&#39;s most likely part of reference design and all vendors use<=
br>
it that way.<br>
<br>
It seems to be easier to enable it by default and just disable it if we<br>
ever see a device with different hardware design.<br>
<br>
Signed-off-by: Rafa=C5=82 Mi=C5=82ecki &lt;<a href=3D"mailto:rafal@milecki.=
pl">rafal@milecki.pl</a>&gt;<br>
---<br>
=C2=A0arch/arm/boot/dts/bcm4708-<wbr>buffalo-wzr-1750dhp.dts=C2=A0 | 4 ----=
<br>
=C2=A0arch/arm/boot/dts/bcm4708-<wbr>luxul-xap-1510.dts=C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 4 ----<br>
=C2=A0arch/arm/boot/dts/bcm4708-<wbr>luxul-xwc-1000.dts=C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 4 ----<br>
=C2=A0arch/arm/boot/dts/bcm4708-<wbr>netgear-r6250.dts=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 4 ----<br>
=C2=A0arch/arm/boot/dts/bcm4708-<wbr>smartrg-sr400ac.dts=C2=A0 =C2=A0 =C2=
=A0 | 4 ----<br>
=C2=A0arch/arm/boot/dts/bcm4708.dtsi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++++<br>
=C2=A0arch/arm/boot/dts/bcm47081-<wbr>buffalo-wzr-600dhp2.dts | 4 ----<br>
=C2=A0arch/arm/boot/dts/bcm47081.<wbr>dtsi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++++<br>
=C2=A0arch/arm/boot/dts/bcm4709-<wbr>netgear-r7000.dts=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 4 ----<br>
=C2=A0arch/arm/boot/dts/bcm4709-<wbr>netgear-r8000.dts=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 4 ----<br>
=C2=A0arch/arm/boot/dts/bcm4709-<wbr>tplink-archer-c9-v1.dts=C2=A0 | 4 ----=
<br>
=C2=A0arch/arm/boot/dts/bcm4709.dtsi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A0arch/arm/boot/dts/bcm47094-<wbr>dlink-dir-885l.dts=C2=A0 =C2=A0 =C2=
=A0 | 4 ----<br>
=C2=A0arch/arm/boot/dts/bcm47094-<wbr>luxul-xwr-3100.dts=C2=A0 =C2=A0 =C2=
=A0 | 4 ----<br>
=C2=A0arch/arm/boot/dts/bcm47094-<wbr>netgear-r8500.dts=C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 4 ----<br>
=C2=A0arch/arm/boot/dts/bcm47094.<wbr>dtsi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br></blockquote><div><br></div=
><div>I think there are a few missing here.=C2=A0 A quick grep shows</div><=
div><br></div><div><div>$ grep -rI &#39;#include &quot;bcm470[89].dtsi&quot=
;&#39; =C2=A0arch/arm/boot/dts/*.dts</div><div>arch/arm/boot/dts/bcm4708-as=
us-rt-ac56u.dts:#include &quot;bcm4708.dtsi&quot;</div><div>arch/arm/boot/d=
ts/bcm4708-asus-rt-ac68u.dts:#include &quot;bcm4708.dtsi&quot;</div><div>ar=
ch/arm/boot/dts/bcm4708-buffalo-wzr-1750dhp.dts:#include &quot;bcm4708.dtsi=
&quot;</div><div>arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts:#include &quo=
t;bcm4708.dtsi&quot;</div><div>arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts=
:#include &quot;bcm4708.dtsi&quot;</div><div>arch/arm/boot/dts/bcm4708-netg=
ear-r6250.dts:#include &quot;bcm4708.dtsi&quot;</div><div>arch/arm/boot/dts=
/bcm4708-netgear-r6300-v2.dts:#include &quot;bcm4708.dtsi&quot;</div><div>a=
rch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts:#include &quot;bcm4708.dtsi&qu=
ot;</div><div>arch/arm/boot/dts/bcm4709-asus-rt-ac87u.dts:#include &quot;bc=
m4709.dtsi&quot;</div><div>arch/arm/boot/dts/bcm4709-buffalo-wxr-1900dhp.dt=
s:#include &quot;bcm4709.dtsi&quot;</div><div>arch/arm/boot/dts/bcm4709-net=
gear-r7000.dts:#include &quot;bcm4709.dtsi&quot;</div><div>arch/arm/boot/dt=
s/bcm4709-netgear-r8000.dts:#include &quot;bcm4709.dtsi&quot;</div><div>arc=
h/arm/boot/dts/bcm4709-tplink-archer-c9-v1.dts:#include &quot;bcm4709.dtsi&=
quot;</div><div>arch/arm/boot/dts/bcm94708.dts:#include &quot;bcm4708.dtsi&=
quot;</div><div>arch/arm/boot/dts/bcm94709.dts:#include &quot;bcm4708.dtsi&=
quot;</div><div>arch/arm/boot/dts/bcm953012er.dts:#include &quot;bcm4708.dt=
si&quot;</div><div>arch/arm/boot/dts/bcm953012k.dts:#include &quot;bcm4708.=
dtsi&quot;</div></div><div><br></div><div>I specifically care about the las=
t 4 :)</div><div><br></div><div>Thanks,</div><div>Jon</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A016 files changed, 10 insertions(+), 48 deletions(-)<br>
<br>
diff --git a/arch/arm/boot/dts/bcm4708-<wbr>buffalo-wzr-1750dhp.dts b/arch/=
arm/boot/dts/bcm4708-<wbr>buffalo-wzr-1750dhp.dts<br>
index 9cb186e..d49afec0 100644<br>
--- a/arch/arm/boot/dts/bcm4708-<wbr>buffalo-wzr-1750dhp.dts<br>
+++ b/arch/arm/boot/dts/bcm4708-<wbr>buffalo-wzr-1750dhp.dts<br>
@@ -136,10 +136,6 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
=C2=A0};<br>
<br>
-&amp;uart0 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
-};<br>
-<br>
=C2=A0&amp;usb2 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 vcc-gpio =3D &lt;&amp;chipcommon 9 GPIO_ACTIVE_=
HIGH&gt;;<br>
=C2=A0};<br>
diff --git a/arch/arm/boot/dts/bcm4708-<wbr>luxul-xap-1510.dts b/arch/arm/b=
oot/dts/bcm4708-<wbr>luxul-xap-1510.dts<br>
index 35e6ed6..f591b0f 100644<br>
--- a/arch/arm/boot/dts/bcm4708-<wbr>luxul-xap-1510.dts<br>
+++ b/arch/arm/boot/dts/bcm4708-<wbr>luxul-xap-1510.dts<br>
@@ -55,10 +55,6 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
=C2=A0};<br>
<br>
-&amp;uart0 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
-};<br>
-<br>
=C2=A0&amp;spi_nor {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
=C2=A0};<br>
diff --git a/arch/arm/boot/dts/bcm4708-<wbr>luxul-xwc-1000.dts b/arch/arm/b=
oot/dts/bcm4708-<wbr>luxul-xwc-1000.dts<br>
index 1c7e53d..50d65d8 100644<br>
--- a/arch/arm/boot/dts/bcm4708-<wbr>luxul-xwc-1000.dts<br>
+++ b/arch/arm/boot/dts/bcm4708-<wbr>luxul-xwc-1000.dts<br>
@@ -56,10 +56,6 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
=C2=A0};<br>
<br>
-&amp;uart0 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
-};<br>
-<br>
=C2=A0&amp;spi_nor {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
=C2=A0};<br>
diff --git a/arch/arm/boot/dts/bcm4708-<wbr>netgear-r6250.dts b/arch/arm/bo=
ot/dts/bcm4708-<wbr>netgear-r6250.dts<br>
index 8ce39d5..8519548 100644<br>
--- a/arch/arm/boot/dts/bcm4708-<wbr>netgear-r6250.dts<br>
+++ b/arch/arm/boot/dts/bcm4708-<wbr>netgear-r6250.dts<br>
@@ -83,10 +83,6 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
=C2=A0};<br>
<br>
-&amp;uart0 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
-};<br>
-<br>
=C2=A0&amp;usb3 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 vcc-gpio =3D &lt;&amp;chipcommon 0 GPIO_ACTIVE_=
HIGH&gt;;<br>
=C2=A0};<br>
diff --git a/arch/arm/boot/dts/bcm4708-<wbr>smartrg-sr400ac.dts b/arch/arm/=
boot/dts/bcm4708-<wbr>smartrg-sr400ac.dts<br>
index 70f4bb9..74cfcd3 100644<br>
--- a/arch/arm/boot/dts/bcm4708-<wbr>smartrg-sr400ac.dts<br>
+++ b/arch/arm/boot/dts/bcm4708-<wbr>smartrg-sr400ac.dts<br>
@@ -119,10 +119,6 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
=C2=A0};<br>
<br>
-&amp;uart0 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
-};<br>
-<br>
=C2=A0&amp;spi_nor {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
=C2=A0};<br>
diff --git a/arch/arm/boot/dts/bcm4708.<wbr>dtsi b/arch/arm/boot/dts/bcm470=
8.<wbr>dtsi<br>
index eed4dd1..d0eec09 100644<br>
--- a/arch/arm/boot/dts/bcm4708.<wbr>dtsi<br>
+++ b/arch/arm/boot/dts/bcm4708.<wbr>dtsi<br>
@@ -34,3 +34,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
<br>
=C2=A0};<br>
+<br>
+&amp;uart0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+};<br>
diff --git a/arch/arm/boot/dts/bcm47081-<wbr>buffalo-wzr-600dhp2.dts b/arch=
/arm/boot/dts/bcm47081-<wbr>buffalo-wzr-600dhp2.dts<br>
index a9c8def..2922536 100644<br>
--- a/arch/arm/boot/dts/bcm47081-<wbr>buffalo-wzr-600dhp2.dts<br>
+++ b/arch/arm/boot/dts/bcm47081-<wbr>buffalo-wzr-600dhp2.dts<br>
@@ -122,7 +122,3 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
=C2=A0};<br>
-<br>
-&amp;uart0 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
-};<br>
diff --git a/arch/arm/boot/dts/bcm47081.<wbr>dtsi b/arch/arm/boot/dts/bcm47=
081.<wbr>dtsi<br>
index f720012..c5f7619 100644<br>
--- a/arch/arm/boot/dts/bcm47081.<wbr>dtsi<br>
+++ b/arch/arm/boot/dts/bcm47081.<wbr>dtsi<br>
@@ -24,3 +24,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
=C2=A0};<br>
+<br>
+&amp;uart0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+};<br>
diff --git a/arch/arm/boot/dts/bcm4709-<wbr>netgear-r7000.dts b/arch/arm/bo=
ot/dts/bcm4709-<wbr>netgear-r7000.dts<br>
index fd38d2a..0225d82 100644<br>
--- a/arch/arm/boot/dts/bcm4709-<wbr>netgear-r7000.dts<br>
+++ b/arch/arm/boot/dts/bcm4709-<wbr>netgear-r7000.dts<br>
@@ -100,7 +100,3 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
=C2=A0};<br>
-<br>
-&amp;uart0 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
-};<br>
diff --git a/arch/arm/boot/dts/bcm4709-<wbr>netgear-r8000.dts b/arch/arm/bo=
ot/dts/bcm4709-<wbr>netgear-r8000.dts<br>
index 92f8a72..56d38a3 100644<br>
--- a/arch/arm/boot/dts/bcm4709-<wbr>netgear-r8000.dts<br>
+++ b/arch/arm/boot/dts/bcm4709-<wbr>netgear-r8000.dts<br>
@@ -107,10 +107,6 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
=C2=A0};<br>
<br>
-&amp;uart0 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
-};<br>
-<br>
=C2=A0&amp;usb2 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 vcc-gpio =3D &lt;&amp;chipcommon 0 GPIO_ACTIVE_=
HIGH&gt;;<br>
=C2=A0};<br>
diff --git a/arch/arm/boot/dts/bcm4709-<wbr>tplink-archer-c9-v1.dts b/arch/=
arm/boot/dts/bcm4709-<wbr>tplink-archer-c9-v1.dts<br>
index 9a92c24..c67bfaa 100644<br>
--- a/arch/arm/boot/dts/bcm4709-<wbr>tplink-archer-c9-v1.dts<br>
+++ b/arch/arm/boot/dts/bcm4709-<wbr>tplink-archer-c9-v1.dts<br>
@@ -97,10 +97,6 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
=C2=A0};<br>
<br>
-&amp;uart0 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
-};<br>
-<br>
=C2=A0&amp;usb2 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 vcc-gpio =3D &lt;&amp;chipcommon 13 GPIO_ACTIVE=
_HIGH&gt;;<br>
=C2=A0};<br>
diff --git a/arch/arm/boot/dts/bcm4709.<wbr>dtsi b/arch/arm/boot/dts/bcm470=
9.<wbr>dtsi<br>
index f039765..c645fea 100644<br>
--- a/arch/arm/boot/dts/bcm4709.<wbr>dtsi<br>
+++ b/arch/arm/boot/dts/bcm4709.<wbr>dtsi<br>
@@ -8,4 +8,5 @@<br>
<br>
=C2=A0&amp;uart0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 clock-frequency =3D &lt;125000000&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
=C2=A0};<br>
diff --git a/arch/arm/boot/dts/bcm47094-<wbr>dlink-dir-885l.dts b/arch/arm/=
boot/dts/bcm47094-<wbr>dlink-dir-885l.dts<br>
index 661348d..7fb9270 100644<br>
--- a/arch/arm/boot/dts/bcm47094-<wbr>dlink-dir-885l.dts<br>
+++ b/arch/arm/boot/dts/bcm47094-<wbr>dlink-dir-885l.dts<br>
@@ -105,10 +105,6 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
=C2=A0};<br>
<br>
-&amp;uart0 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
-};<br>
-<br>
=C2=A0&amp;usb3 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 vcc-gpio =3D &lt;&amp;chipcommon 18 GPIO_ACTIVE=
_HIGH&gt;;<br>
=C2=A0};<br>
diff --git a/arch/arm/boot/dts/bcm47094-<wbr>luxul-xwr-3100.dts b/arch/arm/=
boot/dts/bcm47094-<wbr>luxul-xwr-3100.dts<br>
index 169b35f..2f4a651 100644<br>
--- a/arch/arm/boot/dts/bcm47094-<wbr>luxul-xwr-3100.dts<br>
+++ b/arch/arm/boot/dts/bcm47094-<wbr>luxul-xwr-3100.dts<br>
@@ -98,10 +98,6 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
=C2=A0};<br>
<br>
-&amp;uart0 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
-};<br>
-<br>
=C2=A0&amp;usb3 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 vcc-gpio =3D &lt;&amp;chipcommon 18 GPIO_ACTIVE=
_HIGH&gt;;<br>
=C2=A0};<br>
diff --git a/arch/arm/boot/dts/bcm47094-<wbr>netgear-r8500.dts b/arch/arm/b=
oot/dts/bcm47094-<wbr>netgear-r8500.dts<br>
index 521b415..7ecd57c 100644<br>
--- a/arch/arm/boot/dts/bcm47094-<wbr>netgear-r8500.dts<br>
+++ b/arch/arm/boot/dts/bcm47094-<wbr>netgear-r8500.dts<br>
@@ -97,7 +97,3 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
=C2=A0};<br>
-<br>
-&amp;uart0 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
-};<br>
diff --git a/arch/arm/boot/dts/bcm47094.<wbr>dtsi b/arch/arm/boot/dts/bcm47=
094.<wbr>dtsi<br>
index 4f09aa0..4840a78 100644<br>
--- a/arch/arm/boot/dts/bcm47094.<wbr>dtsi<br>
+++ b/arch/arm/boot/dts/bcm47094.<wbr>dtsi<br>
@@ -14,4 +14,5 @@<br>
<br>
=C2=A0&amp;uart0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 clock-frequency =3D &lt;125000000&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
=C2=A0};<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888">--<br>
2.10.1<br>
<br>
</font></span></blockquote></div><br></div></div>

--001a11440feaa3d18c05429bf5ef--
