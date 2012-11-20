From: Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 3/8] watchdog: orion_wdt: add timeout-sec property
 binding
Date: Tue, 20 Nov 2012 13:46:47 +0100
Message-ID: <CAHkwnC--c91nnjSkRgRdoeqv=rFPfNsHs8jnRG_LZLJWGRLH0w@mail.gmail.com>
References: <1353334243-16703-1-git-send-email-fabio.porcedda@gmail.com>
 <1353334243-16703-4-git-send-email-fabio.porcedda@gmail.com>
 <20121119160643.GI22106@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2881002188124263362=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121119160643.GI22106-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
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
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============2881002188124263362==
Content-Type: multipart/alternative; boundary=e89a8fb1f84abbb61204ceeca125

--e89a8fb1f84abbb61204ceeca125
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 19, 2012 at 5:06 PM, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> wrote:

> On Mon, Nov 19, 2012 at 03:10:38PM +0100, Fabio Porcedda wrote:
> > Only compile tested.
> >
> > Signed-off-by: Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
> > Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/watchdog/marvel.txt | 5 +++++
> >  drivers/watchdog/orion_wdt.c                          | 8 +++-----
> >  2 files changed, 8 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/watchdog/marvel.txt
> b/Documentation/devicetree/bindings/watchdog/marvel.txt
> > index 0b2503a..5dc8d30 100644
> > --- a/Documentation/devicetree/bindings/watchdog/marvel.txt
> > +++ b/Documentation/devicetree/bindings/watchdog/marvel.txt
> > @@ -5,10 +5,15 @@ Required Properties:
> >  - Compatibility : "marvell,orion-wdt"
> >  - reg                : Address of the timer registers
> >
> > +Optional properties:
> > +
> > +- timeout-sec        : Contains the watchdog timeout in seconds
> > +
> >  Example:
> >
> >       wdt@20300 {
> >               compatible =3D "marvell,orion-wdt";
> >               reg =3D <0x20300 0x28>;
> > +             timeout-sec =3D <10>;
> >               status =3D "okay";
> >       };
> > diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.=
c
> > index c20f96b..446a3e9 100644
> > --- a/drivers/watchdog/orion_wdt.c
> > +++ b/drivers/watchdog/orion_wdt.c
> > @@ -162,12 +162,10 @@ static int __devinit orion_wdt_probe(struct
> platform_device *pdev)
> >
> >       wdt_max_duration =3D WDT_MAX_CYCLE_COUNT / wdt_tclk;
> >
> > -     if ((heartbeat < 1) || (heartbeat > wdt_max_duration))
> > -             heartbeat =3D wdt_max_duration;
> > -
> > -     orion_wdt.timeout =3D heartbeat;
> >       orion_wdt.min_timeout =3D 1;
> > +     orion_wdt.timeout =3D wdt_max_duration;
> >       orion_wdt.max_timeout =3D wdt_max_duration;
> > +     watchdog_init_timeout(&orion_wdt, heartbeat, pdev->dev.of_node);
>
> Hi Fabio,
>
> There are many boards using pdata, !CONFIG_OF.  Have you compile-tested
> this without CONFIG_OF?
>

Hi Jason,



> thx,
>
> Jason.
>
> >
> >       watchdog_set_nowayout(&orion_wdt, nowayout);
> >       ret =3D watchdog_register_device(&orion_wdt);
> > @@ -177,7 +175,7 @@ static int __devinit orion_wdt_probe(struct
> platform_device *pdev)
> >       }
> >
> >       pr_info("Initial timeout %d sec%s\n",
> > -             heartbeat, nowayout ? ", nowayout" : "");
> > +             orion_wdt.timeout, nowayout ? ", nowayout" : "");
> >       return 0;
> >  }
> >
> > --
> > 1.8.0
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>

I've tested with and without the CONFIG_OF define.

The first time I=92ve used the kirkwood_defconfig without modifications,
the second time I=92ve enabled only the CONFIG_MACH_SHEEVAPLUG and disabled
USE_OF.

In both cases the orion_wdt driver compile without any warning.

Thanks for the review.

Best regards
--=20
Fabio Porcedda

--e89a8fb1f84abbb61204ceeca125
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_extra"><div class=3D"gmail_quote">On Mon, Nov 19, 2012 =
at 5:06 PM, Jason Cooper <span dir=3D"ltr">&lt;<a href=3D"mailto:jason@lake=
daemon.net" target=3D"_blank">jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">

<div class=3D""><div class=3D"h5">On Mon, Nov 19, 2012 at 03:10:38PM +0100,=
 Fabio Porcedda wrote:<br>
