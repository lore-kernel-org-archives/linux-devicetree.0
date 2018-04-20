From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 1/1] arm: dts: rockchip: default serial for Tinker Board
Date: Fri, 20 Apr 2018 14:56:06 +0200
Message-ID: <2049472.10qBoIBg0j@phil>
References: <20180417205623.764-1-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180417205623.764-1-xypron.glpk@gmx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 17. April 2018, 22:56:23 CEST schrieb Heinrich Schuchardt:
> The Asus Tinker Board uses serial 2 with 115,200 baud by default for
> communication in U-Boot. The same value is also chosen for other RK3288
> boards.
> 
> So let us set the same value in the Tinker Board device tree.
> 
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>

applied for 4.18

Thanks
Heiko
