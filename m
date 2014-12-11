From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v6 1/5] phy: add a driver for the Rockchip SoC internal
 USB2.0 PHY
Date: Thu, 11 Dec 2014 10:41:38 -0800
Message-ID: <CAD=FV=XTYmzxvteNip2gtuDSSEWph-vY=BOPejHa1Z5KS2Kf6Q@mail.gmail.com>
References: <1418291722-25448-1-git-send-email-lyz@rock-chips.com>
	<1418291722-25448-2-git-send-email-lyz@rock-chips.com>
	<548971AF.1020506@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <548971AF.1020506@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Yunzhi Li <lyz@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, jwerner@chromium.org, Olof Johansson <olof@lixom.net>, Tao Huang <huangtao@rock-chips.com>, Chris <zyw@rock-chips.com>, Eddie Cai <cf@rock-chips.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Kishon,

On Thu, Dec 11, 2014 at 2:27 AM, Kishon Vijay Abraham I <kishon@ti.com> wrote:
> I didn't mean that. You can get rid of this entire xlate stuff if you use
> something like below
>
> phy@xxx {
>         compatible = "";
>         phy1:usb_phy {
>         }
>         phy2:usb_phy {
>         };
> };
>
>
> usb@xx {
>         compatible = "";
>         phys = <&phy1>; //doesn't need xlate
>         /* this needs xlate
>            phys = <&phy 1>;
>         */
>         phy-names = "phy";
> };

Is the syntax you proposed really better?  Are you saying that you
advocate never using "#phy-cells" other than 0 for new bindings?  Is
that your own personal preference, or is there a discussion somewhere
where everyone agreed on this?

My vote is that since "phy-cells" exists and is part of the generic
phy bindings that it's meant to be used whenever you have a single PHY
driver that controls multiple PHYs.


-Doug
