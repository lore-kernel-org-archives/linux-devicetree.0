From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx7d: Invert legacy PCI irq mapping
Date: Sat, 14 Oct 2017 22:59:55 +0800
Message-ID: <20171014145954.GN8833@dragon>
References: <20171009184344.5839-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171009184344.5839-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: yurovsky@gmail.com, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 09, 2017 at 11:43:44AM -0700, Andrey Smirnov wrote:
> According to i.MX7D reference manual (Rev. 0.1, table 7-1, page 1221)
> legacy PCI interrupt mapping is as follows:
> 
>  - PCIE INT A is IRQ 122
>  - PCIE INT B is IRQ 123
>  - PCIE INT C is IRQ 124
>  - PCIE INT D is IRQ 125
> 
> Invert the mapping information in corresponding DT node to reflect
> that.
> 
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: yurovsky@gmail.com
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Applied, thanks.
