From: Martin Fuzzey <mfuzzey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] Drivers: w1: mxc_w1, Add support for DT
Date: Sun, 24 Feb 2013 12:37:17 +0100
Message-ID: <CALBypN4+ioS=YDrw7YnvtS1AeS+UH=FidYd2zG1_NsBWDh9bgQ@mail.gmail.com>
References: <1361640958-1876-1-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4964650408554484922=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1361640958-1876-1-git-send-email-mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, zbr-i6C2adt8DTjR7s880joybQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============4964650408554484922==
Content-Type: multipart/alternative; boundary=e89a8ff2514abbb14604d676d839

--e89a8ff2514abbb14604d676d839
Content-Type: text/plain; charset=ISO-8859-1

Hi Markus,

I've already submitted basically this and it's in linux-next:
http://git.kernel.org/?p=linux/kernel/git/next/linux-next.git;a=commitdiff;h=28c55dc1acc863cb29832b5be2464ebcdafdc3d5

Also:
+Example:
+               w1: w1@10009000 {
+                       compatible = "fsl,imx27-w1";
+                       reg = <0x10009000 0x1000>;
+               };
...
+struct of_device_id mxc_w1_of_ids[] = {
+       { .compatible = "fsl,imx21-w1", },
+       { /* sentinel */ }
+};

Isn't there a mismatch imx27 vs imx21 here?

Regards,

Martin



On Sat, Feb 23, 2013 at 6:35 PM, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:

