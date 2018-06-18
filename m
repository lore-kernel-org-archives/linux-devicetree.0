From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 1/3] ARM: dts: NSP: Fix i2c controller interrupt type
Date: Mon, 18 Jun 2018 09:36:59 -0700
Message-ID: <20180618163659.27039-1-f.fainelli@gmail.com>
References: <20180611224714.7007-1-f.fainelli@gmail.com> <20180611224714.7007-2-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180611224714.7007-2-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, 11 Jun 2018 15:47:12 -0700, Florian Fainelli <f.fainelli@gmail.com> wrote:
> The i2c controller should use IRQ_TYPE_LEVEL_HIGH instead of
> IRQ_TYPE_NONE.
> 
> Fixes: 0f9f27a36d09 ("ARM: dts: NSP: Add I2C support to the DT")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---

Applied to devicetree/fixes, thanks!
--
Florian
