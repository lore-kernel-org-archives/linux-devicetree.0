From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] arm64: dts: berlin4ct: switch to Cortex-A53 specific pmu nodes
Date: Tue, 15 Dec 2015 15:43:53 +0100
Message-ID: <8261316.NuheDtlQ6N@wuerfel>
References: <1450190172-1161-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450190172-1161-1-git-send-email-jszhang@marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jisheng Zhang <jszhang@marvell.com>
Cc: sebastian.hesselbarth@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tuesday 15 December 2015 22:36:12 Jisheng Zhang wrote:
> -               compatible = "arm,armv8-pmuv3";
> +               compatible = "arm,cortex-a53-pmu";
> 

Should this list both?

	Arnd
