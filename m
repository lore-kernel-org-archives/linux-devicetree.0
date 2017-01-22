From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: Re: [PATCH 1/4] phy: sun4i-usb: support PHY0 on H3
 in MUSB mode
Date: Sun, 22 Jan 2017 18:24:04 +0800
Message-ID: <20170122132452.Oi5qiTSF@smtp1m.mail.yandex.net>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBB7EQSLCAKGQE55KKORI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


2017=E5=B9=B41=E6=9C=8822=E6=97=A5 17:58=E4=BA=8E Hans de Goede <hdegoede@r=
edhat.com>=E5=86=99=E9=81=93=EF=BC=9A
>
> HI,=20
>
> On 22-01-17 10:39, Icenowy Zheng wrote:=20
> >=20
> >=20
> > 20.01.2017, 16:04, "Hans de Goede" <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>:=20
> >> HI,=20
> >>=20
> >> On 19-01-17 21:27, Karsten Merker wrote:=20
> >>>=C2=A0 On Thu, Jan 19, 2017 at 11:10:08PM +0800, Icenowy Zheng wrote:=
=20
> >>>>=C2=A0 19.01.2017, 22:34, "Maxime Ripard" <maxime.ripard@free-electro=
ns.com>:=20
> >>>>>=C2=A0 On Wed, Jan 18, 2017 at 04:09:32AM +0800, Chen-Yu Tsai wrote:=
=20
> >>>>>>=C2=A0=C2=A0 On Wed, Jan 18, 2017 at 4:06 AM, Maxime Ripard=20
> >>>>>>=C2=A0=C2=A0 <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:=20
> >>>>>>=C2=A0=C2=A0 > On Wed, Jan 18, 2017 at 12:57:08AM +0800, Icenowy Zh=
eng wrote:=20
> >>>>>>=C2=A0=C2=A0 >> 17.01.2017, 16:06, "Maxime Ripard" <maxime.ripard@f=
ree-electrons.com>:=20
> >>>>>>=C2=A0=C2=A0 >> > On Tue, Jan 17, 2017 at 03:14:46AM +0800, Icenowy=
 Zheng wrote:=20
> >>>>>>=C2=A0=C2=A0 >> >> The PHY0 on H3 can be wired either to MUSB contr=
oller or OHCI/EHCI=20
> >>>>>>=C2=A0=C2=A0 >> >> controller.=20
> >>>>>>=C2=A0=C2=A0 >> >>=20
> >>>>>>=C2=A0=C2=A0 >> >> The original driver wired it to OHCI/EHCI contro=
ller; however, as the=20
> >>>>>>=C2=A0=C2=A0 >> >> code to use PHY0 as OHCI/EHCI is missing, it mak=
es the PHY fully=20
> >>>>>>=C2=A0=C2=A0 >> >> unusable.=20
> >>>>>>=C2=A0=C2=A0 >> >>=20
> >>>>>>=C2=A0=C2=A0 >> >> Rename the register (according to its function a=
nd the name in BSP=20
> >>>>>>=C2=A0=C2=A0 >> >> driver), and remove the code which wires the PHY=
0 to OHCI/EHCI, as MUSB=20
> >>>>>>=C2=A0=C2=A0 >> >> can support both peripheral and host mode (altho=
ugh the host mode of=20
> >>>>>>=C2=A0=C2=A0 >> >> MUSB is buggy).=20
> >>>>>>=C2=A0=C2=A0 >> >=20
> >>>>>>=C2=A0=C2=A0 >> > Can you elaborate on that? What's wrong with it?=
=20
> >>>>>>=C2=A0=C2=A0 >>=20
> >>>>>>=C2=A0=C2=A0 >> The configuration is at bit 0 of register 0x20 in P=
HY.=20
> >>>>>>=C2=A0=C2=A0 >>=20
> >>>>>>=C2=A0=C2=A0 >> When the PHY is reseted, it defaults as MUSB mode.=
=20
> >>>>>>=C2=A0=C2=A0 >>=20
> >>>>>>=C2=A0=C2=A0 >> However, the original author of the H3 PHY code see=
ms to be lack of=20
> >>>>>>=C2=A0=C2=A0 >> this knowledge (He named it PHY_UNK_H3), and change=
d the PHY to HCI=20
> >>>>>>=C2=A0=C2=A0 >> mode.=20
> >>>>>>=C2=A0=C2=A0 >>=20
> >>>>>>=C2=A0=C2=A0 >> I just removed the code that wires it to HCI mode, =
thus it will work=20
> >>>>>>=C2=A0=C2=A0 >> in MUSB mode, with my sun8i-h3-musb patch.=20
> >>>>>>=C2=A0=C2=A0 >=20
> >>>>>>=C2=A0=C2=A0 > I have no idea what you mean by MUSB mode.=20
> >>>>>>=C2=A0=C2=A0 >=20
> >>>>>>=C2=A0=C2=A0 > Do you mean that the previous code was only working =
in host mode, and=20
> >>>>>>=C2=A0=C2=A0 > now it only works in peripheral?=20
> >>>>>>=20
> >>>>>>=C2=A0=C2=A0 From what I understand, with the H3, Allwinner has put=
 a mux=20
