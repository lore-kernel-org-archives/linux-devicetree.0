From: Doug Anderson <dianders@google.com>
Subject: Re: [PATCH v3 2/2] phy: rockchip-inno-usb2: correct 480MHz output
 clock stable time
Date: Mon, 14 Nov 2016 10:17:03 -0800
Message-ID: <CAD=FV=VJsuiXV3NS0uroF2OWJEDn5eiCpX-jP3BOYgLZ8gy6Hw@mail.gmail.com>
References: <1479115631-20137-1-git-send-email-wulf@rock-chips.com> <1479115631-20137-3-git-send-email-wulf@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1479115631-20137-3-git-send-email-wulf@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: William Wu <wulf@rock-chips.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Frank Wang <frank.wang@rock-chips.com>, =?UTF-8?B?6buE5rab?= <huangtao@rock-chips.com>, Brian Norris <briannorris@google.com>, Guenter Roeck <groeck@google.com>
List-Id: devicetree@vger.kernel.org

William,

On Mon, Nov 14, 2016 at 1:27 AM, William Wu <wulf@rock-chips.com> wrote:
> We found that the system crashed due to 480MHz output clock of
> USB2 PHY was unstable after clock had been enabled by gpu module.
>
> Theoretically, 1 millisecond is a critical value for 480MHz
> output clock stable time, so we try to change the delay time
> to 1.2 millisecond to avoid this issue.
>
> And the commit ed907fb1d7c3 ("phy: rockchip-inno-usb2: correct
> clk_ops callback") used prepare callbacks instead of enable
> callbacks to support gate a clk if the operation may sleep. So
> we can switch from delay to sleep functions.
>
> Signed-off-by: William Wu <wulf@rock-chips.com>
> ---
> Changes in v3:
> - fix kbuild test error: too few arguments to function 'usleep_range'
>
> Changes in v2:
> - use usleep_range() function instead of mdelay()
>
>  drivers/phy/phy-rockchip-inno-usb2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/phy/phy-rockchip-inno-usb2.c b/drivers/phy/phy-rockchip-inno-usb2.c
> index 365e077..0e52b25 100644
> --- a/drivers/phy/phy-rockchip-inno-usb2.c
> +++ b/drivers/phy/phy-rockchip-inno-usb2.c
> @@ -166,7 +166,7 @@ static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
>                         return ret;
>
>                 /* waitting for the clk become stable */
> -               mdelay(1);
> +               usleep_range(1200, 1300);

Sight nit that you could also fix the spelling from "waitting" to "waiting".

...but that's pre-existing, so:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
