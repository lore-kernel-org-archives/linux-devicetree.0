Return-Path: <houcheng@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACRpkdYkbdbkO7Jff-mQy1ybiq=HV9fJfgGG8QezvX2iJXoUcQ@mail.gmail.com>
References: <1403098673-3058-1-git-send-email-houcheng@gmail.com>
	<CACRpkdYkbdbkO7Jff-mQy1ybiq=HV9fJfgGG8QezvX2iJXoUcQ@mail.gmail.com>
Date: Fri, 11 Jul 2014 06:00:23 +0800
Message-ID: <CAL8JtxD-h1mj8yCSigv_JkU4XizpsUqofc3Lbp5o_KGyR3gV9g@mail.gmail.com>
Subject: Re: [RFC PATCH v3] reset: Add a defer reset object to send board
 specific reset
From: Houcheng Lin <houcheng@gmail.com>
Content-Type: multipart/alternative; boundary=90e6ba4fd38a9c548f04fdddf361
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Philipp Zabel <p.zabel@pengutronix.de>, Stephen Gallimore <stephen.gallimore@st.com>, Srinivas KANDAGATLA <srinivas.kandagatla@st.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Ulf Hansson <ulf.hansson@linaro.org>, Sebastian Reichel <sre@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--90e6ba4fd38a9c548f04fdddf361
Content-Type: text/plain; charset=UTF-8

Hi Linus,
Thank you a lot for reviewing.
All gpiod descriptors could be enumerated during the driver loading and
stored into
private data structure. So the device_node is not needed stored in private
data structure.
Then use gpio descriptor to check status in the last minutes. I'll modify
these on next patch
version.

Best regards,
Houcheng Lin


2014-07-07 20:38 GMT+08:00 Linus Walleij <linus.walleij@linaro.org>:

> On Wed, Jun 18, 2014 at 3:37 PM, Houcheng Lin <houcheng@gmail.com> wrote:
>
> (...)
> > +static DEFINE_MUTEX(deferred_reset_mutex);
> > +static LIST_HEAD(deferred_reset_list);
> > +
> > +struct defer_reset_private {
> > +       struct list_head lnode;
> > +       struct device_node *node;  /* defer_reset device */
>
> Isn't it better if you get the gpio descriptor(s) in probe() and store that
> inside defer_reset_private instead of storing the device_node?
>
> struct gpio_desc *gpiod;
>
> (Then you need not include <linux/of_gpio.h>)
>
> > +};
>
>
> > +static int gdr_issue_reset_line(
> > +       struct device_node *of_node, int index, int val)
> > +{
> > +       enum of_gpio_flags flags = 0;
> > +       struct gpio_desc *gpiod;
> > +       gpiod = of_get_named_gpiod_flags(of_node, "reset-gpios", index,
> &flags);
> > +       if (IS_ERR(gpiod))
> > +               return -PTR_ERR(gpiod);
> > +       gdr_issue_reset_gpio(gpiod, val, flags);
>
> So here just use the gpiod from the private struct instead
> of looking it up in the last minute.
>
> > +static int gdr_probe(struct platform_device *pdev_gdr)
> > +{
> > +       struct list_head *pos, *n;
> > +
> > +       pr_debug("gpio defer reset probe\n");
> > +
> > +       mutex_lock(&deferred_reset_mutex);
> > +       list_for_each_safe(pos, n, &deferred_reset_list) {
> > +               struct defer_reset_private *pdata;
> > +               struct platform_device *pdev;
> > +               pdata = list_entry(pos, struct defer_reset_private,
> lnode);
> > +               pdev = of_find_device_by_node(pdata->node->parent);
>
> So in this iteration I would get the gpio descriptor for each one using
> something like:
>
> pdata->gpiod = gpiod_get_index(&pdev->dev, ...);
>
> Yours,
> Linus Walleij
>



-- 
Best regards,
Houcheng Lin

--90e6ba4fd38a9c548f04fdddf361
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi Linus,<br></div>Thank you a lot for reviewing=
.<br>All gpiod descriptors could be enumerated during the driver loading an=
d stored into<br>private data structure. So the device_node is not needed s=
tored in private data structure. <br>
</div><div><div>Then use gpio descriptor to check status in the last minute=
s. I&#39;ll modify these on next patch <br>version.<br><br></div><div>Best =
regards,<br>Houcheng Lin<br></div></div><div><div><div><div class=3D"gmail_=
extra">
<br><br><div class=3D"gmail_quote">2014-07-07 20:38 GMT+08:00 Linus Walleij=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:linus.walleij@linaro.org" target=
=3D"_blank">linus.walleij@linaro.org</a>&gt;</span>:<br>



<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Jun 18, 2014 at 3=
:37 PM, Houcheng Lin &lt;<a href=3D"mailto:houcheng@gmail.com" target=3D"_b=
lank">houcheng@gmail.com</a>&gt; wrote:<br>





<br>
(...)<br>
<div>&gt; +static DEFINE_MUTEX(deferred_reset_mutex);<br>
&gt; +static LIST_HEAD(deferred_reset_list);<br>
&gt; +<br>
&gt; +struct defer_reset_private {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 struct list_head lnode;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 struct device_node *node; =C2=A0/* defer_reset =
device */<br>
<br>
</div>Isn&#39;t it better if you get the gpio descriptor(s) in probe() and =
store that<br>
inside defer_reset_private instead of storing the device_node?<br>
<br>
struct gpio_desc *gpiod;<br>
<br>
(Then you need not include &lt;linux/of_gpio.h&gt;)<br>
<div><br>
&gt; +};<br>
<br>
<br>
&gt; +static int gdr_issue_reset_line(<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 struct device_node *of_node, int index, int val=
)<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 enum of_gpio_flags flags =3D 0;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 struct gpio_desc *gpiod;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 gpiod =3D of_get_named_gpiod_flags(of_node, &qu=
ot;reset-gpios&quot;, index, &amp;flags);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(gpiod))<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -PTR_ERR(gpi=
od);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 gdr_issue_reset_gpio(gpiod, val, flags);<br>
<br>
</div>So here just use the gpiod from the private struct instead<br>
of looking it up in the last minute.<br>
<div><br>
&gt; +static int gdr_probe(struct platform_device *pdev_gdr)<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 struct list_head *pos, *n;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 pr_debug(&quot;gpio defer reset probe\n&quot;);=
<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 mutex_lock(&amp;deferred_reset_mutex);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 list_for_each_safe(pos, n, &amp;deferred_reset_=
list) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct defer_reset_=
private *pdata;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct platform_dev=
ice *pdev;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pdata =3D list_entr=
y(pos, struct defer_reset_private, lnode);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pdev =3D of_find_de=
vice_by_node(pdata-&gt;node-&gt;parent);<br>
<br>
</div>So in this iteration I would get the gpio descriptor for each one usi=
ng<br>
something like:<br>
<br>
pdata-&gt;gpiod =3D gpiod_get_index(&amp;pdev-&gt;dev, ...);<br>
<br>
Yours,<br>
Linus Walleij<br>
</blockquote></div><br><br clear=3D"all"><br>-- <br>Best regards,<br>Houche=
ng Lin<br>
</div></div></div></div></div>

--90e6ba4fd38a9c548f04fdddf361--
