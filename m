Return-Path: <SRS0=onqV=UJ=google.com=saravanak@kernel.org>
MIME-Version: 1.0
References: <20190604003218.241354-1-saravanak@google.com> <20190604003218.241354-2-saravanak@google.com>
 <CAL_JsqLWfNUJm23x+doJDwyuMLOvqWAnLKGQYcgVct-AyWb9LQ@mail.gmail.com>
In-Reply-To: <CAL_JsqLWfNUJm23x+doJDwyuMLOvqWAnLKGQYcgVct-AyWb9LQ@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Mon, 10 Jun 2019 12:15:39 -0700
Message-ID: <CAGETcx_Kb3+fFYHhBUdVbCSNTk4v5j1Ket=Et2ZQY0SHUgLLMw@mail.gmail.com>
Subject: Re: [RESEND PATCH v1 1/5] of/platform: Speed up of_find_device_by_node()
Content-Type: multipart/alternative; boundary="000000000000389ccb058afd026a"
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Frank Rowand <frowand.list@gmail.com>, David Collins <collinsd@codeaurora.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Android Kernel Team <kernel-team@android.com>
List-ID: <devicetree@vger.kernel.org>

--000000000000389ccb058afd026a
Content-Type: text/plain; charset="UTF-8"

I did. And I didn't get a response. Folks suggested this might be one of
the preferred ways instead of sending "bump" emails.

-Saravana

On Mon, Jun 10, 2019, 10:36 AM Rob Herring <robh+dt@kernel.org> wrote:

