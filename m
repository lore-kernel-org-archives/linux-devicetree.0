From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 9/9] mfd: syscon: add Atmel GPBR DT bindings
 documention
Date: Wed, 17 Sep 2014 14:32:16 -0700
Message-ID: <20140917213216.GS30918@lee--X1>
References: <1410441525-25258-1-git-send-email-boris.brezillon@free-electrons.com>
 <1410441525-25258-10-git-send-email-boris.brezillon@free-electrons.com>
 <20140917163405.GM30918@lee--X1>
 <20140917195727.1c75a062@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140917195727.1c75a062@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Johan Hovold <jhovold-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 17 Sep 2014, Boris BREZILLON wrote:
> On Wed, 17 Sep 2014 09:34:05 -0700
> Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>=20
> > On Thu, 11 Sep 2014, Boris BREZILLON wrote:
> >=20
> > > The GPBR block provides a set of battery-backed registers that ca=
n be used
> > > to save data which need to be kept when the system is powered dow=
n and
> > > VDD-core is maintained by an external battery.
> > >=20
> > > A typical usage is the RTT block (when used as an RTC) which need=
s one of
> > > those registers to save the current time.
> > >=20
> > > Signed-off-by: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTGGXanvQGlWp@public.gmane.org=
m>
> > > ---
> > >  Documentation/devicetree/bindings/mfd/atmel,gpbr.txt | 15 ++++++=
+++++++++
> > >  1 file changed, 15 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/mfd/atmel,g=
pbr.txt
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/mfd/atmel,gpbr.txt=
 b/Documentation/devicetree/bindings/mfd/atmel,gpbr.txt
> > > new file mode 100644
> > > index 0000000..a285695
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mfd/atmel,gpbr.txt
> > > @@ -0,0 +1,15 @@
> > > +* Device tree bindings for Atmel GPBR (General Purpose Backup Re=
gisters)
> > > +
> > > +The GPBR are a set of battery-backed registers.
> > > +
> > > +Required properties:
> > > +- compatible:		"atmel,at91sam9260-gpbr", "syscon"
> > > +- reg:			contains offset/length value of the GPBR memory
> > > +			region.
> > > +
> > > +Example:
> > > +
> > > +gpbr: gpbr@fffffd50 {
> >=20
> > Is something referencing this node via phandle?  If not, please rem=
ove
> > the label.
>=20
> Yes, the rtt device is referencing it in its atmel,rtt-rtc-time-reg
> property (see patch 8 of this series).

How can I?  You only sent me patch 9.

Patch looks good, I'm going to apply it.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
