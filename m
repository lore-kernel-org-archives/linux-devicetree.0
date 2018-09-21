From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] ARM: BCM63XX: Fix incorrect interrupt specifiers
Date: Fri, 21 Sep 2018 14:59:33 -0700
Message-ID: <20180921215933.8592-1-f.fainelli@gmail.com>
References: <20180920001402.1585-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180920001402.1585-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, 19 Sep 2018 17:14:01 -0700, Florian Fainelli <f.fainelli@gmail.com> wrote:
> A number of our interrupts were incorrectly specified, fix both the PPI
> and SPI interrupts to be correct.
> 
> Fixes: b5762cacc411 ("ARM: bcm63138: add NAND DT support")
> Fixes: 46d4bca0445a ("ARM: BCM63XX: add BCM63138 minimal Device Tree")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---

Applied to devicetree/fixes, thanks!
--
Florian
