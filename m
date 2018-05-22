From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 1/7] dt-bindings: pinctrl: add external interrupt
 support to MT7622 pinctrl
Date: Tue, 22 May 2018 15:02:10 -0500
Message-ID: <20180522200209.GA7801@rob-hp-laptop>
References: <cover.1526835466.git.sean.wang@mediatek.com>
 <3898620ef606004aaddc332591ca467f56773029.1526835466.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3898620ef606004aaddc332591ca467f56773029.1526835466.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sean.wang@mediatek.com
Cc: mark.rutland@arm.com, linus.walleij@linaro.org, matthias.bgg@gmail.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, May 21, 2018 at 01:01:47AM +0800, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Extend the capability of MT7622 pinctrl with adding EINT so that each
> GPIO can be used to notify CPU when a signal state is changing on the
> line as an external interrupt.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/pinctrl-mt7622.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
