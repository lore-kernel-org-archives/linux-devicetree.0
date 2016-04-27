From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v4 1/7] regulator: rk808: Add rk808_reg_ops_ranges for LDO3
Date: Wed, 27 Apr 2016 23:54:36 +0200
Message-ID: <1574567.Qm9YHLQrGG@diego>
References: <1461682450-22173-1-git-send-email-w.egorov@phytec.de> <1461682450-22173-2-git-send-email-w.egorov@phytec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1461682450-22173-2-git-send-email-w.egorov@phytec.de>
Sender: linux-clk-owner@vger.kernel.org
To: linux-rockchip@lists.infradead.org
Cc: Wadim Egorov <w.egorov@phytec.de>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, rtc-linux@googlegroups.com, devicetree@vger.kernel.org, lee.jones@linaro.org, mark.rutland@arm.com, a.zummo@towertech.it, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, mturquette@baylibre.com, sboyd@codeaurora.org, lgirdwood@gmail.com, dianders@chromium.org, robh+dt@kernel.org, alexandre.belloni@free-electrons.com, broonie@kernel.org, galak@codeaurora.org, zyw@rock-chips.com
List-Id: devicetree@vger.kernel.org

Am Dienstag, 26. April 2016, 16:54:04 schrieb Wadim Egorov:
> LDO_REG3 descriptor is using linear_ranges.
> Add and use proper ops for LDO_REG3.
> 
> Signed-off-by: Wadim Egorov <w.egorov@phytec.de>

I'm to late to the party judging by Mark's "Aplied" message, but just to 
confirm, this patch sucessfully fixes the issue on veyron-devices reported 
yesterday.


Heiko
