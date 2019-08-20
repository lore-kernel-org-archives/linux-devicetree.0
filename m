From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/6] dt-bindings: net: sun8i-a83t-emac: Add phy-supply property
Date: Tue, 20 Aug 2019 11:18:12 -0500
Message-ID: <CAL_JsqL-fBA5fV=AwegyGpCKAEHtU1C6MZQX9dNYs0tpL9EbVw@mail.gmail.com>
References: <20190820145343.29108-1-megous@megous.com> <20190820145343.29108-2-megous@megous.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190820145343.29108-2-megous@megous.com>
Sender: netdev-owner@vger.kernel.org
To: Ondrej Jirman <megous@megous.com>
Cc: "David S. Miller" <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

On Tue, Aug 20, 2019 at 9:53 AM <megous@megous.com> wrote:
>
> From: Ondrej Jirman <megous@megous.com>
>
> This is already supported by the driver, but is missing from the
> bindings.

Really, the supply for the phy should be in the phy's node...

>
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---
>  .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml    | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
