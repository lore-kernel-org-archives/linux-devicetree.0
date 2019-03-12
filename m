From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 03/15] dt-bindings: mailbox: Add a sunxi message box
 binding
Date: Tue, 12 Mar 2019 08:36:09 -0500
Message-ID: <20190312133609.GA31956@bogus>
References: <20190302042951.53671-1-samuel@sholland.org>
 <20190302042951.53671-4-samuel@sholland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190302042951.53671-4-samuel@sholland.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Jassi Brar <jassisinghbrar@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Samuel Holland <samuel@sholland.org>
List-Id: devicetree@vger.kernel.org

On Fri,  1 Mar 2019 22:29:39 -0600, Samuel Holland wrote:
> This mailbox hardware is present in Allwinner sun8i, sun9i, and sun50i
> SoCs. Add a device tree binding for it.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  .../mailbox/allwinner,sunxi-msgbox.yaml       | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/allwinner,sunxi-msgbox.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
