From: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: apm: Use lowercase consistently for hex
 constants
Date: Tue, 14 Jun 2016 07:54:44 -0500
Message-ID: <20160614125444.GA21266@localhost>
References: <20160606201756.4978.58010.stgit@bhelgaas-glaptop2.roam.corp.google.com>
 <20160608194828.GA2398@rob-hp-laptop>
 <CADaLNDnjuunP9Nj1F=9ddgx5d5rrT2YrzmuAU_nTH3ZJgs1sCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CADaLNDnjuunP9Nj1F=9ddgx5d5rrT2YrzmuAU_nTH3ZJgs1sCg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Duc Dang <dhdang-qTEPVZfXA3Y@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 13, 2016 at 07:33:59PM -0700, Duc Dang wrote:
> On Wed, Jun 8, 2016 at 12:48 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > On Mon, Jun 06, 2016 at 03:17:56PM -0500, Bjorn Helgaas wrote:
> >> The convention in these files is to use lowercase for "0x" prefixes and for
> >> the hex constants themselves, but a few changes didn't follow that
> >> convention, which makes the file annoying to read.
> >>
> >> Use lowercase consistently for the hex constants.  No functional change
> >> intended.
> >>
> >> Signed-off-by: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> >> ---
> >>  .../devicetree/bindings/net/apm-xgene-enet.txt     |    4 +-
> >>  arch/arm64/boot/dts/apm/apm-shadowcat.dtsi         |   40 ++++++++++----------
> >>  arch/arm64/boot/dts/apm/apm-storm.dtsi             |   36 +++++++++---------
> >>  3 files changed, 40 insertions(+), 40 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/net/apm-xgene-enet.txt b/Documentation/devicetree/bindings/net/apm-xgene-enet.txt
> >> index 05f705e3..e41b2d5 100644
> >> --- a/Documentation/devicetree/bindings/net/apm-xgene-enet.txt
> >> +++ b/Documentation/devicetree/bindings/net/apm-xgene-enet.txt
> >> @@ -59,8 +59,8 @@ Example:
> >>               compatible = "apm,xgene-enet";
> >>               status = "disabled";
> >>               reg = <0x0 0x17020000 0x0 0xd100>,
> >> -                   <0x0 0X17030000 0x0 0X400>,
> >> -                   <0x0 0X10000000 0x0 0X200>;
> >> +                   <0x0 0x17030000 0x0 0x400>,
> >> +                   <0x0 0x10000000 0x0 0x200>;
> >>               reg-names = "enet_csr", "ring_csr", "ring_cmd";
> >>               interrupts = <0x0 0x3c 0x4>;
> >>               port-id = <0>;
> >> diff --git a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
> >> index c569f76..9773687 100644
> >> --- a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
> >> +++ b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
> >> @@ -106,9 +106,9 @@
> >>               interrupts = <1 9 0xf04>;       /* GIC Maintenence IRQ */
> >>               ranges = <0 0 0 0x79000000 0x0 0x800000>; /* MSI Range */
> >>               reg = <0x0 0x78090000 0x0 0x10000>,     /* GIC Dist */
> >> -                   <0x0 0x780A0000 0x0 0x20000>,     /* GIC CPU */
> >> -                   <0x0 0x780C0000 0x0 0x10000>,     /* GIC VCPU Control */
> >> -                   <0x0 0x780E0000 0x0 0x20000>;     /* GIC VCPU */
> >> +                   <0x0 0x780a0000 0x0 0x20000>,     /* GIC CPU */
> >> +                   <0x0 0x780c0000 0x0 0x10000>,     /* GIC VCPU Control */
> >> +                   <0x0 0x780e0000 0x0 0x20000>;     /* GIC VCPU */
> >>               v2m0: v2m@0x00000 {
> >
> > Unit addresses should not have '0x' or leading 0s.
> >
> >>                       compatible = "arm,gic-v2m-frame";
> >>                       msi-controller;
> >> @@ -159,35 +159,35 @@
> >>                       msi-controller;
> >>                       reg = <0x0 0x90000 0x0 0x1000>;
> >>               };
> >> -             v2m10: v2m@0xA0000 {
> >> +             v2m10: v2m@0xa0000 {
> >
> > and here...
> 
> Thanks, Bjorn. Will you have time to post another version that
> addresses Rob's comment?

Sorry, I forgot to follow up on this.  I didn't understand Rob's comment,
because my patch only changed uppercase/lowercase.  I didn't add or remove
any '0x' or '0' prefixes.

>From the context, I infer that we should have "v2m10: v2m@a0000" instead of
"v2m10: v2m@0xa0000".

I'll make a second patch that makes that change.  I do notice many other 
DTs that have similar constructs, e.g.,

  arch/arc/boot/dts/abilis_tb10x.dtsi:            spi0: spi@0xFE010000 {
  arch/arc/boot/dts/abilis_tb10x.dtsi:            spi1: spi@0xFE011000 {
  arch/arc/boot/dts/axc001.dtsi:          dw-apb-gpio@0x2000 {
  arch/arc/boot/dts/axc001.dtsi:          debug_uart: dw-apb-uart@0x5000 {
  ...

Maybe more opportunities for cleanup?

Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
