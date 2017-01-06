Return-Path: <SRS0=GrzW=YU=linaro.org=baoyou.xie@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1483694164-7668-2-git-send-email-baoyou.xie@linaro.org>
References: <1483694164-7668-1-git-send-email-baoyou.xie@linaro.org> <1483694164-7668-2-git-send-email-baoyou.xie@linaro.org>
From: Baoyou Xie <baoyou.xie@linaro.org>
Date: Fri, 6 Jan 2017 17:19:29 +0800
Message-ID: <CA+DQWkwC7xEGt_wCSdSwKSW3KsCWbKqpt02fCwZ=Jy-k86EO8A@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] MAINTAINERS: add zx2967 SoC drivers to ARM ZTE architecture
Content-Type: multipart/alternative; boundary=001a114239cedaa0470545698376
To: Jun Nie <jun.nie@linaro.org>, Rob Herring <robh+dt@kernel.org>, mark.rutland@arm.com, Greg KH <gregkh@linuxfoundation.org>, davem@davemloft.net, geert+renesas@glider.be, akpm@linux-foundation.org, mchehab@kernel.org, krzk@kernel.org, Arnd Bergmann <arnd@arndb.de>, claudiu.manoil@nxp.com, amit daniel <amitdanielk@gmail.com>, pankaj.dubey@samsung.com, yangbo.lu@nxp.com, scott.branden@broadcom.com, simon.horman@netronome.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Baoyou Xie <baoyou.xie@linaro.org>, Shawn Guo <shawnguo@kernel.org>, "xie.baoyou" <xie.baoyou@zte.com.cn>, chen.chaokai@zte.com.cn, wang.qiang01@zte.com.cn
List-ID: <devicetree@vger.kernel.org>

--001a114239cedaa0470545698376
Content-Type: text/plain; charset=UTF-8

+Shawn

On 6 January 2017 at 17:16, Baoyou Xie <baoyou.xie@linaro.org> wrote:

> Add the ZTE SoC drivers as maintained by ARM ZTE
> architecture maintainers, as they're parts of the core IP.
>
> By the way, this patch adds the maintainer for ARM
> ZTE architecture to Baoyou Xie.
>
> Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
> ---
>  MAINTAINERS | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ad199da..64f04df 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1975,12 +1975,16 @@ F:      arch/arm/mach-pxa/include/mach/z2.h
>
>  ARM/ZTE ARCHITECTURE
>  M:     Jun Nie <jun.nie@linaro.org>
> +M:     Baoyou Xie <baoyou.xie@linaro.org>
>  L:     linux-arm-kernel@lists.infradead.org (moderated for
> non-subscribers)
>  S:     Maintained
>  F:     arch/arm/mach-zx/
>  F:     drivers/clk/zte/
> +F:     drivers/soc/zte/
>  F:     Documentation/devicetree/bindings/arm/zte.txt
>  F:     Documentation/devicetree/bindings/clock/zx296702-clk.txt
> +F:     Documentation/devicetree/bindings/soc/zte/
> +F:     include/dt-bindings/soc/zx*.h
>
>  ARM/ZYNQ ARCHITECTURE
>  M:     Michal Simek <michal.simek@xilinx.com>
> --
> 2.7.4
>
>

--001a114239cedaa0470545698376
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">+Shawn<br></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On 6 January 2017 at 17:16, Baoyou Xie <span dir=3D"ltr">&=
lt;<a href=3D"mailto:baoyou.xie@linaro.org" target=3D"_blank">baoyou.xie@li=
naro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Add the =
ZTE SoC drivers as maintained by ARM ZTE<br>
architecture maintainers, as they&#39;re parts of the core IP.<br>
<br>
By the way, this patch adds the maintainer for ARM<br>
ZTE architecture to Baoyou Xie.<br>
<br>
Signed-off-by: Baoyou Xie &lt;<a href=3D"mailto:baoyou.xie@linaro.org">baoy=
ou.xie@linaro.org</a>&gt;<br>
---<br>
=C2=A0MAINTAINERS | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index ad199da..64f04df 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -1975,12 +1975,16 @@ F:=C2=A0 =C2=A0 =C2=A0 arch/arm/mach-pxa/include/<w=
br>mach/z2.h<br>
<br>
=C2=A0ARM/ZTE ARCHITECTURE<br>
=C2=A0M:=C2=A0 =C2=A0 =C2=A0Jun Nie &lt;<a href=3D"mailto:jun.nie@linaro.or=
g">jun.nie@linaro.org</a>&gt;<br>
+M:=C2=A0 =C2=A0 =C2=A0Baoyou Xie &lt;<a href=3D"mailto:baoyou.xie@linaro.o=
rg">baoyou.xie@linaro.org</a>&gt;<br>
=C2=A0L:=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:linux-arm-kernel@lists.infrad=
ead.org">linux-arm-kernel@lists.<wbr>infradead.org</a> (moderated for non-s=
ubscribers)<br>
=C2=A0S:=C2=A0 =C2=A0 =C2=A0Maintained<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0arch/arm/mach-zx/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0drivers/clk/zte/<br>
+F:=C2=A0 =C2=A0 =C2=A0drivers/soc/zte/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0Documentation/devicetree/<wbr>bindings/arm/zte.=
txt<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0Documentation/devicetree/<wbr>bindings/clock/zx=
296702-clk.<wbr>txt<br>
+F:=C2=A0 =C2=A0 =C2=A0Documentation/devicetree/<wbr>bindings/soc/zte/<br>
+F:=C2=A0 =C2=A0 =C2=A0include/dt-bindings/soc/zx*.h<br>
<br>
=C2=A0ARM/ZYNQ ARCHITECTURE<br>
=C2=A0M:=C2=A0 =C2=A0 =C2=A0Michal Simek &lt;<a href=3D"mailto:michal.simek=
@xilinx.com">michal.simek@xilinx.com</a>&gt;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
</font></span></blockquote></div><br></div>

--001a114239cedaa0470545698376--
