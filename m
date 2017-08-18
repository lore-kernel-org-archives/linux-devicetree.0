From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: rk3399: init vop clock rates
Date: Sat, 19 Aug 2017 01:13:25 +0200
Message-ID: <3118300.aNFzDAHPf8@phil>
References: <1502851869-1736-1-git-send-email-kever.yang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502851869-1736-1-git-send-email-kever.yang@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kever Yang <kever.yang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, Douglas Anderson <dianders@chromium.org>, William wu <wulf@rock-chips.com>, Elaine Zhang <zhangqing@rock-chips.com>, Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Jacob Chen <jacob-chen@iotwrt.com>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Caesar Wang <wxt@rock-chips.com>, Catalin Marinas <catalin.marinas@arm.com>, Roger Chen <roger.chen@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 16. August 2017, 10:51:09 CEST schrieb Kever Yang:
> We need to init vop aclk and hclk incase the U-Boot does not do
> the initialize.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>

applied for 4.14 with Marks review-tag after adapting the patch subject
and moving the properties slight higher


Thanks
Heiko
