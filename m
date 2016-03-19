From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] clk: sunxi: Add CSI (camera's Sensors Interface) module
 clock driver for sun[457]i
Date: Sat, 19 Mar 2016 18:59:05 -0500
Message-ID: <20160319235905.GA16539@rob-hp-laptop>
References: <1458204222-31149-1-git-send-email-yassinjaffer@gmail.com>
 <1458204222-31149-2-git-send-email-yassinjaffer@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1458204222-31149-2-git-send-email-yassinjaffer@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: yassinjaffer@gmail.com
Cc: dev@linux-sunxi.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Hans de Goede <hdegoede@redhat.com>, Reinder de Haan <patchesrdh@mveas.com>, Jens Kuske <jenskuske@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 17, 2016 at 07:43:42PM +1100, yassinjaffer@gmail.com wrote:
> From: Yassin Jaffer <yassinjaffer@gmail.com>
> 
> This patch adds a composite clock type consisting of
> a clock gate, mux, configurable dividers, and a reset control.
> 
> Signed-off-by: Yassin Jaffer <yassinjaffer@gmail.com>
> ---
>  Documentation/devicetree/bindings/clock/sunxi.txt |   1 +

I wish someone would just add all the sunxi clocks in one pass instead 
of one by one.

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/clk/sunxi/Makefile                        |   1 +
>  drivers/clk/sunxi/clk-a10-csi.c                   | 188 ++++++++++++++++++++++
>  3 files changed, 190 insertions(+)
>  create mode 100644 drivers/clk/sunxi/clk-a10-csi.c
