From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] ARM: dts: BCM5301x: Fix i2c controller interrupt type
Date: Mon, 18 Jun 2018 09:37:17 -0700
Message-ID: <20180618163717.27294-1-f.fainelli@gmail.com>
References: <20180611225340.12733-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180611225340.12733-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@infradead.org
Cc: Hauke Mehrtens <hauke@hauke-m.de>, =?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>, Jon Mason <jonmason@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, 11 Jun 2018 15:53:40 -0700, Florian Fainelli <f.fainelli@gmail.com> wrote:
> The i2c controller should be using IRQ_TYPE_LEVEL_HIGH, fix that.
> 
> Fixes: bb097e3e0045 ("ARM: dts: BCM5301X: Add I2C support to the DT")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---

Applied to devicetree/fixes, thanks!
--
Florian
