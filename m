From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v3 2/6] dt-bindings: phy-rockchip-typec: deprecate some register properties.
Date: Sat, 17 Feb 2018 01:07:29 +0100
Message-ID: <5593793.vhYJ9g2msI@phil>
References: <20180216120956.19034-1-enric.balletbo@collabora.com> <20180216120956.19034-2-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180216120956.19034-2-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Brian Norris <briannorris@chromium.org>, dianders@chromium.org, Chris Zhong <zyw@rock-chips.com>, William wu <wulf@rock-chips.com>, hl@rock-chips.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com
List-Id: devicetree@vger.kernel.org

Am Freitag, 16. Februar 2018, 13:09:52 CET schrieb Enric Balletbo i Serra:
> As now the following register properties are in the driver, document as
> deprecated these properties and recommend to not use them on new bindings.
> 
> The deprecated properties are:
> 
> - rockchip,typec-conn-dir : the register of type-c connector direction
> - rockchip,usb3tousb2-en : the register of type-c force usb3 to usb2
>                            enable control.
> - rockchip,external-psm : the register of type-c phy external psm clock
>                           selection.
> - rockchip,pipe-status : the register of type-c phy pipe status.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
