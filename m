From: Romain Perier <romain.perier@gmail.com>
Subject: Re: [PATCH v4 4/5] ARM: dts: add rk3288 usb PHY
Date: Tue, 9 Dec 2014 15:13:29 +0100
Message-ID: <CABgxDoJ_anqvD215see84RJ2U04kExyouaN1CNUCTYJ9+XMSig@mail.gmail.com>
References: <1418093554-30671-1-git-send-email-lyz@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1418093554-30671-1-git-send-email-lyz@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yunzhi Li <lyz@rock-chips.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, "pawel.moll" <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, ijc+devicetree <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-rockchip@lists.infradead.org, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

2014-12-09 3:52 GMT+01:00 Yunzhi Li <lyz@rock-chips.com>:
> This patch adds a device_node for RK3288 SoC usb phy. It also
> defines the phy to be used by three usb controllers: usb_host0/1
> and usb_otg.
>
> Signed-off-by: Yunzhi Li <lyz@rock-chips.com>
>
> ---
>

Tiny thing: Could you change your short description to "ARM: dts:
rockchip: add rk3288 usb PHY" ? (as this is the case for all
devicetree related changes for a specific SoC)

Thanks,
Romain
