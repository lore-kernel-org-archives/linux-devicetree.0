From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2] powerpc/fsl: Added binding for Freescale CoreNet
 coherency fabric (CCF)
Date: Thu, 8 May 2014 18:18:08 -0500
Message-ID: <1399591088.15726.402.camel@snotra.buserror.net>
References: <1397833917-12611-1-git-send-email-diana.craciun@freescale.com>
	 <6CE62BBF-BFF4-4F2C-8EFF-B6F87EE6EEE9@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6CE62BBF-BFF4-4F2C-8EFF-B6F87EE6EEE9-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Diana Craciun <diana.craciun-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2014-05-08 at 07:00 -0700, Kumar Gala wrote:
> On Apr 18, 2014, at 8:11 AM, Diana Craciun <diana.craciun@freescale.c=
om> wrote:
>=20
> > From: Diana Craciun <Diana.Craciun-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> >=20
> > The CoreNet coherency fabric is a fabric-oriented, conectivity
> > infrastructure that enables the implementation of coherent, multico=
re
> > systems. The CCF acts as a central interconnect for cores,
> > platform-level caches, memory subsystem, peripheral devices and I/O=
 host
> > bridges in the system.
> >=20
> > Signed-off-by: Diana Craciun <Diana.Craciun-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> > .../devicetree/bindings/powerpc/fsl/ccf.txt        | 36 +++++++++++=
+++++++++++
> > 1 file changed, 36 insertions(+)
> > create mode 100644 Documentation/devicetree/bindings/powerpc/fsl/cc=
f.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/powerpc/fsl/ccf.txt =
b/Documentation/devicetree/bindings/powerpc/fsl/ccf.txt
> > new file mode 100644
> > index 0000000..f0b7143
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/powerpc/fsl/ccf.txt
> > @@ -0,0 +1,36 @@
> > +Freescale CoreNet Coherency Fabric(CCF) Device Tree Binding
> > +
> > +DESCRIPTION
> > +
> > +The CoreNet coherency fabric is a fabric-oriented, connectivity in=
frastructure
> > +that enables the implementation of coherent, multicore systems.
> > +
> > +Required properties:
> > +
> > +- compatible : <string>
> > +		Must include "fsl,corenetX-cf", "fsl,corenet-cf" - CoreNet coher=
ency=20
> > +		fabric version X
>=20
> Can we make this =E2=80=98fsl,corenet-vX-cf=E2=80=99.
>=20
> corenet-v1-cf/corenet-v2-cf looks nicer than corenet1-cf/corenet2-cf

How important is this?  We've already got corenet2-cf in SDK device
trees -- and while I know that's not binding on upstream in any way,
it's purely a cosmetic change.  Even if you disregard the SDK, is this
really worth going back and amending several pending patches over
(including a driver that I was waiting for this binding to settle befor=
e
sending)? =20

=46WIW, we have other instances of "deviceN", such as "fsl,etsec2",
"fsl,cpm2-<foo>","fsl,usb2-<foo>", and "fsl,elo3-dma".  We also call it
"corenet2" in U-Boot a lot.

If we must change it, I'd prefer "fsl,corenet-cf-vX.0".

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
