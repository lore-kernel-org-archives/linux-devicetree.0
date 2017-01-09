From: Doug Anderson <dianders@google.com>
Subject: Re: [PATCH v2] arm64: dts: rockchip: add "rockchip, grf" property for
 RK3399 PMUCRU/CRU
Date: Mon, 9 Jan 2017 10:52:29 -0800
Message-ID: <CAD=FV=WjzU_2QSLET3Y9_5A5khXjqMYNzB2ifextKhekmvCsjw@mail.gmail.com>
References: <1483945344-3125-1-git-send-email-zhengxing@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1483945344-3125-1-git-send-email-zhengxing@rock-chips.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Elaine Zhang <zhangqing@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Catalin Marinas <catalin.marinas@arm.com>, Shawn Lin <shawn.lin@rock-chips.com>, Brian Norris <briannorris@chromium.org>, Will Deacon <will.deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, David Wu <david.wu@rock-chips.com>, William wu <wulf@rock-chips.com>, Jianqun Xu <jay.xu@rock-chips.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Caesar Wang <wxt@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Hi,

On Sun, Jan 8, 2017 at 11:02 PM, Xing Zheng <zhengxing@rock-chips.com> wrote:
> The structure rockchip_clk_provider needs to refer the GRF regmap
> in somewhere, if the CRU node has not "rockchip,grf" property,
> calling syscon_regmap_lookup_by_phandle will return an invalid GRF
> regmap, and the MUXGRF type clock will be not supported.
>
> Therefore, we need to add them.
>
> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
> ---
>
> Changes in v2:
> - referring pmugrf for PMUGRU
> - fix the typo "invaild" in COMMIT message
>
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 2 ++
>  1 file changed, 2 insertions(+)

This looks sane to me, but before you land it you need to first send
up a (separate) patch that adjusts:

Documentation/devicetree/bindings/clock/rockchip,rk3399-cru.txt

...it would also be sorta nice if you included an a patch in your
series that actually uses this new functionality.


-Doug
