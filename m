From: Sagar Kadam <sagar.kadam@sifive.com>
Subject: Re: [PATCH 3/3] riscv: dts: Add DT node for SiFive FU540 Ethernet
 controller driver
Date: Mon, 22 Jul 2019 13:57:14 +0530
Message-ID: <CAARK3Hn7vocesjGm3mNGJ4GJXwRnqv-qtVGAgFKMghH033JH4g@mail.gmail.com>
References: <1563534631-15897-1-git-send-email-yash.shah@sifive.com>
 <1563534631-15897-3-git-send-email-yash.shah@sifive.com> <CAARK3H=D1N8gO0Z82_MCtgr5DtT1=E0wzYbn-y451ASgxV-qBg@mail.gmail.com>
 <20190719132657.GD24930@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190719132657.GD24930@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, netdev@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, ynezz@true.cz, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, nicolas.ferre@microchip.com, Sachin Ghadi <sachin.ghadi@sifive.com>, Yash Shah <yash.shah@sifive.com>, Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, davem@davemloft.net
List-Id: devicetree@vger.kernel.org

Hello Andrew,

On Fri, Jul 19, 2019 at 6:57 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Fri, Jul 19, 2019 at 05:23:45PM +0530, Sagar Kadam wrote:
> > > +&eth0 {
> > > +       status = "okay";
> > > +       phy-mode = "gmii";
> > > +       phy-handle = <&phy1>;
> > > +       phy1: ethernet-phy@0 {
> > > +               reg = <0>;
> > > +       };
>
> Hi Sagar
>
> Is there a good reason to call it phy1? Is there a phy0?
>

Sorry for the delayed response.
There is a single phy, so yes phy0 is a better name.
Thank you for pointing this out.

Thanks & Regards,
Sagar Kadam




> Thanks
>
>    Andrew
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
