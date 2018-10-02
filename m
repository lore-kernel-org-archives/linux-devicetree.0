Return-Path: <SRS0=z80J=MO=linuxfoundation.org=gregkh@kernel.org>
Date: Tue, 2 Oct 2018 10:36:27 -0700
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/2] dt-bindings: usb: renesas_usb3: add bindings for
 r8a77990
Message-ID: <20181002173627.GA12821@kroah.com>
References: <1538481507-24821-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1538481507-24821-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <87sh1o8ruz.fsf@linux.intel.com>
 <TY2PR01MB229731FDB2C43B022021E781D8E80@TY2PR01MB2297.jpnprd01.prod.outlook.com>
 <87pnws8q95.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pnws8q95.fsf@linux.intel.com>
To: Felipe Balbi <balbi@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Oct 02, 2018 at 03:52:38PM +0300, Felipe Balbi wrote:
> 
> Hi,
> 
> Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> writes:
> > Hi Felipe-san,
> >
> >> From: Felipe Balbi, Sent: Tuesday, October 2, 2018 9:18 PM
> >> 
> >> Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> writes:
> >> 
> >> > This patch adds bindings for r8a77990 (R-Car E3).
> >> >
> >> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> >> > ---
> >> >  Documentation/devicetree/bindings/usb/renesas_usb3.txt | 1 +
> >> >  1 file changed, 1 insertion(+)
> >> >
> >> > diff --git a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> >> b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> >> > index b22f0a5..d366555 100644
> >> > --- a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> >> > +++ b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> >> > @@ -6,6 +6,7 @@ Required properties:
> >> >  	- "renesas,r8a7795-usb3-peri"
> >> >  	- "renesas,r8a7796-usb3-peri"
> >> >  	- "renesas,r8a77965-usb3-peri"
> >> > +	- "renesas,r8a77990-usb3-peri"
> >> >  	- "renesas,rcar-gen3-usb3-peri" for a generic R-Car Gen3 or RZ/G2
> >> >  	  compatible device
> >> 
> >> oops:
> >> 
> >> checking file Documentation/devicetree/bindings/usb/renesas_usb3.txt
> >> Hunk #1 FAILED at 6.
> >> 1 out of 1 hunk FAILED
> >> 
> >> could you rebase against testing/next?
> >
> > Sorry for lack information.
> > If possible, would you review/apply the following patch at first?
> >
> > https://patchwork.kernel.org/patch/10574879/
> >
> > Greg-san's repo already merged the patch like below:
> >
> > commit 28da90f19cdec24d669d75942fec227f4de37abd
> > Author: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Date:   Fri Aug 24 08:56:15 2018 +0100
> >
> >     usb: gadget: udc: renesas_usb3: Add r8a774a1 support
> >
> >     Document RZ/G2M (R8A774A1) SoC bindings.
> >
> >     Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >     Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> >     Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> >     Reviewed-by: Rob Herring <robh@kernel.org>
> >     Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> >     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >
> >
> > I think that almost all patches I or other guys sent for usb gadget are already
> > merged into Greg-san's repo like below:
> 
> oh, understood. I can rebase my pull request on Greg's branch,
> then. Greg, would you prefer that to avoid duplicated commits?

duplicated commits are fine, I don't mind them :)
