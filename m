From: Guenter Roeck <groeck@google.com>
Subject: Re: [PATCH v7 2/2] phy: rockchip-inno-usb2: add a new driver for
 Rockchip usb2phy
Date: Fri, 24 Jun 2016 13:44:51 -0700
Message-ID: <CABXOdTc5+43ntiq4haS1mXRqcOoaw1AyAAv0Oz77nrZJ-0V9Hg@mail.gmail.com>
References: <1466505005-86122-1-git-send-email-frank.wang@rock-chips.com> <1466505005-86122-3-git-send-email-frank.wang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1466505005-86122-3-git-send-email-frank.wang@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Wang <frank.wang@rock-chips.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Douglas Anderson <dianders@chromium.org>, Guenter Roeck <linux@roeck-us.net>, Guenter Roeck <groeck@chromium.org>, jwerner@chromium.org, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Ziyuan Xu <xzy.xu@rock-chips.com>, Kever Yang <kever.yang@rock-chips.com>, Tao Huang <huangtao@rock-chips.com>, william.wu@rock-chips.com
List-Id: devicetree@vger.kernel.org

On Tue, Jun 21, 2016 at 3:30 AM, Frank Wang <frank.wang@rock-chips.com> wrote:
> The newer SoCs (rk3366, rk3399) take a different usb-phy IP block
> than rk3288 and before, and most of phy-related registers are also
> different from the past, so a new phy driver is required necessarily.
>
> Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
> Suggested-by: Heiko Stuebner <heiko@sntech.de>
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Suggested-by: Doug Anderson <dianders@chromium.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
