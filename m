Return-Path: <matthias.bgg@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1415816222-32200-1-git-send-email-wens@csie.org>
References: <1415816222-32200-1-git-send-email-wens@csie.org>
Date: Thu, 13 Nov 2014 10:00:19 +0100
Message-ID: <CABuKBeJXOT-F71KwoA4E0rnwdjVfBO+o0dgJgF8jtqo+_QZWVQ@mail.gmail.com>
Subject: Re: [PATCH] of: pass name argument for of_io_request_and_map as const
 char *
From: Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: multipart/alternative; boundary=047d7b3a8cf4e4316b0507b9bdef
To: Chen-Yu Tsai <wens@csie.org>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Emilio Lopez <emilio@elopez.com.ar>
List-ID: <devicetree@vger.kernel.org>

--047d7b3a8cf4e4316b0507b9bdef
Content-Type: text/plain; charset=ISO-8859-1

2014-11-12 19:17 GMT+01:00 Chen-Yu Tsai <wens@csie.org>:

> The name argument for of_io_request_and_map is only passed to
> request_mem_region, which is a macro of __request_region, which
> takes a const name argument.
>
> Make the name argument const, so when we pass const strings we
> don't get the following warnings:
>
>     warning: passing argument 3 of 'of_io_request_and_map' discards
>     'const' qualifier from pointer target type [enabled by default]
>
>     In file included from drivers/clk/sunxi/clk-sunxi.c:20:0:
>     include/linux/of_address.h:108:15: note: expected 'char *' but
>     argument is of type 'const char *'
>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>

I already send a patch for that which got accepted by Grant [0]. Although
right now, I'm not able to find it on his repository [1].

Cheers,
Matthias

[0] https://lkml.org/lkml/2014/11/4/588
[1] https://git.kernel.org/cgit/linux/kernel/git/glikely/linux.git/


> I ran into this while switching some of the sunxi clock code to use
> of_io_request_and_map.
>
> ---
>  drivers/of/address.c       | 2 +-
>  include/linux/of_address.h | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index afdb782..e02828f 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -871,7 +871,7 @@ EXPORT_SYMBOL(of_iomap);
>   *             return PTR_ERR(base);
>   */
>  void __iomem *of_io_request_and_map(struct device_node *np, int index,
> -                                       char *name)
> +                                       const char *name)
>  {
>         struct resource res;
>         void __iomem *mem;
> diff --git a/include/linux/of_address.h b/include/linux/of_address.h
> index 8cb14eb..d88e81b 100644
> --- a/include/linux/of_address.h
> +++ b/include/linux/of_address.h
> @@ -106,7 +106,7 @@ extern int of_address_to_resource(struct device_node
> *dev, int index,
>                                   struct resource *r);
>  void __iomem *of_iomap(struct device_node *node, int index);
>  void __iomem *of_io_request_and_map(struct device_node *device,
> -                                       int index, char *name);
> +                                       int index, const char *name);
>  #else
>
>  #include <linux/io.h>
> @@ -123,7 +123,7 @@ static inline void __iomem *of_iomap(struct
> device_node *device, int index)
>  }
>
>  static inline void __iomem *of_io_request_and_map(struct device_node
> *device,
> -                                       int index, char *name)
> +                                       int index, const char *name)
>  {
>         return IOMEM_ERR_PTR(-EINVAL);
>  }
> --
> 2.1.3
>
>


-- 
motzblog.wordpress.com

