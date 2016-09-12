From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/4] nvmem: rockchip-efuse: update compatible strings
 for Rockchip efuse
Date: Mon, 12 Sep 2016 10:35:08 -0500
Message-ID: <20160912153508.GA25555@rob-hp-laptop>
References: <1472786217-52214-1-git-send-email-finley.xiao@rock-chips.com>
 <1472786217-52214-2-git-send-email-finley.xiao@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1472786217-52214-2-git-send-email-finley.xiao@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Finley Xiao <finley.xiao@rock-chips.com>
Cc: srinivas.kandagatla@linaro.org, maxime.ripard@free-electrons.com, mark.rutland@arm.com, heiko@sntech.de, linux@armlinux.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, dianders@chromium.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, wxt@rock-chips.com, zhengsq@rock-chips.com, jay.xu@rock-chips.com, huangtao@rock-chips.com, tony.xie@rock-chips.com, cl@rock-chips.com
List-Id: devicetree@vger.kernel.org

On Thu, Sep 01, 2016 at 08:16:54PM -0700, Finley Xiao wrote:
> Rk3399-efuse is organized as 32bits by 32 one-time programmable electrical
> fuses. The efuse of earlier SoCs are organized as 32bits by 8 one-time
> programmable electrical fuses with random access interface.
> 
> Add different device tree compatible string for different SoCs to be able
> to differentiate between the two. The old binding is of course preserved,
> though deprecated.
> 
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
