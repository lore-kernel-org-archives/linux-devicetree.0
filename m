From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v11 1/2] clk: npcm750: Add binding for Nuvoton NPCM7XX
 clock\n
Date: Sun, 18 Mar 2018 07:52:25 -0500
Message-ID: <20180318125225.sp7ppfumxhcbzbfm@rob-hp-laptop>
References: <1521121518-32217-1-git-send-email-tali.perry1@gmail.com>
 <1521121518-32217-2-git-send-email-tali.perry1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1521121518-32217-2-git-send-email-tali.perry1@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tali Perry <tali.perry1@gmail.com>
Cc: brendanhiggins@google.com, mark.rutland@arm.com, linux@armlinux.org.uk, avifishman70@gmail.com, tmaimon77@gmail.com, raltherr@google.com, mturquette@baylibre.com, sboyd@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 15, 2018 at 03:45:17PM +0200, Tali Perry wrote:
> * Nuvoton NPCM7XX Clock Controller

Trailing '\n' on the subject.
> 
> Nuvoton Poleg BMC NPCM7XX contains an integrated clock controller, which
> generates and supplies clocks to all modules within the BMC.
> 
> 10 ==> 11
> update documentation. "eth" replaced with "ethernet" in use case eaxample.
> 
> 2 ==> 10
> update documentation. add external clocks as inputs to clk driver.
> fix SPDX comment.
> 
> 1 ==> 2
> This patch includes fix request described here:
> https://patchwork.kernel.org/patch/10200033/
> (move fixed clocks to DT)

Changelog goes after the '---' so it doesn't end up in the git commit.

> 
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> 
> ---
> 
> 
>  .../bindings/clock/nuvoton,npcm750-clk.txt         | 100 +++++++++++++++++++++
>  include/dt-bindings/clock/nuvoton,npcm7xx-clock.h  |  44 +++++++++
>  2 files changed, 144 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.txt
>  create mode 100644 include/dt-bindings/clock/nuvoton,npcm7xx-clock.h

With those fixed,

Reviewed-by: Rob Herring <robh@kernel.org>
