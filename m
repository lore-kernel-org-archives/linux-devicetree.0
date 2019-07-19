From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 3/3] riscv: dts: Add DT node for SiFive FU540 Ethernet
 controller driver
Date: Fri, 19 Jul 2019 15:26:57 +0200
Message-ID: <20190719132657.GD24930@lunn.ch>
References: <1563534631-15897-1-git-send-email-yash.shah@sifive.com>
 <1563534631-15897-3-git-send-email-yash.shah@sifive.com>
 <CAARK3H=D1N8gO0Z82_MCtgr5DtT1=E0wzYbn-y451ASgxV-qBg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAARK3H=D1N8gO0Z82_MCtgr5DtT1=E0wzYbn-y451ASgxV-qBg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sagar Kadam <sagar.kadam@sifive.com>
Cc: Yash Shah <yash.shah@sifive.com>, davem@davemloft.net, Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>, nicolas.ferre@microchip.com, Sachin Ghadi <sachin.ghadi@sifive.com>, ynezz@true.cz
List-Id: devicetree@vger.kernel.org

On Fri, Jul 19, 2019 at 05:23:45PM +0530, Sagar Kadam wrote:
> > +&eth0 {
> > +       status = "okay";
> > +       phy-mode = "gmii";
> > +       phy-handle = <&phy1>;
> > +       phy1: ethernet-phy@0 {
> > +               reg = <0>;
> > +       };

Hi Sagar

Is there a good reason to call it phy1? Is there a phy0?

Thanks

   Andrew
