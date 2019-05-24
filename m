Return-Path: <SRS0=HYj1=TY=google.com=saravanak@kernel.org>
MIME-Version: 1.0
References: <20190524010117.225219-1-saravanak@google.com> <20190524010117.225219-2-saravanak@google.com>
 <6f4ca588-106f-93d1-8579-9e8d32c8031d@gmail.com>
In-Reply-To: <6f4ca588-106f-93d1-8579-9e8d32c8031d@gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Fri, 24 May 2019 11:17:06 -0700
Message-ID: <CAGETcx_Bg__+xEn3qObTS2-nAffVy72oxmVmyV0WDPYsRMu3Tg@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] of/platform: Speed up of_find_device_by_node()
Content-Type: multipart/alternative; boundary="000000000000ea842c0589a63665"
To: Frank Rowand <frowand.list@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@android.com
List-ID: <devicetree@vger.kernel.org>

--000000000000ea842c0589a63665
Content-Type: text/plain; charset="UTF-8"

On Fri, May 24, 2019 at 10:56 AM Frank Rowand <frowand.list@gmail.com>
wrote:

> Hi Sarvana,
>
> I'm not reviewing patches 1-5 in any detail, given my reply to patch 0.
>
> But I had already skimmed through this patch before I received the
> email for patch 0, so I want to make one generic comment below,
> to give some feedback as you continue thinking through possible
> implementations to solve the underlying problems.
>

Appreciate the feedback Frank!


