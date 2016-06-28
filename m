From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 10/19] sh: SH7750/51 CPG Driver
Date: Tue, 28 Jun 2016 16:02:53 -0500
Message-ID: <20160628210253.GA8004@rob-hp-laptop>
References: <1467095795-5082-1-git-send-email-ysato@users.sourceforge.jp>
 <1467095795-5082-11-git-send-email-ysato@users.sourceforge.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1467095795-5082-11-git-send-email-ysato@users.sourceforge.jp>
Sender: linux-kernel-owner@vger.kernel.org
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-sh@veger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 28, 2016 at 03:36:26PM +0900, Yoshinori Sato wrote:
> Convert SH specific clock framework to CCF.
> 
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  .../bindings/clock/renesas,sh7750-cpg.txt          |  25 ++

Acked-by: Rob Herring <robh@kernel.org>

>  arch/sh/boards/Kconfig                             |   1 +
>  arch/sh/kernel/cpu/Makefile                        |   8 +-
>  arch/sh/kernel/cpu/clock.c                         |   6 +-
>  drivers/clk/Kconfig                                |   1 +
>  drivers/clk/Makefile                               |   3 +-
>  drivers/clk/sh/Kconfig                             |   2 +
>  drivers/clk/sh/Makefile                            |   1 +
>  drivers/clk/sh/clk-sh7750cpg.c                     | 344 +++++++++++++++++++++
>  9 files changed, 387 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,sh7750-cpg.txt
>  create mode 100644 drivers/clk/sh/Kconfig
>  create mode 100644 drivers/clk/sh/Makefile
>  create mode 100644 drivers/clk/sh/clk-sh7750cpg.c
