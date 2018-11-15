From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v4 04/10] arm64: allwinner: dts: h6: add
 USB2-related device nodes
Date: Thu, 15 Nov 2018 14:28:51 +0800
Message-ID: <CAGb2v64_=YhrDPYAoPxO4YH6OZENAM-nDDhqnCD0Fj26sKwQ7Q@mail.gmail.com>
References: <20181004122855.22981-1-icenowy@aosc.io> <20181004122855.22981-5-icenowy@aosc.io>
 <CAGb2v668dozjLm9mWUw_Y12AZ6DM2ku9dgQ8B8feABNeFf3QSw@mail.gmail.com>
 <4B5BD39B-22E2-4DEA-A199-29094DB8C317@aosc.io> <CAGb2v66Lndq1GMRDda3+2go1snGVS1fKTJTrHpP-B20FtG6VZA@mail.gmail.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBBM5EWTPQKGQEMN2DNKI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v66Lndq1GMRDda3+2go1snGVS1fKTJTrHpP-B20FtG6VZA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 15, 2018 at 10:16 AM Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
>
> On Wed, Nov 14, 2018 at 6:31 PM Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
> > =E4=BA=8E 2018=E5=B9=B411=E6=9C=8814=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=
=886:21:33, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> =E5=86=99=E5=88=B0:
> > >Hi,
> > >
> > >On Thu, Oct 4, 2018 at 8:30 PM Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
> > >>
> > >> Allwinner H6 has two USB2 ports, one OTG and one host-only.
> > >>
> > >> Add device tree nodes related to them.
> > >>
> > >> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> > >> Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> > >> ---
> > >> No changes in v4.
> > >>
> > >> Changes in v3:
> > >> - Removed the wrongly introduced usb3phy node.
> > >> - Added Chen-Yu's Review tag.
> > >>
> > >>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 81
> > >++++++++++++++++++++
> > >>  1 file changed, 81 insertions(+)
> > >>
> > >> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > >b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > >> index 040828d2e2c0..3d60af6cb3ae 100644
> > >> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > >> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > >> @@ -258,6 +258,87 @@
> > >>                         status =3D "disabled";
> > >>                 };
> > >>
> > >> +               usb2otg: usb@5100000 {
> > >> +                       compatible =3D "allwinner,sun8i-a33-musb";
> > >
> > >I added an SoC-specific compatible: "allwinner,sun50i-h6-musb".
> > >
> > >I'm also curious as to whether the MUSB controller was tested or not,
> > >since Allwinner now has EHCI/OHCI host pairs for host mode, and the
> > >Pine H64
> > >only does host mode.
> >
> > USB plug-in detection relays on MUSB if it's enabled.
>
> That's not what I meant. Have you actually used the MUSB core in either
> device or host mode to know that it is compatible with the A33? And
> that it works correctly?
>
> IIRC ID detection is done by the PHY driver, using the GPIO lines.
> In host mode, since it's already directly routed to the host pair,
> it's the host pair that does plug-in detection. The MUSB core is
> completely unused. It should be quite clear if you look at the times
> each interrupt line fired.

I forced the routing to use MUSB and it looks like it works OK.
And the BSP figures for the number of endpoints looks correct.
I'll push the patches out. Thanks.

ChenYu

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
