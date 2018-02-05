From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/5] clk: mediatek: update missing clock data for
 MT7622 audsys
Date: Mon, 5 Feb 2018 00:08:31 -0600
Message-ID: <20180205024914.os5dq5wip344hefe@rob-hp-laptop>
References: <cover.1515639336.git.ryder.lee@mediatek.com>
 <ec2dfe750291a996c54cc8aaeafafa333b992c4f.1515639336.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ec2dfe750291a996c54cc8aaeafafa333b992c4f.1515639336.git.ryder.lee@mediatek.com>
Sender: linux-clk-owner@vger.kernel.org
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Garlic Tseng <garlic.tseng@mediatek.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 31, 2018 at 03:42:41PM +0800, Ryder Lee wrote:
> Add missing clock data 'CLK_AUDIO_AFE_CONN' for MT7622 audsys.
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-mt7622-aud.c  | 1 +
>  include/dt-bindings/clock/mt7622-clk.h | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
