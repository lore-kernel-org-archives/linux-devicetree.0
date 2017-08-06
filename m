From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 1/5] arm64: dts: rockchip: Add rk3399 vop and display-subsystem
Date: Sun, 06 Aug 2017 15:45:28 +0200
Message-ID: <3297411.sT6PaoiFec@phil>
References: <1500301019-9960-1-git-send-email-jacob-chen@iotwrt.com> <1500301019-9960-2-git-send-email-jacob-chen@iotwrt.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500301019-9960-2-git-send-email-jacob-chen@iotwrt.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacob Chen <jacob-chen@iotwrt.com>
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Mark Yao <mark.yao@rock-chips.com>, Yakir Yang <ykk@rock-chips.com>, Caesar Wang <wxt@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Am Montag, 17. Juli 2017, 22:16:55 CEST schrieb Jacob Chen:
> From: Mark Yao <mark.yao@rock-chips.com>
> 
> Add devicetree nodes for rk3399 VOP (Video Output Processors), and the
> top level display-subsystem root node.
> 
> Later patches add endpoints (eDP, HDMI, MIPI, etc) that attach to the
> VOPs' output ports.
> 
> Signed-off-by: Mark Yao <mark.yao@rock-chips.com>
> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> Signed-off-by: Caesar Wang <wxt@rock-chips.com>
> Signed-off-by: Jacob Chen <jacob-chen@iotwrt.com>

applied for 4.14 after moving the display-subsystem node between
cpus and pmu nodes (alphabetical sorting)


Thanks
Heiko
