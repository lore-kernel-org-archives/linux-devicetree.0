From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 2/2] clk: uniphier: add clock data for UniPhier SoCs
Date: Thu, 4 Aug 2016 12:04:24 -0500
Message-ID: <20160804170424.GA10741@rob-hp-laptop>
References: <1470111307-21078-1-git-send-email-yamada.masahiro@socionext.com>
 <1470111307-21078-3-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1470111307-21078-3-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 02, 2016 at 01:14:54PM +0900, Masahiro Yamada wrote:
> Add clock data arrays for all UniPhier SoCs.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  .../devicetree/bindings/clock/uniphier-clock.txt   | 134 ++++++++++++++++++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/clk/uniphier/Makefile                      |   3 +
>  drivers/clk/uniphier/clk-uniphier-core.c           |  91 +++++++++++++
>  drivers/clk/uniphier/clk-uniphier-mio.c            | 103 ++++++++++++++
>  drivers/clk/uniphier/clk-uniphier-peri.c           |  59 ++++++++
>  drivers/clk/uniphier/clk-uniphier-sys.c            | 151 +++++++++++++++++++++
>  drivers/clk/uniphier/clk-uniphier.h                |  13 ++
>  7 files changed, 554 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/uniphier-clock.txt
>  create mode 100644 drivers/clk/uniphier/clk-uniphier-mio.c
>  create mode 100644 drivers/clk/uniphier/clk-uniphier-peri.c
>  create mode 100644 drivers/clk/uniphier/clk-uniphier-sys.c
