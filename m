From: "Dennis Lan (dlan)" <dennis.yxun-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [U-Boot] [PATCH 14/14] fdt: Set kernaddr if fdt indicates a
 kernel is present
Date: Wed, 28 Nov 2012 22:30:48 +0800
Message-ID: <CAF1ZMEc6+He9M8oBGyBgLXYzsLWb=pM2mOuU6709rZzkYSNGyA@mail.gmail.com>
References: <1351218671-15228-1-git-send-email-sjg@chromium.org>
 <1351218671-15228-15-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4445246778241453038=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1351218671-15228-15-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Tom Rini <trini-l0cyMroinI0@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============4445246778241453038==
Content-Type: multipart/alternative; boundary=14dae93404cd455e6304cf8f031c

--14dae93404cd455e6304cf8f031c
Content-Type: text/plain; charset=UTF-8

hi simon:
  found a small bug?(not sure) which introduced by this commit.

this line not inldue FDT option
#if defined(CONFIG_SILENT_CONSOLE) || defined(CONFIG_POST) ||
defined(CONFIG_CMDLINE_EDITING)
DECLARE_GLOBAL_DATA_PTR;
#endif


main.c: In function 'process_fdt_options':
main.c:341:31: error: 'gd' undeclared (first use in this function)
main.c:341:31: note: each undeclared identifier is reported only once for
each function it appears in
main.c: In function 'main_loop':
main.c:464:33: error: 'gd' undeclared (first use in this function)
make[2]: *** [main.o] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [common/libcommon.o] Error 2
make[1]: *** Waiting for unfinished jobs....
make: *** [lt703a] Error 2



On Fri, Oct 26, 2012 at 10:31 AM, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:

