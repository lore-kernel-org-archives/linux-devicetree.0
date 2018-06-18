From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: HR2: Fix interrupt types for i2c and PCIe
Date: Mon, 18 Jun 2018 09:37:10 -0700
Message-ID: <20180618163710.27207-1-f.fainelli@gmail.com>
References: <20180611224714.7007-1-f.fainelli@gmail.com> <20180611224714.7007-4-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180611224714.7007-4-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, 11 Jun 2018 15:47:14 -0700, Florian Fainelli <f.fainelli@gmail.com> wrote:
> The i2c and PCIe controllers had an incorrect type which should have
> been set to IRQ_TYPE_LEVEL_HIGH, fix that.
> 
> Fixes: b9099ec754b5 ("ARM: dts: Add Broadcom Hurricane 2 DTS include file")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---

Applied to devicetree/fixes, thanks!
--
Florian
