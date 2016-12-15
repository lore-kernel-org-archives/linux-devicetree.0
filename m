From: Doug Anderson <dianders@google.com>
Subject: Re: [PATCH 1/3] clk: rockchip: rk3399: add USBPHYx_480M_SRC clock IDs
Date: Wed, 14 Dec 2016 16:27:49 -0800
Message-ID: <CAD=FV=WTS5C1voL5UDwR7xUb5+rJwHOuE3KnqAiQPa_f9AeRFw@mail.gmail.com>
References: <1481710301-1454-1-git-send-email-zhengxing@rock-chips.com> <1481710301-1454-2-git-send-email-zhengxing@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1481710301-1454-2-git-send-email-zhengxing@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lin Huang <hl@rock-chips.com>, Chris Zhong <zyw@rock-chips.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Dec 14, 2016 at 2:11 AM, Xing Zheng <zhengxing@rock-chips.com> wrote:
> This patch add two clock IDs for the usb phy 480m source clocks.
>
> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
> ---
>
>  include/dt-bindings/clock/rk3399-cru.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/dt-bindings/clock/rk3399-cru.h b/include/dt-bindings/clock/rk3399-cru.h
> index 220a60f..224daf7 100644
> --- a/include/dt-bindings/clock/rk3399-cru.h
> +++ b/include/dt-bindings/clock/rk3399-cru.h
> @@ -132,6 +132,8 @@
>  #define SCLK_RMII_SRC                  166
>  #define SCLK_PCIEPHY_REF100M           167
>  #define SCLK_DDRC                      168
> +#define SCLK_USBPHY0_480M_SRC          169
> +#define SCLK_USBPHY1_480M_SRC          170

As mentioned in the dts patch, I don't think you need these since I'm
under the impression that nobody gets this clock.  I think the USB
Controller get the ungated version of this clock.

-Doug
