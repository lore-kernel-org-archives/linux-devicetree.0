From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v8 19/42] clk: davinci: cfgchip: Add TI DA8XX USB PHY clocks
Date: Tue, 20 Mar 2018 10:04:30 -0700
Message-ID: <152156547084.183971.9281090286646445572@swboyd.mtv.corp.google.com>
References: <1521168778-27236-1-git-send-email-david@lechnology.com>
 <1521168778-27236-20-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1521168778-27236-20-git-send-email-david@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Adam Ford <aford173@gmail.com>, linux-kernel@vger.kernel.org, David Lechner <david@lechnology.com>
List-Id: devicetree@vger.kernel.org

Quoting David Lechner (2018-03-15 19:52:35)
> This adds a new driver for the USB PHY clocks in the CFGCHIP2 syscon
> register on TI DA8XX-type SoCs.
> 
> The USB0 (USB 2.0) PHY clock is an interesting case because it calls
> clk_enable() in a reentrant way. The USB 2.0 PSC only has to be enabled
> temporarily while we are locking the PLL, which takes place during the
> clk_enable() callback.
> 
> Signed-off-by: David Lechner <david@lechnology.com>
> ---

Applied to clk-next
