From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v10 0/4] This suspend patch is only support cut off the power of cpu and some external
Date: Fri, 02 Jan 2015 21:57:18 +0100
Message-ID: <1849483.Ep0vu7eFAf@phil>
References: <1417423940-1669-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1417423940-1669-1-git-send-email-zyw@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Zhong <zyw@rock-chips.com>
Cc: dianders@chromium.org, mturquette@linaro.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, khilman@kernel.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Tony Xie <xxx@rock-chips.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Montag, 1. Dezember 2014, 16:52:16 schrieb Chris Zhong:
> devices, since we still lack power_domain driver, so the other power rail
> of rk3288 need keep power on.
> I have tested it on rk3288-evb board, atop next-20141112. goto suspend by
> type "echo mem > /sys/power/state", vdd_cpu is about 0mv by measuring, so
> it can be determined in sleep mode, then press power button to wakeup it.

I've tested this series again on 3.19-rc1. It still sucessfully suspends and 
wakes a rk3288-evb-rk808 system on power-key presses.
[except the sdmmc detect interrupt going off when a card is inserted on 
suspend]

So I've applied this series to appropriate soc and dts branches for 3.20


Heiko
