From: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: pci: pci-msi: Correct the unit-address
 of the pci node name
Date: Thu, 8 Aug 2019 11:26:03 +0800
Message-ID: <CAEUhbmXHzK0Ho27nn+zMAxZfMQxcuN2Pe8fb6_uOEi7RVbJ=_Q@mail.gmail.com>
References: <1564306219-17439-1-git-send-email-bmeng.cn@gmail.com>
 <1564306219-17439-2-git-send-email-bmeng.cn@gmail.com> <CAEUhbmVjELVPKwW6R+W+V2hQbZ_Zj_5j2ogjnTsuCwnK1pT-og@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAEUhbmVjELVPKwW6R+W+V2hQbZ_Zj_5j2ogjnTsuCwnK1pT-og@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 1, 2019 at 5:53 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Sun, Jul 28, 2019 at 5:30 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > The unit-address must match the first address specified in the
> > reg property of the node.
> >
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> > ---
> >
> >  Documentation/devicetree/bindings/pci/pci-msi.txt | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/pci/pci-msi.txt b/Documentation/devicetree/bindings/pci/pci-msi.txt
> > index 9b3cc81..b73d839 100644
> > --- a/Documentation/devicetree/bindings/pci/pci-msi.txt
> > +++ b/Documentation/devicetree/bindings/pci/pci-msi.txt
> > @@ -201,7 +201,7 @@ Example (5)
> >                 #msi-cells = <1>;
> >         };
> >
> > -       pci: pci@c {
> > +       pci: pci@f {
> >                 reg = <0xf 0x1>;
> >                 compatible = "vendor,pcie-root-complex";
> >                 device_type = "pci";
> > --
>
> Ping?

Ping?
