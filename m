Return-Path: <SRS0=qjTl=KP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-cys01nam02on0057.outbound.protection.outlook.com ([104.47.37.57]:11584
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732068AbeGaOvk (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 31 Jul 2018 10:51:40 -0400
From: Manish Narani <MNARANI@xilinx.com>
Subject: RE: [PATCH 2/4] dt: bindings: Document ZynqMP DDRC in Synopsys
 documentation
Date: Tue, 31 Jul 2018 13:11:20 +0000
Message-ID: <SN6PR02MB4959EF52415F3256C7C97911C12E0@SN6PR02MB4959.namprd02.prod.outlook.com>
References: <1531995290-15643-1-git-send-email-manish.narani@xilinx.com>
 <1531995290-15643-3-git-send-email-manish.narani@xilinx.com>
 <20180725192500.GA7228@rob-hp-laptop>
In-Reply-To: <20180725192500.GA7228@rob-hp-laptop>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "mdf@kernel.org" <mdf@kernel.org>, Will Wong <WILLW@xilinx.com>, Naga Sureshkumar Relli <nagasure@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>, Bharat Kumar Gogada <bharatku@xilinx.com>, Shubhrajyoti Datta <shubhraj@xilinx.com>, "stefan.krsmanovic@aggios.com" <stefan.krsmanovic@aggios.com>, Anirudha Sarangi <anirudh@xilinx.com>, Srinivas Goud <sgoud@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

Hi Rob,

> -----Original Message-----
> From: Rob Herring [mailto:robh@kernel.org]
> Sent: Thursday, July 26, 2018 12:55 AM
> To: Manish Narani <MNARANI@xilinx.com>
> Cc: mark.rutland@arm.com; devicetree@vger.kernel.org;
> catalin.marinas@arm.com; will.deacon@arm.com; mdf@kernel.org; Will
> Wong <WILLW@xilinx.com>; Naga Sureshkumar Relli <nagasure@xilinx.com>;
> Edgar Iglesias <edgari@xilinx.com>; Bharat Kumar Gogada
> <bharatku@xilinx.com>; Shubhrajyoti Datta <shubhraj@xilinx.com>;
> stefan.krsmanovic@aggios.com; Anirudha Sarangi <anirudh@xilinx.com>;
> Srinivas Goud <sgoud@xilinx.com>
> Subject: Re: [PATCH 2/4] dt: bindings: Document ZynqMP DDRC in Synopsys
> documentation
>=20
> On Thu, Jul 19, 2018 at 03:44:48PM +0530, Manish Narani wrote:
> > This patch documents Synopsys EDAC driver which reports the single bit
>=20
> Bindings are for h/w, not drivers. I'm pretty sure Synopsys doesn't make =
an
> "EDAC driver".

I will correct it in next version.

>=20
> > errors that are corrected and the double bit errors that are detected.
> >
> > Signed-off-by: Manish Narani <manish.narani@xilinx.com>
> > ---
> >  .../bindings/memory-controllers/synopsys.txt       | 25 ++++++++++++++=
++++-
> ---
> >  1 file changed, 21 insertions(+), 4 deletions(-)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/memory-controllers/synopsys.txt
> > b/Documentation/devicetree/bindings/memory-controllers/synopsys.txt
> > index a43d26d..5d20b76 100644
> > ---
> > a/Documentation/devicetree/bindings/memory-controllers/synopsys.txt
> > +++ b/Documentation/devicetree/bindings/memory-controllers/synopsys.tx
> > +++ t
> > @@ -1,15 +1,32 @@
> >  Binding for Synopsys IntelliDDR Multi Protocol Memory Controller
> >
> > -This controller has an optional ECC support in half-bus width
> > (16-bit) -configuration. The ECC controller corrects one bit error and
> > detects
> > +Synopsys EDAC driver, it does reports the DDR ECC single bit errors
> > +that are corrected and double bit ecc errors that are detected by the
> > +DDR ECC controller.
>=20
> Describe the h/w, not drivers.
Okay

>=20
> s/it does reports/it reports/
> s/ecc/ECC/

Okay

>=20
> > +
> > +The Zynq DDR ECC controller has an optional ECC support in half-bus
> > +width
> > +(16-bit) configuration. The ECC controller corrects one bit error and
> > +detects
> >  two bit errors.
> >
> >  Required properties:
> > - - compatible: Should be 'xlnx,zynq-ddrc-a05'
> > - - reg: Base address and size of the controllers memory area
> > + - compatible: One of:
> > +	- 'xlnx,zynq-ddrc-a05' : Zynq DDR ECC controller
> > +	- 'xlnx,zynqmp-ddrc-2.40a' : ZynqMP DDR ECC controller
> > + - reg: Should contain DDR controller registers location and length.
> > +
> > +Required properties for "xlnx,zynqmp-ddrc-2.40a":
> > + - interrupt-parent: Should be core interrupt controller.
>=20
> Drop this. It is implied.

Sure. I will remove it.

>=20
> > + - interrupts: Property with a value describing the interrupt number.
>=20
> No interrupt for Zynq? That makes ECC reporting hard...

There is no interrupt support in Zynq DDR controller. The ECC reporting is =
done via polling method.

>=20
> >
> >  Example:
> >  	memory-controller@f8006000 {
> >  		compatible =3D "xlnx,zynq-ddrc-a05";
> >  		reg =3D <0xf8006000 0x1000>;
> >  	};
> > +
> > +	mc: memory-controller@fd070000 {
> > +		compatible =3D "xlnx,zynqmp-ddrc-2.40a";
> > +		reg =3D <0x0 0xfd070000 0x0 0x30000>;
> > +		interrupt-parent =3D <&gic>;
> > +		interrupts =3D <0 112 4>;
> > +	};
> > --
> > 2.1.1
> >
Thanks,
Manish Narani
