From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2] arm: dts: rockchip: fix vcc_host_5v regulator for usb3 host
Date: Mon, 19 Aug 2019 16:43:45 +0200
Message-ID: <3811189.poQrIVWTgf@phil>
References: <20190815081252.27405-1-kever.yang@rock-chips.com> <2932927.UJgUFA1Pmh@phil> <208c56e1-bfe0-a982-927d-bdddc3116631@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <208c56e1-bfe0-a982-927d-bdddc3116631@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kever Yang <kever.yang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Jonas Karlman <jonas@kwiboo.se>, Katsuhiro Suzuki <katsuhiro@katsuster.net>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Tomohiro Mayama <parly-gh@iris.mystia.org>, Vasily Khoruzhick <anarsoul@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Kever,

Am Montag, 19. August 2019, 02:29:31 CEST schrieb Kever Yang:
> Hi Heiko,
> 
> On 2019/8/16 下午8:24, Heiko Stuebner wrote:
> > Hi Kever, TL,
> >
> > [added TL Lim for clarification]
> >
> > Am Donnerstag, 15. August 2019, 10:12:52 CEST schrieb Kever Yang:
> >> According to rock64 schemetic V2 and V3, the VCC_HOST_5V output is
> >> controlled by USB_20_HOST_DRV, which is the same as VCC_HOST1_5V.
> > The v1 schematics I have do reference the GPIO0_A0 as controlling this
> > supply, so the big question would be how to handle the different versions.
> >
> > Because adding this would probably break v1 boards in this function.
> >
> > @TL: where v1 boards also sold or were they only used during development?
> 
> 
> I have check this with TL when I make this patch, the V1 hardware was 
> never sold and only V2/V3
> 
> are available on the market.

Thanks for clearing this up. I've applied this patch for 5.4 now.

Thanks
Heiko