> >>>>>>=C2=A0=C2=A0 in front of the MUSB controller. The mux can send the =
USB data=20
> >>>>>>=C2=A0=C2=A0 to/from the MUSB controller, or a standard EHCI/OHCI p=
air.=20
> >>>>>>=C2=A0=C2=A0 This register controls said mux.=20
> >>>>>>=20
> >>>>>>=C2=A0=C2=A0 This means we can use a proper USB host for host mode,=
=20
> >>>>>>=C2=A0=C2=A0 instead of the limited support in MUSB.=20
> >>>>>=20
> >>>>>=C2=A0 But musb can still operate as a host, right?=20
> >>>>=20
> >>>>=C2=A0 Yes!=20
> >>>=20
> >>>=C2=A0 Hello,=20
> >>>=20
> >>>=C2=A0 I don't know how the MUSB implementation in the H3 behaves as I=
=20
> >>>=C2=A0 don't have any H3-based systems, but if it should happen to be=
=20
> >>>=C2=A0 similar to the one in the A31s, it probably isn't a full-fledge=
d=20
> >>>=C2=A0 alternative to using an OHCI/EHCI controller.=20
> >>=20
> >> You right it isn't which is why I suggested that the phy-sun4i-usb=20
> >> code should set the mux to the OCHI/EHCI pair when the id pin=20
> >> is pulled low (host-mode).=20
> >>=20
> >>>=C2=A0 From my practical experiments with the MUSB in the A31s in host=
=20
> >>>=C2=A0 mode I can report that I hadn't been able to get multiple HIDs=
=20
> >>>=C2=A0 (in my case keyboard and mouse) working at the same time. The=
=20
> >>>=C2=A0 keyboard alone worked without problems, the mouse alone worked=
=20
> >>>=C2=A0 without problems, but when both were connected, only one of the=
m=20
> >>>=C2=A0 worked.=20
> >>>=20
> >>>=C2=A0 I had at that time talked to Hans de Goede about the problem an=
d=20
> >>>=C2=A0 if I remenber correctly, he had mentioned that the MUSB has=20
> >>>=C2=A0 problems servicing more than one device that does interrupt=20
> >>>=C2=A0 transfers (as HIDs do).=20
> >>>=20
> >>>=C2=A0 Hans, can you perhaps shed some light on this?=20
> >>=20
> >> Everything you've said is correct, the MUSB can emulate a=20
> >> host-controller, but it is not really one and when possible=20
> >> should not be used as such.=20
> >=20
> > But implement proper EHCI/OHCI pair and MUSB coexistence needs=20
> > a lot of code=20
>
> No it doesn't see the previous thread on this I give an example=20
> of how this can be implemented there, and it is not a lot of=20
> work, it just requires someone to do it.=20
>

However, currently dr_mode is specified in musb, and it's musb that is resp=
onsible for changing the mode (PHY driver only detects ID pin).

> > and MUSB can still work.=20
> >=20
> > We can now just enable MUSB, then after the coexistence is done,=20
> > switch to use MUSB for peripheral and {E,O}HCI for host.=20
>
> I'm not in favor of these kinda hacks, we are creating expectations=20
> of how things work then only to change them later with a possible=20
> risk of regression things for some users / use-cases. Lets do=20
> this the right way in one go please.=20

As we should move dr_mode to phy node, we can
just let phy behave like a musb-only phy if such a dr_mode is not specified=
.


And this patch just makes the phy behave in a way
like the phy in the old SoCs, not a hack.

>
> > Seems that SoCs after sun8iw7 (H3) all have this feature. (At least=20
> > I verified it on H3, V3s, A64, H5)=20
> >=20
> > P.S. The implementation on FreeBSD of A64 PHY uses a dedicated=20
> > PHY number for the HCI pair, which seems to break the DT compatibility=
=20
> > between Linux and FreeBSD.=20
>
> That is unfortunate and also weird since AFAICT there is only=20
> one phy and it is the phy data lines which get muxed not the=20
> physical phy. Anyways can you contact them and ask them to=20
> please not do that ?=20
>
> Regards,=20
>
> Hans=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
