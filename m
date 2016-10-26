From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH RESEND 1/2] dt: bindings: add
 allwinner,otg-routed property for phy-sun4i-usb
Date: Wed, 26 Oct 2016 16:52:43 +0800
Message-ID: <4534561477471963@web8g.yandex.ru>
References: <20161025041139.46454-1-icenowy@aosc.xyz> <55fe59fc-6e93-d519-2d7c-264c48820fc4@redhat.com>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBXW5YHAAKGQERLMZRYA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <55fe59fc-6e93-d519-2d7c-264c48820fc4-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org



26.10.2016, 16:28, "Hans de Goede" <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>:
> Hi,
>
> On 25-10-16 06:11, Icenowy Zheng wrote:
>> =C2=A0On some newer Allwinner SoCs (H3 or A64), the PHY0 can be either r=
outed to
>> =C2=A0the MUSB controller (which is an OTG controller) or the OHCI/EHCI =
pair
>> =C2=A0(which is a Host-only controller, but more stable and easy to impl=
ement).
>>
>> =C2=A0This property marks whether on a certain board which controller sh=
ould be
>> =C2=A0attached to the PHY.
>>
>> =C2=A0Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
>
> Icenowy, I appreciate your work on this, but we really need full otg
> support with dynamic switching rather then hardwiring the routing, so
> this cannot go in as is.

Now I have both PHY0 controllers' drivers.

In the tree of https://github.com/Icenowy/linux/tree/ice-a64-v6.1 , I have =
already
enabled MUSB controller.

And this patchset is for those prefer a stable USB host implement to dual-r=
ole
implementation. MUSB is a good UDC, but not a good host controller. My USB
sound card cannot work on MUSB on A33. Even connecting a R8's MUSB (Serial
Gadget) to an A33's MUSB cannot work.

See the IRC log between Andre and me,
https://irclog.whitequark.org/linux-sunxi/2016-10-24#18012695; .

>
> NACK.
>
> Regards,
>
> Hans
>
>> =C2=A0---
>> =C2=A0=C2=A0Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt | 6 =
++++++
>> =C2=A0=C2=A01 file changed, 6 insertions(+)
>>
>> =C2=A0diff --git a/Documentation/devicetree/bindings/phy/sun4i-usb-phy.t=
xt b/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
>> =C2=A0index 287150d..a63c766 100644
>> =C2=A0--- a/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
>> =C2=A0+++ b/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
>> =C2=A0@@ -36,6 +36,12 @@ Optional properties:
>> =C2=A0=C2=A0- usb1_vbus-supply : regulator phandle for controller usb1 v=
bus
>> =C2=A0=C2=A0- usb2_vbus-supply : regulator phandle for controller usb2 v=
bus
>>
>> =C2=A0+Optional properties for H3 or A64 SoCs:
>> =C2=A0+- allwinner,otg-routed : USB0 (OTG) PHY is routed to OHCI/EHCI pa=
ir rather than
>> =C2=A0+ MUSB. (boolean, if this property is set, the OHCI/EHCI
>> =C2=A0+ controllers at PHY0 should be enabled and the MUSB
>> =C2=A0+ controller must *NOT* be enabled)
>> =C2=A0+
>> =C2=A0=C2=A0Example:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0usbphy: phy@=
0x01c13400 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#phy-cells =3D <1>;

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
