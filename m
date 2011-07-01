From: Manjunatha GK <manjugk-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] DT: Use helper function to read u32 values
Date: Fri, 1 Jul 2011 23:14:01 +0530
Message-ID: <BANLkTimLmh1vCgZD3NA7T+oZ4fX2ZH9hFQ@mail.gmail.com>
References: <BANLkTin+WCRrxhOBNoL_AJJAkS-w9ybXqg@mail.gmail.com>
	<BANLkTikSnqPYxhrZv0YrhdZmTC=zrNNDRg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7398332721780650613=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <BANLkTikSnqPYxhrZv0YrhdZmTC=zrNNDRg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org\"" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============7398332721780650613==
Content-Type: multipart/alternative; boundary=0016e6d778da23eb1304a70590f7

--0016e6d778da23eb1304a70590f7
Content-Type: text/plain; charset=ISO-8859-1

Hi Grant,

On 1 July 2011 20:07, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:

> On Fri, Jul 1, 2011 at 7:55 AM, Manjunatha GK <manjugk-l0cyMroinI0@public.gmane.org> wrote:
> > Use helper function of_property_read_u32() in place of of_get_property
> > and be32_to_cpup() api's for code optimization.
> >
> > Compile tested the changes.
> >
> > Signed-off-by: G, Manjunath Kondaiah <manjugk-l0cyMroinI0@public.gmane.org>
> > ---
> >  drivers/of/irq.c     |   37 ++++++++++++++++++++++---------------
> >  drivers/of/of_i2c.c  |    8 +++-----
> >  drivers/of/of_mdio.c |   16 ++++++----------
> >  3 files changed, 31 insertions(+), 30 deletions(-)
> >
> > diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> > index 9f689f1..13c02e2 100644
> > --- a/drivers/of/irq.c
> > +++ b/drivers/of/irq.c
> > @@ -59,20 +59,20 @@ EXPORT_SYMBOL_GPL(irq_of_parse_and_map);
> >  struct device_node *of_irq_find_parent(struct device_node *child)
> >  {
> >      struct device_node *p;
> > -    const __be32 *parp;
> > +    u32 *parp = NULL;
> >
> >      if (!of_node_get(child))
> >          return NULL;
> >
> >      do {
> > -        parp = of_get_property(child, "interrupt-parent", NULL);
> > +        of_property_read_u32(child, "interrupt-parent", parp);
> >          if (parp == NULL)
> >              p = of_get_parent(child);
>
> Hi Manjunatha.
>
> This won't work.  You must pass a valid pointer.  It needs to be done this
> way;
>        u32 parp;
>        if (of_property_read_u32(child, "interrupt-parent", &parp) == 0) {
>                ...
>        } else {
>                ...
>         }
>
Thanks for the quick catch. I will fix it.

-Manjunath

--0016e6d778da23eb1304a70590f7
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Grant,<br><br><div class=3D"gmail_quote">On 1 July 2011 20:07, Grant Lik=
ely <span dir=3D"ltr">&lt;<a href=3D"mailto:grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org">gran=
t.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x;">
<div><div></div><div class=3D"h5">On Fri, Jul 1, 2011 at 7:55 AM, Manjunath=
a GK &lt;<a href=3D"mailto:manjugk-l0cyMroinI0@public.gmane.org">manjugk-l0cyMroinI0@public.gmane.org</a>&gt; wrote:<br=
>
&gt; Use helper function of_property_read_u32() in place of of_get_property=
<br>
&gt; and be32_to_cpup() api&#39;s for code optimization.<br>
&gt;<br>
&gt; Compile tested the changes.<br>
&gt;<br>
&gt; Signed-off-by: G, Manjunath Kondaiah &lt;<a href=3D"mailto:manjugk@ti.=
com">manjugk-l0cyMroinI0@public.gmane.org</a>&gt;<br>
&gt; ---<br>
&gt; =A0drivers/of/irq.c=A0=A0=A0=A0 |=A0=A0 37 ++++++++++++++++++++++-----=
----------<br>
&gt; =A0drivers/of/of_i2c.c=A0 |=A0=A0=A0 8 +++-----<br>
&gt; =A0drivers/of/of_mdio.c |=A0=A0 16 ++++++----------<br>
&gt; =A03 files changed, 31 insertions(+), 30 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/of/irq.c b/drivers/of/irq.c<br>
&gt; index 9f689f1..13c02e2 100644<br>
&gt; --- a/drivers/of/irq.c<br>
&gt; +++ b/drivers/of/irq.c<br>
&gt; @@ -59,20 +59,20 @@ EXPORT_SYMBOL_GPL(irq_of_parse_and_map);<br>
&gt; =A0struct device_node *of_irq_find_parent(struct device_node *child)<b=
r>
&gt; =A0{<br>
&gt; =A0=A0=A0=A0 struct device_node *p;<br>
&gt; -=A0=A0=A0 const __be32 *parp;<br>
&gt; +=A0=A0=A0 u32 *parp =3D NULL;<br>
&gt;<br>
&gt; =A0=A0=A0=A0 if (!of_node_get(child))<br>
&gt; =A0=A0=A0=A0 =A0=A0=A0 return NULL;<br>
&gt;<br>
&gt; =A0=A0=A0=A0 do {<br>
&gt; -=A0=A0=A0 =A0=A0=A0 parp =3D of_get_property(child, &quot;interrupt-p=
arent&quot;, NULL);<br>
&gt; +=A0=A0=A0 =A0=A0=A0 of_property_read_u32(child, &quot;interrupt-paren=
t&quot;, parp);<br>
&gt; =A0=A0=A0=A0 =A0=A0=A0 if (parp =3D=3D NULL)<br>
&gt; =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 p =3D of_get_parent(child);<br>
<br>
</div></div>Hi Manjunatha.<br>
<br>
This won&#39;t work. =A0You must pass a valid pointer. =A0It needs to be do=
ne this way;<br>
 =A0 =A0 =A0 =A0u32 parp;<br>
 =A0 =A0 =A0 =A0if (of_property_read_u32(child, &quot;interrupt-parent&quot=
;, &amp;parp) =3D=3D 0) {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0...<br>
 =A0 =A0 =A0 =A0} else {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0...<br>
<div><div></div><div class=3D"h5"> =A0 =A0 =A0 =A0}<br></div></div></blockq=
uote><div>Thanks for the quick catch. I will fix it.<br><br>-Manjunath <br>
</div></div><br>

--0016e6d778da23eb1304a70590f7--

--===============7398332721780650613==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============7398332721780650613==--
