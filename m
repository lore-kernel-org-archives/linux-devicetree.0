From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/6] dt-bindings: net: sun8i-a83t-emac: Add phy-io-supply property
Date: Tue, 20 Aug 2019 11:20:22 -0500
Message-ID: <CAL_JsqLHeA6A_+ZgmCzC42Y6yJrEq6+D3vKn8ETh2D7LJ+1_-g@mail.gmail.com>
References: <20190820145343.29108-1-megous@megous.com> <20190820145343.29108-3-megous@megous.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190820145343.29108-3-megous@megous.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ondrej Jirman <megous@megous.com>
Cc: "David S. Miller" <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

On Tue, Aug 20, 2019 at 9:53 AM <megous@megous.com> wrote:
>
> From: Ondrej Jirman <megous@megous.com>
>
> Some PHYs require separate power supply for I/O pins in some modes
> of operation. Add phy-io-supply property, to allow enabling this
> power supply.

Perhaps since this is new, such phys should have *-supply in their nodes.

>
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---
>  .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml    | 4 ++++
>  1 file changed, 4 insertions(+)
