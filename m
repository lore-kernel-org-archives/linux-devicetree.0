From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/3] PCI: Add quirks for devices found on Cavium ThunderX SoCs.
Date: Fri, 18 Sep 2015 09:19:46 +0200
Message-ID: <3066583.BWDZlYWxXU@wuerfel>
References: <1442529694-1792-1-git-send-email-ddaney.cavm@gmail.com> <1442529694-1792-3-git-send-email-ddaney.cavm@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1442529694-1792-3-git-send-email-ddaney.cavm@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: David Daney <ddaney.cavm@gmail.com>, linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, David Daney <david.daney@cavium.com>
List-Id: devicetree@vger.kernel.org

On Thursday 17 September 2015 15:41:33 David Daney wrote:
> From: David Daney <david.daney@cavium.com>
> 
> The on-chip devices all have fixed bars.  So, fix them up.
> 
> Signed-off-by: David Daney <david.daney@cavium.com>
> 

You should be able to just mark the BARs as fixed in DT and not need
this hack. If that doesn't work with current kernels, it would be
better to fix the kernel to respect the flags.

	Arnd
