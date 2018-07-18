Return-Path: <SRS0=w+aW=KC=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr730066.outbound.protection.outlook.com ([40.107.73.66]:53120
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726180AbeGRGUB (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 18 Jul 2018 02:20:01 -0400
From: Shubhrajyoti Datta <shubhraj@xilinx.com>
Subject: RE: [PATCHv3 4/4] dt-bindings: serial: Add binding for uartlite
Date: Wed, 18 Jul 2018 05:42:12 +0000
Message-ID: <BN6PR02MB2577FD6CF575AE734C462FC3AA530@BN6PR02MB2577.namprd02.prod.outlook.com>
References: <1531718634-17939-1-git-send-email-shubhrajyoti.datta@gmail.com>
 <1531718634-17939-4-git-send-email-shubhrajyoti.datta@gmail.com>
 <20180716160251.GA11275@rob-hp-laptop>
In-Reply-To: <20180716160251.GA11275@rob-hp-laptop>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, "shubhrajyoti.datta@gmail.com" <shubhrajyoti.datta@gmail.com>
Cc: "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "jacmet@sunsite.dk" <jacmet@sunsite.dk>
List-ID: <devicetree@vger.kernel.org>

HI Rob,
Thanks for the review.

> -----Original Message-----
> From: Rob Herring [mailto:robh@kernel.org]
> Sent: Monday, July 16, 2018 9:33 PM
> To: shubhrajyoti.datta@gmail.com
> Cc: linux-serial@vger.kernel.org; devicetree@vger.kernel.org;
> gregkh@linuxfoundation.org; jacmet@sunsite.dk; Shubhrajyoti Datta
> <shubhraj@xilinx.com>
> Subject: Re: [PATCHv3 4/4] dt-bindings: serial: Add binding for uartlite
>=20
> On Mon, Jul 16, 2018 at 10:53:54AM +0530, shubhrajyoti.datta@gmail.com
> wrote:
> > From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> >
> > Add binding doc for uartlite
>=20
> A note that this binding is already in use and was undocumented would be
> nice.
Done in next version.
>=20
> >
> > Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> > ---
> > v2:
> > lowercase for hex values
> > interrupt description updated
> > v3:
> > squashed the clock changes
> >
> >  .../bindings/serial/xlnx,opb-uartlite.txt          | 23 ++++++++++++++=
++++++++
> >  1 file changed, 23 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt
> >
> > diff --git
> > a/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt
> > b/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt
> > new file mode 100644
> > index 0000000..52719b9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.txt
> > @@ -0,0 +1,23 @@
> > +Xilinx Axi Uartlite controller Device Tree Bindings
> > +---------------------------------------------------------
> > +
> > +Required properties:
> > +- compatible		: Can be either of
> > +				"xlnx,xps-uartlite-1.00.a"
> > +				"xlnx,opb-uartlite-1.00.b"
> > +- reg			: Physical base address and size of the Axi Uartlite
> > +			  registers map.
> > +- interrupts		: Should contain UART controller interrupts.
>=20
> How many?
There is just one interrupt.Fixed in  next version.
>=20
> > +
> > +Optional properties:
> > +- port-number		: Set Uart port number
> > +- clock-names		: Should be "s_axi_aclk"
> > +- clocks		: Input clock specifier. Refer to common clock
> bindings.
>=20
> How do you calc baud rates if this is omitted?
This is a PL (programmable logic ) ip the baud cannot be changed runtime it=
 is decided at  design.
>=20
> > +
> > +Example:
> > +serial@800c0000 {
> > +	compatible =3D "xlnx,xps-uartlite-1.00.a";
> > +	reg =3D <0x0 0x800c0000 0x10000>;
> > +	interrupts =3D <0x0 0x6e 0x1>;
> > +	port-number =3D <0>;
> > +};
> > --
> > 2.7.4
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe devicetree"
> > in the body of a message to majordomo@vger.kernel.org More majordomo
> > info at  http://vger.kernel.org/majordomo-info.html
