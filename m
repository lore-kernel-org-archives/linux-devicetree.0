From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/2] clk: rockchip: add clock ID for usbphy480m_src
Date: Tue, 16 Dec 2014 13:02:01 -0800
Message-ID: <CAD=FV=WdX6YEYSUuahxGPkkyzF2ArFb7mji1PvEXiuDj6Xt1bA@mail.gmail.com>
References: <1415863357-15680-1-git-send-email-kever.yang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1415863357-15680-1-git-send-email-kever.yang@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kever Yang <kever.yang@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Mike Turquette <mturquette@linaro.org>, Sonny Rao <sonnyrao@chromium.org>, Addy Ke <addy.ke@rock-chips.com>, Eddie Cai <cf@rock-chips.com>, =?UTF-8?B?5oi05YWL6ZyWIChKYWNrKQ==?= <dkl@rock-chips.com>, Tao Huang <huangtao@rock-chips.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark yao <mark.yao@rock-chips.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Kever,

On Wed, Nov 12, 2014 at 11:22 PM, Kever Yang <kever.yang@rock-chips.com> wrote:
> There are 3 different parent clock from different usbphy,
> all of them are fixed 480MHz, it is not able to auto select
> by clock core to the 2nd and the 3rd parent.
> For different use case for different board, we may need to
> select different usbphy clock out as parent manually.
>
> Add the clock ID for it so that we can use in dts.
>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
>
>  include/dt-bindings/clock/rk3288-cru.h | 1 +
>  1 file changed, 1 insertion(+)

Aside from clock ID collisions that Heiko can fixup, this looks good to me.

Reviewed-by: Doug Anderson <dianders@chromium.org>
