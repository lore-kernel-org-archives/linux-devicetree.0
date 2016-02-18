From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/5] dt-bindings: ata: add compatible string for iProc
 AHCI controller
Date: Thu, 18 Feb 2016 08:38:19 -0600
Message-ID: <20160218143819.GA9654@rob-hp-laptop>
References: <1455604420-11300-1-git-send-email-anup.patel@broadcom.com>
 <1455604420-11300-5-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1455604420-11300-5-git-send-email-anup.patel@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anup Patel <anup.patel@broadcom.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Florian Fainelli <f.fainelli@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, Device Tree <devicetree@vger.kernel.org>, Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jon.mason@broadcom.com>, Linux Kernel <linux-kernel@vger.kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 16, 2016 at 12:03:39PM +0530, Anup Patel wrote:
> The Broadcom iProc SoCs have AHCI compliant SATA controller. This
> patch adds common compatible string for AHCI SATA controller on
> iProc SoCs.
> 
> Signed-off-by: Anup Patel <anup.patel@broadcom.com>
> ---
>  Documentation/devicetree/bindings/ata/ahci-platform.txt | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring <robh@kernel.org>
