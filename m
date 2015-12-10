From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH 0/2] arm: dts: berlin: fix BG2Q sdhci clk
Date: Thu, 10 Dec 2015 21:18:04 +0100
Message-ID: <5669DDFC.7010706@gmail.com>
References: <1449493765-5111-1-git-send-email-jszhang@marvell.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449493765-5111-1-git-send-email-jszhang@marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jisheng Zhang <jszhang@marvell.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 07.12.2015 14:09, Jisheng Zhang wrote:
> CLKID_SDIO is used as the 2nd optional clk for all sdhci hosts in BG2Q.
> We removed CLK_IGNORE_UNUSED from CLKID_SDIO's flag. These two patches
> fixes this clk issue.
> 
> Jisheng Zhang (2):
>   ARM: dts: berlin: correct BG2Q's sdhci2 2nd clock
>   ARM: dts: berlin: add 2nd clock for BG2Q sdhci0 and sdhci1
> 
>  arch/arm/boot/dts/berlin2q.dtsi | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Series applied to berlin/fixes.

Thanks!

Sebastian
