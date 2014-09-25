From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] clk: rockchip: rk3288: add reset indices for SOFTRST9-11
Date: Thu, 25 Sep 2014 08:27:57 -0700
Message-ID: <CAD=FV=UOHc2xLmSJdJbZTgcvJ7xZXPeGZkGGfCRySeKh6q+nJQ@mail.gmail.com>
References: <1410522327-23175-1-git-send-email-mark.yao@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1410522327-23175-1-git-send-email-mark.yao@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark yao <mark.yao@rock-chips.com>
Cc: Mike Turquette <mturquette@linaro.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Daniel Kurtz <djkurtz@chromium.org>, =?UTF-8?B?5oi05YWL6ZyWIChKYWNrKQ==?= <dkl@rock-chips.com>, Eddie Cai <eddie.cai@rock-chips.com>, Jianqun Xu <xjq@rock-chips.com>, =?UTF-8?B?5p+v6aOe6ZuE?= <kfx@rock-chips.com>, Tao Huang <huangtao@rock-chips.com>, Chris <zyw@rock-chips.com>, =?UTF-8?B?6Zer5a2d5Yab?= <yxj@rock-chips.com>, jeff chen <cym@rock-chips.com>, Shunqian Zheng <zhengsq@rock-chips.com>, =?UTF-8?B?5pmT6IW+546L?= <caesar.wang@rock-chips.com>, Kever Yang <kever.yang@ro>
List-Id: devicetree@vger.kernel.org

Mark,

On Fri, Sep 12, 2014 at 4:45 AM, Mark yao <mark.yao@rock-chips.com> wrote:
> The patch add the rest of the indices of the additional reset
> registers from the updated TRM.
>
> Signed-off-by: Mark yao <mark.yao@rock-chips.com>
> ---
>  include/dt-bindings/clock/rk3288-cru.h | 43 ++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>
> diff --git a/include/dt-bindings/clock/rk3288-cru.h b/include/dt-bindings/clock/rk3288-cru.h
> index ebcb460..e65d522 100644
> --- a/include/dt-bindings/clock/rk3288-cru.h
> +++ b/include/dt-bindings/clock/rk3288-cru.h
> @@ -276,3 +276,46 @@
>  #define SRST_USBHOST1_CON      140
>  #define SRST_USB_ADP           141
>  #define SRST_ACC_EFUSE         142
> +
> +#define SRST_CORESIGHT         144
> +#define SRST_PD_CORE_AHB_NOC   145
> +#define SRST_PD_CORE_APB_NOC   146
> +#define SRST_PD_CORE_MP_AXI    147
> +#define SRST_GIC               148
> +#define SRST_LCDC_PWM0         149
> +#define SRST_LCDC_PWM1         150
> +#define SRST_VIO0_H2P_BRG      151
> +#define SRST_VIO1_H2P_BRG      152
> +#define SRST_RGA_H2P_BRG       153
> +#define SRST_HEVC              154
> +#define SRST_TSADC             159
> +
> +#define SRST_DDRPHY0           160
> +#define SRST_DDRPHY0_APB       161
> +#define SRST_DDRCTRL0          162
> +#define SRST_DDRCTRL0_APB      163
> +#define SRST_DDRPHY0_CTRL      164
> +#define SRST_DDRPHY1           165
> +#define SRST_DDRPHY1_APB       166
> +#define SRST_DDRCTRL1          167
> +#define SRST_DDRCTRL1_APB      168
> +#define SRST_DDRPHY1_CTRL      169
> +#define SRST_DDRMSCH0          170
> +#define SRST_DDRMSCH1          171

Interestingly 170 and 171 show as Reserved in my TRM...  ...but if
that's what the reserved bits map to then I have no objection.

> +#define SRST_CRYPTO            174
> +#define SRST_C2C_HOST          175
> +
> +#define SRST_LCDC1_AXI         176
> +#define SRST_LCDC1_AHB         177
> +#define SRST_LCDC1_DCLK                178
> +#define SRST_UART0             179
> +#define SRST_UART1             180
> +#define SRST_UART2             181
> +#define SRST_UART3             182
> +#define SRST_UART4             183
> +#define SRST_SIMC              186
> +#define SRST_PS2C              187
> +#define SRST_TSP               188
> +#define SRST_TSP_CLKIN0                189
> +#define SRST_TSP_CLKIN1                190
> +#define SRST_TSP_27M           191

Reviewed-by: Doug Anderson <dianders@chromium.org>
