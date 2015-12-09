From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 1/4] arm64: dts: prepare foundation-v8.dts to cope with
 GICv3
Date: Wed, 09 Dec 2015 15:10:20 +0000
Message-ID: <5668445C.9070702@arm.com>
References: <1444729069-27922-1-git-send-email-andre.przywara@arm.com> <1444729069-27922-2-git-send-email-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444729069-27922-2-git-send-email-andre.przywara@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andre Przywara <andre.przywara@arm.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk
Cc: catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, galak@codeaurora.org, drjones@redhat.com
List-Id: devicetree@vger.kernel.org

On 13/10/15 10:37, Andre Przywara wrote:
> To prepare the ARM foundation model to support GICv3, we adjust
> the #address-cells property of the current GICv2 node to be
> compatible with the two cells required for GICv3 later.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Marc Zyngier <marc.zyngier@arm.com>

	M.
-- 
Jazz is not dead. It just smells funny...
