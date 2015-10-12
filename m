From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 2/5] mtd: nand: Allow MTD_NAND_BRCMNAND to be selected
 for ARM64
Date: Mon, 12 Oct 2015 14:20:38 -0700
Message-ID: <20151012212038.GP107187@google.com>
References: <1443808606-21203-1-git-send-email-anup.patel@broadcom.com>
 <1443808606-21203-3-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1443808606-21203-3-git-send-email-anup.patel@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anup Patel <anup.patel@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, David Woodhouse <dwmw2@infradead.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Pramod KUMAR <pramodku@broadcom.com>, Vikram Prakash <vikramp@broadcom.com>, Sandeep Tripathy <tripathy@broadcom.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On Fri, Oct 02, 2015 at 11:26:43PM +0530, Anup Patel wrote:
> The BRCM NAND driver can be re-used for Broadcom ARM64 SoCs hence
> this patch updates Kconfig to allow selection of MTD_NAND_BRCMNAND
> for ARM64.
> 
> Signed-off-by: Anup Patel <anup.patel@broadcom.com>
> Reviewed-by: Vikram Prakash <vikramp@broadcom.com>
> Reviewed-by: Ray Jui <rjui@broadcom.com>
> Reviewed-by: Pramod KUMAR <pramodku@broadcom.com>
> Reviewed-by: Scott Branden <sbranden@broadcom.com>

Pushed to l2-mtd.git
