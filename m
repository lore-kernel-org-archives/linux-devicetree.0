Return-Path: <SRS0=jQri=YR=linaro.org=baoyou.xie@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1483434097-13647-1-git-send-email-baoyou.xie@linaro.org>
References: <1483434097-13647-1-git-send-email-baoyou.xie@linaro.org>
From: Baoyou Xie <baoyou.xie@linaro.org>
Date: Tue, 3 Jan 2017 17:07:56 +0800
Message-ID: <CA+DQWkx1ncDm+nheo8m=jO3A8s+ODBSysquKCCNxsxwzVqEbXQ@mail.gmail.com>
Subject: Re: [PATCH v2] soc: zte: Add header for PM domains specifiers
Content-Type: multipart/alternative; boundary=001a114abf4a0d950105452d010f
To: Rob Herring <robh+dt@kernel.org>, mark.rutland@arm.com, Jun Nie <jun.nie@linaro.org>, Shawn Guo <shawnguo@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Baoyou Xie <baoyou.xie@linaro.org>, "xie.baoyou" <xie.baoyou@zte.com.cn>, chen.chaokai@zte.com.cn, wang.qiang01@zte.com.cn
List-ID: <devicetree@vger.kernel.org>

--001a114abf4a0d950105452d010f
Content-Type: text/plain; charset=UTF-8

Sorry, file named "zte,pm_domains.h" should be lived in
include/dt-bindings/soc/, I will resend this patch.

On 3 January 2017 at 17:01, Baoyou Xie <baoyou.xie@linaro.org> wrote:

> This patch adds header with values used for ZTE 2967
> SoC's power domain driver.
>
> Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
> ---
>  include/dt-bindings/zte,pm_domains.h | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 include/dt-bindings/zte,pm_domains.h
>
> diff --git a/include/dt-bindings/zte,pm_domains.h
> b/include/dt-bindings/zte,pm_domains.h
> new file mode 100644
> index 0000000..a64cfb8
> --- /dev/null
> +++ b/include/dt-bindings/zte,pm_domains.h
> @@ -0,0 +1,23 @@
> +/*
> + * Copyright (C) 2015 Linaro Ltd.
> + *
> + * Author: Baoyou Xie <baoyou.xie@linaro.org>
> + * License terms: GNU General Public License (GPL) version 2
> + */
> +#ifndef _DT_BINDINGS_SOC_ZTE_PM_DOMAINS_H
> +#define _DT_BINDINGS_SOC_ZTE_PM_DOMAINS_H
> +
> +#define DM_ZX296718_SAPPU      0
> +#define DM_ZX296718_VDE                1  /* g1v6 */
> +#define DM_ZX296718_VCE                2  /* h1v6 */
> +#define DM_ZX296718_HDE                3  /* g2v2 */
> +#define DM_ZX296718_VIU                4
> +#define DM_ZX296718_USB20      5
> +#define DM_ZX296718_USB21      6
> +#define DM_ZX296718_USB30      7
> +#define DM_ZX296718_HSIC       8
> +#define DM_ZX296718_GMAC       9
> +#define DM_ZX296718_TS         10
> +#define DM_ZX296718_VOU                11
> +
> +#endif /* _DT_BINDINGS_SOC_ZTE_PM_DOMAINS_H */
> --
> 2.7.4
>
>

--001a114abf4a0d950105452d010f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry, file named &quot;zte,pm_<wbr>domains.h&quot; should=
 be lived in include/dt-bindings/soc/, I will resend this patch.<br></div><=
div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 3 January 2017 =
at 17:01, Baoyou Xie <span dir=3D"ltr">&lt;<a href=3D"mailto:baoyou.xie@lin=
aro.org" target=3D"_blank">baoyou.xie@linaro.org</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">This patch adds header with values used for Z=
TE 2967<br>
SoC&#39;s power domain driver.<br>
<br>
Signed-off-by: Baoyou Xie &lt;<a href=3D"mailto:baoyou.xie@linaro.org">baoy=
ou.xie@linaro.org</a>&gt;<br>
---<br>
=C2=A0include/dt-bindings/zte,pm_<wbr>domains.h | 23 ++++++++++++++++++++++=
+<br>
=C2=A01 file changed, 23 insertions(+)<br>
=C2=A0create mode 100644 include/dt-bindings/zte,pm_<wbr>domains.h<br>
<br>
diff --git a/include/dt-bindings/zte,pm_<wbr>domains.h b/include/dt-binding=
s/zte,pm_<wbr>domains.h<br>
new file mode 100644<br>
index 0000000..a64cfb8<br>
--- /dev/null<br>
+++ b/include/dt-bindings/zte,pm_<wbr>domains.h<br>
@@ -0,0 +1,23 @@<br>
+/*<br>
+ * Copyright (C) 2015 Linaro Ltd.<br>
+ *<br>
+ * Author: Baoyou Xie &lt;<a href=3D"mailto:baoyou.xie@linaro.org">baoyou.=
xie@linaro.org</a>&gt;<br>
+ * License terms: GNU General Public License (GPL) version 2<br>
+ */<br>
+#ifndef _DT_BINDINGS_SOC_ZTE_PM_<wbr>DOMAINS_H<br>
+#define _DT_BINDINGS_SOC_ZTE_PM_<wbr>DOMAINS_H<br>
+<br>
+#define DM_ZX296718_SAPPU=C2=A0 =C2=A0 =C2=A0 0<br>
+#define DM_ZX296718_VDE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 1=C2=A0 /* g1v6 */<br>
+#define DM_ZX296718_VCE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 2=C2=A0 /* h1v6 */<br>
+#define DM_ZX296718_HDE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 3=C2=A0 /* g2v2 */<br>
+#define DM_ZX296718_VIU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 4<br>
+#define DM_ZX296718_USB20=C2=A0 =C2=A0 =C2=A0 5<br>
+#define DM_ZX296718_USB21=C2=A0 =C2=A0 =C2=A0 6<br>
+#define DM_ZX296718_USB30=C2=A0 =C2=A0 =C2=A0 7<br>
+#define DM_ZX296718_HSIC=C2=A0 =C2=A0 =C2=A0 =C2=A08<br>
+#define DM_ZX296718_GMAC=C2=A0 =C2=A0 =C2=A0 =C2=A09<br>
+#define DM_ZX296718_TS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A010<br>
+#define DM_ZX296718_VOU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 11<br>
+<br>
+#endif /* _DT_BINDINGS_SOC_ZTE_PM_<wbr>DOMAINS_H */<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
</font></span></blockquote></div><br></div>

--001a114abf4a0d950105452d010f--
