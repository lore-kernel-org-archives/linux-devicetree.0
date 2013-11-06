From: Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 2/3] clk: shmobile: Add MSTP clock support
Date: Wed, 6 Nov 2013 17:33:39 +0900
Message-ID: <CANqRtoRe2repacDdWhoZxY7sMP=AOhW=Mtwm3P9AgzVvwoBGKA@mail.gmail.com>
References: <1383058511-26046-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
	<1383058511-26046-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1383058511-26046-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-sh-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: SH-Linux <linux-sh@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Mike Turquette <mturquette@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Laurent,

On Tue, Oct 29, 2013 at 11:55 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> MSTP clocks are gate clocks controlled through a register that handles
> up to 32 clocks. The register is often sparsely populated.
>
> Those clocks are found on Renesas ARM SoCs.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../bindings/clock/renesas,cpg-mstp-clocks.txt     |  47 +++++
>  drivers/clk/shmobile/Makefile                      |   1 +
>  drivers/clk/shmobile/clk-mstp.c                    | 229 +++++++++++++++++++++
>  include/dt-bindings/clock/r8a7790-clock.h          |  56 +++++
>  4 files changed, 333 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt
>  create mode 100644 drivers/clk/shmobile/clk-mstp.c

Thanks for this. The MSTP driver looks fine to me, but..

>  create mode 100644 include/dt-bindings/clock/r8a7790-clock.h

.. why do you bundle r8a7790-specific bits with the generic MSTP
driver in this patch?

It looks to me that you want these r8a7790 bits included with the
r8a7790 support code.

Cheers,

/ magnus
