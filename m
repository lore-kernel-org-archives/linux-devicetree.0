From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 6/9] dt-bindings: pinctrl: Deprecate sunxi pinctrl
 bindings
Date: Tue, 18 Oct 2016 07:43:49 -0500
Message-ID: <20161018124349.qxsrpx3yjy62bqhp@rob-hp-laptop>
References: <cover.7edc6c25be8a5e2efdda6a82e102dbf7ece6aa64.1476200742.git-series.maxime.ripard@free-electrons.com>
 <ee6d214a14ed31689c5f70fc6ee5736c3d26737b.1476200742.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ee6d214a14ed31689c5f70fc6ee5736c3d26737b.1476200742.git-series.maxime.ripard@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 11, 2016 at 05:46:04PM +0200, Maxime Ripard wrote:
> The generic pin configuration and multiplexing should be preferred now,
> even though we still support the old one.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+), 0 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
