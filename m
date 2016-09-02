From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v5 2/4] ARM: dts: rockchip: update compatible strings for Rockchip efuse
Date: Fri, 02 Sep 2016 17:48:39 +0200
Message-ID: <18429499.x7qIytyN63@diego>
References: <1472786217-52214-1-git-send-email-finley.xiao@rock-chips.com> <1472786217-52214-3-git-send-email-finley.xiao@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1472786217-52214-3-git-send-email-finley.xiao@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Finley Xiao <finley.xiao@rock-chips.com>
Cc: srinivas.kandagatla@linaro.org, maxime.ripard@free-electrons.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, dianders@chromium.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, wxt@rock-chips.com, zhengsq@rock-chips.com, jay.xu@rock-chips.com, huangtao@rock-chips.com, tony.xie@rock-chips.com, cl@rock-chips.com
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 1. September 2016, 20:16:55 schrieb Finley Xiao:
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

due to the new compatible values, this would cause a regression (existing 
functionality breaking) when used without the efuse change, so I've put this 
patch into a branch for 4.10 with Doug's review, so that the code change is 
definitly existing by then.


Heiko
