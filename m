From: Chen-Yu Tsai <wens@kernel.org>
Subject: Re: [PATCH v2 0/3] ARM: sun8i: a83t: Support Camera Sensor Interface controller
Date: Tue, 28 May 2019 21:03:06 +0800
Message-ID: <CAGb2v64NDYo-yOvUQDpqzRB_A3NUgF3dXJeYbz_57uwB7mXwqQ@mail.gmail.com>
References: <20190520150637.23557-1-megous@megous.com> <20190520151003.uklhhak5clxi5zpf@core.my.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190520151003.uklhhak5clxi5zpf@core.my.home>
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Ondrej Jirman <megous@megous.com>
Cc: devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Yong Deng <yong.deng@magewell.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 20, 2019 at 11:10 PM Ond=C5=99ej Jirman <megous@megous.com> wro=
te:
>
> On Mon, May 20, 2019 at 05:06:34PM +0200, verejna wrote:
> > From: Ondrej Jirman <megous@megous.com>
> >
> > This is a re-send of Chen-Yu's A83T CSI patch series with review tags
> > applied and removed address/size cells from csi_in port. Already applie=
d
> > patches from v1  were dropped.
> >
> > The series is ready to be merged:
> >
> >   Patch 1 and 2 via sunxi tree
> >   Patch 3 via media tree
>
> Sorry, wrong numbers. 2 is for media tree, 3 is for sunxi, 1 is a dt-bind=
ings
> patch, where I'm not sure.

Bindings typically go with the driver.

Sakari, this series is and has been ready for some time since before the me=
rge
window. Could you please merge patches 1 and 2.


Thanks
ChenYu


>
> thanks,
>         Ondrej
>
> > v2:
> > - dropped address/size cells from csi_in port
> > - added review tags
> >
> > Please take a look and merge.
> >
> > Thank you,
> >       Ondrej
> >
> > --------------------------
> > Original description:
> >
> > Hi everyone,
> >
> > This series adds support for the camera sensor interface controller
> > found on the Allwinner A83T SoC. The controller is similar to the one
> > found on  the H3, with the addition of a MIPI CSI-2 interface. However,
> > this series only supports parallel and BT.656 interfaces, based on the
> > existing driver.
> >
> > Patch 1 adds an undocumented clock parent of the CSI MCLK. This was
> > found after finding the default value to sometimes work and sometimes
> > not, and then comparing against BSP code.
> >
> > Patch 2 adds a compatible string for the A83T variant.
> >
> > Patch 3 adds support for the A83T variant to the existing sun6i-csi
> > driver.
> >
> > Patch 4 adds a device node for the controller, as well as commonly
> > used pin muxing options.
> >
> > Patch 5 adds a pin muxing option for I2C1 on the PE pins, used in
> > conjunction with the CSI pins.
> >
> > Patch 6 provides an example usage of the CSI controller: the Bananapi M=
3
> > with its camera module attached.
> >
> > Please have a look.
> >
> > Regards
> > ChenYu
> >
> > Chen-Yu Tsai (3):
> >   dt-bindings: media: sun6i-csi: Add compatible string for A83T variant
> >   media: sun6i: Support A83T variant
> >   ARM: dts: sun8i: a83t: Add device node for CSI (Camera Sensor
> >     Interface)
> >
> >  .../devicetree/bindings/media/sun6i-csi.txt   |  1 +
> >  arch/arm/boot/dts/sun8i-a83t.dtsi             | 29 +++++++++++++++++++
> >  .../platform/sunxi/sun6i-csi/sun6i_csi.c      |  1 +
> >  3 files changed, 31 insertions(+)
> >
> > --
> > 2.21.0
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
