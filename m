From: Rob Herring <robh@kernel.org>
Subject: Re: [RESEND PATCH v7 2/4] phy: rockchip-usb: use
 rockchip_usb_phy_reset to reset phy during wakeup
Date: Mon, 19 Sep 2016 16:28:43 -0500
Message-ID: <20160919212843.GA18511@rob-hp-laptop>
References: <1473447580-10369-1-git-send-email-ayaka@soulik.info>
 <1473447580-10369-3-git-send-email-ayaka@soulik.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1473447580-10369-3-git-send-email-ayaka@soulik.info>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Li <ayaka@soulik.info>
Cc: linux-usb@vger.kernel.org, John.Youn@synopsys.com, kishon@ti.com, felipe.balbi@linux.intel.com, mark.rutland@arm.com, devicetree@vger.kernel.org, heiko@sntech.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, randy.li@rock-chips.com
List-Id: devicetree@vger.kernel.org

On Sat, Sep 10, 2016 at 02:59:38AM +0800, Randy Li wrote:
> It is a hardware bug in RK3288, the only way to solve it is to
> reset the phy.
> 
> Signed-off-by: Randy Li <ayaka@soulik.info>
> ---
>  .../devicetree/bindings/phy/rockchip-usb-phy.txt     |  3 +++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/phy/phy-rockchip-usb.c                       | 20 ++++++++++++++++++++
>  2 files changed, 23 insertions(+)
