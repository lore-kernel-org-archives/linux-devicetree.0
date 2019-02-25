From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/7] dt-bindings: spi: Add Support for Allwinner F1C100s
Date: Mon, 25 Feb 2019 17:33:01 -0600
Message-ID: <20190225233301.GA25780@bogus>
References: <cover.1549875778.git.mesihkilinc@gmail.com>
 <8d62291fa2f98d07e08d81fe4f54e4c49744c24e.1549875778.git.mesihkilinc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8d62291fa2f98d07e08d81fe4f54e4c49744c24e.1549875778.git.mesihkilinc@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com, Mesih Kilinc <mesihkilinc@gmail.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

On Mon, 11 Feb 2019 12:21:10 +0300, Mesih Kilinc wrote:
> Allwinner suniv F1C100s has similar SPI controllers as sun8i H3.
> Add compatible string for it.
> 
> Signed-off-by: Mesih Kilinc <mesihkilinc@gmail.com>
> ---
>  Documentation/devicetree/bindings/spi/spi-sun6i.txt | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
