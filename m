From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/3] doc: dt: add documentation for Mediatek spi-nor
 controller
Date: Fri, 11 Sep 2015 14:49:07 -0700
Message-ID: <20150911214907.GE11487@google.com>
References: <1441705796-11365-1-git-send-email-bayi.cheng@mediatek.com>
 <1441705796-11365-2-git-send-email-bayi.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1441705796-11365-2-git-send-email-bayi.cheng@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bayi Cheng <bayi.cheng@mediatek.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

One more thing:

On Tue, Sep 08, 2015 at 05:49:54PM +0800, Bayi Cheng wrote:
> +- clocks: spi nor source clock

^^ you only list one clock here

> +- clock-names: "spi_clk", "axi_clk", "mux_clk", "sf_clk"

But you have 4 names here.

...
> +	clocks = <&pericfg CLK_PERI_SPI>,
> +		 <&topckgen CLK_TOP_AXI_SEL>,
> +		 <&topckgen CLK_TOP_UNIVPLL2_D8>,
> +		 <&topckgen CLK_TOP_SPINFI_IFR_SEL>;

And you provide 4 clocks.

> +	clock-names = "spi_clk", "axi_clk", "mux_clk", "sf_clk";

Please list all 4 under the "clocks" property, not just under the
"clock-names" property.

Brian
