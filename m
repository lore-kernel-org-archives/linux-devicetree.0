From: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Subject: [RFC] New Device Tree property - "bonding"
Date: Fri, 25 Nov 2016 16:55:05 +0000
Message-ID: <KL1PR06MB1031872E5DC2C65F2A490D6BC3890@KL1PR06MB1031.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "frowand.list@gmail.com" <frowand.list@gmail.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "pantelis.antoniou@konsulko.com" <pantelis.antoniou@konsulko.com>
Cc: Chris Paterson <Chris.Paterson2@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "laurent.pinchart+renesas@ideasonboard.com" <laurent.pinchart+renesas@ideasonboard.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello DT maintainers,

In one of the Renesas SoCs we have a device called DRIF (Digital Radio Inte=
rface) controller. A DRIF channel contains 4 external pins - SCK, SYNC, Dat=
a pins D0 & D1.=20

Internally a DRIF channel is made up of two SPI slave devices (also called =
sub-channels here) that share common CLK & SYNC signals but have their own =
resource set. The DRIF channel can have either one of the sub-channel activ=
e at a time or both. When both sub-channels are active, they need to be man=
aged together as one device as they share same CLK & SYNC. We plan to tie t=
hese two sub-channels together with a new property called "renesas,bonding"=
.

We would appreciate your feedback on this regard. Below is an example usage=
 of this property.=20

SoC common dtsi file:
---------------------
"renesas,bonding" - phandles to similar devices that are part of the bond. =
A bond between devices implies that they need to be managed together and ca=
nnot operate independently when more than one member of the bond needs to b=
e active.=20

                drif00: rif@e6f40000 {
                        compatible =3D "renesas,r8a7795-drif",
                                     "renesas,rcar-gen3-drif";
                        reg =3D <0 0xe6f40000 0 0x64>;
                        interrupts =3D <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
                        clocks =3D <&cpg CPG_MOD 515>;
                        clock-names =3D "fck";
                        dmas =3D <&dmac1 0x20>, <&dmac2 0x20>;
                        dma-names =3D "rx", "rx";
                        renesas,bonding =3D <&drif01>;
                        power-domains =3D <&sysc R8A7795_PD_ALWAYS_ON>;
                        status =3D "disabled";

                };

                drif01: rif@e6f50000 {
                        compatible =3D "renesas,r8a7795-drif",
                                     "renesas,rcar-gen3-drif";
                        reg =3D <0 0xe6f50000 0 0x64>;
                        interrupts =3D <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
                        clocks =3D <&cpg CPG_MOD 514>;
                        clock-names =3D "fck";
                        dmas =3D <&dmac1 0x22>, <&dmac2 0x22>;
                        dma-names =3D "rx", "rx";
                        renesas,bonding =3D <&drif00>;
                        power-domains =3D <&sysc R8A7795_PD_ALWAYS_ON>;
                        status =3D "disabled";
                };

Board specific dts file:
-------------------------
- When more than one member of the "bonding" property are available, anothe=
r keyword ("primary" or "bonded" or ??) is expected on any one of the membe=
rs. This "primary" member controls/accepts properties common to all members=
.

- When only a single member of the bond needs to be active, the "bonding" p=
roperty has no effect.

Note: "primary" keyword is found in "http://elinux.org/images/c/cf/Power_eP=
APR_APPROVED_v1.1.pdf" Page 103, Line 10. It looks like a generic property =
but documentation is not available.=20

E.g.
1) Both channels enabled case:
------------------------------------
&drif00 {
        pinctrl-0 =3D <&drif0_pins>;
        pinctrl-names =3D "default";
        renesas,syncac-pol-high;
        status =3D "okay";

        primary; /* This can be changed to "renesas,primary or renesas,bond=
ed or ??" */

        port {
                drif0_ep: endpoint {
                     remote-endpoint =3D <&tuner_ep>;
                }; =20
        }; =20
};

&drif01 {
        status =3D "okay";
};

2) Single channel enabled case:
-------------------------------
&drif01 {
        pinctrl-0 =3D <&drif0_pins>;
        pinctrl-names =3D "default";
        status =3D "okay";

        port {
                drif0_ep: endpoint {
                     remote-endpoint =3D <&tuner_ep>;
                }; =20
        }; =20
};


Thanks,
Ramesh.

Note 1:
--------
Below is a pictorial representation of E.g. (1) and (2)

A DRIF channel can interface with a Master device like this

1) Master with two data pins - both sub-channels used
+---------------------+                +---------------------+
|                     |-----SCK------->|CLK                  |  =20
|       Master        |-----SS-------->|SYNC  DRIFn (slave)  |
|                     |-----SD0------->|D0                   |  =20
|                     |-----SD1------->|D1                   |  =20
+---------------------+                +---------------------+

2) Master with one data pin - sub-channel0 or 1 can be used based on the bo=
ard.
Below is e.g. where sub-channel1 alone is used. D0 pin is unused.

+---------------------+                +---------------------+
|                     |-----SCK------->|CLK                  |  =20
|       Master        |-----SS-------->|SYNC  DRIFn (slave)  |
|                     |-----SD0------->|D1                   |  =20
|                     |                |                     |  =20
+---------------------+                +---------------------+

Note 2:
--------
This topic is discussed as part of the driver submission. The latest on tha=
t is here -=20
https://www.mail-archive.com/linux-renesas-soc@vger.kernel.org/msg09037.htm=
l

None of the models discussed are convincing. This new property proposal is =
closest to option 3 discussed in the thread.
