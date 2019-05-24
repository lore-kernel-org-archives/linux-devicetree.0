From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 4/6] dt-bindings: display: hdmi-connector: Support DDC
 bus enable
Date: Fri, 24 May 2019 16:55:49 -0500
Message-ID: <20190524215549.GA13928@bogus>
References: <20190520235009.16734-1-megous@megous.com>
 <20190520235009.16734-5-megous@megous.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190520235009.16734-5-megous@megous.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-sunxi@googlegroups.com, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Ondrej Jirman <megous@megous.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

On Tue, 21 May 2019 01:50:07 +0200, megous@megous.com wrote:
> From: Ondrej Jirman <megous@megous.com>
> 
> Some Allwinner SoC using boards (Orange Pi 3 for example) need to enable
> on-board voltage shifting logic for the DDC bus using a gpio to be able
> to access DDC bus. Use ddc-en-gpios property on the hdmi-connector to
> model this.
> 
> Add binding documentation for optional ddc-en-gpios property.
> 
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---
>  .../devicetree/bindings/display/connector/hdmi-connector.txt     | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
