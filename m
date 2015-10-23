From: Ray Jui <rjui@broadcom.com>
Subject: Re: [PATCH 0/3] clk: Broadcom BCM63138 support
Date: Fri, 23 Oct 2015 11:35:28 -0700
Message-ID: <562A7DF0.20709@broadcom.com>
References: <1445621448-11894-1-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1445621448-11894-1-git-send-email-f.fainelli@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, linux-clk@vger.kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, jonmason@broadcom.com, sboyd@codeaurora.org, mturquette@baylibre.com, linux@arm.linux.org.uk, sbranden@broadcom.com
List-Id: devicetree@vger.kernel.org

Hi Florian,

On 10/23/2015 10:30 AM, Florian Fainelli wrote:
> Hi all,
>
> This patch series adds support for the Broadcom BCM63138 DSL SoCs
> clocking framework.
>
> Since the HW is identical to the one found in Broadcom iProc SoCs, but the
> integration is different (obviously), there is still a new compatible string
> introduced just in case we happen to find issues in the future.
>
> This applies on top of clk/next as of
>
> f63d19ef52aa66e97fca2425974845177ce02b0a ("Merge branch 'clk-iproc' into clk-next")
>
> Since there is an obvious dependency between patch 2 and 3, we can either
> merge this through the Clock tree or via a future arm-soc pull requests
> for Broadcom SoCs.
>
> Thanks!
>
> Florian Fainelli (3):
>    clk: iproc: Extend binding to cover BCM63138
>    clk: bcm: Add BCM63138 clock support
>    ARM: dts: BCM63xx: Add ARMPLL device tree nodes
>
>   .../bindings/clock/brcm,iproc-clocks.txt           |  5 +++
>   arch/arm/boot/dts/bcm63138.dtsi                    | 39 ++++++++++++++++------
>   drivers/clk/bcm/Kconfig                            | 10 ++++++
>   drivers/clk/bcm/Makefile                           |  1 +
>   drivers/clk/bcm/clk-bcm63xx.c                      | 22 ++++++++++++
>   5 files changed, 67 insertions(+), 10 deletions(-)
>   create mode 100644 drivers/clk/bcm/clk-bcm63xx.c
>

The entire patch set looks good to me (- Scott's comment of adding 
COMPILE_TEST to increase build test coverage).

Thanks,

Ray