>
>
> On 5/23/19 6:01 PM, Saravana Kannan wrote:
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
> >       return dev->of_node == data;
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
> >       struct device *dev;
> >
> > -     dev = bus_find_device(&platform_bus_type, NULL, np,
> of_dev_node_match);
> > +     /*
> > +      * Spinlock needed to make sure np->dev doesn't get freed between
> NULL
> > +      * check inside and kref count increment inside get_device(). This
> is
> > +      * achieved by grabbing the spinlock before setting np->dev = NULL
> in
> > +      * of_platform_device_destroy().
> > +      */
> > +     spin_lock(&of_dev_lock);
> > +     dev = get_device(np->dev);
> > +     spin_unlock(&of_dev_lock);
> > +     if (!dev)
> > +             dev = bus_find_device(&platform_bus_type, NULL, np,
> > +                                   of_dev_node_match);
> >       return dev ? to_platform_device(dev) : NULL;
> >  }
> >  EXPORT_SYMBOL(of_find_device_by_node);
> > @@ -196,6 +209,7 @@ static struct platform_device
> *of_platform_device_create_pdata(
> >               platform_device_put(dev);
> >               goto err_clear_flag;
> >       }
> > +     np->dev = &dev->dev;
> >
> >       return dev;
> >
> > @@ -556,6 +570,10 @@ int of_platform_device_destroy(struct device *dev,
> void *data)
> >       if (of_node_check_flag(dev->of_node, OF_POPULATED_BUS))
> >               device_for_each_child(dev, NULL,
> of_platform_device_destroy);
> >
> > +     /* Spinlock is needed for of_find_device_by_node() to work */
> > +     spin_lock(&of_dev_lock);
> > +     dev->of_node->dev = NULL;
> > +     spin_unlock(&of_dev_lock);
> >       of_node_clear_flag(dev->of_node, OF_POPULATED);
> >       of_node_clear_flag(dev->of_node, OF_POPULATED_BUS);
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
> >       const char *name;
> >       phandle phandle;
> > @@ -68,6 +70,7 @@ struct device_node {
> >       unsigned int unique_id;
> >       struct of_irq_controller *irq_trans;
> >  #endif
> > +     struct device *dev;             /* Device created from this node */
>
> We have actively been working on shrinking the size of struct device_node,
> as part of reducing the devicetree memory usage.

As such, we need strong
> justification for adding anything to this struct.  For example, proof that
> there is a performance problem that can only be solved by increasing the
> memory usage.
>
>
I didn't mean for people to focus on the deferred probe optimization. In
reality that was just a added side benefit of this series. The main problem
to solve is that of suppliers having to know when all their consumers are
up and managing the resources actively, especially in a system with
loadable modules where we can't depend on the driver to notify the supplier
because the consumer driver module might not be available or loaded until
much later.

Having said that, I'm not saying we should go around and waste space
willy-nilly. But, isn't the memory usage going to increase based on the
number of DT nodes present in DT? I'd think as the number of DT nodes
increase it's more likely for those devices have more memory? So at least
in this specific case I think adding the field is justified.

Also, right now the look up is O(n) complexity and if we are trying to add
device links to most of the devices, that whole process becomes O(n^2).
Having this field makes the look up a O(1) and the entire linking process a
O(n) process. I think the memory usage increase is worth the efficiency
improvement.

And if people are still strongly against it, we could make this a config
option.

-Saravana

--000000000000ea842c0589a63665
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 24, 2019 at 10:56 AM Fran=
k Rowand &lt;<a href=3D"mailto:frowand.list@gmail.com">frowand.list@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Hi Sarvana,<br>
<br>
I&#39;m not reviewing patches 1-5 in any detail, given my reply to patch 0.=
<br>
<br>
But I had already skimmed through this patch before I received the<br>
email for patch 0, so I want to make one generic comment below,<br>
to give some feedback as you continue thinking through possible<br>
implementations to solve the underlying problems.<br></blockquote><div><br>=
</div><div>Appreciate the feedback Frank!</div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
<br>
<br>
On 5/23/19 6:01 PM, Saravana Kannan wrote:<br>
&gt; Add a pointer from device tree node to the device created from it.<br>
&gt; This allows us to find the device corresponding to a device tree node<=
br>
&gt; without having to loop through all the platform devices.<br>
&gt; <br>
&gt; However, fallback to looping through the platform devices to handle<br=
>
&gt; any devices that might set their own of_node.<br>
&gt; <br>
&gt; Signed-off-by: Saravana Kannan &lt;<a href=3D"mailto:saravanak@google.=
com" target=3D"_blank">saravanak@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/of/platform.c | 20 +++++++++++++++++++-<br>
&gt;=C2=A0 include/linux/of.h=C2=A0 =C2=A0 |=C2=A0 3 +++<br>
&gt;=C2=A0 2 files changed, 22 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/drivers/of/platform.c b/drivers/of/platform.c<br>
&gt; index 04ad312fd85b..1115a8d80a33 100644<br>
&gt; --- a/drivers/of/platform.c<br>
&gt; +++ b/drivers/of/platform.c<br>
&gt; @@ -42,6 +42,8 @@ static int of_dev_node_match(struct device *dev, voi=
d *data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return dev-&gt;of_node =3D=3D data;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +static DEFINE_SPINLOCK(of_dev_lock);<br>
&gt; +<br>
&gt;=C2=A0 /**<br>
&gt;=C2=A0 =C2=A0* of_find_device_by_node - Find the platform_device associ=
ated with a node<br>
&gt;=C2=A0 =C2=A0* @np: Pointer to device tree node<br>
&gt; @@ -55,7 +57,18 @@ struct platform_device *of_find_device_by_node(stru=
ct device_node *np)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0dev =3D bus_find_device(&amp;platform_bus_type, N=
ULL, np, of_dev_node_match);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Spinlock needed to make sure np-&gt;dev doesn&=
#39;t get freed between NULL<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * check inside and kref count increment inside g=
et_device(). This is<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * achieved by grabbing the spinlock before setti=
ng np-&gt;dev =3D NULL in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * of_platform_device_destroy().<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spin_lock(&amp;of_dev_lock);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev =3D get_device(np-&gt;dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spin_unlock(&amp;of_dev_lock);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!dev)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev =3D bus_find_devi=
ce(&amp;platform_bus_type, NULL, np,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of_dev_node_match);=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return dev ? to_platform_device(dev) : NULL;=
<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 EXPORT_SYMBOL(of_find_device_by_node);<br>
&gt; @@ -196,6 +209,7 @@ static struct platform_device *of_platform_device_=
create_pdata(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0platform_device_=
put(dev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_clear_f=
lag;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0np-&gt;dev =3D &amp;dev-&gt;dev;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return dev;<br>
&gt;=C2=A0 <br>
&gt; @@ -556,6 +570,10 @@ int of_platform_device_destroy(struct device *dev=
, void *data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (of_node_check_flag(dev-&gt;of_node, OF_P=
OPULATED_BUS))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0device_for_each_=
child(dev, NULL, of_platform_device_destroy);<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Spinlock is needed for of_find_device_by_node(=
) to work */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spin_lock(&amp;of_dev_lock);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev-&gt;of_node-&gt;dev =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spin_unlock(&amp;of_dev_lock);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_clear_flag(dev-&gt;of_node, OF_POPUL=
ATED);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_clear_flag(dev-&gt;of_node, OF_POPUL=
ATED_BUS);<br>
&gt;=C2=A0 <br>
&gt; diff --git a/include/linux/of.h b/include/linux/of.h<br>
&gt; index 0cf857012f11..f2b4912cbca1 100644<br>
&gt; --- a/include/linux/of.h<br>
&gt; +++ b/include/linux/of.h<br>
&gt; @@ -48,6 +48,8 @@ struct property {<br>
&gt;=C2=A0 struct of_irq_controller;<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 <br>
&gt; +struct device;<br>
&gt; +<br>
&gt;=C2=A0 struct device_node {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *name;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0phandle phandle;<br>
&gt; @@ -68,6 +70,7 @@ struct device_node {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int unique_id;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct of_irq_controller *irq_trans;<br>
&gt;=C2=A0 #endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device *dev;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0/* Device created from this node */<br>
<br>
We have actively been working on shrinking the size of struct device_node,<=
br>
as part of reducing the devicetree memory usage.</blockquote><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">As such, we need strong<br>
justification for adding anything to this struct.=C2=A0 For example, proof =
that<br>
there is a performance problem that can only be solved by increasing the<br=
>
memory usage.<br><br></blockquote><div><br></div><div>I didn&#39;t mean for=
 people to focus on the deferred probe optimization. In reality that was ju=
st a added=C2=A0side benefit of this series. The main problem to solve is t=
hat of suppliers having to know when all their consumers are up and managin=
g the resources actively, especially in a system with loadable modules wher=
e we can&#39;t depend on the driver to notify the supplier because the cons=
umer driver module might not be available or loaded until much later.</div>=
<div><br></div><div>Having said that, I&#39;m not saying we should go aroun=
d and waste space willy-nilly. But, isn&#39;t the memory usage going to inc=
rease based on the number of DT nodes present in DT? I&#39;d think as the n=
umber of DT nodes increase it&#39;s more likely for those devices have more=
 memory? So at least in this specific case I think adding the field is just=
ified.</div><div><br></div><div>Also, right now the look up is O(n) complex=
ity and if we are trying to add device links to most of the devices, that w=
hole process becomes O(n^2). Having this field makes the look up a O(1) and=
 the entire linking process a O(n) process. I think the memory usage increa=
se is worth the efficiency improvement.</div><div><br></div><div>And if peo=
ple are still strongly against it, we could make this a config option.</div=
><div><br></div><div>-Saravana</div></div></div>

--000000000000ea842c0589a63665--
