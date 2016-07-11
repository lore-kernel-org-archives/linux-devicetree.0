From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 4/5] usb: dwc3: add dis_del_phy_power_chg_quirk
Date: Mon, 11 Jul 2016 10:11:00 -0500
Message-ID: <20160711151100.GA28081@rob-hp-laptop>
References: <1467860066-15142-1-git-send-email-william.wu@rock-chips.com>
 <1467860066-15142-5-git-send-email-william.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1467860066-15142-5-git-send-email-william.wu@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: William Wu <william.wu@rock-chips.com>
Cc: gregkh@linuxfoundation.org, balbi@kernel.org, heiko@sntech.de, linux-rockchip@lists.infradead.org, briannorris@google.com, dianders@google.com, kever.yang@rock-chips.com, huangtao@rock-chips.com, frank.wang@rock-chips.com, eddie.cai@rock-chips.com, John.Youn@synopsys.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, sergei.shtylyov@cogentembedded.com, mark.rutland@arm.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 07, 2016 at 10:54:25AM +0800, William Wu wrote:
> Add a quirk to clear the GUSB3PIPECTL.DELAYP1TRANS bit,
> which specifies whether disable delay PHY power change
> from P0 to P1/P2/P3 when link state changing from U0
> to U1/U2/U3 respectively.
> 
> Signed-off-by: William Wu <william.wu@rock-chips.com>
> ---
> Changes in v6:
> - use '-' instead of '_' in dts (Rob Herring)
> 
> Changes in v5:
> - None
> 
> Changes in v4:
> - rebase on top of balbi testing/next, remove pdata (balbi)
> 
> Changes in v3:
> - None
> 
> Changes in v2:
> - None
> 
>  Documentation/devicetree/bindings/usb/dwc3.txt | 2 ++
>  drivers/usb/dwc3/core.c                        | 5 +++++
>  drivers/usb/dwc3/core.h                        | 3 +++
>  3 files changed, 10 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
