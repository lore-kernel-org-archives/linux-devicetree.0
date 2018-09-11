Return-Path: <SRS0=Waov=LZ=renesas.com=yoshihiro.shimoda.uh@kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH v4 2/3] dt-bindings: usb: renesas_usbhs: add clock-names
 property
Date: Tue, 11 Sep 2018 02:38:00 +0000
Message-ID: 
 <OSBPR01MB229363BDD44B8D8B01954AF3D8040@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: 
 <1536573140-24123-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1536573140-24123-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20180910182634.GA21062@bogus>
In-Reply-To: <20180910182634.GA21062@bogus>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Rob Herring <robh@kernel.org>
Cc: "balbi@kernel.org" <balbi@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Rob,

> From: Rob Herring, Sent: Tuesday, September 11, 2018 3:27 AM
>=20
> On Mon, Sep 10, 2018 at 06:52:19PM +0900, Yoshihiro Shimoda wrote:
> > R-Car Gen3 needs to enable clocks of both host and peripheral.
> > Otherwise, other side device cannot work correctly. So, this patch
> > adds a property of clock-names for R-Car Gen3 as an optional.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> > index 087140a..dbdb92c 100644
> > --- a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> > +++ b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> > @@ -26,7 +26,9 @@ Required properties:
> >
> >    - reg: Base address and length of the register for the USBHS
> >    - interrupts: Interrupt specifier for the USBHS
> > -  - clocks: A list of phandle + clock specifier pairs
> > +  - clocks: A list of phandle + clock specifier pairs. In case of
> > +	    "renesas,rcar-gen3-usbhs" compatible device, first clock should b=
e
> > +	    peripheral and second one should be host.
>=20
> This should have said how many clocks. That's still not clear except for
> "renesas,rcar-gen3-usbhs".

Thank you for your comments! I'll revise it.

Best regards,
Yoshihiro Shimoda

> Rob
