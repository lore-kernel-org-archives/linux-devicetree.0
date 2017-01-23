From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v4 6/9] clocksource/drivers/rockchip_timer: split
 bc_timer into rk_timer and rk_clock_event_device
Date: Mon, 23 Jan 2017 17:26:24 +0100
Message-ID: <20170123162624.GG2166@mai>
References: <1480343486-25539-1-git-send-email-al.kochet@gmail.com>
 <1480436092-10728-1-git-send-email-al.kochet@gmail.com>
 <1480436092-10728-7-git-send-email-al.kochet@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1480436092-10728-7-git-send-email-al.kochet@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexander Kochetkov <al.kochet@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, Heiko Stuebner <heiko@sntech.de>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Caesar Wang <wxt@rock-chips.com>, Huang Tao <huangtao@rock-chips.com>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 29, 2016 at 07:14:49PM +0300, Alexander Kochetkov wrote:
> The patch move ce field out of struct bc_timer into struct
> rk_clock_event_device and rename struct bc_timer to struct rk_timer.

Why ?
