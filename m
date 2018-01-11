From: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH] arm64: dts: socfpga: add missing interrupt-parent
Date: Thu, 11 Jan 2018 08:35:58 -0600
Message-ID: <e3a44268-88f2-3dbd-a992-f9484a82d826@kernel.org>
References: <20180110210431.2330267-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180110210431.2330267-1-arnd@arndb.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: arm@kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Alan Tull <atull@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 01/10/2018 03:04 PM, Arnd Bergmann wrote:
> The PMU node has no working interrupt, as shown by this dtc warning:
> 
> arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtb: Warning (interrupts_property): Missing interrupt-parent for /pmu
> 
> This adds an interrupt-parent property so we can correct parse
> that interrupt number.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> If this looks ok, I'd apply it directly to the fixes branch
> for 4.15, as the warning is one that was introduced in this
> release.

Acked-by: Dinh Nguyen <dinguyen@kernel.org>

Yes, please feel free to apply it. And thanks alot!

Dinh
