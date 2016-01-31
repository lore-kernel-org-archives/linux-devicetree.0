From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v4 1/9] ARM: dts: rockchip: add the leds control for kylin board
Date: Sun, 31 Jan 2016 11:46:47 +0100
Message-ID: <2785565.JmZWWova7F@phil>
References: <1453970618-4383-1-git-send-email-wxt@rock-chips.com> <1453970618-4383-2-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453970618-4383-2-git-send-email-wxt@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Caesar Wang <wxt@rock-chips.com>
Cc: linux-kernel@vger.kernel.org, hl@rock-chips.com, jay.xu@rock-chips.com, jeffy.chen@rock-chips.com, linux-rockchip@lists.infradead.org, keescook@google.com, cf@rock-chips.com, sonnyrao@chromium.org, leozwang@google.com, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 28. Januar 2016, 16:43:30 schrieb Caesar Wang:
> As the kylin schematic drawing, add the needed work led for
> kylin board.
> 
> Run:
> echo 0 > /sys/class/leds/kylin:red:led/brightness
> echo 1 > /sys/class/leds/kylin:red:led/brightness
> 
> The led can normal on/off on kylin board.
> 
> Signed-off-by: Caesar Wang <wxt@rock-chips.com>

applied to my dts32-branch for 4.6
