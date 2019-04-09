From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 2/5] dt-bindings: phy: add binding for
 Allwinner USB3 PHY
Date: Mon, 8 Apr 2019 20:09:14 -0500
Message-ID: <CAL_JsqJMxhbvT6jv+-tsaOPq4anTjRPn0b2qVp=TF4uh6KDzNw@mail.gmail.com>
References: <20190405205736.55177-1-icenowy@aosc.io> <20190405205736.55177-3-icenowy@aosc.io>
 <20190406071402.GA6006@bogus> <B954438A-73B2-4156-81CD-197C08D0E3F5@aosc.io>
Reply-To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDJIP47K7MERBSPBV7SQKGQEDVKKW2I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <B954438A-73B2-4156-81CD-197C08D0E3F5-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Apr 6, 2019 at 2:24 AM Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
>
>
>
> =E4=BA=8E 2019=E5=B9=B44=E6=9C=886=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=883=
:14:02, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> =E5=86=99=E5=88=B0:
> >On Sat, Apr 06, 2019 at 04:57:33AM +0800, Icenowy Zheng wrote:
> >> The new Allwinner H6 SoC contains a USB3 PHY that is wired to the
> >> external USB3 pins of the SoC.
> >>
> >> Add a device tree binding for the PHY.
> >>
> >> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> >> Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> >> ---
> >> Changes in v5:
> >> - Dropped Vbus regulator and added connector subnode.
> >>
> >> Changes in v4:
> >> - Changed Vbus regulator property to vbus-supply.
> >>
> >> Changes in v3:
> >> - Added Chen-Yu's Review tag.
> >>
> >> No changes in v2, v1.
> >>
> >>  .../bindings/phy/sun50i-usb3-phy.txt          | 28
> >+++++++++++++++++++
> >>  1 file changed, 28 insertions(+)
> >>  create mode 100644
> >Documentation/devicetree/bindings/phy/sun50i-usb3-phy.txt
> >>
> >> diff --git
> >a/Documentation/devicetree/bindings/phy/sun50i-usb3-phy.txt
> >b/Documentation/devicetree/bindings/phy/sun50i-usb3-phy.txt
> >> new file mode 100644
> >> index 000000000000..eeedc53e6360
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/phy/sun50i-usb3-phy.txt
> >> @@ -0,0 +1,28 @@
> >> +Allwinner sun50i USB3 PHY
> >> +-----------------------
> >> +
> >> +Required properties:
> >> +- compatible : should be one of
> >> +  * allwinner,sun60i-h6-usb3-phy
> >> +- reg : a list of offset + length pairs
> >> +- #phy-cells : from the generic phy bindings, must be 0
> >> +- clocks : phandle + clock specifier for the phy clock
> >> +- resets : phandle + reset specifier for the phy reset
> >> +
> >> +Optional nodes:
> >> +- connector : A sub-node required for representing the connector
> >connected
> >> +          to the USB PHY. See ../connector/usb-connector.txt for
> >details.
> >> +
> >> +Example:
> >> +    usb3phy: phy@5210000 {
> >> +            compatible =3D "allwinner,sun50i-h6-usb3-phy";
> >> +            reg =3D <0x5210000 0x10000>;
> >> +            clocks =3D <&ccu CLK_USB_PHY1>;
> >> +            resets =3D <&ccu RST_USB_PHY1>;
> >> +            #phy-cells =3D <0>;
> >> +
> >> +            connector {
> >> +                    compatible =3D "usb-a-connector";
> >> +                    label =3D "USB3";
> >
> >The binding defines that a connector is a child of USB controller or
>
> Please note that the word used is not "USB controller", but "USB interfac=
e
> controller".

Same thing.

We do not represent PHYs as part of the hierarchy. The controller just
points to its PHY with the 'phys' property, but is not part of the
graph.

Unless your PHY handle USB-C functions like PD and alternate modes,
then it shouldn't be part of the graph.

> A USB controller is something that deal with USB protocol, and connect to=
 a USB
> PHY with ULPI/UTMI/PIPE interface. It's not connected to the connector
> directly at all. Then the PHY is connected to the interface controller (i=
f present), or
> the connector, with D+, D- and SS pins.
>
> >some port controller (such as USB-C ctrlr) with OF graph to USB
> >controller. So either way, this is wrong unless this is more than just
> >a
> >phy.
> >
> >Rob
> >
> >_______________________________________________
> >linux-arm-kernel mailing list
> >linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> >http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
> --
> =E4=BD=BF=E7=94=A8 K-9 Mail =E5=8F=91=E9=80=81=E8=87=AA=E6=88=91=E7=9A=84=
Android=E8=AE=BE=E5=A4=87=E3=80=82

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
