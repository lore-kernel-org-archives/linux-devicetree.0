From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 1/4] clk: gxbb: expose i2c clocks
Date: Wed, 14 Sep 2016 11:25:06 -0700
Message-ID: <20160914182506.GS7243@codeaurora.org>
References: <1473847568-20163-1-git-send-email-jbrunet@baylibre.com>
 <1473847568-20163-2-git-send-email-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1473847568-20163-2-git-send-email-jbrunet@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 09/14, Jerome Brunet wrote:
> I2C and AO_I2C clocks are needed for the i2c driver, expose to DT
> (and comment out in clk driver)
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
