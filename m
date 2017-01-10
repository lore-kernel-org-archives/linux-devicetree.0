From: Doug Anderson <dianders@google.com>
Subject: Re: [PATCH v4 2/2] dt-bindings: clk: add rockchip,
 grf property for RK3399
Date: Tue, 10 Jan 2017 10:34:41 -0800
Message-ID: <CAD=FV=Wr0bOLaU2LnhXUSk8b7xaJC2+8ihRvx48Az=zy54Agdg@mail.gmail.com>
References: <1484028930-20305-1-git-send-email-zhengxing@rock-chips.com>
 <1484028930-20305-3-git-send-email-zhengxing@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1484028930-20305-3-git-send-email-zhengxing@rock-chips.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, linux-clk <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Jan 9, 2017 at 10:15 PM, Xing Zheng <zhengxing@rock-chips.com> wrote:
> Add support for rockchip,grf property which is used for GRF muxes
> on RK3399.
>
> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
> ---
>
> Changes in v4:
> - update the decription for rockchip,grf property
>
> Changes in v3: None
> Changes in v2: None
>
>  Documentation/devicetree/bindings/clock/rockchip,rk3399-cru.txt | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
