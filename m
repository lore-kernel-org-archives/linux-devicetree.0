From: jean-philippe francois <jp.francois@cynove.com>
Subject: Re: [early RFC] Device Tree bindings for OMAP3 Camera Subsystem
Date: Mon, 4 Nov 2013 20:49:50 +0100
Message-ID: <CAGGh5h3R0bEuFnpG2Ak+_OXSd2YsnsdDxCQkgoG0Og5sSABYGw@mail.gmail.com>
References: <20131103220315.GA11659@earth.universe>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20131103220315.GA11659@earth.universe>
Sender: linux-media-owner@vger.kernel.org
To: Sebastian Reichel <sre@debian.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>
List-Id: devicetree@vger.kernel.org

013/11/3 Sebastian Reichel <sre@debian.org>:
> Hi,
>
> This is an early RFC for omap3isp DT support. For now i just created =
a potential DT
> binding documentation based on the existing platform data:
>
> Binding for the OMAP3 Camera subsystem with the image signal processo=
r (ISP) feature.
>

This is very interesting, I am in the process of transforming an (out
of tree) machine board file into
a device tree description, and I was precisely searching for "oma3isp
dt" when I saw your mail.
I would be happy to test or help develop any patch aiming at DT
support for omap3isp. I am new to DT, so I
will leave the DT bindings review to  people that actually  have a clue=
=2E

I am looking forward to testing patches and bugging you when things bre=
ak ;)
Regards,
Jean-Philippe Fran=C3=A7ois

> omap3isp node
> -------------
>
> Required properties:
>
> - compatible    : should be "ti,omap3isp" for OMAP3;
> - reg           : physical addresses and length of the registers set;
> - clocks        : list of clock specifiers, corresponding to entries =
in
>                   clock-names property;
> - clock-names   : must contain "cam_ick", "cam_mclk", "csi2_96m_fck",
>                   "l3_ick" entries, matching entries in the clocks pr=
operty;
> - interrupts    : must contain mmu interrupt;
> - ti,iommu      : phandle to isp mmu;
>
> Optional properties:
>
> - VDD_CSIPHY1-supply    : regulator for csi phy1
> - VDD_CSIPHY2-supply    : regulator for csi phy2
> - ti,isp-xclk-1         : device(s) attached to ISP's first external =
clock
> - ti,isp-xclk-2         : device(s) attached to ISP's second external=
 clock
>
> device-group subnode
> --------------------
>
> Required properties:
> - ti,isp-interface-type : Integer describing the interface type, one =
of the following
>    * 0 =3D ISP_INTERFACE_PARALLEL
>    * 1 =3D ISP_INTERFACE_CSI2A_PHY2
>    * 2 =3D ISP_INTERFACE_CCP2B_PHY1
>    * 3 =3D ISP_INTERFACE_CCP2B_PHY2
>    * 4 =3D ISP_INTERFACE_CSI2C_PHY1
> - ti,isp-devices        : Array of phandles to devices connected via =
the interface
> - One of the following configuration nodes (depending on ti,isp-inter=
face-type)
>  - ti,ccp2-bus-cfg      : CCP2 bus configuration (needed for ISP_INTE=
RFACE_CCP*)
>  - ti,parallel-bus-cfg  : PARALLEL bus configuration (needed for ISP_=
INTERFACE_PARALLEL)
>  - ti,csi2-bus-cfg      : CSI bus configuration (needed for ISP_INTER=
=46ACE_CSI*)
>
> ccp2-bus-cfg subnode
> --------------------
>
> Required properties:
> - ti,video-port-clock-divisor   : integer; used for video port output=
 clock control
>
> Optional properties:
> - ti,inverted-clock             : boolean; clock/strobe signal is inv=
erted
> - ti,enable-crc                 : boolean; enable crc checking
> - ti,ccp2-mode-mipi             : boolean; port is used in MIPI-CSI1 =
mode (default: CCP2 mode)
> - ti,phy-layer-is-strobe        : boolean; use data/strobe physical l=
ayer (default: data/clock physical layer)
> - ti,data-lane-configuration    : integer array with position and pol=
arity information for lane 1 and 2
> - ti,clock-lane-configuration   : integer array with position and pol=
arity information for clock lane
>
> parallel-bus-cfg subnode
> ------------------------
>
> Required properties:
> - ti,data-lane-shift                            : integer; shift data=
 lanes by this amount
>
> Optional properties:
> - ti,clock-falling-edge                         : boolean; sample on =
falling edge (default: rising edge)
> - ti,horizontal-synchronization-active-low      : boolean; default: a=
ctive high
> - ti,vertical-synchronization-active-low        : boolean; default: a=
ctive high
> - ti,data-polarity-ones-complement              : boolean; data polar=
ity is one's complement
>
> csi2-bus-cfg subnode
> --------------------
>
> Required properties:
> - ti,video-port-clock-divisor   : integer; used for video port output=
 clock control
>
> Optional properties:
> - ti,data-lane-configuration    : integer array with position and pol=
arity information for lane 1 and 2
> - ti,clock-lane-configuration   : integer array with position and pol=
arity information for clock lane
> - ti,enable-crc                 : boolean; enable crc checking
>
> Example for Nokia N900
> ----------------------
>
> omap3isp: isp@480BC000 {
>         compatible =3D "ti,omap3isp";
>         reg =3D <
>                 /* OMAP3430+ */
>                 0x480BC000 0x070        /* base */
>                 0x480BC100 0x078        /* cbuf */
>                 0x480BC400 0x1F0        /* cpp2 */
>                 0x480BC600 0x0A8        /* ccdc */
>                 0x480BCA00 0x048        /* hist */
>                 0x480BCC00 0x060        /* h3a  */
>                 0x480BCE00 0x0A0        /* prev */
>                 0x480BD000 0x0AC        /* resz */
>                 0x480BD200 0x0FC        /* sbl  */
>                 0x480BD400 0x070        /* mmu  */
>         >;
>
>         clocks =3D < &cam_ick &cam_mclk &csi2_96m_fck &l3_ick >;
>         clock-names =3D "cam_ick", "cam_mclk", "csi2_96m_fck", "l3_ic=
k";
>
>         interrupts =3D <24>;
>
>         ti,iommu =3D <&mmu_isp>;
>
>         ti,isp-xclk-1 =3D <
>                 &et8ek8
>                 &smiapp_dfl
>         >;
>
>         group1: device-group@0 {
>                 ti,isp-interface-type =3D <2>;
>
>                 ti,isp-devices =3D <
>                         &et8ek8
>                         &ad5820
>                         &adp1653
>                 >;
>
>                 ti,ccp2-bus-cfg {
>                         ti,enable-crc;
>                         ti,phy-layer-is-strobe;
>                         ti,video-port-clock-divisor =3D <1>;
>                 };
>         };
>
>         group2: device-group@1 {
>                 ti,isp-interface-type =3D <2>;
>
>                 ti,isp-devices =3D <
>                         &smiapp_dfl
>                 >;
>
>                 ti,ccp2-bus-cfg {
>                         ti,enable-crc;
>                         ti,phy-layer-is-strobe;
>                         ti,video-port-clock-divisor =3D <1>;
>                 };
>         };
> };
