From: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: dts: sun7i: Enable touchscreen on
 Wexler TAB7200 tablet
Date: Sat, 19 Dec 2015 18:11:40 +0300
Message-ID: <CAF==cZWcY=FH9Sr8RY4j4Ob8iuiYrBGkajZDWpNQzS-t4d074Q@mail.gmail.com>
References: <1450428591-5597-1-git-send-email-mamlinav@gmail.com>
	<1450428710-5653-1-git-send-email-mamlinav@gmail.com>
	<20151218212525.GR30359@lukather>
Reply-To: mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary=001a11474aac4e43ef052741acd2
Return-path: <linux-sunxi+bncBCENVD7YAEIK3Z6VWMCRUBDRMDFG6-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20151218212525.GR30359@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--001a11474aac4e43ef052741acd2
Content-Type: text/plain; charset=UTF-8

2015-12-19 0:25 GMT+03:00 Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:

> Hi,
>
> On Fri, Dec 18, 2015 at 11:51:50AM +0300, Aleksei Mamlin wrote:
> > Add a node for the Goodix GT911 touchscreen found on the Wexler TAB7200
> tablet
> >
> > Signed-off-by: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
> b/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
> > index 239b5d2..ec3b837 100644
> > --- a/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
> > +++ b/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
> > @@ -102,6 +102,18 @@
> >       pinctrl-names = "default";
> >       pinctrl-0 = <&i2c2_pins_a>;
> >       status = "okay";
> > +
> > +     gt911: touchscreen@5d {
> > +             compatible = "goodix,gt911";
> > +             reg = <0x5d>;
> > +             interrupt-parent = <&pio>;
> > +             interrupts = <7 21 IRQ_TYPE_EDGE_FALLING>; /* EINT21
> (PH21) */
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&ts_reset_pin>;
> > +             irq-gpios = <&pio 7 21 GPIO_ACTIVE_HIGH>; /* INT (PH21) */
>
> It seems odd that you need both irq-gpios and interrupts. These two
> are completely redundant, and you should even actually use only one in
> your driver, since the second request_irq will fail.
>
>
We need both interrupts and irq-gpios because the driver uses the interrupt
gpio pin as output to reset the device. See bindings documentation [1]

[1]
https://git.kernel.org/cgit/linux/kernel/git/dtor/input.git/tree/Documentation/devicetree/bindings/input/touchscreen/goodix.txt?h=goodix


Thanks!
> Maxime
>
> --
> Maxime Ripard, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>



-- 
Thanks and regards,
Aleksei Mamlin

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--001a11474aac4e43ef052741acd2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">2015=
-12-19 0:25 GMT+03:00 Maxime Ripard <span dir=3D"ltr">&lt;<a href=3D"mailto=
:maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" target=3D"_blank">maxime.ripard@free-ele=
ctrons.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,=
204);border-left-style:solid;padding-left:1ex">Hi,<br>
<span class=3D""><br>
On Fri, Dec 18, 2015 at 11:51:50AM +0300, Aleksei Mamlin wrote:<br>
&gt; Add a node for the Goodix GT911 touchscreen found on the Wexler TAB720=
0 tablet<br>
&gt;<br>
&gt; Signed-off-by: Aleksei Mamlin &lt;<a href=3D"mailto:mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org=
">mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts | 19 ++++++++++++=
+++++++<br>
&gt;=C2=A0 1 file changed, 19 insertions(+)<br>
&gt;<br>
&gt; diff --git a/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts b/arch/arm=
/boot/dts/sun7i-a20-wexler-tab7200.dts<br>
&gt; index 239b5d2..ec3b837 100644<br>
&gt; --- a/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts<br>
&gt; +++ b/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts<br>
&gt; @@ -102,6 +102,18 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;i2c2_pins_a&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gt911: touchscreen@5d {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
goodix,gt911&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x5d&gt;;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt-parent =3D =
&lt;&amp;pio&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupts =3D &lt;7 =
21 IRQ_TYPE_EDGE_FALLING&gt;; /* EINT21 (PH21) */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &qu=
ot;default&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&am=
p;ts_reset_pin&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0irq-gpios =3D &lt;&am=
p;pio 7 21 GPIO_ACTIVE_HIGH&gt;; /* INT (PH21) */<br>
<br>
</span>It seems odd that you need both irq-gpios and interrupts. These two<=
br>
are completely redundant, and you should even actually use only one in<br>
your driver, since the second request_irq will fail.<br>
<br></blockquote><div><br></div><div>We need both interrupts and irq-gpios =
because the driver uses the interrupt</div><div>gpio pin as output to reset=
 the device. See bindings documentation [1]</div><div><br></div><div>[1] <a=
 href=3D"https://git.kernel.org/cgit/linux/kernel/git/dtor/input.git/tree/D=
ocumentation/devicetree/bindings/input/touchscreen/goodix.txt?h=3Dgoodix">h=
ttps://git.kernel.org/cgit/linux/kernel/git/dtor/input.git/tree/Documentati=
on/devicetree/bindings/input/touchscreen/goodix.txt?h=3Dgoodix</a>=C2=A0</d=
iv><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-=
left-style:solid;padding-left:1ex">
Thanks!<br>
<span class=3D""><font color=3D"#888888">Maxime<br>
<br>
--<br>
Maxime Ripard, Free Electrons<br>
Embedded Linux, Kernel and Android engineering<br>
<a href=3D"http://free-electrons.com" rel=3D"noreferrer" target=3D"_blank">=
http://free-electrons.com</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature"><div dir=3D"ltr"><div style=3D"font-family=
:arial;font-size:small"><span style=3D"font-family:Arial,Helvetica,sans-ser=
if;font-size:13px">Thanks and regards,</span><br></div><div style=3D"font-f=
amily:arial;font-size:small">Aleksei Mamlin</div></div></div>
</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--001a11474aac4e43ef052741acd2--
