From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 2/3] ARM: DTS: imx6q-logicpd: Reduce inrush current on
 start
Date: Wed, 20 Mar 2019 22:57:25 +0800
Message-ID: <20190320145723.GE8337@dragon>
References: <20190306140402.17122-1-aford173@gmail.com>
 <20190306140402.17122-2-aford173@gmail.com>
 <20190320124446.GO4980@dragon>
 <CAHCN7x+DKh8bR17C90o-zKKnFqWe_Yz5EM68xEiSY0W6ufNARA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHCN7x+DKh8bR17C90o-zKKnFqWe_Yz5EM68xEiSY0W6ufNARA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Adam Ford <aford173@gmail.com>
Cc: arm-soc <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 20, 2019 at 08:41:27AM -0500, Adam Ford wrote:
> On Wed, Mar 20, 2019 at 7:45 AM Shawn Guo <shawnguo@kernel.org> wrote:
> >
> > On Wed, Mar 06, 2019 at 08:04:00AM -0600, Adam Ford wrote:
> > > The main 3.3V regulator sources a series of additional regulators.
> > > This patch adds a small delay, so when the 3.3V regulator comes
> > > on it delays a bit before the subsequent regulators can come on.
> > > This reduces the inrush current a bit on the external DC power
> > > supply.
> > >
> > > Fixes: 1c207f911fe9 ("ARM: dts: imx: Add support for Logic PD
> > > i.MX6QD EVM")
> >
> > Same comment as patch #1.
> 
> The sourcing regulator occasionally cuts out because the inrush is so
> high.  I would argue that preventing a hardware issue like that would
> be a 'fix' and if it helps, I could add that to the description.

Yes, if you would like to get it in as a fix, please elaborate the real
world issue it fixes.

Shawn
