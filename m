From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] ARM: dts: Add the hdmi-ddc pinctrl settings for rk3288
Date: Sun, 13 Sep 2015 13:32:34 +0200
Message-ID: <1460847.PVSDMeWNWs@diego>
References: <1441230862-17376-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1441230862-17376-1-git-send-email-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: linux-rockchip@lists.infradead.org, ykk@rock-chips.com, mark.yao@rock-chips.com, briannorris@chromium.org, amstan@chromium.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 2. September 2015, 14:54:22 schrieb Douglas Anderson:
> The pins for i2c5 can either be configured as "I2C5" which means that
> they're controlled by the normal RK3288 I2C controller or as "EDP / HDMI
> I2C".  It's unclear why EDP is referenced here since apparently setting
> the mux to this position enables I2C communication using the dw_hdmi
> block with a patch like <https://patchwork.kernel.org/patch/7098101/>.
> 
> There appear to be some reasons why using the builtin I2C controller in
> dw_hdmi is better than using the normal RK3288 I2C controller, so boards
> based on rk3288 might eventually want to use this pinmux if it's known
> to work.
> 
> Once driver support in dw_hdmi lands, boards would use this by selecting
> this pinctrl for the HDMI block and then _not_ specifying a ddc-i2c-bus
> and _not_ setting the status to "okay" for i2c5 (which uses the same
> pins).
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

applied to my dts branch for 4.4


Thanks
Heiko
