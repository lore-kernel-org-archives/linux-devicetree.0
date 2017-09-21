Return-Path: <SRS0=sIrt=AW=google.com=wak@kernel.org>
MIME-Version: 1.0
References: <20170905202339.20732-1-wak@google.com> <20170921095930.4b473f91@bbrezillon>
In-Reply-To: <20170921095930.4b473f91@bbrezillon>
From: William Kennington <wak@google.com>
Date: Thu, 21 Sep 2017 19:15:13 +0000
Message-ID: <CAPnigKmBujCoKdtXwnK6YsU=YvXM+MaDvDvKpUXEVgHzOC-VEw@mail.gmail.com>
Subject: Re: [PATCH] mtd: powernv: Support MTD_NO_ERASE
Content-Type: multipart/alternative; boundary="001a1141ad8418d9150559b7eac4"
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Cyril Bur <cyrilbur@gmail.com>, mpe@ellerman.id.au
List-ID: <devicetree@vger.kernel.org>

--001a1141ad8418d9150559b7eac4
Content-Type: text/plain; charset="UTF-8"

+Cyril Bur and

Not sure what you mean by mainline, but the commit is in the master branch
at
https://github.com/open-power/skiboot/commit/ba99af9b149d02438347b055e6e7d6bd15e33551

I'm unsure about the documentation of the properties as I'm not really the
maintainer of any of the code on either side. I just added this DT property
for plumbing through the NO_ERASE flag. I added Cyril and Michael as they
both work closely with this driver and could comment better than I could.

- William

On Thu, Sep 21, 2017 at 12:59 AM Boris Brezillon <
boris.brezillon@free-electrons.com> wrote:

> +the DT maintainers
>
> On Tue,  5 Sep 2017 13:23:39 -0700
> "William A. Kennington III" <wak@google.com> wrote:
>
> > As of skiboot@ba99af9b149d02438347b055e6e7d6bd15e33551, we now support
>
> I didn't find this commit in mainline.
>
> > adding a device tree entry which marks a flash device as not needing
> > erase. This patch adds support for setting MTD_NO_ERASE on powernvflash
> > devices which have the property no-erase.
> >
> > Signed-off-by: William A. Kennington III <wak@google.com>
> > ---
> >  drivers/mtd/devices/powernv_flash.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/mtd/devices/powernv_flash.c
> b/drivers/mtd/devices/powernv_flash.c
> > index f5396f26ddb4..fab9f9121b4c 100644
> > --- a/drivers/mtd/devices/powernv_flash.c
> > +++ b/drivers/mtd/devices/powernv_flash.c
> > @@ -196,6 +196,8 @@ static int powernv_flash_set_driver_info(struct
> device *dev,
> >       mtd->name = of_get_property(dev->of_node, "name", NULL);
> >       mtd->type = MTD_NORFLASH;
> >       mtd->flags = MTD_WRITEABLE;
> > +     if (of_property_read_bool(dev->of_node, "no-erase"))
> > +             mtd->flags |= MTD_NO_ERASE;
>
> I don't see this property document in a DT binding doc, which is
> mandatory. Actually, there's no DT bindings doc at all for the
> 'ibm,opal-flash' device in mainline, is this normal?
>
> >       mtd->size = size;
> >       mtd->erasesize = erase_size;
> >       mtd->writebufsize = mtd->writesize = 1;
>
>

--001a1141ad8418d9150559b7eac4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">+Cyril Bur and=C2=A0<div><br></div><div>Not sure what you =
mean by mainline, but the commit is in the master branch at</div><div><a hr=
ef=3D"https://github.com/open-power/skiboot/commit/ba99af9b149d02438347b055=
e6e7d6bd15e33551" target=3D"_blank">https://github.com/open-power/skiboot/c=
ommit/ba99af9b149d02438347b055e6e7d6bd15e33551</a><br></div><div><br></div>=
<div>I&#39;m unsure about the documentation of the properties as I&#39;m no=
t really the maintainer of any of the code on either side. I just added thi=
s DT property for plumbing through the NO_ERASE flag. I added Cyril and Mic=
hael as they both work closely with this driver and could comment better th=
an I could.</div><div><br></div><div>- William</div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr">On Thu, Sep 21, 2017 at 12:59 AM Boris Brezillon &=
lt;<a href=3D"mailto:boris.brezillon@free-electrons.com" target=3D"_blank">=
boris.brezillon@free-electrons.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">+the DT maintainers<br>
<br>
On Tue,=C2=A0 5 Sep 2017 13:23:39 -0700<br>
&quot;William A. Kennington III&quot; &lt;<a href=3D"mailto:wak@google.com"=
 target=3D"_blank">wak@google.com</a>&gt; wrote:<br>
<br>
&gt; As of skiboot@ba99af9b149d02438347b055e6e7d6bd15e33551, we now support=
<br>
<br>
I didn&#39;t find this commit in mainline.<br>
<br>
&gt; adding a device tree entry which marks a flash device as not needing<b=
r>
&gt; erase. This patch adds support for setting MTD_NO_ERASE on powernvflas=
h<br>
&gt; devices which have the property no-erase.<br>
&gt;<br>
&gt; Signed-off-by: William A. Kennington III &lt;<a href=3D"mailto:wak@goo=
gle.com" target=3D"_blank">wak@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/mtd/devices/powernv_flash.c | 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt;<br>
&gt; diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices=
/powernv_flash.c<br>
&gt; index f5396f26ddb4..fab9f9121b4c 100644<br>
&gt; --- a/drivers/mtd/devices/powernv_flash.c<br>
&gt; +++ b/drivers/mtd/devices/powernv_flash.c<br>
&gt; @@ -196,6 +196,8 @@ static int powernv_flash_set_driver_info(struct de=
vice *dev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mtd-&gt;name =3D of_get_property(dev-&gt;of_=
node, &quot;name&quot;, NULL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mtd-&gt;type =3D MTD_NORFLASH;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mtd-&gt;flags =3D MTD_WRITEABLE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (of_property_read_bool(dev-&gt;of_node, &quot;=
no-erase&quot;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mtd-&gt;flags |=3D MT=
D_NO_ERASE;<br>
<br>
I don&#39;t see this property document in a DT binding doc, which is<br>
mandatory. Actually, there&#39;s no DT bindings doc at all for the<br>
&#39;ibm,opal-flash&#39; device in mainline, is this normal?<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mtd-&gt;size =3D size;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mtd-&gt;erasesize =3D erase_size;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mtd-&gt;writebufsize =3D mtd-&gt;writesize =
=3D 1;<br>
<br>
</blockquote></div></div>

--001a1141ad8418d9150559b7eac4--
