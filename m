From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH v4 0/6] PCI: imx: Initial imx7d suspend/resume support
Date: Mon, 17 Sep 2018 17:52:57 +0100
Message-ID: <20180917165257.GJ7239@e107981-ln.cambridge.arm.com>
References: <cover.1534264292.git.leonard.crestez@nxp.com>
 <20180917150941.GH7239@e107981-ln.cambridge.arm.com>
 <16d68541fd499dfda88e79d4386be7ad6d0919d9.camel@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <16d68541fd499dfda88e79d4386be7ad6d0919d9.camel@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Leonard Crestez <leonard.crestez@nxp.com>
Cc: "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, Richard Zhu <hongxing.zhu@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Anson Huang <anson.huang@nxp.com>, "bhelgaas@google.com" <bhelgaas@google.com>, linux-pci@vger.kernel.o
List-Id: devicetree@vger.kernel.org

On Mon, Sep 17, 2018 at 04:01:21PM +0000, Leonard Crestez wrote:
> On Mon, 2018-09-17 at 16:09 +0100, Lorenzo Pieralisi wrote:
> > On Tue, Aug 14, 2018 at 07:50:14PM +0300, Leonard Crestez wrote:
> 
> > > V4 adds 4 more patches with PME_Turn_Off support on top, using a new
> > > reset bit. I generally try to keep series short but in this case some
> > > planning might be needed to get patches into 4.20.
> > > 
> > > Since the new reset is treated as optional with old DTB there should be
> > > again no problem if reset and pci are merged out of order.
> > > 
> > > Shawn/Philipp/Lorenzo: Would it make sense to merge this series through a
> > > single specific tree, such as the one for imx?
> > 
> > This series is a bit of a mixture of multiple things hard to discern
> > (actually I already merged patch 2 and patch 1 seems completely
> > unrelated).
> > 
> > I would take the series through the PCI tree but I need an ACK for
> > patches 5 and 6, please let me know how you want to handle it.
> 
> Patches 1 and 2 are already in, the rest need review. I can now just
> resend patches 3-6 as a separate series, unless somebody complains
> about spam.

What do you mean by "are already in" ? Patch 2 I queued via the PCI
tree, patch 1 ? Can I drop it from the PCI patch queue ?

I do not think there is any need to resend, I can merge patches 3-4
since they have been reviewed but patches 5 and 6 need review.

Lorenzo

> Multiple separate patches are required because it touches reset + dt +
> pci. I guess adding the include constant should be moved from the dts
> patch to dt-bindings though.
> 
> Merging reset and pci out of order should be fine here and is required
> by DT compatibility rules anyway.
> 
> --
> Regards,
> Leonard
