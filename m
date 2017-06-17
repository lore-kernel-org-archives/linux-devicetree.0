From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v1 2/2] ARM: dts: rk322x: add spdif node
Date: Sat, 17 Jun 2017 19:56:29 +0200
Message-ID: <2530167.bvmFb2R02b@phil>
References: <1496995173-63532-1-git-send-email-sugar.zhang@rock-chips.com> <1496995173-63532-3-git-send-email-sugar.zhang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1496995173-63532-3-git-send-email-sugar.zhang@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sugar Zhang <sugar.zhang@rock-chips.com>
Cc: broonie@kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Freitag, 9. Juni 2017, 15:59:33 CEST schrieb Sugar Zhang:
> This patch add spdif node for rk322x.
> 
> Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>

applied, after adapting the subject to
	ARM: dts: rockchip: add rk322x spdif node

and dropping the #dma-cells property.
#dma-cells is a property of dma-controllers not dma-clients.


Heiko
