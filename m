From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [RFC PATCH] ARM: dts: rockchip: increase the mclk_fs to 512 for kylin board
Date: Tue, 02 Feb 2016 22:43:36 +0100
Message-ID: <5872159.rO8vOly5eX@diego>
References: <1454057361-22923-1-git-send-email-zhengxing@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454057361-22923-1-git-send-email-zhengxing@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, keescook@google.com, leozwang@google.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Freitag, 29. Januar 2016, 16:49:21 schrieb Xing Zheng:
> If we playback the 8KHz FS audio with the 256 mclk_fs, we need the
> mclk = 256 * 8000 = 2.048MHz, the frac div is 594 / 2.048 = 290,
> the frac div value 0x00809015 set to the CRU_CLKSEL7_CON will cause
> to hang.
> 
> We increase the mclk_fs to 512, will get the mclk = 512 * 8000 =
> 4.096MHz, use 0x01009015 instead of 0x00809015 to work around this
> issue. We will keep tracking it.
> 
> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>

applied to my dts32 branch for 4.6


Thanks
Heiko
