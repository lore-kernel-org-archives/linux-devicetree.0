From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 10/12] clk: mediatek: switch to use dev_get_regmap() for
 MT7622 audsys
Date: Fri, 5 Jan 2018 09:51:15 -0600
Message-ID: <20180105155115.xihnhkvlrj3lozsx@rob-hp-laptop>
References: <cover.1514881870.git.ryder.lee@mediatek.com>
 <cbdada9cdbafda2452fe171a81588ce5b0d4f688.1514881870.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cbdada9cdbafda2452fe171a81588ce5b0d4f688.1514881870.git.ryder.lee@mediatek.com>
Sender: linux-clk-owner@vger.kernel.org
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Garlic Tseng <garlic.tseng@mediatek.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 02, 2018 at 07:47:52PM +0800, Ryder Lee wrote:
> As the new audsys wrapper driver is in place, switch to use dev_get_regmap()
> to obtain the regmap from its parent.
> 
> This patch also add missing clock data 'CLK_AUDIO_AFE_CONN'.

"also" is a keyword for this belonging in a separate patch.

> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-mt7622-aud.c  | 11 +++++++++--
>  include/dt-bindings/clock/mt7622-clk.h |  3 ++-
>  2 files changed, 11 insertions(+), 3 deletions(-)
