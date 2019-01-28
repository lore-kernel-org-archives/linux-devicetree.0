From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 2/2] arm64: dts: armada-3720-espressobin: Set mv88e6341
 cpu port as RGMII-ID
Date: Mon, 28 Jan 2019 21:21:29 +0100
Message-ID: <20190128202129.GA11826@lunn.ch>
References: <20190128200728.17747-1-repk@triplefau.lt>
 <20190128200728.17747-3-repk@triplefau.lt>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190128200728.17747-3-repk@triplefau.lt>
Sender: linux-kernel-owner@vger.kernel.org
To: Remi Pommarel <repk@triplefau.lt>
Cc: Jason Cooper <jason@lakedaemon.net>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 28, 2019 at 09:07:28PM +0100, Remi Pommarel wrote:
> The mv88e6341 ethernet switch needs the cpu port control register to be
> set with TX and RX internal delay in order to work.
> 
> This fixes ethernet support on system booted via a bootloader that
> has not already configured this register (e.g. mainline u-boot, or
> vendor u-boot compiled without ethernet support).
> 
> Signed-off-by: Remi Pommarel <repk@triplefau.lt>

Looks sensible

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
