From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 3/7] ARM: dts: bcm-mobile: Fix most DTC W=1 warnings
Date: Tue, 11 Jun 2019 14:54:40 -0700
Message-ID: <20190611215440.10245-1-f.fainelli@gmail.com>
References: <20190528230134.27007-1-f.fainelli@gmail.com> <20190528230134.27007-4-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190528230134.27007-4-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, =?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, 28 May 2019 16:01:30 -0700, Florian Fainelli <f.fainelli@gmail.com> wrote:
> Fix the bulk of the unit_address_vs_reg warnings and unnecessary
> \#address-cells/#size-cells without "ranges" or child "reg" property
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---

Applied to devicetree/next, thanks!
--
Florian
