From: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH] riscv: dts: Add DT node for SiFive FU540 Ethernet
 controller driver
Date: Fri, 21 Jun 2019 15:29:20 +0530
Message-ID: <CAJ2_jOGWFaw6G6vjbfz9rwa3jceL0kmykM4B3zLhu0V+qBVZvw@mail.gmail.com>
References: <1561097422-25130-1-git-send-email-yash.shah@sifive.com>
 <1561097422-25130-2-git-send-email-yash.shah@sifive.com> <CAAhSdy2zHozRnwAU6-+U+BE-5h5uNE67D_0TXHJnrHMi53gMog@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAhSdy2zHozRnwAU6-+U+BE-5h5uNE67D_0TXHJnrHMi53gMog@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anup Patel <anup@brainfault.org>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Sachin Ghadi <sachin.ghadi@sifive.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 21, 2019 at 2:31 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Fri, Jun 21, 2019 at 11:40 AM Yash Shah <yash.shah@sifive.com> wrote:
> >
> > DT node for SiFive FU540-C000 GEMGXL Ethernet controller driver added
> >
> > Signed-off-by: Yash Shah <yash.shah@sifive.com>
> > ---
> >  arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> > index 4e8fbde..584e737 100644
> > --- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> > +++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> > @@ -225,5 +225,25 @@
> >                         #address-cells = <1>;
> >                         #size-cells = <0>;
> >                 };
> > +               eth0: ethernet@10090000 {
> > +                       compatible = "sifive,fu540-macb";
> > +                       interrupt-parent = <&plic0>;
> > +                       interrupts = <53>;
> > +                       reg = <0x0 0x10090000 0x0 0x2000
> > +                              0x0 0x100a0000 0x0 0x1000>;
> > +                       reg-names = "control";
> > +                       local-mac-address = [00 00 00 00 00 00];
> > +                       phy-mode = "gmii";
> > +                       phy-handle = <&phy1>;
> > +                       clock-names = "pclk", "hclk";
> > +                       clocks = <&prci PRCI_CLK_GEMGXLPLL>,
> > +                                <&prci PRCI_CLK_GEMGXLPLL>;
> > +                       #address-cells = <1>;
> > +                       #size-cells = <0>;
>
> Have status = "disabled"; here and have
> status = "okay" in board DTS file.
>
> General convention for any SOC device with external
> connection (e.g. ethernet, SPI, SDHC, SATA, PCI, etc)
> is:
>
> 1. Define only device DT node in SOC DTSi file with
> status = "disabled"
> 2. Enable device in Board DTS file with
> status = "okay"
> 3. Define PHY or external PIN connection details
> in Board DTS file
>
> > +                       phy1: ethernet-phy@0 {
> > +                               reg = <0>;
> > +                       };
>
> The PHY DT node should be in Board DTS file.

Will move all PHY related nodes in board DTS file.

>
> Of course, same comments apply to SPI DT nodes as well
> but I missed reviewing those DT nodes. You can send separate
> DT patch to re-organize SPI DT nodes.

Sure, will send a separate patch for SPI DT nodes as well.
Thanks for your comments.

- Yash

>
> Regards,
> Anup
