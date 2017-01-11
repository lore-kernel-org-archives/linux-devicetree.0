From: Bin Liu <b-liu@ti.com>
Subject: Re: [PATCH 4/4] ARM: dts: sun8i: add OTG function to Lichee Pi Zero
Date: Wed, 11 Jan 2017 14:33:26 -0600
Message-ID: <20170111203326.GB16865@uda0271908>
References: <20170103152534.20118-1-icenowy@aosc.xyz>
 <20170103152534.20118-5-icenowy@aosc.xyz>
 <20170110202443.GC2479@uda0271908>
 <2733831484164533@web1g.yandex.ru>
 <20170111200811.GA16865@uda0271908>
 <418251484165614@web21h.yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <418251484165614@web21h.yandex.ru>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 12, 2017 at 04:13:34AM +0800, Icenowy Zheng wrote:
> =

> =

> 12.01.2017, 04:08, "Bin Liu" <b-liu@ti.com>:
> > On Thu, Jan 12, 2017 at 03:55:33AM +0800, Icenowy Zheng wrote:
> >> =A011.01.2017, 04:24, "Bin Liu" <b-liu@ti.com>:
> >> =A0> On Tue, Jan 03, 2017 at 11:25:34PM +0800, Icenowy Zheng wrote:
> >> =A0>> =A0Lichee Pi Zero features a USB OTG port.
> >> =A0>>
> >> =A0>> =A0Add support for it.
> >> =A0>>
> >> =A0>> =A0Note: in order to use the Host mode, the board must be powere=
d via the
> >> =A0>> =A0+5V and GND pins.
> >> =A0>>
> >> =A0>> =A0Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> >> =A0>> =A0---
> >> =A0>> =A0=A0arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts | 10 +++++++=
+++
> >> =A0>> =A0=A01 file changed, 10 insertions(+)
> >> =A0>>
> >> =A0>> =A0diff --git a/arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts b/=
arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts
> >> =A0>> =A0index 0099affc6ce3..3d9168cbaeca 100644
> >> =A0>> =A0--- a/arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts
> >> =A0>> =A0+++ b/arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts
> >> =A0>> =A0@@ -71,3 +71,13 @@
> >> =A0>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pinctrl-names =3D "default";
> >> =A0>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0status =3D "okay";
> >> =A0>> =A0=A0};
> >> =A0>> =A0+
> >> =A0>> =A0+&usb_otg {
> >> =A0>> =A0+ dr_mode =3D "otg";
> >> =A0>
> >> =A0> Why not set this default mode in dtsi instead?
> >> =A0>
> >> =A0> Regards,
> >> =A0> -Bin.
> >>
> >> =A0There's possibly boards which do not have OTG functions.
> >
> > That is board specific.
> >
> > You'd better to define the default dr_mode which the musb _controller_
> > supports in the dtsi, and then override it in a specific board dts if
> > necessary.
> =

> Is there MUSB controllers which do not support a certain mode?

I am not aware of any. That is why I recommended to set "otg" in dtsi,
then override it in board dts if a port is specically designed to
host-only or device-only mode.

> =

> (I remembered my omap3-n900 which do not work under OTG mode...)

I belive it is n900 board specific. omap3 itself doesn't have such
limitation, AFAIK.

Regards,
-Bin.

> =

> >
> > Regards,
> > -Bin.
> >
> >> =A0Even the official CDR design of V3s uses the USB controller to
> >> =A0connect a UVC webcam to make the design a dual-cam design
> >> =A0(V3s itself has a CSI).
> >>
> >> =A0>
> >> =A0>> =A0+ status =3D "okay";
> >> =A0>> =A0+};
> >> =A0>> =A0+
> >> =A0>> =A0+&usbphy {
> >> =A0>> =A0+ usb0_id_det-gpio =3D <&pio 5 6 GPIO_ACTIVE_HIGH>;
> >> =A0>> =A0+ status =3D "okay";
> >> =A0>> =A0+};
> >> =A0>> =A0--
> >> =A0>> =A02.11.0
