From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH net-next v3] bindings: net: stmmac: add missing note
 about LPI interrupt
Date: Thu, 20 Apr 2017 15:10:49 -0500
Message-ID: <20170420201049.gynbmvksfaqnut35@rob-hp-laptop>
References: <20170418123955.21335-1-niklass@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170418123955.21335-1-niklass@axis.com>
Sender: netdev-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@axis.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>, Joao Pinto <Joao.Pinto@synopsys.com>, Niklas Cassel <niklass@axis.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Giuseppe CAVALLARO <peppe.cavallaro@st.com>, Thierry Reding <treding@nvidia.com>, Eric Engestrom <eric@engestrom.ch>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 18, 2017 at 02:39:53PM +0200, Niklas Cassel wrote:
> From: Niklas Cassel <niklas.cassel@axis.com>
> 
> The hardware has a LPI interrupt.
> There is already code in the stmmac driver to parse and handle the
> interrupt. However, this information was missing from the DT binding.
> 
> At the same time, improve the description of the existing interrupts.
> 
> Signed-off-by: Niklas Cassel <niklas.cassel@axis.com>
> ---
>  Documentation/devicetree/bindings/net/stmmac.txt | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
