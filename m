From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v4 0/3] clk: Broadcom BCM63138 support
Date: Thu, 19 Nov 2015 17:02:36 -0800
Message-ID: <564E712C.50309@gmail.com>
References: <1446168199-5959-1-git-send-email-f.fainelli@gmail.com> <564E70A4.8060001@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <564E70A4.8060001@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, linux-clk@vger.kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, jonmason@broadcom.com, sboyd@codeaurora.org, mturquette@baylibre.com, linux@arm.linux.org.uk, sbranden@broadcom.com, rjui@broadcom.com
List-Id: devicetree@vger.kernel.org

On 19/11/15 17:00, Florian Fainelli wrote:
> On 29/10/15 18:23, Florian Fainelli wrote:
>> This patch series adds support for the Broadcom BCM63138 DSL SoCs
>> clocking framework.
>>
>> Since the HW is identical to the one found in Broadcom iProc SoCs, but the
>> integration is different (obviously), there is still a new compatible string
>> introduced just in case we happen to find issues in the future.
>>
>> Stephen, could you stage the two patches in a clk-bcm63xx branch that I could
>> later utilize while doing the arm-soc DT pull request?
> 
> Stephen, can you queue the first two patches in a topic branch for me to
> merge as part of the commit adding the DTS changes?

Well, now that I look back at the changes, you can actually merge the
two patches in clk-next, and the DTS changes can come in before or
after, it does not really matter, this would not cause breakage or
anything. Sorry for the noise.

> 
> Thanks!
> 
>>
>> Thank you!
>>
>> Florian Fainelli (3):
>>   clk: iproc: Extend binding to cover BCM63138
>>   clk: bcm: Add BCM63138 clock support
>>   ARM: dts: BCM63xx: Add ARMPLL device tree nodes
>>
>>  .../bindings/clock/brcm,iproc-clocks.txt           |  5 +++
>>  arch/arm/boot/dts/bcm63138.dtsi                    | 36 +++++++++++++++++-----
>>  drivers/clk/bcm/Kconfig                            | 10 ++++++
>>  drivers/clk/bcm/Makefile                           |  1 +
>>  drivers/clk/bcm/clk-bcm63xx.c                      | 22 +++++++++++++
>>  5 files changed, 66 insertions(+), 8 deletions(-)
>>  create mode 100644 drivers/clk/bcm/clk-bcm63xx.c
>>
> 
> 


-- 
Florian
