From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/4] arm64: dts: mt8183: add pintcrl file
Date: Mon, 25 Mar 2019 14:30:05 -0500
Message-ID: <20190325193005.GA18114@bogus>
References: <20190325122302.5483-1-zhiyong.tao@mediatek.com>
 <20190325122302.5483-3-zhiyong.tao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190325122302.5483-3-zhiyong.tao@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: linus.walleij@linaro.org, mark.rutland@arm.com, matthias.bgg@gmail.com, sean.wang@kernel.org, srv_heupstream@mediatek.com, hui.liu@mediatek.com, eddie.huang@mediatek.com, chuanjia.liu@mediatek.com, biao.huang@mediatek.com, hongzhou.yang@mediatek.com, erin.lo@mediatek.com, sean.wang@mediatek.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 25, 2019 at 08:23:00PM +0800, Zhiyong Tao wrote:
> This patch adds pinctrl file for mt8183.

Still has a typo in the subject.

> 
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8183-pinfunc.h | 1120 +++++++++++++++++++++++++
>  1 file changed, 1120 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-pinfunc.h

Add acks/reviewed-bys when posting new versions. This should also be 
called v8 even though a different person sent it.

Rob