&gt; Only compile tested.<br>
&gt;<br>
&gt; Signed-off-by: Fabio Porcedda &lt;<a href=3D"mailto:fabio.porcedda@gma=
il.com">fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;<br>
&gt; Cc: Jason Cooper &lt;<a href=3D"mailto:jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org">jason@lak=
edaemon.net</a>&gt;<br>
&gt; Cc: Andrew Lunn &lt;<a href=3D"mailto:andrew-g2DYL2Zd6BY@public.gmane.org">andrew-g2DYL2Zd6BY@public.gmane.org</=
a>&gt;<br>
&gt; ---<br>
&gt; =A0Documentation/devicetree/bindings/watchdog/marvel.txt | 5 +++++<br>
&gt; =A0drivers/watchdog/orion_wdt.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0| 8 +++-----<br>
&gt; =A02 files changed, 8 insertions(+), 5 deletions(-)<br>
&gt;<br>
&gt; diff --git a/Documentation/devicetree/bindings/watchdog/marvel.txt b/D=
ocumentation/devicetree/bindings/watchdog/marvel.txt<br>
&gt; index 0b2503a..5dc8d30 100644<br>
&gt; --- a/Documentation/devicetree/bindings/watchdog/marvel.txt<br>
&gt; +++ b/Documentation/devicetree/bindings/watchdog/marvel.txt<br>
&gt; @@ -5,10 +5,15 @@ Required Properties:<br>
&gt; =A0- Compatibility : &quot;marvell,orion-wdt&quot;<br>
&gt; =A0- reg =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0: Address of the timer registe=
rs<br>
&gt;<br>
&gt; +Optional properties:<br>
&gt; +<br>
&gt; +- timeout-sec =A0 =A0 =A0 =A0: Contains the watchdog timeout in secon=
ds<br>
&gt; +<br>
&gt; =A0Example:<br>
&gt;<br>
&gt; =A0 =A0 =A0 wdt@20300 {<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D &quot;marvell,orion-wdt&quo=
t;;<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D &lt;0x20300 0x28&gt;;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 timeout-sec =3D &lt;10&gt;;<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 status =3D &quot;okay&quot;;<br>
&gt; =A0 =A0 =A0 };<br>
&gt; diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt=
.c<br>
&gt; index c20f96b..446a3e9 100644<br>
&gt; --- a/drivers/watchdog/orion_wdt.c<br>
&gt; +++ b/drivers/watchdog/orion_wdt.c<br>
&gt; @@ -162,12 +162,10 @@ static int __devinit orion_wdt_probe(struct plat=
form_device *pdev)<br>
&gt;<br>
&gt; =A0 =A0 =A0 wdt_max_duration =3D WDT_MAX_CYCLE_COUNT / wdt_tclk;<br>
&gt;<br>
&gt; - =A0 =A0 if ((heartbeat &lt; 1) || (heartbeat &gt; wdt_max_duration))=
<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 heartbeat =3D wdt_max_duration;<br>
&gt; -<br>
&gt; - =A0 =A0 orion_wdt.timeout =3D heartbeat;<br>
&gt; =A0 =A0 =A0 orion_wdt.min_timeout =3D 1;<br>
&gt; + =A0 =A0 orion_wdt.timeout =3D wdt_max_duration;<br>
&gt; =A0 =A0 =A0 orion_wdt.max_timeout =3D wdt_max_duration;<br>
&gt; + =A0 =A0 watchdog_init_timeout(&amp;orion_wdt, heartbeat, pdev-&gt;de=
v.of_node);<br>
<br>
</div></div>Hi Fabio,<br>
<br>
There are many boards using pdata, !CONFIG_OF. =A0Have you compile-tested<b=
r>
this without CONFIG_OF?<br></blockquote><div><br>Hi Jason,<br><br>=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
thx,<br>
<br>
Jason.<br>
<div class=3D"im"><br>
&gt;<br>
&gt; =A0 =A0 =A0 watchdog_set_nowayout(&amp;orion_wdt, nowayout);<br>
&gt; =A0 =A0 =A0 ret =3D watchdog_register_device(&amp;orion_wdt);<br>
&gt; @@ -177,7 +175,7 @@ static int __devinit orion_wdt_probe(struct platfo=
rm_device *pdev)<br>
&gt; =A0 =A0 =A0 }<br>
&gt;<br>
&gt; =A0 =A0 =A0 pr_info(&quot;Initial timeout %d sec%s\n&quot;,<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 heartbeat, nowayout ? &quot;, nowayout&quot;=
 : &quot;&quot;);<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 orion_wdt.timeout, nowayout ? &quot;, nowayo=
ut&quot; : &quot;&quot;);<br>
&gt; =A0 =A0 =A0 return 0;<br>
&gt; =A0}<br>
&gt;<br>
&gt; --<br>
&gt; 1.8.0<br>
&gt;<br>
&gt;<br>
</div>&gt; _______________________________________________<br>
&gt; linux-arm-kernel mailing list<br>
&gt; <a href=3D"mailto:linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org">linux-arm-kern=
el-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org</a><br>
&gt; <a href=3D"http://lists.infradead.org/mailman/listinfo/linux-arm-kerne=
l" target=3D"_blank">http://lists.infradead.org/mailman/listinfo/linux-arm-=
kernel</a><br>
</blockquote></div><br>I&#39;ve tested with and without the CONFIG_OF defin=
e.<br><br>The first time I=92ve used the kirkwood_defconfig without modific=
ations,<br>the second time I=92ve enabled only the CONFIG_MACH_SHEEVAPLUG a=
nd disabled USE_OF.<br clear=3D"all">

<br>In both cases the orion_wdt driver compile without any warning.<br><br>=
Thanks for the review.<br><br>Best regards<br>-- <br>Fabio Porcedda<br><br>
</div>

--e89a8fb1f84abbb61204ceeca125--

--===============2881002188124263362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2881002188124263362==--