> Why are you resending this rather than replying to Frank's last
> comments on the original?
>
> On Mon, Jun 3, 2019 at 6:32 PM Saravana Kannan <saravanak@google.com>
> wrote:
> >
> > Add a pointer from device tree node to the device created from it.
> > This allows us to find the device corresponding to a device tree node
> > without having to loop through all the platform devices.
> >
> > However, fallback to looping through the platform devices to handle
> > any devices that might set their own of_node.
> >
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > ---
> >  drivers/of/platform.c | 20 +++++++++++++++++++-
> >  include/linux/of.h    |  3 +++
> >  2 files changed, 22 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> > index 04ad312fd85b..1115a8d80a33 100644
> > --- a/drivers/of/platform.c
> > +++ b/drivers/of/platform.c
> > @@ -42,6 +42,8 @@ static int of_dev_node_match(struct device *dev, void
> *data)
> >         return dev->of_node == data;
> >  }
> >
> > +static DEFINE_SPINLOCK(of_dev_lock);
> > +
> >  /**
> >   * of_find_device_by_node - Find the platform_device associated with a
> node
> >   * @np: Pointer to device tree node
> > @@ -55,7 +57,18 @@ struct platform_device *of_find_device_by_node(struct
> device_node *np)
> >  {
> >         struct device *dev;
> >
> > -       dev = bus_find_device(&platform_bus_type, NULL, np,
> of_dev_node_match);
> > +       /*
> > +        * Spinlock needed to make sure np->dev doesn't get freed
> between NULL
> > +        * check inside and kref count increment inside get_device().
> This is
> > +        * achieved by grabbing the spinlock before setting np->dev =
> NULL in
> > +        * of_platform_device_destroy().
> > +        */
> > +       spin_lock(&of_dev_lock);
> > +       dev = get_device(np->dev);
> > +       spin_unlock(&of_dev_lock);
> > +       if (!dev)
> > +               dev = bus_find_device(&platform_bus_type, NULL, np,
> > +                                     of_dev_node_match);
> >         return dev ? to_platform_device(dev) : NULL;
> >  }
> >  EXPORT_SYMBOL(of_find_device_by_node);
> > @@ -196,6 +209,7 @@ static struct platform_device
> *of_platform_device_create_pdata(
> >                 platform_device_put(dev);
> >                 goto err_clear_flag;
> >         }
> > +       np->dev = &dev->dev;
> >
> >         return dev;
> >
> > @@ -556,6 +570,10 @@ int of_platform_device_destroy(struct device *dev,
> void *data)
> >         if (of_node_check_flag(dev->of_node, OF_POPULATED_BUS))
> >                 device_for_each_child(dev, NULL,
> of_platform_device_destroy);
> >
> > +       /* Spinlock is needed for of_find_device_by_node() to work */
> > +       spin_lock(&of_dev_lock);
> > +       dev->of_node->dev = NULL;
> > +       spin_unlock(&of_dev_lock);
> >         of_node_clear_flag(dev->of_node, OF_POPULATED);
> >         of_node_clear_flag(dev->of_node, OF_POPULATED_BUS);
> >
> > diff --git a/include/linux/of.h b/include/linux/of.h
> > index 0cf857012f11..f2b4912cbca1 100644
> > --- a/include/linux/of.h
> > +++ b/include/linux/of.h
> > @@ -48,6 +48,8 @@ struct property {
> >  struct of_irq_controller;
> >  #endif
> >
> > +struct device;
> > +
> >  struct device_node {
> >         const char *name;
> >         phandle phandle;
> > @@ -68,6 +70,7 @@ struct device_node {
> >         unsigned int unique_id;
> >         struct of_irq_controller *irq_trans;
> >  #endif
> > +       struct device *dev;             /* Device created from this node
> */
> >  };
> >
> >  #define MAX_PHANDLE_ARGS 16
> > --
> > 2.22.0.rc1.257.g3120a18244-goog
> >
>

--000000000000389ccb058afd026a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I did. And I didn&#39;t get a response. Folks suggested t=
his might be one of the preferred ways instead of sending &quot;bump&quot; =
emails.=C2=A0<div dir=3D"auto"><br></div><div dir=3D"auto">-Saravana</div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Mon, Jun 10, 2019, 10:36 AM Rob Herring &lt;<a href=3D"mailto:robh%2Bdt@k=
ernel.org">robh+dt@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">Why are you resending this rather than replying to Frank&#39;s la=
st<br>
comments on the original?<br>
<br>
On Mon, Jun 3, 2019 at 6:32 PM Saravana Kannan &lt;<a href=3D"mailto:sarava=
nak@google.com" target=3D"_blank" rel=3D"noreferrer">saravanak@google.com</=
a>&gt; wrote:<br>
&gt;<br>
&gt; Add a pointer from device tree node to the device created from it.<br>
&gt; This allows us to find the device corresponding to a device tree node<=
br>
&gt; without having to loop through all the platform devices.<br>
&gt;<br>
&gt; However, fallback to looping through the platform devices to handle<br=
>
&gt; any devices that might set their own of_node.<br>
&gt;<br>
&gt; Signed-off-by: Saravana Kannan &lt;<a href=3D"mailto:saravanak@google.=
com" target=3D"_blank" rel=3D"noreferrer">saravanak@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/of/platform.c | 20 +++++++++++++++++++-<br>
&gt;=C2=A0 include/linux/of.h=C2=A0 =C2=A0 |=C2=A0 3 +++<br>
&gt;=C2=A0 2 files changed, 22 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/drivers/of/platform.c b/drivers/of/platform.c<br>
&gt; index 04ad312fd85b..1115a8d80a33 100644<br>
&gt; --- a/drivers/of/platform.c<br>
&gt; +++ b/drivers/of/platform.c<br>
&gt; @@ -42,6 +42,8 @@ static int of_dev_node_match(struct device *dev, voi=
d *data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return dev-&gt;of_node =3D=3D data;<b=
r>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; +static DEFINE_SPINLOCK(of_dev_lock);<br>
&gt; +<br>
&gt;=C2=A0 /**<br>
&gt;=C2=A0 =C2=A0* of_find_device_by_node - Find the platform_device associ=
ated with a node<br>
&gt;=C2=A0 =C2=A0* @np: Pointer to device tree node<br>
&gt; @@ -55,7 +57,18 @@ struct platform_device *of_find_device_by_node(stru=
ct device_node *np)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0dev =3D bus_find_device(&amp;platform_bus_=
type, NULL, np, of_dev_node_match);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Spinlock needed to make sure np-&gt;dev=
 doesn&#39;t get freed between NULL<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * check inside and kref count increment i=
nside get_device(). This is<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * achieved by grabbing the spinlock befor=
e setting np-&gt;dev =3D NULL in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * of_platform_device_destroy().<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock(&amp;of_dev_lock);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dev =3D get_device(np-&gt;dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock(&amp;of_dev_lock);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!dev)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev =3D bus_fi=
nd_device(&amp;platform_bus_type, NULL, np,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of_dev_node_=
match);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return dev ? to_platform_device(dev) =
: NULL;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 EXPORT_SYMBOL(of_find_device_by_node);<br>
&gt; @@ -196,6 +209,7 @@ static struct platform_device *of_platform_device_=
create_pdata(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0platform_=
device_put(dev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_=
clear_flag;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0np-&gt;dev =3D &amp;dev-&gt;dev;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return dev;<br>
&gt;<br>
&gt; @@ -556,6 +570,10 @@ int of_platform_device_destroy(struct device *dev=
, void *data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (of_node_check_flag(dev-&gt;of_nod=
e, OF_POPULATED_BUS))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0device_fo=
r_each_child(dev, NULL, of_platform_device_destroy);<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Spinlock is needed for of_find_device_b=
y_node() to work */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock(&amp;of_dev_lock);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dev-&gt;of_node-&gt;dev =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock(&amp;of_dev_lock);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_clear_flag(dev-&gt;of_node, O=
F_POPULATED);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_clear_flag(dev-&gt;of_node, O=
F_POPULATED_BUS);<br>
&gt;<br>
&gt; diff --git a/include/linux/of.h b/include/linux/of.h<br>
&gt; index 0cf857012f11..f2b4912cbca1 100644<br>
&gt; --- a/include/linux/of.h<br>
&gt; +++ b/include/linux/of.h<br>
&gt; @@ -48,6 +48,8 @@ struct property {<br>
&gt;=C2=A0 struct of_irq_controller;<br>
&gt;=C2=A0 #endif<br>
&gt;<br>
&gt; +struct device;<br>
&gt; +<br>
&gt;=C2=A0 struct device_node {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *name;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0phandle phandle;<br>
&gt; @@ -68,6 +70,7 @@ struct device_node {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int unique_id;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct of_irq_controller *irq_trans;<=
br>
&gt;=C2=A0 #endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Device created from this node */<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt;=C2=A0 #define MAX_PHANDLE_ARGS 16<br>
&gt; --<br>
&gt; 2.22.0.rc1.257.g3120a18244-goog<br>
&gt;<br>
</blockquote></div>

--000000000000389ccb058afd026a--
