From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] clk: uniphier: remove sLD3 SoC support
Date: Thu, 3 Aug 2017 13:39:14 -0500
Message-ID: <20170803183914.dxus5l2dgscfx6gi@rob-hp-laptop>
References: <1501040075-24279-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1501040075-24279-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-clk-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 26, 2017 at 12:34:35PM +0900, Masahiro Yamada wrote:
> This SoC is too old.  It is difficult to maintain any longer.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  .../devicetree/bindings/clock/uniphier-clock.txt   |  5 ---
>  drivers/clk/uniphier/clk-uniphier-core.c           | 16 +++------
>  drivers/clk/uniphier/clk-uniphier-mio.c            |  4 +--
>  drivers/clk/uniphier/clk-uniphier-sys.c            | 42 ++++++++--------------
>  drivers/clk/uniphier/clk-uniphier.h                |  3 +-
>  5 files changed, 20 insertions(+), 50 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