--047d7b3a8cf4e4316b0507b9bdef
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">2014-11-12 19:17 GMT+01:00 Chen-Yu Tsai <span dir=3D"ltr">&lt;<a href=
=3D"mailto:wens@csie.org" target=3D"_blank">wens@csie.org</a>&gt;</span>:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">The name argument for o=
f_io_request_and_map is only passed to<br>
request_mem_region, which is a macro of __request_region, which<br>
takes a const name argument.<br>
<br>
Make the name argument const, so when we pass const strings we<br>
don&#39;t get the following warnings:<br>
<br>
=A0 =A0 warning: passing argument 3 of &#39;of_io_request_and_map&#39; disc=
ards<br>
=A0 =A0 &#39;const&#39; qualifier from pointer target type [enabled by defa=
ult]<br>
<br>
=A0 =A0 In file included from drivers/clk/sunxi/clk-sunxi.c:20:0:<br>
=A0 =A0 include/linux/of_address.h:108:15: note: expected &#39;char *&#39; =
but<br>
=A0 =A0 argument is of type &#39;const char *&#39;<br>
<br>
Signed-off-by: Chen-Yu Tsai &lt;<a href=3D"mailto:wens@csie.org">wens@csie.=
org</a>&gt;<br>
Cc: Matthias Brugger &lt;<a href=3D"mailto:matthias.bgg@gmail.com">matthias=
.bgg@gmail.com</a>&gt;<br>
---<br></blockquote><div><br></div><div>I already send a patch for that whi=
ch got accepted by Grant [0]. Although right now, I&#39;m not able to find =
it on his repository [1].<br><br></div><div>Cheers,<br>Matthias<br></div><d=
iv><br>[0] <a href=3D"https://lkml.org/lkml/2014/11/4/588">https://lkml.org=
/lkml/2014/11/4/588</a><br></div><div>[1] <a href=3D"https://git.kernel.org=
/cgit/linux/kernel/git/glikely/linux.git/">https://git.kernel.org/cgit/linu=
x/kernel/git/glikely/linux.git/</a> <br><br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
<br>
I ran into this while switching some of the sunxi clock code to use<br>
of_io_request_and_map.<br>
<br>
---<br>
=A0drivers/of/address.c=A0 =A0 =A0 =A0| 2 +-<br>
=A0include/linux/of_address.h | 4 ++--<br>
=A02 files changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/drivers/of/address.c b/drivers/of/address.c<br>
index afdb782..e02828f 100644<br>
--- a/drivers/of/address.c<br>
+++ b/drivers/of/address.c<br>
@@ -871,7 +871,7 @@ EXPORT_SYMBOL(of_iomap);<br>
=A0 *=A0 =A0 =A0 =A0 =A0 =A0 =A0return PTR_ERR(base);<br>
=A0 */<br>
=A0void __iomem *of_io_request_and_map(struct device_node *np, int index,<b=
r>
-=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0char *name)<br>
+=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0const char *name)<br>
=A0{<br>
=A0 =A0 =A0 =A0 struct resource res;<br>
=A0 =A0 =A0 =A0 void __iomem *mem;<br>
diff --git a/include/linux/of_address.h b/include/linux/of_address.h<br>
index 8cb14eb..d88e81b 100644<br>
--- a/include/linux/of_address.h<br>
+++ b/include/linux/of_address.h<br>
@@ -106,7 +106,7 @@ extern int of_address_to_resource(struct device_node *d=
ev, int index,<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct =
resource *r);<br>
=A0void __iomem *of_iomap(struct device_node *node, int index);<br>
=A0void __iomem *of_io_request_and_map(struct device_node *device,<br>
-=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0int index, char *name);<br>
+=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0int index, const char *name);<br>
=A0#else<br>
<br>
=A0#include &lt;linux/io.h&gt;<br>
@@ -123,7 +123,7 @@ static inline void __iomem *of_iomap(struct device_node=
 *device, int index)<br>
=A0}<br>
<br>
=A0static inline void __iomem *of_io_request_and_map(struct device_node *de=
vice,<br>
-=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0int index, char *name)<br>
+=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0int index, const char *name)<br>
=A0{<br>
=A0 =A0 =A0 =A0 return IOMEM_ERR_PTR(-EINVAL);<br>
=A0}<br>
<span class=3D""><font color=3D"#888888">--<br>
2.1.3<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature"><a href=3D"http://motzblog.wordpress.com" target=3D"_=
blank">motzblog.wordpress.com</a></div>
</div></div>

--047d7b3a8cf4e4316b0507b9bdef--
