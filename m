From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH V2  0/2] correct ids for clk_testout
Date: Tue, 25 Apr 2017 23:04:53 +0200
Message-ID: <5003001.RcGOJBte3U@diego>
References: <1493102470-22965-1-git-send-email-eddie.cai.linux@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1493102470-22965-1-git-send-email-eddie.cai.linux@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Eddie Cai <eddie.cai.linux@gmail.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, zhengxing@rock-chips.com, mturquette@baylibre.com, sboyd@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Eddie,

Am Dienstag, 25. April 2017, 14:41:08 CEST schrieb Eddie Cai:
> we use clk_testout1 and clk_testout2 for camera. e.g. mipi 24M mclk. the ids
> of clk_testout1 and clk_testout2 is wrong. it's time to correct it.

Just to say, patches look good - thanks for explaining what the clocks are 
going to be used for.

I'll apply them after 4.12-rc1 is released (in roughly 2.5 weeks), due to
needing a stable base for the clock-ids.


Heiko

