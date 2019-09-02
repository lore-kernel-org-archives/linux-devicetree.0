From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/2] clk: mediatek: add pericfg clocks for MT8183
Date: Mon, 02 Sep 2019 14:38:42 +0100
Message-ID: <5d6d1b63.1c69fb81.1cab3.5ef8@mx.google.com>
References: <1566980533-28282-1-git-send-email-chunfeng.yun@mediatek.com> <1566980533-28282-2-git-send-email-chunfeng.yun@mediatek.com>
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566980533-28282-2-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, Ryder Lee <ryder.lee@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>, Erin Lo <erin.lo@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, 28 Aug 2019 16:22:13 +0800, Chunfeng Yun wrote:
> Add pericfg clocks for MT8183, it's used when support USB
> remote wakeup
> 
> Cc: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2:
>    use GATE_MTK to define GATE_PERI suggested by Weiyi
> ---
>  drivers/clk/mediatek/clk-mt8183.c      | 30 ++++++++++++++++++++++++++
>  include/dt-bindings/clock/mt8183-clk.h |  4 ++++
>  2 files changed, 34 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
