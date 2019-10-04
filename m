From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: rockchip: add missing #msi-cells to rk3399
Date: Fri, 04 Oct 2019 21:52:40 +0200
Message-ID: <3758829.B9nFNygdid@phil>
References: <20190917083625.25818-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190917083625.25818-1-heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-rockchip@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 17. September 2019, 10:36:25 CEST schrieb Heiko Stuebner:
> The rk3399 gic-its was missing the #msi-cells property as found by
> dt-schema checks, so add it.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

applied for 5.5
