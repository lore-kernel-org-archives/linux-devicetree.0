From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v4 2/2] clocksource: Add renesas-ostm timer driver
Date: Thu, 26 Jan 2017 10:24:46 +0100
Message-ID: <20170126092446.GF2021@mai>
References: <20170126020707.4376-1-chris.brandt@renesas.com>
 <20170126020707.4376-3-chris.brandt@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170126020707.4376-3-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 25, 2017 at 09:07:07PM -0500, Chris Brandt wrote:
> This patch adds a OSTM driver for the Renesas architecture.
> The OS Timer (OSTM) has independent channels that can be
> used as a freerun or interval times.
> This driver uses the first probed device as a clocksource
> and then any additional devices as clock events.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v3:
> * Added more details to commit log
> * Kconfig: SYS_SUPPORTS_RENESAS_OSTM to just RENESAS_OSTM
> * removed all MODULE code (this driver is builtin only)
> * removed items from 'struct ostm_device'
> * changed ioread8 to readb

The iowrite* conversion is missing.

s/iowrite8/writeb/
s/iowrite32/writel/

Other than that the driver looks good to me.

Thanks.

  -- Daniel