> Add devicetree support for mxc_w1 driver.
>
> Signed-off-by: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/w1/fsl,mxc-w1.txt | 13 +++++++++++++
>  drivers/w1/masters/mxc_w1.c                         |  7 +++++++
>  2 files changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/w1/fsl,mxc-w1.txt
>
> diff --git a/Documentation/devicetree/bindings/w1/fsl,mxc-w1.txt
> b/Documentation/devicetree/bindings/w1/fsl,mxc-w1.txt
> new file mode 100644
> index 0000000..686ced4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/w1/fsl,mxc-w1.txt
> @@ -0,0 +1,13 @@
> +Freescale driver for Dalla's 1-wire bus master on imx chips
> +
> +This driver supports imx21,27,31,35.
> +
> +Required properties:
> +- compatible : "fsl,<chip>-w1"
> +- reg : Should be the memory range.
> +
> +Example:
> +               w1: w1@10009000 {
> +                       compatible = "fsl,imx27-w1";
> +                       reg = <0x10009000 0x1000>;
> +               };
> diff --git a/drivers/w1/masters/mxc_w1.c b/drivers/w1/masters/mxc_w1.c
> index 708a25f..827ff7f 100644
> --- a/drivers/w1/masters/mxc_w1.c
> +++ b/drivers/w1/masters/mxc_w1.c
> @@ -186,9 +186,16 @@ static int mxc_w1_remove(struct platform_device *pdev)
>         return 0;
>  }
>
> +struct of_device_id mxc_w1_of_ids[] = {
> +       { .compatible = "fsl,imx21-w1", },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, mxc_w1_of_ids);
> +
>  static struct platform_driver mxc_w1_driver = {
>         .driver = {
>                    .name = "mxc_w1",
> +                  .of_match_table = mxc_w1_of_ids,
>         },
>         .probe = mxc_w1_probe,
>         .remove = mxc_w1_remove,
> --
> 1.8.1.2
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>

--e89a8ff2514abbb14604d676d839
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Markus,<div><br></div><div style>I&#39;ve already submi=
tted basically this and it&#39;s in linux-next:</div><div style><a href=3D"=
http://git.kernel.org/?p=3Dlinux/kernel/git/next/linux-next.git;a=3Dcommitd=
iff;h=3D28c55dc1acc863cb29832b5be2464ebcdafdc3d5">http://git.kernel.org/?p=
=3Dlinux/kernel/git/next/linux-next.git;a=3Dcommitdiff;h=3D28c55dc1acc863cb=
29832b5be2464ebcdafdc3d5</a><br>
</div><div style><br></div><div style>Also:</div><div style><span style=3D"=
font-family:arial,sans-serif;font-size:12.499999046325684px">+Example:</spa=
n><br style=3D"font-family:arial,sans-serif;font-size:12.499999046325684px"=
>
<span style=3D"font-family:arial,sans-serif;font-size:12.499999046325684px"=
>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 w1: w1@10009000 {</span><br style=3D"font-fa=
mily:arial,sans-serif;font-size:12.499999046325684px"><span style=3D"font-f=
amily:arial,sans-serif;font-size:12.499999046325684px">+ =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D &quot;fsl,imx27-w1&quot;;</span>=
<br style=3D"font-family:arial,sans-serif;font-size:12.499999046325684px">
<span style=3D"font-family:arial,sans-serif;font-size:12.499999046325684px"=
>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D &lt;0x10009000 0x100=
0&gt;;</span><br style=3D"font-family:arial,sans-serif;font-size:12.4999990=
46325684px"><span style=3D"font-family:arial,sans-serif;font-size:12.499999=
046325684px">+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 };</span><br>
</div><div style>...</div><div style><span style=3D"font-family:arial,sans-=
serif;font-size:12.499999046325684px">+struct of_device_id mxc_w1_of_ids[] =
=3D {</span><br style=3D"font-family:arial,sans-serif;font-size:12.49999904=
6325684px">
<span style=3D"font-family:arial,sans-serif;font-size:12.499999046325684px"=
>+ =A0 =A0 =A0 { .compatible =3D &quot;fsl,imx21-w1&quot;, },</span><br sty=
le=3D"font-family:arial,sans-serif;font-size:12.499999046325684px"><span st=
yle=3D"font-family:arial,sans-serif;font-size:12.499999046325684px">+ =A0 =
=A0 =A0 { /* sentinel */ }</span><br style=3D"font-family:arial,sans-serif;=
font-size:12.499999046325684px">
<span style=3D"font-family:arial,sans-serif;font-size:12.499999046325684px"=
>+};</span><br></div><div style><br></div><div style>Isn&#39;t there a mism=
atch imx27 vs imx21 here?</div><div style><br></div><div style>Regards,</di=
v>
<div style><br></div><div style>Martin</div><div style><br></div></div><div=
 class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Sat, Feb 23, 2=
013 at 6:35 PM, Markus Pargmann <span dir=3D"ltr">&lt;<a href=3D"mailto:mpa=
@pengutronix.de" target=3D"_blank">mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org</a>&gt;</span> wrote:=
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Add devicetree support for mxc_w1 driver.<br=
>
<br>
Signed-off-by: Markus Pargmann &lt;<a href=3D"mailto:mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org">mp=
a@pengutronix.de</a>&gt;<br>
---<br>
=A0Documentation/devicetree/bindings/w1/fsl,mxc-w1.txt | 13 +++++++++++++<b=
r>
=A0drivers/w1/masters/mxc_w1.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A07 +++++++<br>
=A02 files changed, 20 insertions(+)<br>
=A0create mode 100644 Documentation/devicetree/bindings/w1/fsl,mxc-w1.txt<b=
r>
<br>
diff --git a/Documentation/devicetree/bindings/w1/fsl,mxc-w1.txt b/Document=
ation/devicetree/bindings/w1/fsl,mxc-w1.txt<br>
new file mode 100644<br>
index 0000000..686ced4<br>
--- /dev/null<br>
+++ b/Documentation/devicetree/bindings/w1/fsl,mxc-w1.txt<br>
@@ -0,0 +1,13 @@<br>
+Freescale driver for Dalla&#39;s 1-wire bus master on imx chips<br>
+<br>
+This driver supports imx21,27,31,35.<br>
+<br>
+Required properties:<br>
+- compatible : &quot;fsl,&lt;chip&gt;-w1&quot;<br>
+- reg : Should be the memory range.<br>
+<br>
+Example:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 w1: w1@10009000 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D &quot;fsl,imx2=
7-w1&quot;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D &lt;0x10009000 0x1000=
&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 };<br>
diff --git a/drivers/w1/masters/mxc_w1.c b/drivers/w1/masters/mxc_w1.c<br>
index 708a25f..827ff7f 100644<br>
--- a/drivers/w1/masters/mxc_w1.c<br>
+++ b/drivers/w1/masters/mxc_w1.c<br>
@@ -186,9 +186,16 @@ static int mxc_w1_remove(struct platform_device *pdev)=
<br>
=A0 =A0 =A0 =A0 return 0;<br>
=A0}<br>
<br>
+struct of_device_id mxc_w1_of_ids[] =3D {<br>
+ =A0 =A0 =A0 { .compatible =3D &quot;fsl,imx21-w1&quot;, },<br>
+ =A0 =A0 =A0 { /* sentinel */ }<br>
+};<br>
+MODULE_DEVICE_TABLE(of, mxc_w1_of_ids);<br>
+<br>
=A0static struct platform_driver mxc_w1_driver =3D {<br>
=A0 =A0 =A0 =A0 .driver =3D {<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =3D &quot;mxc_w1&quot;,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.of_match_table =3D mxc_w1_of_ids,<br>
=A0 =A0 =A0 =A0 },<br>
=A0 =A0 =A0 =A0 .probe =3D mxc_w1_probe,<br>
=A0 =A0 =A0 =A0 .remove =3D mxc_w1_remove,<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.8.1.2<br>
<br>
<br>
_______________________________________________<br>
linux-arm-kernel mailing list<br>
<a href=3D"mailto:linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org">linux-arm-kernel@li=
sts.infradead.org</a><br>
<a href=3D"http://lists.infradead.org/mailman/listinfo/linux-arm-kernel" ta=
rget=3D"_blank">http://lists.infradead.org/mailman/listinfo/linux-arm-kerne=
l</a><br>
</font></span></blockquote></div><br></div>

--e89a8ff2514abbb14604d676d839--

--===============4964650408554484922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============4964650408554484922==--
