From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: Re: [PATCH 2/2] arm: dts: sun8i: reuse the uart1
 node of iNet D978 rev2 board
Date: Fri, 09 Dec 2016 19:42:15 +0800
Message-ID: <20161213233646.agnmUDHf@smtp2h.mail.yandex.net>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBZNXYHBAKGQEDA3Y22I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


2016=E5=B9=B412=E6=9C=889=E6=97=A5 =E4=B8=8B=E5=8D=884:11=E4=BA=8E Maxime R=
ipard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Dec 05, 2016 at 05:03:35PM +0800, Icenowy Zheng wrote:=20
> >=20
> > 2016=E5=B9=B412=E6=9C=885=E6=97=A5 16:50=E4=BA=8E Maxime Ripard <maxime=
.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>=E5=86=99=E9=81=93=EF=BC=9A=20
> > >=20
> > > On Fri, Dec 02, 2016 at 11:19:13PM +0800, Icenowy Zheng wrote:=20
> > > > As a uart1 node is added into sun8i-reference-design-tablet.dtsi, s=
imply=20
> > > > use it in iNet D978 rev2 device tree.=20
> > > >=20
> > > > Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>=20
> > >=20
> > > I'd like to see more consolidation before that change is needed. If w=
e=20
> > > find more boards using that, it will make sense, but for a single=20
> > > board it's not worth it.=20
> >=20
> > At least 2~3 Q8 A33 tablets in #linux-sunxi are found to have=20
> > rtl8703as, which contains UART bluetooth. (including mine)=20
>
> Still, I'm not fond of creating a default on such a low count sample=20
> of (out-of-tree) DTs. Support and enable the bluetooth on more boards,=20
> and then consolidate.=20
>
> > In fact, what I want to do is to get the node ready-to-be-okay in Q8=20
> > dts, so it can be enabled by either u-boot command or (theortically)=20
> > Hans de Goede's q8-hardwaremgr, just like what is done at=20
> > touchscreen node.=20
>
> If your plan is to enable all the combinations possible accross the Q8=20
> tablets and let the bootloader/user figure it all out, then it's not=20
> going to happen, sorry.=20

This wire is in the A23/33 tablet reference design schemetics.

>
> Maxime=20
>
> --=20
> Maxime Ripard, Free Electrons=20
> Embedded Linux and Kernel engineering=20
> http://free-electrons.com=20
>
> --=20
> You received this message because you are subscribed to the Google Groups=
 "linux-sunxi" group.=20
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org=20
> For more options, visit https://groups.google.com/d/optout.=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
