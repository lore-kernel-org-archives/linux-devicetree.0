From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: fix rk3300-gru-bob graph_port warning
Date: Sun, 27 Jan 2019 22:08:00 +0100
Message-ID: <4055651.A8C7SXy0L7@phil>
References: <20190126103730.3883-1-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190126103730.3883-1-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: devicetree@vger.kernel.org, Vicente Bergas <vicencb@gmail.com>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, kernel@collabora.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Samstag, 26. Januar 2019, 11:37:28 CET schrieb Enric Balletbo i Serra:
> Ports are described by child 'port' nodes contained in the device node.
> 'ports' is optional and is used to group all 'port' nodes which is not
> the case here.
> 
> This patch fixes the following warning:
> 
> arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dts:25.9-29.5: Warning (graph_port): /edp-panel/ports: graph port node name should be 'port'
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

I've squashed all 3 into one and applied the result as fix for 5.0

Thanks
Heiko
