From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 3/4] arm64: dts: split Foundation model dts to put the
 GIC separately
Date: Wed, 09 Dec 2015 15:11:12 +0000
Message-ID: <56684490.8000007@arm.com>
References: <1444729069-27922-1-git-send-email-andre.przywara@arm.com> <1444729069-27922-4-git-send-email-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444729069-27922-4-git-send-email-andre.przywara@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andre Przywara <andre.przywara@arm.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk
Cc: catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, galak@codeaurora.org, drjones@redhat.com
List-Id: devicetree@vger.kernel.org

On 13/10/15 10:37, Andre Przywara wrote:
> The ARMv8 Foundation model can be run with a GICv2 or a GICv3.
> To prepare for the GICv3 version of the .dts without code duplication,
> move most of the nodes of the existing DT (except the GIC) into an
> include file and just keep that include statement and the GIC node in
> the current foundation-v8.dts.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Marc Zyngier <marc.zyngier@arm.com>

	M.
-- 
Jazz is not dead. It just smells funny...
