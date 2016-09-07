From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 1/7] clk: gxbb: expose USB clocks
Date: Tue, 6 Sep 2016 17:33:55 -0700
Message-ID: <20160907003355.GQ12510@codeaurora.org>
References: <20160904213152.25837-1-martin.blumenstingl@googlemail.com>
 <20160904213152.25837-2-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160904213152.25837-2-martin.blumenstingl@googlemail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org, jbrunet@baylibre.com, johnyoun@synopsys.com, kishon@ti.com, khilman@baylibre.com, carlo@caione.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, mturquette@baylibre.com, will.deacon@arm.com, catalin.marinas@arm.com, gregkh@linuxfoundation.org, mark.rutland@arm.com, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

On 09/04, Martin Blumenstingl wrote:
> USB0_DDR_BRIDGE and USB1_DDR_BRIDGE1 are needed for the related
> dwc2 usb controller. USB, USB0 and USB1 are needed for the PHYs.
> Expose these clocks to DT and comment out in clk driver.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Is authorship correct on this patch? Did Jerome author it
instead?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
