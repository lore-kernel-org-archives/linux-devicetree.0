From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] arm64: dts: rockchip: assign clock rate for ACLK_VIO
Date: Sun, 11 Mar 2018 19:14:42 -0700
Message-ID: <CAD=FV=VG0CSaLGyyfHAdvn4Ud0D3tab0c3pMEvqcFxAJ+5c7Zg@mail.gmail.com>
References: <1520819448-8316-1-git-send-email-zhengsq@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1520819448-8316-1-git-send-email-zhengsq@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shunqian Zheng <zhengsq@rock-chips.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, devicetree@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Sun, Mar 11, 2018 at 6:50 PM, Shunqian Zheng <zhengsq@rock-chips.com> wrote:
> The ACLK_VIO is a parent clock used by a several children,
> its suggested clock rate is 400MHz. Right now it gets 400MHz
> because it sources from CPLL(800M) and divides by 2 after reset.
> It's good not to rely on default values like this, so let's
> explicitly set it.
> NOTE: it's expected that at least one board may override cru node and
> set the CPLL to 1.6 GHz. On that board it will be very important to be
> explicit about aclk-vio being 400 MHz.
>
> Signed-off-by: Shunqian Zheng <zhengsq@rock-chips.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi | 6 ++++--
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi     | 6 ++++--
>  2 files changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
