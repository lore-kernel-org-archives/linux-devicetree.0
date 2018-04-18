From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] arm64: dts: correct SATA addresses for Stingray
Date: Wed, 18 Apr 2018 11:31:17 -0700
Message-ID: <20180418183117.14237-1-f.fainelli@gmail.com>
References: <1524040889-6876-1-git-send-email-srinath.mannam@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524040889-6876-1-git-send-email-srinath.mannam@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bcm-kernel-feedback-list@broadcom.com, Srinath Mannam <srinath.mannam@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Scott Branden <scott.branden@broadcom.com>, Ray Jui <ray.jui@broadcom.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 18 Apr 2018 14:11:29 +0530, Srinath Mannam <srinath.mannam@broadcom.com> wrote:
> Correct all SATA ahci and phy controller register
> addresses and interrupt lines to proper values.
> 
> Fixes: 344a2e514182 ("arm64: dts: Add SATA DT nodes for Stingray SoC")
> 
> Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
> Reviewed-by: Ray Jui <ray.jui@broadcom.com>
> Reviewed-by: Scott Branden <scott.branden@broadcom.com>
> Reviewed-by: Andrew Gospodarek <andrew.gospodarek@broadcom.com>
> ---

Applied to devicetree-arm64/fixes, thanks!
--
Florian
