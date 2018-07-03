From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] clk: aspeed: Fix SDCLK name
Date: Tue, 3 Jul 2018 16:09:17 -0600
Message-ID: <20180703220917.GA5938@rob-hp-laptop>
References: <1529978125-28712-1-git-send-email-mine260309@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1529978125-28712-1-git-send-email-mine260309@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lei YU <mine260309@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Mark Rutland <mark.rutland@arm.com>, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 26, 2018 at 09:55:25AM +0800, Lei YU wrote:
> The SDCLK was named SDCLKCLK, and no one has used this yet.
> Fix it.
> 
> Signed-off-by: Lei YU <mine260309@gmail.com>
> ---
>  drivers/clk/clk-aspeed.c                 | 2 +-

>  include/dt-bindings/clock/aspeed-clock.h | 2 +-

Acked-by: Rob Herring <robh@kernel.org>

>  2 files changed, 2 insertions(+), 2 deletions(-)
