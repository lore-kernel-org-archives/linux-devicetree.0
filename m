From: Bin Liu <b-liu@ti.com>
Subject: Re: [PATCH 4/4] ARM: dts: sun8i: add OTG function to Lichee Pi Zero
Date: Thu, 12 Jan 2017 08:50:14 -0600
Message-ID: <20170112145014.GC16865@uda0271908>
References: <20170103152534.20118-1-icenowy@aosc.xyz>
 <20170103152534.20118-5-icenowy@aosc.xyz>
 <20170110202443.GC2479@uda0271908>
 <2733831484164533@web1g.yandex.ru>
 <20170111200811.GA16865@uda0271908>
 <20170111210638.ppdnpzdd2l6x4lyo@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170111210638.ppdnpzdd2l6x4lyo@lukather>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.xyz>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 11, 2017 at 10:06:38PM +0100, Maxime Ripard wrote:
> On Wed, Jan 11, 2017 at 02:08:11PM -0600, Bin Liu wrote:
> > On Thu, Jan 12, 2017 at 03:55:33AM +0800, Icenowy Zheng wrote:
> > > =

> > > =

> > > 11.01.2017, 04:24, "Bin Liu" <b-liu@ti.com>:
> > > > On Tue, Jan 03, 2017 at 11:25:34PM +0800, Icenowy Zheng wrote:
> > > >> =A0Lichee Pi Zero features a USB OTG port.
> > > >>
> > > >> =A0Add support for it.
> > > >>
> > > >> =A0Note: in order to use the Host mode, the board must be powered =
via the
> > > >> =A0+5V and GND pins.
> > > >>
> > > >> =A0Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> > > >> =A0---
> > > >> =A0=A0arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts | 10 ++++++++++
> > > >> =A0=A01 file changed, 10 insertions(+)
> > > >>
> > > >> =A0diff --git a/arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts b/ar=
ch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts
> > > >> =A0index 0099affc6ce3..3d9168cbaeca 100644
> > > >> =A0--- a/arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts
> > > >> =A0+++ b/arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts
> > > >> =A0@@ -71,3 +71,13 @@
> > > >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pinctrl-names =3D "default";
> > > >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0status =3D "okay";
> > > >> =A0=A0};
> > > >> =A0+
> > > >> =A0+&usb_otg {
> > > >> =A0+ dr_mode =3D "otg";
> > > >
> > > > Why not set this default mode in dtsi instead?
> > > >
> > > > Regards,
> > > > -Bin.
> > > =

> > > There's possibly boards which do not have OTG functions.
> > =

> > That is board specific.
> =

> Exactly, and this is why it should be done in the board DT.

I am just suggesting based on the common practice. If a .dtsi exists for
a family, the .dtsi describes the device and common properties for all
possible boards, and each board .dts adds or overrides its specific
implementation. Kernel has many devices/boards done in this way - define
the default dr_mode in .dtsi.

In this case, I suggest to set the common dr_mode in .dtsi, then each
board .dts only overrides it if the implementation is different. =


> =

> The controller in the Allwinner SoCs do not handle directly the ID pin
> and VBUS, but rather rely on a GPIO to do so.
> =

> So boards with OTG will need setup anyway, at least to tell which
> GPIOs are used. There's no point in enforcing a default if it doesn't
> work by default.

Then define a default which supposes to work for most boards.

Why I suggest this, is because defining a default dr_mode which works
for most cases in dtsi could prevent a little surprise in MUSB function.
If someone designs a new board but forgets to define dr_mode in the new
board DT, the MUSB driver will default to org mode, which might not be
intended.

Regards,
-Bin.
