From: Jerry Huang <jerry.huang-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH v3 2/3] USB3/DWC3: Add property "snps,
 incr-burst-type-adjustment" for INCR burst type
Date: Fri, 23 Dec 2016 02:52:49 +0000
Message-ID: <DB5PR0401MB1813E210B2ADE1C9493F7768FE950@DB5PR0401MB1813.eurprd04.prod.outlook.com>
References: <1482139554-13618-1-git-send-email-jerry.huang@nxp.com>
 <1482139554-13618-2-git-send-email-jerry.huang@nxp.com>
 <20161222184514.hfd4g7ifrz5cv627@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161222184514.hfd4g7ifrz5cv627@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "catalin.marinas-5wv7dgnIgG8@public.gmane.org" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "will.deacon-5wv7dgnIgG8@public.gmane.org" <will.deacon-5wv7dgnIgG8@public.gmane.org>, "linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org" <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi, Rob,
> -----Original Message-----
> From: Rob Herring [mailto:robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> Sent: Friday, December 23, 2016 2:45 AM
> To: Jerry Huang <jerry.huang-3arQi8VN3Tc@public.gmane.org>
> Cc: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org; catalin.marinas-5wv7dgnIgG8@public.gmane.org;
> will.deacon-5wv7dgnIgG8@public.gmane.org; linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-
> kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Subject: Re: [PATCH v3 2/3] USB3/DWC3: Add property "snps, incr-burst-
> type-adjustment" for INCR burst type
>=20
> On Mon, Dec 19, 2016 at 05:25:53PM +0800, Changming Huang wrote:
> > New property "snps,incr-burst-type-adjustment =3D <x>, <y>" for USB3.0
> DWC3.
> > Field "x": 1/0 - undefined length INCR burst type enable or not; Field
> > "y": INCR4/INCR8/INCR16/INCR32/INCR64/INCR128/INCR256 burst type.
> >
> > While enabling undefined length INCR burst type and INCR16 burst type,
> > get better write performance on NXP Layerscape platform:
> > around 3% improvement (from 364MB/s to 375MB/s).
> >
> > Signed-off-by: Changming Huang <jerry.huang-3arQi8VN3Tc@public.gmane.org>
> > ---
> > Changes in v3:
> >   - add new property for INCR burst in usb node.
> >
> >  Documentation/devicetree/bindings/usb/dwc3.txt |    5 +++++
> >  arch/arm/boot/dts/ls1021a.dtsi                 |    1 +
> >  arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi |    3 +++
> >  arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi |    2 ++
> >  4 files changed, 11 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt
> > b/Documentation/devicetree/bindings/usb/dwc3.txt
> > index e3e6983..8c405a3 100644
> > --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> > +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> > @@ -55,6 +55,10 @@ Optional properties:
> >  	fladj_30mhz_sdbnd signal is invalid or incorrect.
> >
> >   - <DEPRECATED> tx-fifo-resize: determines if the FIFO *has* to be
> reallocated.
> > + - snps,incr-burst-type-adjustment: Value for INCR burst type of
> GSBUSCFG0
> > +	register, undefined length INCR burst type enable and INCRx type.
> > +	First field is for undefined length INCR burst type enable or not.
> > +	Second field is for largest INCRx type enabled.
>=20
> Why do you need the first field? Is the 2nd field used if the 1st is 0?
> If not, then just use the presence of the property to enable or not.
The first field is one switch.
When it is 1, means undefined length INCR burst type enabled, we can use an=
y length less than or equal to the largest-enabled burst length of INCR4/8/=
16/32/64/128/256.=20
When it is zero, means INCRx burst mode enabled, we can use one fixed burst=
 length of 1/4/8/16/32/64/128/256 byte.
So, the 2nd field is used if the 1st is 0, we need to select one largest bu=
rst length the USB controller can support.
If we don't want to change the value of this register (use the default valu=
e), we don't need to add this property to usb node.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
