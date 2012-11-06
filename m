From: Belisko Marek <marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] leds/tca6507: Add support for devicetree.
Date: Tue, 6 Nov 2012 21:32:19 +0100
Message-ID: <CAAfyv36WJZro4DsOy=S7X5YLPw93M00JY95kc9EHKRqCSMcBbQ@mail.gmail.com>
References: <1351633534-20817-1-git-send-email-marek.belisko@open-nandra.com>
 <CAK5ve-+fE7T3U9KZ-C5-sZN9PUPq6RybCu+nv9UDb2x0bnarzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2120188351013842369=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAK5ve-+fE7T3U9KZ-C5-sZN9PUPq6RybCu+nv9UDb2x0bnarzw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============2120188351013842369==
Content-Type: multipart/alternative; boundary=bcaec517a9b2a474ae04cdd97fa0

--bcaec517a9b2a474ae04cdd97fa0
Content-Type: text/plain; charset=UTF-8

Hi,

On Tue, Nov 6, 2012 at 7:24 PM, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> On Tue, Oct 30, 2012 at 2:45 PM, Marek Belisko
> <marek.belisko-e6Ot0yJZRx5zTq7rFmK8cA@public.gmane.org> wrote:
> > Support added only for leds (not for gpio's).
> >
> > Signed-off-by: Marek Belisko <marek.belisko-e6Ot0yJZRx5zTq7rFmK8cA@public.gmane.org>
> > ---
> >  drivers/leds/leds-tca6507.c |   73
> +++++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 70 insertions(+), 3 deletions(-)
> >
>
> Overall, this looks good to me. Maybe some question as below,
>
> -Bryan
>
> > diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
> > index dabcf7a..496dd98 100644
> > --- a/drivers/leds/leds-tca6507.c
> > +++ b/drivers/leds/leds-tca6507.c
> > @@ -667,6 +667,69 @@ static void tca6507_remove_gpio(struct tca6507_chip
> *tca)
> >  }
> >  #endif /* CONFIG_GPIOLIB */
> >
> > +#ifdef CONFIG_OF
> > +static struct tca6507_platform_data * __devinit
> tca6507_led_dt_init(struct i2c_client *client)
> > +{
> > +       struct device_node *np = client->dev.of_node, *child;
> > +       struct tca6507_platform_data *pdata;
> > +       struct led_info *tca_leds;
> > +       int count = 0;
> > +
> > +       for_each_child_of_node(np, child)
> > +               count++;
> > +       if (!count)
> > +               return NULL;
> > +
>
> I saw many 'return NULL' here, why not return some error code in ERR_PTR?
>
Well this function is only only used to correctly parse DT and set proper
platform data which was previously passed from board file. I think we don't
need to return (and check) specific error code just return NULL and use
some general advice to user that something is wrong. Same way it's done in
leds-gpio in gpio_leds_create_of() function.

>
> > +       if (count > NUM_LEDS)
> > +               return NULL;
> > +
> > +       tca_leds = devm_kzalloc(&client->dev, sizeof(struct led_info) *
> NUM_LEDS, GFP_KERNEL);
> > +
>
> useless empty line.
>
> > +       if (!tca_leds)
> > +               return NULL;
> > +
> > +
>
> useless empty line.
>
> > +       for_each_child_of_node(np, child) {
> > +               struct led_info led;
> > +               u32 reg;
> > +               int ret;
> > +
> > +               led.name = of_get_property(child, "label", NULL) ? :
> child->name;
> > +               led.default_trigger =
> > +                       of_get_property(child, "linux,default-trigger",
> NULL);
> > +
> > +               ret = of_property_read_u32(child, "reg", &reg);
> > +
> > +               if (ret != 0)
> > +                       continue;
> > +               tca_leds[reg] = led;
> > +       }
> > +       pdata = devm_kzalloc(&client->dev, sizeof(struct
> tca6507_platform_data), GFP_KERNEL);
> > +       if (!pdata) {
> > +               kfree(tca_leds);
>
> Do we need to kfree here? I think devm_zalloc() will take care of this
> if the driver failed to register.
>
You're right. I'll fix comments are send updated version of patch. Are you
OK with binding documentation patch?

>
> > +               return NULL;
> > +       }
> > +
> > +       pdata->leds.leds = tca_leds;
> > +       pdata->leds.num_leds = NUM_LEDS;
> > +
> > +       return pdata;
> > +}
> > +
> > +static const struct of_device_id of_tca6507_leds_match[] = {
> > +       { .compatible = "leds-tca6507", },
> > +       {},
> > +};
> > +
> > +#else
> > +static int __devinit tca6507_led_dt_init(struct i2c_client *client,
> struct tca6507_platform_data *data)
> > +{
> > +       return -1;
> > +}
> > +
> > +#define of_tca6507_leds_match NULL
> > +#endif
> > +
> >  static int __devinit tca6507_probe(struct i2c_client *client,
> >                                    const struct i2c_device_id *id)
> >  {
> > @@ -683,9 +746,12 @@ static int __devinit tca6507_probe(struct
> i2c_client *client,
> >                 return -EIO;
> >
> >         if (!pdata || pdata->leds.num_leds != NUM_LEDS) {
> > -               dev_err(&client->dev, "Need %d entries in platform-data
> list\n",
> > -                       NUM_LEDS);
> > -               return -ENODEV;
> > +               pdata = tca6507_led_dt_init(client);
> > +               if (!pdata) {
> > +                       dev_err(&client->dev, "Need %d entries in
> platform-data list\n",
> > +                               NUM_LEDS);
> > +                       return -ENODEV;
> > +               }
> >         }
> >         tca = devm_kzalloc(&client->dev, sizeof(*tca), GFP_KERNEL);
> >         if (!tca)
> > @@ -750,6 +816,7 @@ static struct i2c_driver tca6507_driver = {
> >         .driver   = {
> >                 .name    = "leds-tca6507",
> >                 .owner   = THIS_MODULE,
> > +               .of_match_table = of_tca6507_leds_match,
> >         },
> >         .probe    = tca6507_probe,
> >         .remove   = __devexit_p(tca6507_remove),
> > --
> > 1.7.9.5
> >
>

mbe

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com

--bcaec517a9b2a474ae04cdd97fa0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Nov 6,=
 2012 at 7:24 PM, Bryan Wu <span dir=3D"ltr">&lt;<a href=3D"mailto:cooloney=
@gmail.com" target=3D"_blank">cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;pa=
dding-left:1ex">
<div class=3D"im">On Tue, Oct 30, 2012 at 2:45 PM, Marek Belisko<br>
&lt;<a href=3D"mailto:marek.belisko-e6Ot0yJZRx5zTq7rFmK8cA@public.gmane.org">marek.belisko@open-nan=
dra.com</a>&gt; wrote:<br>
&gt; Support added only for leds (not for gpio&#39;s).<br>
&gt;<br>
&gt; Signed-off-by: Marek Belisko &lt;<a href=3D"mailto:marek.belisko@open-=
nandra.com">marek.belisko-e6Ot0yJZRx5zTq7rFmK8cA@public.gmane.org</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0drivers/leds/leds-tca6507.c | =C2=A0 73 ++++++++++++++++++++++++=
+++++++++++++++++--<br>
&gt; =C2=A01 file changed, 70 insertions(+), 3 deletions(-)<br>
&gt;<br>
<br>
</div>Overall, this looks good to me. Maybe some question as below,<br>
<br>
-Bryan<br>
<div class=3D"im"><br>
&gt; diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c=
<br>
&gt; index dabcf7a..496dd98 100644<br>
&gt; --- a/drivers/leds/leds-tca6507.c<br>
&gt; +++ b/drivers/leds/leds-tca6507.c<br>
&gt; @@ -667,6 +667,69 @@ static void tca6507_remove_gpio(struct tca6507_ch=
ip *tca)<br>
&gt; =C2=A0}<br>
&gt; =C2=A0#endif /* CONFIG_GPIOLIB */<br>
&gt;<br>
&gt; +#ifdef CONFIG_OF<br>
&gt; +static struct tca6507_platform_data * __devinit tca6507_led_dt_init(s=
truct i2c_client *client)<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 struct device_node *np =3D client-&gt;dev.of_no=
de, *child;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 struct tca6507_platform_data *pdata;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 struct led_info *tca_leds;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 int count =3D 0;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 for_each_child_of_node(np, child)<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 count++;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 if (!count)<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt; +<br>
<br>
</div>I saw many &#39;return NULL&#39; here, why not return some error code=
 in ERR_PTR?<br></blockquote><div>Well this function is only only used to c=
orrectly parse DT and set proper platform data which was previously passed =
from board file. I think we don&#39;t need to return (and check) specific e=
rror code just return NULL and use some general advice to user that somethi=
ng is wrong. Same way it&#39;s done in leds-gpio in=C2=A0gpio_leds_create_o=
f() function.</div>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
<div class=3D"im"><br>
&gt; + =C2=A0 =C2=A0 =C2=A0 if (count &gt; NUM_LEDS)<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 tca_leds =3D devm_kzalloc(&amp;client-&gt;dev, =
sizeof(struct led_info) * NUM_LEDS, GFP_KERNEL);<br>
&gt; +<br>
<br>
</div>useless empty line.<br>
<div class=3D"im"><br>
&gt; + =C2=A0 =C2=A0 =C2=A0 if (!tca_leds)<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt; +<br>
&gt; +<br>
<br>
</div>useless empty line.<br>
<div class=3D"im"><br>
&gt; + =C2=A0 =C2=A0 =C2=A0 for_each_child_of_node(np, child) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct led_info led=
;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 reg;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://l=
ed.name" target=3D"_blank">led.name</a> =3D of_get_property(child, &quot;la=
bel&quot;, NULL) ? : child-&gt;name;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 led.default_trigger=
 =3D<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 of_get_property(child, &quot;linux,default-trigger&quot;, NULL);=
<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D of_property=
_read_u32(child, &quot;reg&quot;, &amp;reg);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret !=3D 0)<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tca_leds[reg] =3D l=
ed;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 pdata =3D devm_kzalloc(&amp;client-&gt;dev, siz=
eof(struct tca6507_platform_data), GFP_KERNEL);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 if (!pdata) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kfree(tca_leds);<br=
>
<br>
</div>Do we need to kfree here? I think devm_zalloc() will take care of thi=
s<br>
if the driver failed to register.<br></blockquote><div>You&#39;re right. I&=
#39;ll fix comments are send updated version of patch. Are you OK with bind=
ing documentation patch?=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex">

<div class=3D""><div class=3D"h5"><br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 pdata-&gt;leds.leds =3D tca_leds;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 pdata-&gt;leds.num_leds =3D NUM_LEDS;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 return pdata;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct of_device_id of_tca6507_leds_match[] =3D {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 { .compatible =3D &quot;leds-tca6507&quot;, },<=
br>
&gt; + =C2=A0 =C2=A0 =C2=A0 {},<br>
&gt; +};<br>
&gt; +<br>
&gt; +#else<br>
&gt; +static int __devinit tca6507_led_dt_init(struct i2c_client *client, s=
truct tca6507_platform_data *data)<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +}<br>
&gt; +<br>
&gt; +#define of_tca6507_leds_match NULL<br>
&gt; +#endif<br>
&gt; +<br>
&gt; =C2=A0static int __devinit tca6507_probe(struct i2c_client *client,<br=
>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct i2c_dev=
ice_id *id)<br>
&gt; =C2=A0{<br>
&gt; @@ -683,9 +746,12 @@ static int __devinit tca6507_probe(struct i2c_cli=
ent *client,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;<b=
r>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!pdata || pdata-&gt;leds.num_leds !=3D=
 NUM_LEDS) {<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&amp;client=
-&gt;dev, &quot;Need %d entries in platform-data list\n&quot;,<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 NUM_LEDS);<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pdata =3D tca6507_l=
ed_dt_init(client);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!pdata) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dev_err(&amp;client-&gt;dev, &quot;Need %d entries in platform-d=
ata list\n&quot;,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NUM_LEDS);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return -ENODEV;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 tca =3D devm_kzalloc(&amp;client-&gt;dev, =
sizeof(*tca), GFP_KERNEL);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!tca)<br>
&gt; @@ -750,6 +816,7 @@ static struct i2c_driver tca6507_driver =3D {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 .driver =C2=A0 =3D {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =C2=A0 =
=C2=A0=3D &quot;leds-tca6507&quot;,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .owner =C2=A0 =
=3D THIS_MODULE,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .of_match_table =3D=
 of_tca6507_leds_match,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 .probe =C2=A0 =C2=A0=3D tca6507_probe,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 .remove =C2=A0 =3D __devexit_p(tca6507_rem=
ove),<br>
&gt; --<br>
&gt; 1.7.9.5<br>
&gt;<br>
</div></div></blockquote></div><br>mbe<br clear=3D"all"><div><br></div>-- <=
br>as simple and primitive as possible<br>---------------------------------=
----------------<br>Marek Belisko - OPEN-NANDRA<br>Freelance Developer<br>
<br>Ruska Nova Ves 219 | Presov, 08005 Slovak Republic<br>Tel: +421 915 052=
 184<br>skype: marekwhite<br>twitter: #opennandra<br>web: <a href=3D"http:/=
/open-nandra.com" target=3D"_blank">http://open-nandra.com</a><br>
</div>

--bcaec517a9b2a474ae04cdd97fa0--

--===============2120188351013842369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2120188351013842369==--
