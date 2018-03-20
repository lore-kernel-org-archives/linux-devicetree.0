From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v8 02/42] clk: davinci: New driver for davinci PLL clocks
Date: Tue, 20 Mar 2018 10:03:36 -0700
Message-ID: <152156541626.183971.14116213325024297115@swboyd.mtv.corp.google.com>
References: <1521168778-27236-1-git-send-email-david@lechnology.com>
 <1521168778-27236-3-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1521168778-27236-3-git-send-email-david@lechnology.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, David Lechner <david@lechnology.com>, Kevin Hilman <khilman@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Adam Ford <aford173@gmail.com>
List-Id: devicetree@vger.kernel.org

Quoting David Lechner (2018-03-15 19:52:18)
> This adds a new driver for mach-davinci PLL clocks. This is porting the
> code from arch/arm/mach-davinci/clock.c to the common clock framework.
> Additionally, it adds device tree support for these clocks.
> 
> The ifeq ($(CONFIG_COMMON_CLK), y) in the Makefile is needed to prevent
> compile errors until the clock code in arch/arm/mach-davinci is removed.
> 
> Note: although there are similar clocks for TI Keystone we are not able
> to share the code for a few reasons. The keystone clocks are device tree
> only and use legacy one-node-per-clock bindings. Also the register
> layouts are a bit different, which would add even more if/else mess
> to the keystone clocks. And the keystone PLL driver doesn't support
> setting clock rates.
> 
> Signed-off-by: David Lechner <david@lechnology.com>
> ---

Applied to clk-next
