From: Dragan Cvetic <draganc@xilinx.com>
Subject: RE: [PATCH V2 01/12] dt-bindings: xilinx-sdfec: Add SDFEC binding
Date: Fri, 26 Apr 2019 12:27:05 +0000
Message-ID: <BL0PR02MB56812D6CE27C3522A7A2A58ACB3E0@BL0PR02MB5681.namprd02.prod.outlook.com>
References: <1554804414-206099-1-git-send-email-dragan.cvetic@xilinx.com>
 <1554804414-206099-2-git-send-email-dragan.cvetic@xilinx.com>
 <20190425202417.GA22307@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190425202417.GA22307@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "arnd@arndb.de" <arnd@arndb.de>, Michal Simek <michals@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Derek Kiernan <dkiernan@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Greg,



> -----Original Message-----
> From: Greg KH [mailto:gregkh@linuxfoundation.org]
> Sent: Thursday 25 April 2019 21:24
> To: Dragan Cvetic <draganc@xilinx.com>
> Cc: arnd@arndb.de; Michal Simek <michals@xilinx.com>; linux-arm-kernel@li=
sts.infradead.org; linux-kernel@vger.kernel.org; Derek
> Kiernan <dkiernan@xilinx.com>
> Subject: Re: [PATCH V2 01/12] dt-bindings: xilinx-sdfec: Add SDFEC bindin=
g
>=20
> On Tue, Apr 09, 2019 at 11:06:43AM +0100, Dragan Cvetic wrote:
> > Add the Soft Decision Forward Error Correction (SDFEC) Engine
> > bindings which is available for the Zynq UltraScale+ RFSoC
> > FPGA's.
> >
> > Signed-off-by: Dragan Cvetic <dragan.cvetic@xilinx.com>
> > Signed-off-by: Derek Kiernan <derek.kiernan@xilinx.com>
> > ---
> >  .../devicetree/bindings/misc/xlnx,sd-fec.txt       | 58 ++++++++++++++=
++++++++
> >  1 file changed, 58 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/misc/xlnx,sd-fec.=
txt
>=20
> Don't you have to send new bindings to the DT maintainers?


They will be in the email list from now on.

Thanks
Dragan

>=20
> thanks,
>=20
> greg k-h
