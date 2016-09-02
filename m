From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 4/4] nvmem: rockchip-efuse: add rk3399-efuse support
Date: Thu, 1 Sep 2016 20:54:00 -0700
Message-ID: <CAD=FV=VUy5hEZBT6ehpTS=5-moOJsSTqEM6tJeahZ-MeGz_5fg@mail.gmail.com>
References: <1472786217-52214-1-git-send-email-finley.xiao@rock-chips.com>
 <1472786217-52214-5-git-send-email-finley.xiao@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1472786217-52214-5-git-send-email-finley.xiao@rock-chips.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Finley Xiao <finley.xiao@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Tao Huang <huangtao@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Tony Xie <tony.xie@rock-chips.com>, Catalin Marinas <catalin.marinas@arm.com>, Xu Jianqun <jay.xu@rock-chips.com>, Will Deacon <will.deacon@arm.com>, linux@armlinux.org.uk, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, cl@rock-chips.com, Maxime Ripard <maxime.ripard@free-electrons.com>, Shunqian Zheng <zhengsq@rock-chips.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Caesar Wang <wxt@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Sep 1, 2016 at 8:16 PM, Finley Xiao <finley.xiao@rock-chips.com> wrote:
> 1) the efuse timing of rk3399 is different from earlier SoCs.
> 2) rk3399-efuse is organized as 32bits by 32 one-time programmable
> electrical fuses, the efuse of earlier SoCs is organized as 32bits
> by 8 one-time programmable electrical fuses with random access interface.
>
> This patch adds a new read function for rk3399-efuse.
>
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  drivers/nvmem/rockchip-efuse.c | 133 +++++++++++++++++++++++++++++++++++------
>  1 file changed, 114 insertions(+), 19 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
