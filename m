From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 0/3] add usb support for rv1108 SoCs
Date: Wed, 23 Aug 2017 09:26:27 +0200
Message-ID: <4411588.R4EXSA7JtF@phil>
References: <1503304768-14520-1-git-send-email-frank.wang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1503304768-14520-1-git-send-email-frank.wang@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Wang <frank.wang@rock-chips.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, huangtao@rock-chips.com, william.wu@rock-chips.com, daniel.meng@rock-chips.com, kever.yang@rock-chips.com, andy.yan@rock-chips.com, wmc@rock-chips.com
List-Id: devicetree@vger.kernel.org

Am Montag, 21. August 2017, 16:39:25 CEST schrieb Frank Wang:
> This serie adds USB related device nodes support for rv1108 SoCs, in addition,
> Rockchip's rv1108-evb board has one usb otg controller and one usb host
> controller, each controller connect with one usb-phy port through UTMI+
> interface, the changes also enable usb related for rv1108-evb board.
> 
> Frank Wang (3):
>   dt-bindings: update dt-binding for rv1108 SoCs
>   ARM: dts: rockchip: add usb nodes for rv1108 SoCs
>   ARM: dts: rockchip: enable usb for rv1108-evb

applied all 3 for 4.14 ... with some minor changes to patch subjects
and property ordering


Thanks
Heiko
