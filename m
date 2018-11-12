From: Alex Williams <alex.williams@ettus.com>
Subject: Re: [PATCH net-next 2/2] net: nixge: Update device-tree bindings with v3.00
Date: Mon, 12 Nov 2018 15:41:14 -0800
Message-ID: <CAJZzcDhTKAXW4vomD2xazfDU=NWH6eAAbLubEhAo-SWuq5+EKQ@mail.gmail.com>
References: <20181029231447.3690-1-alex.williams@ettus.com>
 <20181029231447.3690-2-alex.williams@ettus.com> <5bea0e95.1c69fb81.88799.a282@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5bea0e95.1c69fb81.88799.a282@mx.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh@kernel.org
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, mark.rutland@arm.com, mdf@kernel.org, Kees Cook <keescook@chromium.org>, "Alex C. Williams" <alex.williams@ni.com>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 12, 2018 at 3:36 PM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Oct 29, 2018 at 04:14:47PM -0700, alex.williams@ettus.com wrote:
> > From: Alex Williams <alex.williams@ni.com>
> >
> > Now the DMA engine is free to float elsewhere in the system map.
> >
> > Signed-off-by: Alex Williams <alex.williams@ni.com>
> > ---
> >  Documentation/devicetree/bindings/net/nixge.txt | 14 +++++++++++---
> >  1 file changed, 11 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/net/nixge.txt b/Documentation/devicetree/bindings/net/nixge.txt
> > index e55af7f0881a..d0f9fb520578 100644
> > --- a/Documentation/devicetree/bindings/net/nixge.txt
> > +++ b/Documentation/devicetree/bindings/net/nixge.txt
> > @@ -1,8 +1,14 @@
> >  * NI XGE Ethernet controller
> >
> >  Required properties:
> > -- compatible: Should be "ni,xge-enet-2.00"
> > -- reg: Address and length of the register set for the device
> > +- compatible: Should be "ni,xge-enet-3.00", but can be "ni,xge-enet-2.00" for
> > +              older device trees with DMA engines co-located in the address map,
> > +              with the one reg entry to describe the whole device.
> > +- reg: Address and length of the register set for the device. It contains the
> > +       information of registers in the same order as described by reg-names.
> > +- reg-names: Should contain the reg names
> > +     "dma":  DMA engine control and status region
> > +        "ctrl": MDIO and PHY control and status region
> >  - interrupts: Should contain tx and rx interrupt
> >  - interrupt-names: Should be "rx" and "tx"
> >  - phy-mode: See ethernet.txt file in the same directory.
> > @@ -13,7 +19,9 @@ Required properties:
> >  Examples (10G generic PHY):
> >       nixge0: ethernet@40000000 {
> >               compatible = "ni,xge-enet-2.00";
>
> Shouldn't the compatible change here?
>
That's an oops... Will fix.

Should I leave the old example for the version 2.00 format and create
another for 3.00?
> > -             reg = <0x40000000 0x6000>;
> > +             reg = <0x40000000 0x4000
> > +                    0x41002000 0x2000>;
> > +             reg-names = "dma", "ctrl";
> >
> >               nvmem-cells = <&eth1_addr>;
> >               nvmem-cell-names = "address";
> > --
> > 2.14.5
> >
>
