From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/3] phy: rockchip-emmc: should be a child device of
 the GRF
Date: Fri, 25 Mar 2016 09:51:52 -0500
Message-ID: <20160325145152.GA32438@rob-hp-laptop>
References: <1458854943-17388-1-git-send-email-heiko@sntech.de>
 <1458854943-17388-2-git-send-email-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1458854943-17388-2-git-send-email-heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: kishon@ti.com, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, shawn.lin@rock-chips.com, ykk@rock-chips.com, devicetree@vger.kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 24, 2016 at 10:29:02PM +0100, Heiko Stuebner wrote:
> The emmc-phy is fully enclosed in the general register files (GRF).
> Therefore as seen from the device-tree it shouldn't be a separate platform-
> device but instead a sub-device of the GRF - using the simply-mfd mechanism.
> 
> The driver entered the kernel in the current merge-window, so we can still
> adapt the binding without needing a fallback, as the binding hasn't been
> released with a full kernel yet.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
> Hi Shawn, Kishon,
> 
> I didn't see this new phy driver until now, so I'd really like to get
> this sorted before the old binding solidifies :-).
> 
> I'll convert the usbphy as well, but that has to have the fallback for
> the old binding, so is not as urgent as these two.
> 
> As mentioned in the patch description above, this is meant as a fixup for
> kernel 4.6.
> 
> 
> changes in v2: drop forgotten rockchip,grf from example
> 
> 
>  .../devicetree/bindings/phy/rockchip-emmc-phy.txt     | 19 ++++++++++++-------
>  drivers/phy/phy-rockchip-emmc.c                       |  5 ++++-
>  2 files changed, 16 insertions(+), 8 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
