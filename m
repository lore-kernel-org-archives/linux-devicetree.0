MIME-Version: 1.0
Date: Thu, 25 Jul 2019 16:46:05 -0600
References: <1561990354-4084-1-git-send-email-akinobu.mita@gmail.com>
	<1561990354-4084-3-git-send-email-akinobu.mita@gmail.com>
	<20190722221645.GA32515@bogus>
	<CAC5umyh5d7Ya-Ou8BZmPfpXKT+WkMCWnRKkCw8xhe9upNKqVbg@mail.gmail.com>
In-Reply-To: <CAC5umyh5d7Ya-Ou8BZmPfpXKT+WkMCWnRKkCw8xhe9upNKqVbg@mail.gmail.com>
Message-ID: <CAL_Jsq++7TkihOTrcx+3NVqYsS502h-1Og7h9H2YCA_YY5av2A@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] dt-bindings: thermal: nvme: Add binding documentation
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Akinobu Mita <akinobu.mita@gmail.com>
Cc: linux-nvme@lists.infradead.org, "open list:THERMAL" <linux-pm@vger.kernel.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Minwoo Im <minwoo.im.dev@gmail.com>, Kenneth Heitke <kenneth.heitke@intel.com>, Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, Jul 25, 2019 at 8:24 AM Akinobu Mita <akinobu.mita@gmail.com> wrote=
:
>
> 2019=E5=B9=B47=E6=9C=8823=E6=97=A5(=E7=81=AB) 7:16 Rob Herring <robh@kern=
el.org>:
> >
> > On Mon, Jul 01, 2019 at 11:12:32PM +0900, Akinobu Mita wrote:
> > > Add thermal binding documentation for NVMe temperature sensor.
> > >
> > > Cc: Rob Herring <robh@kernel.org>
> > > Cc: Zhang Rui <rui.zhang@intel.com>
> > > Cc: Eduardo Valentin <edubezval@gmail.com>
> > > Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> > > Cc: Keith Busch <kbusch@kernel.org>
> > > Cc: Jens Axboe <axboe@fb.com>
> > > Cc: Christoph Hellwig <hch@lst.de>
> > > Cc: Sagi Grimberg <sagi@grimberg.me>
> > > Cc: Minwoo Im <minwoo.im.dev@gmail.com>
> > > Cc: Kenneth Heitke <kenneth.heitke@intel.com>
> > > Cc: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
> > > Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> > > ---
> > > * v5
> > > - New patch
> > >
> > >  Documentation/devicetree/bindings/thermal/nvme.txt | 56 ++++++++++++=
++++++++++
> > >  1 file changed, 56 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/thermal/nvme.tx=
t
> > >
> > > diff --git a/Documentation/devicetree/bindings/thermal/nvme.txt b/Doc=
umentation/devicetree/bindings/thermal/nvme.txt
> > > new file mode 100644
> > > index 0000000..60b90de
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/thermal/nvme.txt
> > > @@ -0,0 +1,56 @@
> > > +Binding for NVMe temperature sensor
> > > +
> > > +An NVMe controller reports up to nine temperature values in the SMAR=
T / Health
> > > +log.
> > > +
> > > +Required properties:
> > > +- reg: A five-cell address encoded as (phys.hi phys.mid phys.lo size=
.hi
> > > +  size.lo). phys.hi should contain the device's BDF (Bus/Device/Func=
tion)
> > > +  as 0b00000000 bbbbbbbb dddddfff 00000000. The other cells should b=
e zero.
> > > +  See also Documentation/devicetree/bindings/pci/pci.txt
> > > +
> > > +- #thermal-sensor-cells: Must be 1. See ./thermal.txt for a descript=
ion.
> > > +  In the thermal-sensors property, the sensor ID 0 for composite tem=
perature,
> > > +  1 through 8 for NVMe temperature sensor N.
> > > +
> > > +Example:
> > > +
> > > +&pcie0 {
> > > +     ...
> > > +     nvme: nvme@0,0 {
> > > +             reg =3D <0x0000 0 0 0 0>;
> > > +             #address-cells =3D <3>;
> > > +             #size-cells =3D <2>;
> > > +
> > > +             nvmetemp: nvmetemp {
> > > +                     reg =3D <0x0000 0 0 0 0>; /* DEVFN =3D 0x00 (0:=
0) */
> >
> > I'm not sure this is really valid PCI addressing as the parent has the
> > same address.
> >
> > > +                     #thermal-sensor-cells =3D <1>;
> >
> > Can't you just put this in the parent? Is this really a separate
> > addressable device from the parent?
>
> How about this?
>
> &pcie0 {
> ...
>         pci-bridge@0 {
>                 reg =3D <0x00000 0 0 0 0>;
>                 #address-cells =3D <3>;
>                 #size-cells =3D <2>;
>
>                 nvme: nvme@0,0 {
>                         reg =3D <0x10000 0 0 0 0>;
>                         #thermal-sensor-cells =3D <1>;
>                 };
>         };
> };
>
> and
>
> &thermal_zones {
> ...
> thermal-sensors =3D <&nvme 0>;
> };
>
> I tested this with the RockPro64 and edited
> arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts.
>
> $ lspci
> 00:00.0 PCI bridge: Fuzhou Rockchip Electronics Co., Ltd Device 0100
> 01:00.0 Non-Volatile memory controller: Micron/Crucial Technology
> Device 2263 (rev 03)
>
> $ lspci -tv
> -[0000:00]---00.0-[01]----00.0  Micron/Crucial Technology Device 2263

Looks better to me.

Rob
