From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH V2  2/2] clk: rockchip: fix the incorrect ids
Date: Wed, 17 May 2017 19:57:02 +0200
Message-ID: <1707274.tv1fl5P7jF@phil>
References: <1493102470-22965-1-git-send-email-eddie.cai.linux@gmail.com> <1493102470-22965-3-git-send-email-eddie.cai.linux@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1493102470-22965-3-git-send-email-eddie.cai.linux@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Eddie Cai <eddie.cai.linux@gmail.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, zhengxing@rock-chips.com, mturquette@baylibre.com, sboyd@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 25. April 2017, 14:41:10 CEST schrieb Eddie Cai:
> the ids of clk_testout1 and clk_testout2 is incorrect now. let's correct it
> 
> Signed-off-by: Eddie Cai <eddie.cai.linux@gmail.com>

applied for 4.13, after fixing the subject up a bit [the old ids are not
incorrect, there simply weren't any assigned to the testclks yet :-) ]


Thanks
Heiko
