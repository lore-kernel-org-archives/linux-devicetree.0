From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 2/4] clk: rockchip: export clock pclk_efuse_256 for RK3368 SoCs
Date: Sat, 14 Oct 2017 23:29:07 +0200
Message-ID: <2959871.y9lmPDGV1V@phil>
References: <20170904085119.25981-1-romain.perier@collabora.com> <20170904085119.25981-3-romain.perier@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170904085119.25981-3-romain.perier@collabora.com>
Sender: linux-clk-owner@vger.kernel.org
To: Romain Perier <romain.perier@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, philipp.tomsich@theobroma-systems.com, klaus.goger@theobroma-systems.com, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Montag, 4. September 2017, 10:51:17 CEST schrieb Romain Perier:
> This exports the clock for the pclk gate of the eFuse that is part of
> the RK3368 SoCs. So we can use it from the dt-bindings.
> 
> Signed-off-by: Romain Perier <romain.perier@collabora.com>

applied for 4.15


Thanks
Heiko
