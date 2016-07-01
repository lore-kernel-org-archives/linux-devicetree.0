From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 01/14] dt-bindings: sunxi: Add CCU binding
 documentation
Date: Thu, 30 Jun 2016 21:17:39 -0500
Message-ID: <20160701021739.GA16181@rob-hp-laptop>
References: <20160629190535.11855-1-maxime.ripard@free-electrons.com>
 <20160629190535.11855-2-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160629190535.11855-2-maxime.ripard@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Vishnu Patekar <vishnupatekar0510@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jean-Francois Moine <moinejf@free.fr>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 29, 2016 at 09:05:22PM +0200, Maxime Ripard wrote:
> Introduce a new binding with its documentation for the brand new clock
> sub-framework.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  .../devicetree/bindings/clock/sunxi-ccu.txt        | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/sunxi-ccu.txt

Yay!

Acked-by: Rob Herring <robh@kernel.org>
