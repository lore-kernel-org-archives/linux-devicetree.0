From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: i.MX25: add the clocks for the EPIT blocks
Date: Tue, 13 Nov 2018 22:42:11 +0800
Message-ID: <20181113144209.GB4557@dragon>
References: <1541093567-29205-1-git-send-email-martin@kaiser.cx>
 <20181104144614.GJ26016@tiger>
 <20181105091230.z2ooz7olbdpopxyd@viti.kaiser.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181105091230.z2ooz7olbdpopxyd@viti.kaiser.cx>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Kaiser <martin@kaiser.cx>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 05, 2018 at 10:12:30AM +0100, Martin Kaiser wrote:
> Hi,
> 
> Thus wrote Shawn Guo (shawnguo@kernel.org):
> 
> > On Thu, Nov 01, 2018 at 06:32:47PM +0100, Martin Kaiser wrote:
> > > The i.MX25 contains two EPIT (Enhanced Periodic Interrupt Timer)
> > > function blocks. Add their ipg and per clocks to the device tree.
> 
> > > Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> 
> > Are these EPIT devices actually used in upstream kernel, or just
> > somewhere else?
> 
> Until I saw Vladimir's mail this morning, I wasn't aware of any mainline
> driver that's using the EPIT devices. I found that the clocks are
> missing when I tried to use EPIT with a company-internal driver that's
> not suitable for mainline integration.
> 
> Still, I think that merging this patch does no harm. If the EPIT devices
> are present in the DT, we should add all resources they're using.

Agreed.  I will be happy to apply the patch if I can get an ACK from
Clément saying this works with his driver in upstreaming.

Shawn