> If kernel-offset is specified in the fdt, set an environment variable
> so that scripts can access the attached kernel.
>
> This can be used by a packaging program to tell U-Boot about a kernel
> that has been downloaded alongside U-Boot. The value in the fdt is
> the offset of the kernel from the start of the U-Boot image, so we can
> find it just by adding CONFIG_SYS_TEXT_BASE.
>
> It is then fairly easy to put something like this in the environment
> variables in the board header file:
>
>                 "if test ${kernaddr} != \"\"; then "\
>                         "echo \"Using bundled kernel\"; "\
>                         "bootm ${kernaddr};" \
>                 "fi; "\
>                 /* rest of boot sequence follows here */
>
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  common/main.c |   16 ++++++++++++++++
>  1 files changed, 16 insertions(+), 0 deletions(-)
>
> diff --git a/common/main.c b/common/main.c
> index 03c63b4..3137b75 100644
> --- a/common/main.c
> +++ b/common/main.c
> @@ -333,6 +333,20 @@ err:
>         hang();
>  }
>
> +static void process_fdt_options(const void *blob)
> +{
> +       ulong addr;
> +
> +       /* Add an env variable to point to a kernel payload, if available
> */
> +       addr = fdtdec_get_config_int(gd->fdt_blob, "kernel-offset", 0);
> +       if (addr)
> +               setenv_addr("kernaddr", (void *)(CONFIG_SYS_TEXT_BASE +
> addr));
> +
> +       /* Add an env variable to point to a root disk, if available */
> +       addr = fdtdec_get_config_int(gd->fdt_blob, "rootdisk-offset", 0);
> +       if (addr)
> +               setenv_addr("rootaddr", (void *)(CONFIG_SYS_TEXT_BASE +
> addr));
> +}
>  #endif /* CONFIG_OF_CONTROL */
>
>
> @@ -451,6 +465,8 @@ void main_loop (void)
>         if (env)
>                 s = env;
>
> +       process_fdt_options(gd->fdt_blob);
> +
>         /*
>          * If the bootsecure option was chosen, use secure_boot_cmd().
>          * Always use 'env' in this case, since bootsecure requres that the
> --
> 1.7.7.3
>
> _______________________________________________
> U-Boot mailing list
> U-Boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org
> http://lists.denx.de/mailman/listinfo/u-boot
>

--14dae93404cd455e6304cf8f031c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

hi simon:<br>=C2=A0 found a small bug?(not sure) which introduced by this c=
ommit.<br><br>this line not inldue FDT option<br>#if defined(CONFIG_SILENT_=
CONSOLE) || defined(CONFIG_POST) || defined(CONFIG_CMDLINE_EDITING)<br>DECL=
ARE_GLOBAL_DATA_PTR;<br>
#endif<br><br><br>main.c: In function &#39;process_fdt_options&#39;:<br>mai=
n.c:341:31: error: &#39;gd&#39; undeclared (first use in this function)<br>=
main.c:341:31: note: each undeclared identifier is reported only once for e=
ach function it appears in<br>
main.c: In function &#39;main_loop&#39;:<br>main.c:464:33: error: &#39;gd&#=
39; undeclared (first use in this function)<br>make[2]: *** [main.o] Error =
1<br>make[2]: *** Waiting for unfinished jobs....<br>make[1]: *** [common/l=
ibcommon.o] Error 2<br>
make[1]: *** Waiting for unfinished jobs....<br>make: *** [lt703a] Error 2<=
br><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Fri=
, Oct 26, 2012 at 10:31 AM, Simon Glass <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" target=3D"_blank">sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org</a>&gt;</span> wr=
ote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">If kernel-offset is specified in the fdt, se=
t an environment variable<br>
so that scripts can access the attached kernel.<br>
<br>
This can be used by a packaging program to tell U-Boot about a kernel<br>
that has been downloaded alongside U-Boot. The value in the fdt is<br>
the offset of the kernel from the start of the U-Boot image, so we can<br>
find it just by adding CONFIG_SYS_TEXT_BASE.<br>
<br>
It is then fairly easy to put something like this in the environment<br>
variables in the board header file:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;if test ${ker=
naddr} !=3D \&quot;\&quot;; then &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;echo \&quot;Using bundled kernel\&quot;; &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;bootm ${kernaddr};&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;fi; &quot;\<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* rest of boot seq=
uence follows here */<br>
<br>
Signed-off-by: Simon Glass &lt;<a href=3D"mailto:sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org">sjg@chro=
mium.org</a>&gt;<br>
---<br>
=C2=A0common/main.c | =C2=A0 16 ++++++++++++++++<br>
=C2=A01 files changed, 16 insertions(+), 0 deletions(-)<br>
<br>
diff --git a/common/main.c b/common/main.c<br>
index 03c63b4..3137b75 100644<br>
--- a/common/main.c<br>
+++ b/common/main.c<br>
@@ -333,6 +333,20 @@ err:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 hang();<br>
=C2=A0}<br>
<br>
+static void process_fdt_options(const void *blob)<br>
+{<br>
+ =C2=A0 =C2=A0 =C2=A0 ulong addr;<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 /* Add an env variable to point to a kernel payload,=
 if available */<br>
+ =C2=A0 =C2=A0 =C2=A0 addr =3D fdtdec_get_config_int(gd-&gt;fdt_blob, &quo=
t;kernel-offset&quot;, 0);<br>
+ =C2=A0 =C2=A0 =C2=A0 if (addr)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 setenv_addr(&quot;kernad=
dr&quot;, (void *)(CONFIG_SYS_TEXT_BASE + addr));<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 /* Add an env variable to point to a root disk, if a=
vailable */<br>
+ =C2=A0 =C2=A0 =C2=A0 addr =3D fdtdec_get_config_int(gd-&gt;fdt_blob, &quo=
t;rootdisk-offset&quot;, 0);<br>
+ =C2=A0 =C2=A0 =C2=A0 if (addr)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 setenv_addr(&quot;rootad=
dr&quot;, (void *)(CONFIG_SYS_TEXT_BASE + addr));<br>
+}<br>
=C2=A0#endif /* CONFIG_OF_CONTROL */<br>
<br>
<br>
@@ -451,6 +465,8 @@ void main_loop (void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s =3D env;<br>
<br>
+ =C2=A0 =C2=A0 =C2=A0 process_fdt_options(gd-&gt;fdt_blob);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* If the bootsecure option was chosen, us=
e secure_boot_cmd().<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Always use &#39;env&#39; in this case, =
since bootsecure requres that the<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.7.3<br>
<br>
_______________________________________________<br>
U-Boot mailing list<br>
<a href=3D"mailto:U-Boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org">U-Boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org</a><br>
<a href=3D"http://lists.denx.de/mailman/listinfo/u-boot" target=3D"_blank">=
http://lists.denx.de/mailman/listinfo/u-boot</a><br>
</font></span></blockquote></div><br></div>

--14dae93404cd455e6304cf8f031c--

--===============4445246778241453038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============4445246778241453038==--
