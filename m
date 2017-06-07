From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH 0/2] Broadcom Stingray SATA PHY support
Date: Wed, 7 Jun 2017 17:59:18 +0530
Message-ID: <571281f4-ff88-3810-5a1f-0b16f8470ce2@ti.com>
References: <1496653235-22757-1-git-send-email-srinath.mannam@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1496653235-22757-1-git-send-email-srinath.mannam@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinath Mannam <srinath.mannam@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Tejun Heo <tj@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <ray.jui@broadcom.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org



On Monday 05 June 2017 02:30 PM, Srinath Mannam wrote:
> This patchset extends the Broadcom SATA PHY driver to add
> support for Stingray SATA PHY.

Please rebase the series to linux-phy -next.

Thanks
Kishon
> 
> All patches are based on Linux-4.12-rc2.
> 
> Srinath Mannam (2):
>   dt-bindings: Update documentation for stingray SATA phy
>   phy: Add stingray SATA phy support
> 
>  .../devicetree/bindings/phy/brcm-sata-phy.txt      |  7 ++-
>  drivers/phy/phy-brcm-sata.c                        | 73 ++++++++++++++++++++++
>  2 files changed, 77 insertions(+), 3 deletions(-)
> 
