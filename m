From: Martin Kaiser <martin@kaiser.cx>
Subject: Re: [PATCH] ARM: dts: i.MX25: add the clocks for the EPIT blocks
Date: Mon, 5 Nov 2018 10:12:30 +0100
Message-ID: <20181105091230.z2ooz7olbdpopxyd@viti.kaiser.cx>
References: <1541093567-29205-1-git-send-email-martin@kaiser.cx>
 <20181104144614.GJ26016@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181104144614.GJ26016@tiger>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

Thus wrote Shawn Guo (shawnguo@kernel.org):

> On Thu, Nov 01, 2018 at 06:32:47PM +0100, Martin Kaiser wrote:
> > The i.MX25 contains two EPIT (Enhanced Periodic Interrupt Timer)
> > function blocks. Add their ipg and per clocks to the device tree.

> > Signed-off-by: Martin Kaiser <martin@kaiser.cx>

> Are these EPIT devices actually used in upstream kernel, or just
> somewhere else?

Until I saw Vladimir's mail this morning, I wasn't aware of any mainline
driver that's using the EPIT devices. I found that the clocks are
missing when I tried to use EPIT with a company-internal driver that's
not suitable for mainline integration.

Still, I think that merging this patch does no harm. If the EPIT devices
are present in the DT, we should add all resources they're using.

Thanks & best regards,

   Martin
