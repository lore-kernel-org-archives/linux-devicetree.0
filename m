From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [v1 3/3] arm64: dts: ls1028a: Add properties node for Display
 output pixel clock
Date: Mon, 19 Aug 2019 11:32:01 +0200
Message-ID: <20190819093159.GJ5999@X250>
References: <20190812100224.34502-1-wen.he_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190812100224.34502-1-wen.he_1@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wen He <wen.he_1@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, leoyang.li@nxp.com, liviu.dudau@arm.com
List-Id: devicetree@vger.kernel.org

On Mon, Aug 12, 2019 at 06:02:24PM +0800, Wen He wrote:
> The LS1028A has a clock domain PXLCLK0 used for the Display output
> interface in the display core, independent of the system bus frequency,
> for flexible clock design. This display core has its own pixel clock.
> 
> This patch enable the pixel clock provider on the LS1028A.
> 
> Signed-off-by: Wen He <wen.he_1@nxp.com>

Applied, thanks.
